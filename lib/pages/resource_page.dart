import 'package:flutter/material.dart';


class ResourcePage extends StatefulWidget {
  const ResourcePage({Key? key}) : super(key: key);

  @override
  State<ResourcePage> createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.network("http://43.138.80.236:5230/o/r/17/8b754ae9-e9ac-4640-9066-6133993249a8.jpg"),
      ),
    );
  }
}
