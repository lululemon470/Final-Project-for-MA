import 'package:flutter/material.dart';
import 'package:first_project/LoginScreen.dart';
void main() => runApp(const DashboardScreen());

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
                  "MIRT Chair Dashboard",
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
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
                    decoration: const BoxDecoration(
                      color: Color(0xFFd9d8d7),
                    ),
                    padding: const EdgeInsets.all(5),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ACTIVE MIRT",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.all(15),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0, // 👈 Add this,
                          backgroundColor: const Color(0xFFFACA46),
                          padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.call_to_action,
                              color: Color(0xFFA15600),
                            ),
                            Text(
                              "   MIRT CHAIR ACTIONS",
                              style: TextStyle(
                                  color: Color(0xFFA15600),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )),
                  Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFfff5d9),
                      ),
                      padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              "Fire Event",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  letterSpacing: -1.5,
                                  wordSpacing: 1),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              "11:30 am",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              "10/10/2016",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset('assets/images/icons8-user-24.png'),
                              const Text("15 notified"),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_drop_down_outlined,
                                      size: 30)),
                            ],
                          )
                        ],
                      )),
                  Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFfff5d9),
                      ),
                      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Row(children: [
                                Image.asset(
                                    'assets/images/icons8-location-pin-32.png')
                              ])),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text.rich(TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: const [
                                TextSpan(
                                  text: 'Building #7 IT department\n',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: 'Primary Emergency Operation Centre',
                                  style: TextStyle(fontSize: 12)
                                ),
                              ],
                            )),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  iconColor: Colors.white,
                                  elevation: 0, // 👈 Add this,
                                  backgroundColor: Colors.red,
                                  padding: const EdgeInsets.fromLTRB(5,5,10,5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.close),
                                    Text("CLOSE MIRT",
                                      style: TextStyle(color:Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left:10,right:10,top:10),
                        child: Row(children: [
                          Image.asset(
                              'assets/images/icons8-user-48.png')
                        ]),
                      ),
                      Container(
                        child: Text.rich(TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const [
                            TextSpan(
                              text: 'John Doe\n',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                text: 'Did not respond in time-declined',
                                style: TextStyle(fontSize: 12,color: Colors.red,fontWeight: FontWeight.bold)
                            ),
                          ],
                        )),
                      ),
                      Expanded(
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_drop_down_outlined,
                                      size: 30)),
                            ],
                          )
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left:10,right:10,top:10),
                        child: Row(children: [
                          Image.asset(
                              'assets/images/icons8-user-48.png')
                        ]),
                      ),
                      Expanded(
                        flex:5,
                        child: Text.rich(TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const [
                            TextSpan(
                              text: 'Michael Lockwood\t',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: 'Yet to acknowledge receipt\n',
                              style: TextStyle(fontSize: 12 ,color: Colors.grey),
                            ),
                            TextSpan(
                                text: 'Notified at 11:30am, 10/10/16',
                                style: TextStyle(fontSize: 12 ,color: Colors.grey)
                            ),
                          ],
                        )),
                      ),
                      Expanded(
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_drop_up_outlined,
                                      size: 30)),
                            ],
                          )
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right:10,left:10,top:10),
                        child: Row(children: [
                          Image.asset(
                              'assets/images/icons8-user-48.png')
                        ]),
                      ),
                      Expanded(
                        flex:5,
                        child: Text.rich(TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const [
                            TextSpan(
                              text: 'John Doe\t\t',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: 'Yet to acknowledge receipt\n',
                              style: TextStyle(fontSize: 12 ,color: Colors.grey),
                            ),
                            TextSpan(
                                text: 'Notified at 11:30am, 10/10/16',
                                style: TextStyle(fontSize: 12 ,color: Colors.grey)
                            ),
                          ],
                        )),
                      ),
                      Expanded(
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_drop_up_outlined,
                                      size: 30)),
                            ],
                          )
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right:10,left:10,top:10),
                        child: Row(children: [
                          Image.asset(
                              'assets/images/icons8-user-48.png')
                        ]),
                      ),
                      Expanded(
                        flex:5,
                        child: Text.rich(TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const [
                            TextSpan(
                              text: 'John Doe\t\t',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: 'Yet to acknowledge receipt\n',
                              style: TextStyle(fontSize: 12 ,color: Colors.grey),
                            ),
                            TextSpan(
                                text: 'Notified at 11:30am, 10/10/16',
                                style: TextStyle(fontSize: 12 ,color: Colors.grey)
                            ),
                          ],
                        )),
                      ),
                      Expanded(
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_drop_up_outlined,
                                      size: 30)),
                            ],
                          )
                      ),
                    ],
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
