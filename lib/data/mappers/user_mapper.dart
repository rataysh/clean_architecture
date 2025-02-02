import 'package:auth_test_task/data/models/user_model.dart';
import 'package:auth_test_task/domain/entities/user_entity.dart';

extension UserDTOMapper on UserModel {
  UserEntity toDomain() {
    return UserEntity(
      uid: uid,
      email: email,
      passwordHash: passwordHash,
      salt: salt,
    );
  }
}

extension UserDomainMapper on UserEntity {
  UserModel toDTO() {
    return UserModel(
      uid: uid,
      email: email,
      passwordHash: passwordHash,
      salt: salt,
    );
  }
}
