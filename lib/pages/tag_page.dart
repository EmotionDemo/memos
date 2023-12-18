import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:memos/view/flag_item.dart';

import '../beans/TagsBean.dart';
import '../generated/l10n.dart';
import '../network/network.dart';

class TagPage extends StatefulWidget {
  const TagPage({Key? key}) : super(key: key);

  @override
  State<TagPage> createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> with AutomaticKeepAliveClientMixin {
  List<FlagItem> flags = [];

  List<FlagItem> getFlags(List<String> data) {
    List<FlagItem> list = [];
    //倒置一下，使最新添加的在最前面
    for (var tag in data.reversed) {
      list.add(FlagItem(
        tagText: '#$tag',
        onClickListener: (String data) {

        },
      ));
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    Future<TagsBean> allTags = RequestManager.getClient().queryAllTags();
    allTags.then((value) {
      setState(() {
        flags = getFlags(value.data).toList();
      });
    }).catchError((error) {
      print('获取所有tags失败，errorinfo---》${error}');
    });
  }

  @override
  Widget build(BuildContext context) {
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
              child: Text(
                  S.of(context).tags_title,
                style: /*const TextStyle(color: Colors.black, fontSize: 22)*/ Get.textTheme.headline6,
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

  @override
  bool get wantKeepAlive => true;
}
