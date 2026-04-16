class Solution {
public:
    vector<int> solveQueries(vector<int>& nums, vector<int>& queries) {
        int n = nums.size();
        vector<int> min_dist(n, -1);
        unordered_map<int, int> last_pos;
        unordered_map<int, int> counts;

        // خطوة إضافية: نعد كل رقم موجود كام مرة
        for(int x : nums) counts[x]++;

        // 1. اللفة الأولى: للأمام
        for (int i = 0; i < 2 * n; i++) {
            int current = i % n;
            int val = nums[current];
            
            // شرط: لازم يكون الرقم متكرر أصلاً في المصفوفة الأصلية
            if (counts[val] > 1 && last_pos.count(val)) {
                int d = i - last_pos[val];
                if (d > 0 && d < n) { // d < n عشان نضمن إنه مش نفس العنصر بعد لفة كاملة
                    if (min_dist[current] == -1 || d < min_dist[current])
                        min_dist[current] = d;
                }
            }
            last_pos[val] = i;
        }

        // 2. اللفة الثانية: للخلف
        last_pos.clear();
        for (int i = 2 * n - 1; i >= 0; i--) {
            int current = i % n;
            int val = nums[current];
            
            if (counts[val] > 1 && last_pos.count(val)) {
                int d = last_pos[val] - i;
                if (d > 0 && d < n) {
                    if (min_dist[current] == -1 || d < min_dist[current])
                        min_dist[current] = d;
                }
            }
            last_pos[val] = i;
        }

        vector<int> answer;
        for (int q : queries) {
            answer.push_back(min_dist[q]);
        }
        return answer;
    }
};