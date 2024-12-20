import 'dart:io';

main() {
  print("Enter two numbers:");
  int num1 = int.parse(stdin.readLineSync()!);
  int num2 = int.parse(stdin.readLineSync()!);

  if (num1 > num2) {
    print("$num1 is bigger than $num2.");
  } else if (num1 < num2) {
    print("$num2 is bigger than $num1.");
  } else {
    print("Both numbers are equal.");
  }
}