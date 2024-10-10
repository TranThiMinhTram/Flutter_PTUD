import 'package:flutter/material.dart';
import 'package:product/add_product.dart'; // Import Add Product logic
import 'package:product/edit_product.dart'; // Import Edit Product logic
import 'package:product/delete_product.dart'; // Import Delete Product logic

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  List<Map<String, String>> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dữ liệu sản phẩm'),
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
          ),
        ),
        TextField(
          controller: _categoryController,
          decoration: const InputDecoration(
            labelText: 'Loại sản phẩm',
          ),
        ),
        TextField(
          controller: _priceController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Giá sản phẩm',
          ),
        ),
        const SizedBox(height: 10),
        const Row(
          children: [
            Icon(Icons.folder),
            SizedBox(width: 8),
            Text('pexels-blaque-x-264516-863963.jpg'),
          ],
        ),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            onPressed: () {
              addProduct(_nameController, _categoryController, _priceController,
                  products, setState);
            },
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
              leading: Image.network(
                  'https://via.placeholder.com/50'), // Placeholder image
              title: Text('Tên sp: ${products[index]['name']}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Giá sp: ${products[index]['price']}'),
                  Text('Loại sp: ${products[index]['category']}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.yellow),
                    onPressed: () {
                      editProduct(index, _nameController, _categoryController,
                          _priceController, products, setState);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      deleteProduct(index, products, setState);
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
