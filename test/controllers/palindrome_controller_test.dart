import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_suitmedia_test/controllers/palindrome_controller.dart'; // Adjust the import according to your project structure

void main() {
  group('PalindromeController Tests', () {
    late PalindromeController controller;

    setUp(() {
      // Initialize the controller before each test
      controller = PalindromeController();
    });

    test('Initial values are empty', () {
      expect(controller.name.value, '');
      expect(controller.sentence.value, '');
    });

    test('isPalindrome method returns true for a valid palindrome', () {
      expect(controller.isPalindrome('kasur rusak'), isTrue);
      expect(controller.isPalindrome('step on no pets'), isTrue);
      expect(controller.isPalindrome('put it up'), isTrue);
    });

    test('isPalindrome method returns false for a non-palindrome', () {
      expect(controller.isPalindrome('suitmedia'), isFalse);
      expect(controller.isPalindrome('intern'), isFalse);
      expect(controller.isPalindrome('test'), isFalse);
    });

    test('Reactive variables update correctly', () {
      controller.name.value = 'John Doe';
      controller.sentence.value = 'madam';

      expect(controller.name.value, 'John Doe');
      expect(controller.sentence.value, 'madam');

      controller.name.value = 'Jane Doe';
      expect(controller.name.value, 'Jane Doe');
    });

    test('isPalindrome method is case insensitive and ignores spaces', () {
      expect(controller.isPalindrome('RaceCar'), isTrue);
      expect(controller.isPalindrome('No lemon no melon'), isTrue);
      expect(controller.isPalindrome('Was it a car or a cat I saw'), isTrue);
    });
  });
}