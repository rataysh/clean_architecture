class RandomNumberModel {
  final String randomValue;

  RandomNumberModel({required this.randomValue});

  factory RandomNumberModel.fromJson(Map<String, dynamic> json) {
    return RandomNumberModel(
      randomValue: json['randomValue'] ?? '',
    );
  }

  factory RandomNumberModel.fromString(String value) {
    return RandomNumberModel(randomValue: value);
  }

  Map<String, dynamic> toJson() {
    return {
      'randomValue': randomValue,
    };
  }
}
