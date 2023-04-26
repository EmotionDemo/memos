import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memos/view/flag_item.dart';

class TagPage extends StatefulWidget {
  const TagPage({Key? key}) : super(key: key);

  @override
  State<TagPage> createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  List<FlagItem> getFlags() {
    List<FlagItem> list = [];
    list.add(FlagItem(tagText: '#flutter'));
    list.add(FlagItem(tagText: '#memos'));
    list.add(FlagItem(tagText: '#java'));
    list.add(FlagItem(tagText: '#协程'));
    list.add(FlagItem(tagText: '#kotlin'));
    list.add(FlagItem(tagText: '#踏青'));
    list.add(FlagItem(tagText: '#这颗种子 在我心里快要发芽啦'));
    list.add(FlagItem(tagText: '#每天我都为了它而更加努力呀'));
    list.add(FlagItem(tagText: '#兄弟姐妹一起冲压'));
    list.add(FlagItem(tagText: '#Ok go 来吧来吧'));
    list.add(FlagItem(tagText: '#flutter'));
    list.add(FlagItem(tagText: '#memos'));
    list.add(FlagItem(tagText: '#java'));
    list.add(FlagItem(tagText: '#协程'));
    list.add(FlagItem(tagText: '#kotlin'));
    list.add(FlagItem(tagText: '#踏青'));
    list.add(FlagItem(tagText: '#这颗种子 在我心里快要发芽啦'));
    list.add(FlagItem(tagText: '#每天我都为了它而更加努力呀'));
    list.add(FlagItem(tagText: '#兄弟姐妹一起冲压'));
    list.add(FlagItem(tagText: '#Ok go 来吧来吧'));
    list.add(FlagItem(tagText: '#flutter'));
    list.add(FlagItem(tagText: '#memos'));
    list.add(FlagItem(tagText: '#java'));
    list.add(FlagItem(tagText: '#协程'));
    list.add(FlagItem(tagText: '#kotlin'));
    list.add(FlagItem(tagText: '#踏青'));
    list.add(FlagItem(tagText: '#这颗种子 在我心里快要发芽啦'));
    list.add(FlagItem(tagText: '#每天我都为了它而更加努力呀'));
    list.add(FlagItem(tagText: '#兄弟姐妹一起冲压'));
    list.add(FlagItem(tagText: '#Ok go 来吧来吧'));
    list.add(FlagItem(tagText: '#flutter'));
    list.add(FlagItem(tagText: '#memos'));
    list.add(FlagItem(tagText: '#java'));
    list.add(FlagItem(tagText: '#协程'));
    list.add(FlagItem(tagText: '#kotlin'));
    list.add(FlagItem(tagText: '#踏青'));
    list.add(FlagItem(tagText: '#这颗种子 在我心里快要发芽啦'));
    list.add(FlagItem(tagText: '#每天我都为了它而更加努力呀'));
    list.add(FlagItem(tagText: '#兄弟姐妹一起冲压'));
    list.add(FlagItem(tagText: '#Ok go 来吧来吧'));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    List<FlagItem> flags = getFlags().toList();
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          InkWell(
            child: Container(
              margin: const EdgeInsets.only(top: 10, right: 15, bottom: 10),
              child: const Icon(
                Icons.add_circle_rounded,
                size: 25,
                color: Colors.blue,
              ),
            ),
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: const Text(
                'Tags',
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 8.0, // gap between adjacent chips
                    runSpacing: 4.0, // gap between lines
                    children: flags,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
