import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [Image.asset('images/ic_net_error.png'), Text('稍后重试')],
        ),
      ),
    );
  }
}
