class Item {
  String? id;
  String? title;
  String? subTitle;
  String? imageUrl;

  Item(this.id, this.title, this.subTitle, this.imageUrl);

  factory Item.fromJson(Map<String, dynamic> map) =>
      Item(map["id"], map["title"], map["subTitle"], map["imageUrl"]);
}
