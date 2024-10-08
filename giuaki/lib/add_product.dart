import 'package:flutter/material.dart';

// Function to add a product
void addProduct(
    TextEditingController nameController,
    TextEditingController categoryController,
    TextEditingController priceController,
    List<Map<String, String>> products,
    Function setStateCallback) {
  setStateCallback(() {
    products.add({
      'name': nameController.text,
      'category': categoryController.text,
      'price': priceController.text,
      'image': 'path/to/image.jpg', // Hardcoded for now
    });
    // Clear the input fields
    nameController.clear();
    categoryController.clear();
    priceController.clear();
  });
}
