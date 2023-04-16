import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class DeleteCard extends StatefulWidget {
  const DeleteCard(
      {Key? key,
      required this.data,
      required this.createTime,
      required this.user})
      : super(key: key);
  final String createTime;
  final String data;
  final String user;

  @override
  State<DeleteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<DeleteCard> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 180, minHeight: 100),
      color: Colors.blue,
      alignment: Alignment.topLeft,
      child: Card(
          clipBehavior: Clip.antiAlias,
          color: Colors.white,
          shadowColor: Colors.grey,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            // side: BorderSide(
            //   color: Colors.white,
            //   width: 1,
            // ),
          ),
          margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 10, right: 5, top: 5),
                      child: Text(
                        "创建时间 " + widget.createTime,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Markdown(
                    data: widget.data,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics()),
              ),
              Container(
                  height: 30,
                  alignment: Alignment.centerLeft,
                  color: Colors.grey.withOpacity(0.08),
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          flex: 7,
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "@lifenghua",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ))
            ],
          )),
    );
  }
}
