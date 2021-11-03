import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'A.dart';
import 'test_test.mocks.dart';

@GenerateMocks([A])
void main() {
  test("description", () {
    MockA a = MockA();
    when(a.a(any)).thenAnswer((realInvocation) {
      print("object");
      return 2;
    });
    B b = B(a);

    b.test();
  });
}

class B {
  A a;
  B(this.a);

  void test() {
    a.a(2);
  }
}
