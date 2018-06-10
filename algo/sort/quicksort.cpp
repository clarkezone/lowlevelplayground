#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

class QuickSort {
	public:
		void sort(std::vector<int>& array, int low, int high) {
			if (high > low) {
				auto pivot = partition(array, low, high);

				sort(array, low, pivot-1);
				sort(array, pivot+1, high);
			}
		}

		int partition(std::vector<int>& array, int low, int high) {
			int pivot = high;
			int targetValue = array[pivot];
			int smallestPos = low-1;

			for (int i=low; i<pivot; i++) {
				if (array[i] <= targetValue) {
					smallestPos++;
					std::swap(array[i], array[smallestPos]);
				}
			}

			smallestPos++;
			std::swap(array[pivot], array[smallestPos]);
			return smallestPos;
		}
};

int main(int count, char* args[]) {
	std::vector<int> inputs {9, 8, 7, 6, 5, 4, 3, 2, 1};
//	std::vector<int> inputs {1, 8, 3, 6, 5, 4, 3, 2, 1};
	QuickSort q;

	q.sort(inputs, 0, inputs.size()-1);

	for (int i=0; i < inputs.size(); i++) {
		std::cout << inputs[i];
	}

	return 0;
}
