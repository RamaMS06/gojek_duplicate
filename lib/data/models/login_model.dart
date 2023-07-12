class LoginModel {
  String? imgSlider;
  String? title;
  String? desc;

  LoginModel({this.imgSlider, this.title, this.desc});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
      imgSlider: json['img_slider'], title: json['title'], desc: json['desc']);
}
