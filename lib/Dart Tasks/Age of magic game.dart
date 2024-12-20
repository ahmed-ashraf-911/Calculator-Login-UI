import 'dart:io';

main() {
  print("Enter year of birth:");
  int birthYear = int.parse(stdin.readLineSync()!);

  int currentYear = DateTime.now().year;
  int age = currentYear - birthYear;

  print("Your age is: $age");

  if (age >= 10) {
    print("You can play the Game!");
  } else {
    print("You are too young to play the Game.");
  }
}