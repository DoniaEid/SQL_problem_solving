class Solution {
public:
    vector<int> leftRightDifference(vector<int>& nums) {
        vector<int>arr;
        for(int i=0;i<nums.size();i++){
            int left=0;
            for(int l=0;l<i;l++){
               left+=nums[l];
            }
            int right=0;
            for(int r=i+1;r<nums.size();r++){
                right+=nums[r];
            }
            arr.push_back(abs(left-right));
        }
        return arr;
    }
};