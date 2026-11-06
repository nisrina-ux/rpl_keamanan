import 'package:flutter_test/flutter_test.dart';
import 'package:rpl_keamanan/utils/validators.dart';

void main() {
  group('Unit Test Validators', () {
    test('isValidEmail menguji email valid dan invalid', () {
      expect(Validators.isValidEmail('user@amikom.ac.id'), isTrue);
      expect(Validators.isValidEmail('invalid-email'), isFalse);
      expect(Validators.isValidEmail('test@domain'), isFalse);
    });

    test('sanitize mengganti karakter HTML berbahaya', () {
      final rawInput = '<script>alert("hack")</script>';
      final result = Validators.sanitize(rawInput);
      expect(result.contains('<'), isFalse);
      expect(result.contains('>'), isFalse);
      expect(
        result,
        equals('&lt;script&gt;alert(&quot;hack&quot;)&lt;/script&gt;'),
      );
    });

    test('validateText memeriksa panjang karakter', () {
      expect(Validators.hasValidLength('Hello', min: 1, max: 10), isTrue);
      expect(Validators.hasValidLength('', min: 1, max: 10), isFalse);
    });

    test('validatePhone memeriksa angka 10-13 digit', () {
      expect(Validators.validatePhone('081234567890'), isTrue);
      expect(Validators.validatePhone('12345'), isFalse);
      expect(Validators.validatePhone('0812abc3456'), isFalse);
    });

    test('validateUrl memeriksa format HTTP/HTTPS', () {
      expect(Validators.validateUrl('https://amikom.ac.id'), isTrue);
      expect(Validators.validateUrl('ftp://amikom.ac.id'), isFalse);
    });

    test('validatePassword menguji kriteria komplekitas password', () {
      expect(Validators.validatePassword('Password123!'), isTrue);
      expect(Validators.validatePassword('weakpassword'), isFalse);
      expect(Validators.validatePassword('NoSymbol123'), isFalse);
    });
  });
}
