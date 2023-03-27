import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class NoteCard extends StatefulWidget {
  const NoteCard({Key? key, required this.data, required this.title})
      : super(key: key);

  final String data;
  final String title;

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  final ScrollController controller = ScrollController();
  String data = """
  我是彬彬 我爱吃菠萝
  
  '![](http://43.138.80.236:5230/o/r/9/image.png)'
  
  """;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      alignment: Alignment.topLeft,
      child: Card(
          color: Colors.white,
          shadowColor: Colors.grey,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Colors.white,
              width: 3,
            ),
          ),
          margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                child: Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ),
              Expanded(
                child: Markdown(data: widget.data),
              ),

              // Container(
              //   margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
              //   child: Container(
              //     alignment: Alignment.centerLeft,
              //     child: Text.rich(
              //       TextSpan(
              //         children: [
              //           WidgetSpan(
              //               child: Text(
              //                   '习近平，习近平，习近平，习近平，习近平，习近平，习近平，习近平，习近平，习近平，习近平，习近平，习近平，习近平，习近平，')),
              //           WidgetSpan(
              //               child: SingleChildScrollView(
              //             child: Column(
              //               children: [
              //                 Image.network(
              //                   'https://bkimg.cdn.bcebos.com/pic/5882b2b7d0a20cf431ad7f26d25f5c36acaf2fdd3389',
              //                   width: 200,
              //                   height: 200,
              //                   fit: BoxFit.scaleDown,
              //                 ),
              //               ],
              //             )
              //           ))
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              /* Expanded(
                  child: Container(
                child: QuillEditor.basic(
                  controller: _controller,
                  readOnly: false,
                ),
              )),*/
            ],
          )),
    );
  }
}
