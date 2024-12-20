import 'dart:io';
import 'dart:math';

main() {
  int correct = 0;
  int  wrong = 0;

  while (true) { // Keep asking questions until user says no
    int num1 = Random().nextInt(10) + 1;
    int num2 = Random().nextInt(10) + 1;
    int answer = num1 * num2;

    print('What is $num1 times $num2?');
    String? input = (stdin.readLineSync()!);

    if (input == null) {
      break;
    }

    int? userAnswer = int.tryParse(input);

    if (userAnswer == null) {
      print('Please only enter numbers.');
      continue;
    }

    if (userAnswer == answer) {
      print('Correct!');
      correct++;
    } else {
      print('Incorrect. The answer is $answer.');
      wrong++;
    }

    print('Do you wanna try again? (yes/no)');
    String? choice = (stdin.readLineSync()!).toLowerCase();

    if (choice != 'yes') {
      break;
    }
  }

  print('You got $correct correct and $wrong incorrect.');
}