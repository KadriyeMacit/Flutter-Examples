import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_examples/example.dart';

void main() {
  ExampleTest subject = ExampleTest();
  test('isBook is true', () {
    subject.onTrue();

    bool book = subject.isBook;

    expect(book, true);
  });
}
