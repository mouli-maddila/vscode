#include <iostream>
#include <vector> 
using namespace std;

void rmdupes(std::vector <int> nums) {
    for(int i = 0 ; i < nums.size() ; i++){
        if (nums[i] == nums[i+1]) {
        nums.erase(nums.begin() + i);
        i--;
        }
    }
    for (int i = 0; i < nums.size(); i++) {
        std::cout << nums[i] << " ";
    }
    std::cout << std::endl;
}

int main(){
    vector <int> nums = {1,2,2,4,3,3,5,5,5,6,7};
    rmdupes(nums);
    return 0;
}