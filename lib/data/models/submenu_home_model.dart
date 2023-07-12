class SubMenuHomeModel {
  String? label;
  String? icons;

  SubMenuHomeModel({this.label, this.icons});

  factory SubMenuHomeModel.fromJson(Map<String, dynamic> json) =>
      SubMenuHomeModel(label: json['label'], icons: json['icons']);

  Map<String, dynamic> toJson() => {'label': label, 'icons': icons};
}
