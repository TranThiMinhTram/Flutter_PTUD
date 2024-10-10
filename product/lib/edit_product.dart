import 'package:flutter/material.dart';

// Function to edit a product
void editProduct(
    int index,
    TextEditingController nameController,
    TextEditingController categoryController,
    TextEditingController priceController,
    List<Map<String, String>> products,
    Function setStateCallback) {
  setStateCallback(() {
    nameController.text = products[index]['name']!;
    categoryController.text = products[index]['category']!;
    priceController.text = products[index]['price']!;
  });
}
