import 'package:flutter/material.dart';
import 'add_product.dart'; // Import Add Product logic
import 'edit_product.dart'; // Import Edit Product logic
import 'delete_product.dart'; // Import Delete Product logic
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  List<Map<String, dynamic>> products =
      []; // Changed to dynamic to handle Firestore data

  void showEditDialog(int index) {
    // Set the text in the controllers
    _nameController.text = products[index]['name']!;
    _categoryController.text = products[index]['category']!;
    _priceController.text = products[index]['price']!;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Chỉnh sửa sản phẩm'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                    labelText: 'Tên sản phẩm', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _categoryController,
                decoration: const InputDecoration(
                  labelText: 'Loại sản phẩm',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Giá sản phẩm',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog khi nhấn Hủy
              },
              child: const Text('Hủy',
                  style: TextStyle(color: Colors.red)), // Nút Hủy với màu đỏ
            ),
            TextButton(
              onPressed: () async {
                // Update Firestore
                await FirebaseFirestore.instance
                    .collection('products')
                    .doc(products[index]['id'])
                    .update({
                  'name': _nameController.text,
                  'category': _categoryController.text,
                  'price': _priceController.text,
                });

                fetchProducts(); // Refresh product list
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cập nhật'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    fetchProducts(); // Fetch products from Firestore
  }

  Future<void> fetchProducts() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('products').get();
    setState(() {
      products = querySnapshot.docs.map((doc) {
        return {
          'id': doc.id,
          ...doc.data(),
        };
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center, // Căn giữa tiêu đề
          child: const Text(
            'Thông tin sản phẩm',
            style: TextStyle(
              //backgroundColor: Colors.grey,

              fontWeight: FontWeight.bold, // In đậm tiêu đề
              fontSize: 40, // Tùy chỉnh kích thước chữ (tùy chọn)
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Form to input product details
            _buildProductForm(),
            const SizedBox(height: 10),
            // List of products
            _buildProductList(),
          ],
        ),
      ),
    );
  }

  // Widget for the product form
  Widget _buildProductForm() {
    return Column(
      children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            labelText: 'Tên sản phẩm',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _categoryController,
          decoration: const InputDecoration(
            labelText: 'Loại sản phẩm',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _priceController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Giá sản phẩm',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            onPressed: () {
              addProduct(context, _nameController, _categoryController,
                  _priceController, products, fetchProducts);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF2A5018), // Màu nền của nút
              foregroundColor: Colors.white, // Màu chữ trên nút
              padding: const EdgeInsets.symmetric(
                  horizontal: 50, vertical: 20), // Căn lề bên trong nút
              textStyle: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold), // Kiểu chữ đậm
            ),
            child: const Text('THÊM SẢN PHẨM'),
          ),
        ),
      ],
    );
  }

  // Widget to display the list of products
  Widget _buildProductList() {
    return Expanded(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.network(products[index]['image'] ??
                  'https://via.placeholder.com/50'), // Image from Firestore
              title: Text('Tên sản phẩm: ${products[index]['name']}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Giá : ${products[index]['price']}'),
                  Text('Loại : ${products[index]['category']}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //cHỈNH SỬA SẢN PHẨM
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      showEditDialog(index);
                      //editProduct(index, _nameController, _categoryController, _priceController, products, fetchProducts);
                    },
                  ),
                  IconButton(
                    //XOÁ SẢN PHẨM
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      deleteProduct(products[index]['id'],
                          fetchProducts); // Pass product ID
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
