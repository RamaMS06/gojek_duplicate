class CardDataUserModel {
  int? type;
  double? amount;
  String? img;

  CardDataUserModel({this.type, this.amount, this.img});

  factory CardDataUserModel.fromJson(Map<String, dynamic> json) {
    return CardDataUserModel(
      amount: json['amount'],
      type: json['type'],
      img: json['img'],
    );
  }
}
