import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markdown_widget/markdown_widget.dart';

import '../beans/MemoDetailBean.dart';

class MemoDetail extends StatefulWidget {
  const MemoDetail({Key? key, required this.data}) : super(key: key);

  final MemoDetailBean data;

  @override
  State<MemoDetail> createState() => _MemoDetailState();
}

class _MemoDetailState extends State<MemoDetail> {
  @override
  Widget build(BuildContext context) {
    // final String data = ModalRoute.of(context)!.settings.arguments as String;
    print('data-------->${widget.data}');
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              widget.data.title,
              style: const TextStyle(color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: MarkdownWidget(
          data: widget.data.data,
          shrinkWrap: true,
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        ));
  }
}
