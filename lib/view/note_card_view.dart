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
      height: 200,
      alignment: Alignment.topLeft,
      child: Card(
          clipBehavior: Clip.antiAlias,
          color: Colors.white,
          shadowColor: Colors.grey,
          elevation: 1,
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
                    flex: 3,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 10, right: 5, top: 5),
                      child: Text(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),
                  Flexible(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: const Text(
                            'PROTECTED',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ))),
                ],
              ),
              Expanded(
                child: Markdown(
                    data: widget.data,
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
                        child: Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: const Text(
                            '1 小时前',
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
                                    border: Border.all(color: Colors.black26),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: const Icon(
                                  Icons.copy,
                                  size: 18,
                                  color: Colors.pink,
                                ),
                              ),
                              onTap: () {},
                            ),
                            const SizedBox(width: 5,),
                            InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black26),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child:const Icon(
                                  Icons.edit_note,
                                  size: 18,
                                  color: Colors.black87,
                                ),
                              ),
                              onTap: (){},
                            ),
                            const SizedBox(width: 5,),
                            InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black26),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child:const Icon(
                                  Icons.share,
                                  size: 18,
                                  color: Colors.blue,
                                ),
                              ),
                              onTap: (){},
                            ),
                            const SizedBox(width: 5,),
                            InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black26),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child:const Icon(
                                  Icons.save,
                                  size: 18,
                                  color: Colors.red,
                                ),
                              ),
                              onTap: (){},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          )),
    );
  }
}
