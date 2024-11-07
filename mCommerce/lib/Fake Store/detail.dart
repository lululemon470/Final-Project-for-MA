import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'cart.dart';
import 'cartscreen.dart'; // Ensure CartScreen is imported

class DetailScreen extends StatelessWidget {
  final int data;
  var productData;
  // Constructor to accept data
  DetailScreen({required this.data});

  // Simulate fetching data from an API or database after navigation
  Future<Map> _getProductDetail() async {
    var url = Uri.parse("http://127.0.0.1:5050/getProductbyID/${this.data}");
    var respone = await http.get(url);
    final data = jsonDecode(respone.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
        actions: [
          Consumer<Cart>(
            builder: (context, cart, child) {
              return IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  // Navigate to Cart screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Map>(
              future: _getProductDetail(), // Fetch the data asynchronously
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                      strokeWidth: 5,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  productData = snapshot.data!; // Store product data here

                  return Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            productData['image'],
                            width: 200,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                print("Favorite");
                              },
                              icon: const Icon(
                                Icons.favorite_outline,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8.0),
                              child: Text(
                                productData['title'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8.0),
                              child: Text(
                                productData['description'],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total Amount",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(fontSize: 12),
                                      ),

                                    ],
                                  ),
                                ),
                                Text(
                                  "\$${productData['price']}",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Center(child: Text('No product data available.'));
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Consumer<Cart>(
        builder: (context, cart, child) {
          return FloatingActionButton(
            onPressed: () {
              // Add item to the cart when the action button is pressed
              cart.addToCart(
                productData['id'].toString(),
                productData['title'],
                productData['price'],
                productData['image'],
              );

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Added to cart'),
                ),
              );
            },
            child: Icon(Icons.add_shopping_cart),
            backgroundColor: Colors.blue,
          );
        },
      ),
    );
  }
}
