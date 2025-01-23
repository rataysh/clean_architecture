import 'dart:convert';
import 'package:crypto/crypto.dart';

class AuthPasswordService {
  static String hashPassword(String password, {String? salt}) {
    final passwordSalt =
        salt ?? DateTime.now().millisecondsSinceEpoch.toString();

    final bytes = utf8.encode(password + passwordSalt);

    final hash = sha256.convert(bytes);

    return hash.toString();
  }

  static bool verifyPassword(String password, String hash, String salt) {
    final newHash = hashPassword(password, salt: salt);
    return newHash == hash;
  }

  static String generateSalt() {
    final random = DateTime.now().millisecondsSinceEpoch.toString();
    final bytes = utf8.encode(random);
    final hash = sha256.convert(bytes);
    return hash.toString().substring(0, 16);
  }
}
