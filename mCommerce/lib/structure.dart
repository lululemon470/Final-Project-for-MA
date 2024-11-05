import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://legend.com.kh/_ipx/s_117x44/legend-cinema-logo.png',
                fit: BoxFit.contain,
                height: 32,
                alignment: FractionalOffset.center
              ),
              Container(
                  padding: const EdgeInsets.all(0)
              ),
            ],

          ),
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: Icon(
                Icons.chat_bubble_outline_sharp,
                size: 22,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: Icon(
                Icons.notifications_outlined,
                size: 22,
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(right: 5.0),
            //   child: Icon(
            //     Icons.qr_code,
            //     size: 22,
            //   ),
            // ),
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children:[
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child:Image.network(
                          "https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/37c1b050-709f-40fe-b374-23c2035177bb.jpeg",
                          width: 400
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child:Image.network(
                        "https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/5194d602-2667-4ae7-9e83-fc76b4753e5e.jpeg",
                        width: 400,
                      ),
                    ),Padding(
                      padding: const EdgeInsets.all(5),
                      child:Image.network(
                        "https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/0b31dc63-3a5c-40be-992d-ba9d2cfa02f8.jpeg",
                        width: 400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child:Image.network(
                        "https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/ac132b32-1e1d-4225-a2a9-5633a177437e.jpeg",
                        width: 400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child:Image.network(
                        "https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/f2112620-2f17-4d51-9e0d-648a449a7298.jpeg",
                        width: 400,
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child:Image.network(
                          "https://tickets.legend.com.kh/CDN/media/entity/get/Movies/HO00001619",
                          width: 400),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child:Image.network(
                        "https://tickets.legend.com.kh/CDN/media/entity/get/Movies/HO00001692",
                        width: 400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child:Image.network(
                        "https://tickets.legend.com.kh/CDN/media/entity/get/Movies/HO00001614",
                        width: 400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child:Image.network(
                        "https://tickets.legend.com.kh/CDN/media/entity/get/Movies/HO00001708",
                        width: 400,
                      ),
                    ),

                  ],
                ),
              ),
            ]
          )

        ),
      ),
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
