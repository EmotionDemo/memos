import 'dart:ffi';

import 'package:flutter/material.dart';

// import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_widget/markdown_widget.dart';

class CollectedCard extends StatefulWidget {
  const CollectedCard(
      {Key? key,
      required this.data,
      required this.createTime,
      required this.user,
      required this.itemHeight,
      required this.id})
      : super(key: key);
  final String createTime;
  final String data;
  final String user;
  final double itemHeight;
  final int id;

  @override
  State<CollectedCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<CollectedCard>
    with AutomaticKeepAliveClientMixin {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      height: widget.itemHeight,
      constraints: const BoxConstraints(maxHeight: 400, minHeight: 150),
      alignment: Alignment.topLeft,
      child: Card(
          clipBehavior: Clip.antiAlias,
          color: Colors.white,
          shadowColor: Colors.grey,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
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
                child: MarkdownWidget(
                    data: widget.data,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 5, bottom: 5),
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

  @override
  bool get wantKeepAlive => true;
}
