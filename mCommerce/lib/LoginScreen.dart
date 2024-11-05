import 'package:flutter/material.dart';
import 'MenuScreen.dart';
void main() => runApp(const LoginScreen());

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFACA46),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFACA46),
        ),
        body: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.network(
                      "https://www.edigitalagency.com.au/wp-content/uploads/new-UNSW-logo-png-horizontal-crest.png",
                      width:300,
                    )
                  )
                ],
              )
            ),
            Container(
                margin: const EdgeInsets.only(top:80),
                padding: const EdgeInsets.only(left:10,right:10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                      Text("Major Application",
                        style: TextStyle(fontSize: 45, color: Color(0xFFA15600)),
                        textAlign: TextAlign.center,
                      ),
                  ],
                )
            ),
            Container(
                margin: const EdgeInsets.only(top:0),
                padding: const EdgeInsets.only(left:10,right:10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("RESPONSE APPLICATION",
                      style: TextStyle(fontSize: 31, color:Color(0xFFC96D04)
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
            ),
            Container(
              margin: const EdgeInsets.only(top:60),
              padding: const EdgeInsets.only(left:10,right:10),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Username',
                        filled: true,
                        fillColor: Colors.white
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left:15, right:15),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter Password',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Builder(
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.only(left:20,right:20,top:10),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Menuscreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                      side: const BorderSide(width: 0, color: Colors.white),
                      backgroundColor: Colors.black,
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text('LOGIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                  )
                );
              }
            ),
            Container(
                width: 200,
                padding: const EdgeInsets.only(left:20,right:20,top:5),
                child: TextButton(
                  onPressed: (){},
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text('Forget Password',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.normal)),
                  ),
                )
            )
          ],
        )
      )
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
