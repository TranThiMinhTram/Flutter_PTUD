import 'package:flutter/material.dart';

// Function to edit a product
Future<void> editProduct(
  int index,
  TextEditingController nameController,
  TextEditingController categoryController,
  TextEditingController priceController,
  List<Map<String, dynamic>> products,
  Function fetchProducts,
) async {
  nameController.text = products[index]['name'];
  categoryController.text = products[index]['category'];
  priceController.text = products[index]['price'];

  // Show a dialog for editing the product
}
