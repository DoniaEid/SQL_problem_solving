class Solution {
public:
    int romanToInt(string s) {
        map<char,int>m;
        m['I']=1;
        m['V']=5;
        m['X']=10;
        m['L']=50;
        m['C']=100;
        m['D']=500;
        m['M']=1000;
        int sum=0;
        for(int i=0;i<s.size();i++){
            int j=i;
           if( m[s[j]]<m[s[j+1]] && i + 1 < s.size()){
              sum+=m[s[j+1]]-m[s[j]];
              i++;
           }
           else{
            sum+=m[s[j]];
           }
        }
        return sum;
    }
};