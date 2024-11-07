import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(SendData());
}

class SendData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SendDataScreen(),
    );
  }
}

class SendDataScreen extends StatefulWidget {
  @override
  _SendDataScreenState createState() => _SendDataScreenState();
}

class _SendDataScreenState extends State<SendDataScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  File? _image;

  final ImagePicker _picker = ImagePicker();

  // Function to pick an image
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Function to send data
  Future<void> sendData() async {
    try {
      String name = _controller.text;
      String price = _controller1.text;
      String category = _controller2.text;
      String description = _controller3.text;

      // If there's an image, include the file path
      String imagePath = _image != null ? _image!.path : 'default_image_path';

      // Wrap the body in an array
      List<Map<String, dynamic>> body = [
        {
          'title': name,
          'category': category,
          'price': double.parse(price),
          'description': description,
          'image': imagePath // Include the image path
        }
      ];

      String apiUrl = "http://127.0.0.1:5050/createProduct";
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body), // Send the array
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Response: ${response.body}");
      } else {
        print("Failed: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Data to API"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter product name'),
            ),
            TextField(
              controller: _controller1,
              decoration: InputDecoration(labelText: 'Enter product price'),
            ),
            TextField(
              controller: _controller2,
              decoration: InputDecoration(labelText: 'Enter product category'),
            ),
            TextField(
              controller: _controller3,
              decoration: InputDecoration(labelText: 'Enter product description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage, // Open image picker
              child: Text("Pick Image"),
            ),
            SizedBox(height: 10),
            _image != null
                ? Image.file(_image!) // Display the selected image
                : Text("No image selected"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: sendData,
              child: Text("Add Product"),
            ),
          ],
        ),
      ),
    );
  }
}
