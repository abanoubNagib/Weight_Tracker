import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {


  final CollectionReference _productCollectionRef =
      FirebaseFirestore.instance.collection('Products');

  final CollectionReference _weightCollectionRef =
      FirebaseFirestore.instance.collection('Weights');


  Future<List<QueryDocumentSnapshot>> getProducts() async {
    var value = await _productCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getAllWeights() async {
    var value = await _weightCollectionRef.get();
    return value.docs;
  }
}
