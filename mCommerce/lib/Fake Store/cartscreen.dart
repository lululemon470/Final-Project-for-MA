import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: cart.itemCount == 0
          ? Center(child: Text("Your cart is empty"))
          : ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final item = cart.items.values.toList()[index];
          return Dismissible(
            key: ValueKey(item.id), // Used to uniquely identify the item
            direction: DismissDirection.endToStart, // Swipe to remove
            onDismissed: (direction) {
              // Remove item from cart when dismissed
              cart.removeItem(item.id);
            },
            background: Container(
              color: Colors.red, // Red background when swiping
              child: Icon(Icons.delete, color: Colors.white),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
            ),
            child: ListTile(
              title: Text(item.title),
              subtitle: Text("\$${item.price}"),
              leading: Image.network(item.image),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle, color: Colors.red),
                onPressed: () {
                  // Remove the item when the remove button is pressed
                  cart.removeItem(item.id);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
