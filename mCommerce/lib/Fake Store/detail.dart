// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailScreen extends StatelessWidget {
  final int data;
  var price;
  // Constructor to accept data
  DetailScreen({required this.data});

  // Simulate fetching data from an API or database after navigation
  Future<String> fetchData() async {
    await Future.delayed(
        Duration(seconds: 5)); // Simulating a network call delay
    return 'Fetched Data: Details loaded after 5 seconds!';
  }
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
                  ); // Loading spinner
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}')); // Error handling
                } else {
                  return Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), // DecorationImage
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center, // Align items to the start
                        children: [
                          Image.network(
                            "${snapshot.data!['image']}",
                            width: 200,
                          ),
                          Align(
                            alignment: Alignment.topRight, // Aligns the IconButton at the top right
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
                              padding: const EdgeInsets.only(top:8, bottom: 8.0),
                              child: Text(
                                "${snapshot.data!['title']}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top:8, bottom: 8.0),
                              child: Text(
                                "${snapshot.data!['description']}",
                              ),
                            ),
                          ),
                          const Spacer(), // Takes up available space to push the price down
                          Container(
                            padding: EdgeInsets.only(top:10),
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide( //                    <--- top side
                                  color: Colors.grey,
                                  width: 0.5,
                                )
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
                                      Text("Total",textAlign: TextAlign.start, style: TextStyle(fontSize: 12),),
                                      Text("Amount",textAlign: TextAlign.start,style: TextStyle(fontSize: 12,))
                                    ],
                                  ),
                                ),
                                Text(
                                  "\$${snapshot.data!['price']}",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:60.0),
                                  child: ElevatedButton(
                                    onPressed: (){},
                                    child: Text(
                                        "Add to Cart",
                                        style: TextStyle(color:Colors.white),
                                      ),
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0, // 👈 Add this,
                                      backgroundColor: Colors.blue,
                                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ); // Display fetched data
                }
              },
            ),
          ),
        ],
      ),

    );
  }
}
