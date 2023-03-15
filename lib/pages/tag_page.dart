
import 'package:flutter/material.dart';

class TagPage extends StatefulWidget {
  const TagPage({Key? key}) : super(key: key);

  @override
  State<TagPage> createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('标签',style: TextStyle(color: Colors.black,fontSize: 22),),
    );
  }
}
