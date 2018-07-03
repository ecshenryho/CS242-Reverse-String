#include <iostream>
using namespace std;
extern"C" void reverse(char []);

int main() {
	char arr[] = "henryho";
	cout << "Original string: " << arr << endl;
	reverse(arr);
	cout << "The reversed string: " << arr << endl;
	system("pause");
	return 0;
}