class Solution {
public:
    int getMinDistance(vector<int>& nums, int target, int start) {
         vector<int>index;
        for(int i=0;i<nums.size();i++){
            if(nums[i]==target){
                index.push_back(i);
            }
        }
                int m=abs(index[0]-start);

        for(int i=0;i<index.size();i++){
            m=min(m,abs(index[i]-start));
        }
       return m;
    }
};