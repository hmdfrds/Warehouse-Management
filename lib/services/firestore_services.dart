import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:warehouse/models/item.dart';

class FirestoreServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference warehouseReference;
  late CollectionReference workersReference;
  late CollectionReference itemsReference;

  FirestoreServices() {
    itemsReference = _firebaseFirestore.collection("Items");
    workersReference = _firebaseFirestore.collection("Workers");
    warehouseReference = _firebaseFirestore.collection("Warehouse");
  }

  Future<Item> getItem(String itemId) async {
    DocumentSnapshot ds = await itemsReference.doc(itemId).get();
    Map<String, dynamic> map = ds.data() as Map<String, dynamic>;
    map.addAll({
      "id": ds.id,
    });
    return Item.fromMap(map);
  }

  Future<List<Item>> getItemList(String itemId) async {
    List<Item> items = [];

    return items;
  }
}
