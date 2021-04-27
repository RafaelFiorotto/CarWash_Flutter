import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceApi {
  final Firestore _db = Firestore.instance;
  final String path;
  CollectionReference ref;


  ServiceApi(this.path) {
    ref = _db.collection(path);
  }  

  Future<QuerySnapshot> getDataCollection(){
    return ref.getDocuments();
  }

  Future<QuerySnapshot> getRates(String serviceId){
    return ref.document(serviceId).collection('rates').getDocuments();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.document(id).get();
  }

  Future<void> removeDocument(String id){
    return ref.document(id).delete();
  }

  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }

  Future<void> updateDocument(String id, Map data) {
    return ref.document(id).updateData(data);
  }
}
