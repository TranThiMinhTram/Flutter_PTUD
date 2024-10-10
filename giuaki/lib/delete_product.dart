import 'package:cloud_firestore/cloud_firestore.dart';

// Function to delete a product
Future<void> deleteProduct(String productId, Function fetchProducts) async {
  await FirebaseFirestore.instance
      .collection('products')
      .doc(productId)
      .delete();
  fetchProducts(); // Refresh product list
}
