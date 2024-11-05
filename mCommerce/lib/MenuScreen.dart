import 'package:first_project/DashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:first_project/LoginScreen.dart';
void main() => runApp(const Menuscreen());

class Menuscreen extends StatelessWidget {
  const Menuscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF2e2e2d),
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Menu",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
            iconTheme: const IconThemeData(
              color: Color(0xFFFACA46),
            ),
            actions: [
              Builder(
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: TextButton(
                      onPressed: (){
                        Navigator.of(context).pop(MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        'LOGOUT',
                        style: TextStyle(
                            color: Color(0xFFFACA46), fontWeight: FontWeight.bold
                        ),
                      ),
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
                    margin: EdgeInsets.only(left:20,right:20,top:20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between the two boxes
                      children: [
                        // First box
                        Container(
                          margin: EdgeInsets.only(right:5),
                          width: (MediaQuery.of(context).size.width - 50) / 2, // Half of the available width with padding
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
                          child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.people_outline_outlined,
                                  size: 90,
                                ),
                                Text(
                                  "Users",
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left:5),
                          width: (MediaQuery.of(context).size.width - 50) / 2, // Half of the available width with padding
                          height: 200,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFACA46),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 7,
                              ),
                            ],
                          ),
                          child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  color: Color(0xFFA15600),
                                  Icons.contact_phone_outlined,
                                  size: 90,
                                ),
                                Text(
                                  "Contact lists",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFFA15600),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left:20,right:20,top:10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between the two boxes
                      children: [
                        // First box
                        Container(
                          margin: EdgeInsets.only(right:5),
                          width: (MediaQuery.of(context).size.width - 50) / 2, // Half of the available width with padding
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
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.groups_3_outlined,
                                size: 90,
                              ),
                              Text(
                                "Groups and associations",
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left:5),
                          width: (MediaQuery.of(context).size.width - 50) / 2, // Half of the available width with padding
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
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.menu_book_outlined,
                                size: 90,
                              ),
                              Text(
                                "Documents",
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left:20,right:20,top:10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between the two boxes
                      children: [
                        // First box
                        Container(
                          margin: EdgeInsets.only(right:5),
                          width: (MediaQuery.of(context).size.width - 50) / 2, // Half of the available width with padding
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
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.inventory_outlined,
                                size: 90,
                              ),
                              Text(
                                "Incident types and response guidlines",
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              )
                            ],
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
