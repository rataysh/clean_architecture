class ApiRandomNumberModel {
  final String randomValue;

  ApiRandomNumberModel({required this.randomValue});

  factory ApiRandomNumberModel.fromJson(Map<String, dynamic> json) {
    return ApiRandomNumberModel(
      randomValue: json['randomValue'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'randomValue': randomValue,
    };
  }
}
