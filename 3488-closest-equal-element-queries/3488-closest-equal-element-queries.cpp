class Solution {
public:
    vector<int> solveQueries(vector<int>& nums, vector<int>& queries) {
        int n = nums.size();
        unordered_map<int, vector<int>> pos;
        
        // 1. تجميع الأماكن لكل رقم (O(N))
        for (int i = 0; i < n; i++) {
            pos[nums[i]].push_back(i);
        }

        vector<int> answer;
        for (int q_idx : queries) {
            int val = nums[q_idx];
            const vector<int>& p = pos[val];

            // لو الرقم موجود مرة واحدة بس
            if (p.size() <= 1) {
                answer.push_back(-1);
                continue;
            }

            // 2. Binary Search (O(log N))
            // نلاقي مكان q_idx الحالي جوه vector الأماكن
            auto it = lower_bound(p.begin(), p.end(), q_idx);
            int i = distance(p.begin(), it);

            int min_dist = n; 

            // 3. فحص الجيران (السابق واللاحق)
            // الجار السابق (مع مراعاة الدوران لو إحنا في أول الـ vector)
            int prev_val = p[(i - 1 + p.size()) % p.size()];
            // الجار اللاحق (مع مراعاة الدوران لو إحنا في آخر الـ vector)
            int next_val = p[(i + 1) % p.size()];

            // دالة لحساب أقصر مسافة دائرية بين مكانين
            auto get_dist = [&](int a, int b) {
                int d = abs(a - b);
                return min(d, n - d);
            };

            min_dist = min(get_dist(q_idx, prev_val), get_dist(q_idx, next_val));
            
            answer.push_back(min_dist);
        }

        return answer;
    }
};