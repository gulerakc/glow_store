import 'models/product.dart';

class Cart {
  static final Map<Product, int> items = {};

  static void add(Product product) {
    if (items.containsKey(product)) {
      items[product] = items[product]! + 1;
    } else {
      items[product] = 1;
    }
  }

  static void remove(Product product) {
    items.remove(product);
  }

  static void increase(Product product) {
    items[product] = items[product]! + 1;
  }

  static void decrease(Product product) {
    if (items[product]! > 1) {
      items[product] = items[product]! - 1;
    } else {
      items.remove(product);
    }
  }

  static double totalPrice() {
    double total = 0;
    items.forEach((product, qty) {
      total += product.price * qty;
    });
    return total;
  }
}
