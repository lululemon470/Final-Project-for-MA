import 'package:first_project/Fake%20Store/fake_store.dart';
import 'package:first_project/Fake%20Store/sendDatatoAPIServer.dart';
import 'package:flutter/material.dart';

void main() => runApp(const dashboard());

class dashboard extends StatelessWidget {
  const dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Dashboard",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
            iconTheme: const IconThemeData(
              color: Colors.white
            ),
            actions: [
              Builder(
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(right: 0),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.shopping_cart,
                            ),
                            // the method which is called
                            // when button is pressed
                            onPressed: () {
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.notifications,
                            ),
                            // the method which is called
                            // when button is pressed
                            onPressed: () {
                            },
                          ),
                        ],
                      ),
                    );
                  }
              ),
            ],
            toolbarHeight: 70,
            toolbarOpacity: 1,
            elevation: 100,

          ),
          drawer: Drawer(
              child: Column(
                children: <Widget>[
                  const UserAccountsDrawerHeader(
                    accountName: Text("GOLB"),
                    accountEmail: Text("od.king007@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/images/2e9.jpg"),
                    ),
                    decoration: BoxDecoration(color: Color(0xFF000000)),
                  ),
                  _buildHoverListTile(Icons.home, "Home"),
                  _buildHoverListTile(Icons.person, "Profile"),
                  _buildHoverListTile(Icons.settings, "Setting"),
                  _buildHoverListTile(Icons.logout, "Logout"),
                  _buildHoverListTile(Icons.info, "About app"),
                ],
              )),
          body: Column(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between the two boxes
                      children: [
                        // First box
                        Container(
                          margin: EdgeInsets.only(right:5),
                          width: (MediaQuery.of(context).size.width - 35) / 2, // Half of the available width with padding
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 7,
                              ),
                            ],
                          ),
                          child: Builder(
                            builder: (context) {
                              return InkWell(
                                onTap: () {
                                  // Check if MyApp is already on the navigation stack
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => SendDataScreen()),
                                    );
                                },
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.sell,
                                      size: 90,
                                      color:Colors.green
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Add new product",
                                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left:5),
                          width: (MediaQuery.of(context).size.width - 35) / 2, // Half of the available width with padding
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 7,
                              ),
                            ],
                          ),
                          child: Builder(
                            builder: (context) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          FakeStore(),
                                    ),
                                  );
                                },
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.production_quantity_limits_outlined,
                                      size: 90,
                                        color:Colors.pink
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Product List",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  Widget _buildHoverListTile(IconData icon, String title) {
    return InkWell(
      onTap: () {
        // Handle tap event if necessary
      },
      hoverColor: Colors.grey[300], // Grey color when hovered
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
      ),
    );
  }
}
