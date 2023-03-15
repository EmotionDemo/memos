import 'package:flutter/material.dart';

class ResourcePage extends StatefulWidget {
  const ResourcePage({Key? key}) : super(key: key);

  @override
  State<ResourcePage> createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('资源',style: TextStyle(color: Colors.black,fontSize: 22),),
    );
  }
}
