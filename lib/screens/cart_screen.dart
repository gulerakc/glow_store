import 'package:flutter/material.dart';
import '../cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sepet")),
      body: Cart.items.isEmpty
          ? const Center(child: Text("Sepet boş"))
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    children: Cart.items.entries.map((entry) {
                      final product = entry.key;
                      final qty = entry.value;

                      return ListTile(
                        leading: Image.asset(product.image, width: 50),
                        title: Text(product.name),
                        subtitle: Text("${product.price} ₺"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  Cart.decrease(product);
                                });
                              },
                            ),
                            Text("$qty"),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  Cart.increase(product);
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Toplam: ${Cart.totalPrice().toStringAsFixed(2)} ₺",
                    style: const TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
    );
  }
}
