import 'package:flutter/material.dart';

class CollectPage extends StatefulWidget {
  const CollectPage({Key? key}) : super(key: key);

  @override
  State<CollectPage> createState() => _CollectPageState();
}

class _CollectPageState extends State<CollectPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('收藏',style: TextStyle(color: Colors.black,fontSize: 22),),
    );
  }
}
