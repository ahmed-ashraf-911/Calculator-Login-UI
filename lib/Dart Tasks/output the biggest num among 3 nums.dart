import 'dart:io';

main() {
  print("Enter three numbers:");
  int num1 = int.parse(stdin.readLineSync()!);
  int num2 = int.parse(stdin.readLineSync()!);
  int num3 = int.parse(stdin.readLineSync()!);

  int biggest = num1;

  if (num2 > biggest) {
    biggest = num2;
  }

  if (num3 > biggest) {
    biggest = num3;
  }

  print("The biggest number is: $biggest");
}