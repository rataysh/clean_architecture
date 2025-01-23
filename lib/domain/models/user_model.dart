class UserModel {
  final String uid;
  final String email;
  final String passwordHash;
  final String salt;

  UserModel({
    required this.uid,
    required this.email,
    required this.passwordHash,
    required this.salt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      passwordHash: json['passwordHash'] ?? '',
      salt: json['salt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'passwordHash': passwordHash,
      'salt': salt,
    };
  }
}
