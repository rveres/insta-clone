import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<CreatePostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Instagram',
            style: TextStyle(
                color: Colors.black, fontFamily: 'Billabong', fontSize: 35.0),
          )),
      body: Center(child: Text('Create Post')),
    );
  }
}
