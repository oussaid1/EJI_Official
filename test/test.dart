// ignore_for_file: sdk_version_async_exported_from_core
// ignore_for_file: unawaited_futures
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Real class
class Cat {
  String sound() => 'Meow';
  bool eatFood(String food, {bool hungry}) => true;
  Future<void> chew() async => print('Chewing...');
  int walk(List<String> places) => 7;
  void sleep() {}
  void hunt(String place, String prey) {}
  int lives = 9;
}

// Mock class
class MockCat extends Mock implements Cat {}

// Fake class
class FakeCat extends Fake implements Cat {
  @override
  bool eatFood(String food, {bool hungry}) {
    print('Fake eat $food');
    return true;
  }
}

void main() {
  Cat cat;

  setUp(() {
    // Create mock object.
    cat = MockCat();
  });
  tearDown(() {});

  test('description', () {
    print(cat.sound().toString());
  });
}
