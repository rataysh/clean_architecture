class UserEntity {
  final String uid;
  final String email;
  final String salt;
  final String passwordHash;

  UserEntity({
    required this.uid,
    required this.email,
    required this.passwordHash,
    required this.salt,
  });
}
