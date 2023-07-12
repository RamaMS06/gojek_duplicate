class CountriesModel {
  String? name;
  String? flag;
  String? code;
  String? dialCode;

  CountriesModel({this.name, this.flag, this.code, this.dialCode});

  factory CountriesModel.fromJson(Map<String, dynamic> json) => CountriesModel(
      name: json['name'],
      flag: json['flag'],
      code: json['code'],
      dialCode: json['dial_code']);

  Map<String, dynamic> toJson() =>
      {'name': name, 'flag': flag, 'code': code, 'dial_code': dialCode};
}
