import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grad_proj/data/models/post_model.dart';

class FirebaseFireStoreServices {
  // Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getData(
  //     String collectionName) async {
  //   QuerySnapshot<Map<String, dynamic>> collectionReference =
  //       await FirebaseFirestore.instance.collection(collectionName).get();
  //
  //   List<QueryDocumentSnapshot<Map<String, dynamic>>> docSnapshot =
  //       collectionReference.docs;
  //
  //   return docSnapshot;
  // }

  // Future addPost(PostModel post) async {
  //   await FirebaseFirestore.instance.collection('posts').add(PostModel(
  //           userName: post.userName,
  //           post: post.post,
  //           time: post.time,
  //           uid: post.uid,
  //           userImage: post.userName)
  //       .toJson());
  // }

  // Future<void> deleteDataFromCartOrFavorite(
  //     ProductModel productModel, int index, String collectionName) async {
  //   List productsData = [];
  //   productsData = collectionName == 'products'
  //       ? await getData(collectionName)
  //       : await getMyCartOrFavoriteData(collectionName);
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .collection(collectionName)
  //       .doc(productsData[index].id)
  //       .update({
  //     'isInCart': false,
  //   });
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .collection(collectionName)
  //       .doc(productsData[index].id)
  //       .delete();
  // }
  //
  // updateNumberOfItemsInCart(int index, int numOfItems) async {
  //   List productsData = [];
  //   productsData = await getMyCartOrFavoriteData('cart');
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .collection('cart')
  //       .doc(productsData[index].id)
  //       .update({
  //     'numOfItems': numOfItems,
  //   });
  // }
}
