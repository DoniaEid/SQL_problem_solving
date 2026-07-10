class Solution {
public:
    int maxDigitRange(vector<int>& nums) {

        map<int, vector<int>> mp;

        for (int i = 0; i < nums.size(); i++) {

            string s = to_string(nums[i]);
            sort(s.begin(), s.end());

            int diff = (s.back() - '0') - (s.front() - '0');

            mp[diff].push_back(nums[i]);
        }

        int mx = mp.rbegin()->first;

        int sum = 0;

        for (int x : mp[mx]) {
            sum += x;
        }

        return sum;
    }
};