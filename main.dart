import 'dart:io';
class Product {
  String name;
  double price;

  Product(this.name, this.price);
}

class ShoppingCart {
  List<Product> cart = [];

  void addProduct(Product product) {
    cart.add(product);
    print("\n${product.name} added to cart.");
  }

  void viewCart() {
    if (cart.isEmpty) {
      print("\nYour cart is empty.");
      return;
    }

    print("\nYour Shopping Cart:");
    double total = 0;
    for (int i = 0; i < cart.length; i++) {
      print("${i + 1}. ${cart[i].name} - \$${cart[i].price.toStringAsFixed(2)}");
      total += cart[i].price;
    }
    print("Total Cost: \$${total.toStringAsFixed(2)}");
  }
}

void main() {
  List<Product> products = [
    Product("Laptop", 750.99),
    Product("Smartphone", 499.99),
    Product("Headphones", 79.99),
    Product("Smartwatch", 199.99),
    Product("Tablet", 329.99)
  ];

  ShoppingCart cart = ShoppingCart();

  while (true) {
    print("\nAvailable Products:");
    for (int i = 0; i < products.length; i++) {
      print("${i + 1}. ${products[i].name} - \$${products[i].price.toStringAsFixed(2)}");
    }
    print("6. View Cart");
    print("7. Exit");
    stdout.write("\nEnter the number of the product to add to cart: ");

    String? input = stdin.readLineSync();
    int? choice = int.tryParse(input ?? "");

    if (choice == null || choice < 1 || choice > 7) {
      print("Invalid input. Please enter a valid number.");
      continue;
    }

    if (choice == 7) {
      print("Exiting the application. Thank you!");
      break;
    } else if (choice == 6) {
      cart.viewCart();
    } else {
      cart.addProduct(products[choice - 1]);
    }
  }
}




