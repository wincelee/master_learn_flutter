class Item2 {
  String? id;
  String? title;
  String? subTitle;
  String? imageUrl;

  Item2({this.id, this.title, this.subTitle, this.imageUrl});

  factory Item2.fromJson(Map<String, dynamic> map) =>
      Item2(id: map["id"], title:map["title"], subTitle: map["subTitle"], imageUrl: map["imageUrl"]);
}
