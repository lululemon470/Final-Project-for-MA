import 'dart:convert';
import 'package:first_project/Fake%20Store/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'cart.dart'; // Import your Cart provider
import 'detail.dart';
import 'cartscreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),  // Provide the Cart to the entire app
      child: FakeStore(),
    ),
  );
}

class FakeStore extends StatelessWidget {
  const FakeStore({super.key});

  Future<List> _getProduct() async {
    var url = Uri.parse("http://127.0.0.1:5050/getProduct");
    var response = await http.get(url);
    final data = jsonDecode(response.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shop",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Shopping Mobile", style: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
          actionsIconTheme: IconThemeData(color: Colors.white),
          actions: [
            Consumer<Cart>(
              builder: (context, cart, child) {
                return IconButton(
                  icon: Stack(
                    children: [
                      Icon(Icons.shopping_cart),
                      if (cart.itemCount > 0)
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              cart.itemCount.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  onPressed: () {
                    // Navigate to the cart screen
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
        body: FutureBuilder<List>(
          future: _getProduct(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.data == null) {
              return Center(child: Text("No data"));
            }
            if (snapshot.data != null) {
              var product = snapshot.data!;
              return GridView.builder(
                itemCount: product.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(data: product[index]['id']),
                                  ),
                                );
                              },
                              child: Image.network(
                                product[index]['image'],
                                fit: BoxFit.cover,
                                width: 200,
                                height: 200,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              product[index]['title'],
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              product[index]['description'].toString().substring(1, 10) + " ...",
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${product[index]['price'].toString()} \$",
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Access the Cart provider to add the item to the cart
                                    Provider.of<Cart>(context, listen: false).addToCart(
                                      product[index]['id'].toString(),
                                      product[index]['title'],
                                      product[index]['price'],
                                      product[index]['image'],
                                    );
                                  },
                                  child: Text(
                                    'Add to Cart',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return const Text("No widget to build");
          },
        ),
      ),
    );
  }
}
