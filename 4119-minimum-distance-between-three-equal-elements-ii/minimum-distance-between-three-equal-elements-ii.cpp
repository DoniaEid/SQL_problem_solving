class Solution {
public:
    int minimumDistance(vector<int>& nums) {
        map<int, int> freq; 
        map<int, vector<int>> last_indices; 
        
        long long res = -1;

        for (int i = 0; i < nums.size(); i++) {
            int x = nums[i];
            freq[x]++;
            last_indices[x].push_back(i);

            if (freq[x] >= 3) {
                int size = last_indices[x].size();
                int first_idx = last_indices[x][size - 3];
                
                long long current_dist = 2LL * (i - first_idx);

                if (res == -1 || current_dist < res) {
                    res = current_dist;
                }
            }
        }
        
        return (int)res;
    }
};