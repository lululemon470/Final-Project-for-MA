import 'dart:convert';

import 'package:first_project/DashboardScreen.dart';
import 'package:first_project/Fake%20Store/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detail.dart';
import 'dashboard.dart';

void main() {
  runApp(FakeStore());
}

class FakeStore extends StatelessWidget {
  const FakeStore({super.key});

  Future<List> _getProduct() async {
    var url = Uri.parse("http://127.0.0.1:5050/getProduct");
    var respone = await http.get(url);
    final data = jsonDecode(respone.body);
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
          title: const Text("Shopping Mobile",style: TextStyle(color:Colors.white),),
          iconTheme: IconThemeData(color: Colors.white),
          actionsIconTheme: IconThemeData(color: Colors.white),
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          dashboard(),
                    ),
                  );
                },
                icon: Icon(Icons.home),
              );
            }
          ),
          actions: [
            IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {  },)
          ]
        ),

        body: FutureBuilder<List>(
            future: _getProduct(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data == null) {
                return Center(
                  child: Text("No data"),
                );
              }
              if (snapshot.data != null) {
                var product = snapshot.data!;
                return GridView.builder(
                  itemCount: product.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // Number of items per row
                    crossAxisSpacing: 5.0,
                    // Horizontal spacing between grid items
                    mainAxisSpacing: 5.0,
                    // Vertical spacing between grid items
                    childAspectRatio: 0.6, // Aspect ratio of grid items
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailScreen(data:  product[index]['id']),
                                    ),
                                  );
                                },
                                child: Image.network(
                                  product[index]['image'],
                                  fit: BoxFit.cover,
                                  width:200,
                                  height:200
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                product[index]['title'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8),
                              child: Text(
                                product[index]['description'].toString().substring(1, 10) + " ...",
                                style: TextStyle(
                                    fontSize: 14,
                                    color:Colors.grey
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8),
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
                                    onPressed: () {},
                                    child: Text('Add to Cart',
                                    style: TextStyle(color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                  )
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
            }),
      ),
    );
  }
}