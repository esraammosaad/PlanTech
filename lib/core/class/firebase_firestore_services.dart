// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class FirebaseFireStoreServices {
//   Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getData(
//       String collectionName) async {
//     QuerySnapshot<Map<String, dynamic>> collectionReference =
//         await FirebaseFirestore.instance.collection(collectionName).get();
//
//     List<QueryDocumentSnapshot<Map<String, dynamic>>> docSnapshot =
//         collectionReference.docs;
//
//     return docSnapshot;
//   }
//
//   Future<List<QueryDocumentSnapshot>> getMyCartOrFavoriteData(
//       String collectionName) async {
//     QuerySnapshot collectionReference = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .collection(collectionName)
//         .orderBy('createdAt', descending: true)
//         .get();
//     List<QueryDocumentSnapshot> docSnapshot = collectionReference.docs;
//
//     return docSnapshot;
//   }
//
//   Future<num> getTotalPrice() async {
//     num totalPrice = 0;
//     List productsData = [];
//     productsData = await getMyCartOrFavoriteData('cart');
//     for (int i = 0; i < productsData.length; i++) {
//       totalPrice += (ProductModel.fromJson(productsData[i].data()).price *
//           ProductModel.fromJson(productsData[i].data()).numOfItems);
//     }
//
//     return totalPrice;
//   }
//
//   Future<void> addDataToCartOrFavorite(
//       ProductModel productModel, int index, String collectionName) async {
//     List productsData = [];
//     productsData = await getData('products');
//
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .collection(collectionName)
//         .doc(productsData[index].id)
//         .set(productModel.toJson());
//   }
//
//   Future<void> deleteDataFromCartOrFavorite(
//       ProductModel productModel, int index, String collectionName) async {
//     List productsData = [];
//     productsData = collectionName == 'products'
//         ? await getData(collectionName)
//         : await getMyCartOrFavoriteData(collectionName);
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .collection(collectionName)
//         .doc(productsData[index].id)
//         .update({
//       'isInCart': false,
//     });
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .collection(collectionName)
//         .doc(productsData[index].id)
//         .delete();
//   }
//
//   updateNumberOfItemsInCart(int index, int numOfItems) async {
//     List productsData = [];
//     productsData = await getMyCartOrFavoriteData('cart');
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .collection('cart')
//         .doc(productsData[index].id)
//         .update({
//       'numOfItems': numOfItems,
//     });
//   }
// }
