#include <iostream>

int main(int argc, char *argv[]) {
  std::ios::sync_with_stdio(false);
  std::cout << "Hello, World!" << std::endl;
  std::cout << argc << ',' << argv << std::endl;
  return 0;
}
