import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Database {
  late FirebaseFirestore firestore;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }


  Future read() async {
    QuerySnapshot querySnapshot;
    List docs= [];
    try{
      querySnapshot = await firestore.collection('locations').get();
      if(querySnapshot.docs.isNotEmpty){
        for(var doc in querySnapshot.docs.toList()){
          Map a = {"id": doc.id, "name": doc['name'], "location":doc["location"] };
          docs.add(a);
        }
        return docs;
      }
    }
    catch(e){
      print(e);
    }
  }
}