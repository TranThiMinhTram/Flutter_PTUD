import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

// Function to add a product
Future<void> addProduct(
  BuildContext context,
  TextEditingController nameController,
  TextEditingController categoryController,
  TextEditingController priceController,
  List<Map<String, dynamic>> products,
  Function fetchProducts,
) async {
  // Validate input fields
  if (nameController.text.isEmpty ||
      categoryController.text.isEmpty ||
      priceController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields.')));
    return;
  }

  // Pick an image and upload it
  final ImagePicker picker = ImagePicker();
  final XFile? imageFile = await picker.pickImage(source: ImageSource.gallery);

  if (imageFile != null) {
    // Upload image to Firebase Storage (implement this function)
    String imageUrl =
        await uploadImage(imageFile.path); // Implement uploadImage method

    // Add the product to Firestore
    await FirebaseFirestore.instance.collection('products').add({
      'name': nameController.text,
      'category': categoryController.text,
      'price': priceController.text,
      'image': imageUrl, // Save the uploaded image URL
    });

    // Clear the input fields
    nameController.clear();
    categoryController.clear();
    priceController.clear();

    fetchProducts(); // Refresh product list

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product added successfully!')));
  }
}

// Function to upload image (implement your own logic)
Future<String> uploadImage(String filePath) async {
  // Implement the image upload logic here, for example, using Firebase Storage
  // Return the download URL of the uploaded image
  return 'https://firebasestorage.googleapis.com/path/to/uploaded/image.jpg'; // Replace with the actual URL
}
