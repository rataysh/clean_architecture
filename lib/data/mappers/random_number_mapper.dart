import 'package:auth_test_task/data/models/random_number_model.dart';
import 'package:auth_test_task/domain/entities/random_number_entity.dart';

extension RandomNumberDTOMapper on RandomNumberModel {
  RandomNumberEntity toDomain() {
    return RandomNumberEntity(
      randomValue: randomValue,
    );
  }
}

extension RandomNumberDomainMapper on RandomNumberEntity {
  RandomNumberModel toDTO() {
    return RandomNumberModel(
      randomValue: randomValue,
    );
  }
}
