#include <iostream>
#include <ostream>
#include <strings.h>

int foo();

int main() {
  std::cout << "Hello World";
  foo();
  return 0;
}

int foo() {
  std::cout << "I am debugging bitch!" << std::endl;
  return 0; 
}
