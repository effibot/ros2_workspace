#include <iostream>
#include <string>


int main(int argc, char * argv[])
{
  int a = 0, b = 0;
  // parse command line arguments
  if (argc == 1){
    std::cout << 1+2 << std::endl;
    return 0;
  }
  if (argc < 3) {
    std::cerr << "Usage: " << argv[0] << " <number> <number>" << std::endl;
    return 1;
  }
  a = std::stoi(argv[1]);
  b = std::stoi(argv[2]);
  std::cout << "Sum of " << a << " and " << b << " is " << a + b << std::endl;

  return 0;
}
