#include <iostream>
#include <string>


int main(int argc, char * argv[])
{
  std::string a, b;
  // parse command line arguments
  if (argc < 2) {
    std::cerr << "Usage: " << argv[0] << " <number> <number>" << std::endl;
    return 1;
  }
  a = std::string(argv[1]);
  b = std::string(argv[2]);
  std::cout << "passed args: " << a << " and " << b << std::endl;

  return 0;
}
