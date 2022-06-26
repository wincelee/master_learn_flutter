class FirebaseItem {
  int? id;
  String? itemName;
  double? itemPrice;

  FirebaseItem();

  Map<String, dynamic> toJson() =>
      {'id': id, 'itemName': itemName, 'itemPrice': itemPrice};

  FirebaseItem.fromSnapshot(snapshot)
      : id = snapshot.data()['id'],
        itemName = snapshot.data()['itemName'],
        itemPrice = snapshot.data()['itemPrice'].toDouble();
}
