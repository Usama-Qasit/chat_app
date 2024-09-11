
import 'package:chat_app/consts/firebase_consts.dart';

class StoreServies{

  static getUser(String id){
    return firebaseFirestore.collection(collectionUser).where('id',isEqualTo: id).get();
  }
}
