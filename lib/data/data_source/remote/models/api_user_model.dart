class ApiUserModel {
  final String uid;
  final String email;
  final String passwordHash;
  final String salt;
  final String? userName;

  ApiUserModel({
    required this.uid,
    required this.email,
    required this.passwordHash,
    required this.salt,
    this.userName,
  });

  factory ApiUserModel.fromJson(Map<String, dynamic> json) {
    return ApiUserModel(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      passwordHash: json['passwordHash'] ?? '',
      salt: json['salt'] ?? '',
      userName: json['userName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'passwordHash': passwordHash,
      'salt': salt,
      'userName': userName,
    };
  }
}
