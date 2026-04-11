class Solution {
public:
    int minimumDistance(vector<int>& nums) {
        unordered_map<int, vector<int>> pos;
        for (int i = 0; i < nums.size(); i++) {
            pos[nums[i]].push_back(i);
        }

        vector<long long> allDistances;

 for (auto const& [val, indices] : pos) {
    if (indices.size() >= 3) {
        for (int i = 0; i <= (int)indices.size() - 3; i++) {
            int idx1 = indices[i];    
            int idx2 = indices[i + 1]; 
            int idx3 = indices[i + 2]; 

            long long d = (idx2 - idx1) + (idx3 - idx2) + (idx3 - idx1);
            
            allDistances.push_back(d);
        }
    }
}

        if (allDistances.empty()) return -1;

        return *min_element(allDistances.begin(), allDistances.end());
    }
};