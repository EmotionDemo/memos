import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:memos/pages/add_page.dart';

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
            title:const Text(
              /*widget.data.title*/"📒笔记正文",
              style: TextStyle(color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                // Navigator.popAndPushNamed(context, "/add_page");
                Navigator.pop(context);
              },
            )),
        body: MarkdownWidget(
          data: widget.data.data,
          shrinkWrap: true,
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
        ));
  }
}
