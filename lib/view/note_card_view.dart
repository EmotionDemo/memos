import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:memos/utils/ImgUtil.dart';
import 'package:memos/utils/ScreenUtil.dart';
import 'package:flutter_highlight/themes/a11y-light.dart';

import 'package:memos/utils/video.dart';

import '../beans/MemoDetailBean.dart';
import '../pages/memo_detail.dart';

class NoteCard extends StatefulWidget {
  const NoteCard(
      {Key? key,
      required this.data,
      required this.title,
      required this.visibility,
      required this.updateTime,
      required this.itemHeight})
      : super(key: key);

  final String data;
  final String title;
  final String visibility;
  final String updateTime;
  final double itemHeight;

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard>
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
          child: InkWell(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin:
                            const EdgeInsets.only(left: 10, right: 5, top: 5),
                        child: Text(
                          widget.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              const TextStyle(color: Colors.blue, fontSize: 15),
                        ),
                      ),
                    ),
                    Flexible(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                alignment: Alignment.centerRight,
                                margin: const EdgeInsets.only(
                                    right: 5, top: 5, bottom: 5),
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black26),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Text(
                                  widget.visibility,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ))
                          ],
                        )),
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                    child: MarkdownWidget(
                      data: widget.data,
                      shrinkWrap: true,
                      selectable: false,
                      physics: const NeverScrollableScrollPhysics(),
                      config: MarkdownConfig(configs: [
                        const PreConfig(
                            theme: a11yLightTheme, language: 'dart'),
                      ]),
                      markdownGeneratorConfig: MarkdownGeneratorConfig(
                        generators: [videoGeneratorWithTag],
                      ),
                    ),
                  ),
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
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(
                              widget.updateTime,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Row(
                            children: [
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: const Icon(
                                    Icons.copy,
                                    size: 18,
                                    color: Colors.pink,
                                  ),
                                ),
                                onTap: () {},
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: const Icon(
                                    Icons.edit_note,
                                    size: 18,
                                    color: Colors.black87,
                                  ),
                                ),
                                onTap: () {},
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: const Icon(
                                    Icons.share,
                                    size: 18,
                                    color: Colors.blue,
                                  ),
                                ),
                                onTap: () {},
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: const Icon(
                                    Icons.save,
                                    size: 18,
                                    color: Colors.red,
                                  ),
                                ),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => MemoDetail(
                            data: MemoDetailBean(widget.data,widget.title),
                          )));
            },
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
