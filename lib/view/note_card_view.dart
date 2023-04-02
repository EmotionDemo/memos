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
                  style: const TextStyle(color: Colors.black, fontSize: 22),
                ),
              ),
              Expanded(
                child: Markdown(
                    data: widget.data,
                    physics: const NeverScrollableScrollPhysics()),
              )
            ],
          )),
    );
  }
}
