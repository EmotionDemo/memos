import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memos/utils/ScreenUtil.dart';
import 'package:memos/utils/toast.dart';
import 'package:uuid/uuid.dart';

import '../view/delete_card_view.dart';
import '../view/mylist_item.dart';

class CollectPage extends StatefulWidget {
  const CollectPage({Key? key}) : super(key: key);

  @override
  State<CollectPage> createState() => _CollectPageState();
}

class _CollectPageState extends State<CollectPage> {
  Widget defaultPage = Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'images/ic_not_data.png',
          width: ScreenUtil.hc_ScreenWidth() / 3 * 2,
          height: ScreenUtil.hc_ScreenWidth() / 3 * 2,
        ),
        const Text(
          '什么都没有~',
          style: TextStyle(color: Colors.black45, fontSize: 18),
        )
      ],
    ),
  );

  late Widget dataPage;

  late Widget showPage;

  List<Widget> _queryHoldUpBoxData() {
    List<Widget> list = [Container()];
    list.clear();
    list.add(DeleteCard(
      createTime: "2023-11-23 03:11:32",
      data: "你好呀，又是充满希望的一天~",
      user: "@lifenghua",
    ));
    list.add(DeleteCard(
      createTime: "2023-11-23 03:11:32",
      data: "小猪小猪胖嘟嘟，遇到困难呼噜噜",
      user: "@lifenghua",
    ));
    list.add(DeleteCard(
      createTime: "2023-11-23 03:11:32",
      data: "ok Go！",
      user: "@lifenghua",
    ));

    return list;
  }

  var listItemCount = 0;
  List<Widget> list = [Container()];

  @override
  void initState() {
    super.initState();
    list = _queryHoldUpBoxData();
    listItemCount = list.length;

  }

  @override
  Widget build(BuildContext context) {
    dataPage = Column(
      children: [
        Container(
          height: 30,
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            color: Colors.black12.withOpacity(0.05),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.info,
                color: Colors.greenAccent,
                size: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '在条目中左滑恢复右滑永久删除',
                style: TextStyle(color: Colors.black54),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: listItemCount,
            itemBuilder: (context, index) {
              final item = list[index];
              return Dismissible(
                key: Key(Uuid().v4().toString()),
                onDismissed: (DismissDirection direction) {
                  if (direction == DismissDirection.endToStart) {
                    //恢复
                    list.removeAt(index);
                    setState(() {
                      listItemCount = list.length;
                    });
                  } else {
                    //永久删除
                    ToastUtil.showToast(message: direction.name);
                  }
                },
                movementDuration: const Duration(milliseconds: 100),
                child: item,
              );
            },
          ),
        ),
      ],
    );
    setState(() {
      if (listItemCount == 0) {
        showPage = defaultPage;
      } else {
        showPage = dataPage;
      }
    });
    return Scaffold(

      // backgroundColor: Colors.grey.withOpacity(0.07),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: const Text(
                '暂存箱',
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            ),
            InkWell(
              child: Container(
                margin: const EdgeInsets.only(top: 5, right: 5, bottom: 5),
                child: const Icon(
                  Icons.search,
                  size: 25,
                  color: Colors.black,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
        elevation: 0,
      ),
      body: showPage,
    );
  }
}
