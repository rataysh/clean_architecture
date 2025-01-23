import 'dart:convert';
import 'package:auth_test_task/domain/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const _keyIsLoggedIn = 'isLoggedIn';
  static const _keyUsers = 'users';

  static late final SharedPreferences _preferences;

  static Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> getIsLoggedIn() async {
    return _preferences.getBool(_keyIsLoggedIn) ?? false;
  }

  static Future<void> setIsLoggedIn(bool value) async {
    await _preferences.setBool(_keyIsLoggedIn, value);
  }

  static Future<List<UserModel>> getUsers() async {
    final usersJson = _preferences.getString(_keyUsers);
    if (usersJson == null) {
      return [];
    }
    final List<dynamic> decodedJson = jsonDecode(usersJson);
    return decodedJson.map((json) => UserModel.fromJson(json)).toList();
  }

  static Future<UserModel?> getUserByEmail(String email) async {
    final users = await getUsers();
    try {
      return users.firstWhere((u) => u.email == email);
    } catch (e) {
      return null;
    }
  }

  static Future<void> saveUser(UserModel user) async {
    final users = await getUsers();
    users.add(user);
    final usersJson = jsonEncode(users.map((user) => user.toJson()).toList());
    await _preferences.setString(_keyUsers, usersJson);
  }
}
