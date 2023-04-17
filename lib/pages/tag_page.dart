import 'package:flutter/material.dart';
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

    return list;
  }

  @override
  Widget build(BuildContext context) {
    List<FlagItem> flags = getFlags().toList();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Text(
                      'Flags',
                      style: TextStyle(color: Colors.grey, fontSize: 22),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.only(top: 10, right: 15, bottom: 10),
                      child: Icon(
                        Icons.search,
                        size: 22,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
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
