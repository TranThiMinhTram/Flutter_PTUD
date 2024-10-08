import 'package:flutter/material.dart';

// Function to delete a product
void deleteProduct(
    int index, List<Map<String, String>> products, Function setStateCallback) {
  setStateCallback(() {
    products.removeAt(index);
  });
}
