import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/cart.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(product.image, height: 150),
            const SizedBox(height: 20),
            Text(
              product.name,
              style: const TextStyle(fontSize: 20),
            ),
            Text("${product.price} ₺"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Cart.items.add(product);
                Navigator.pop(context);
              },
              child: const Text("Sepete Ekle"),
            )
          ],
        ),
      ),
    );
  }
}
