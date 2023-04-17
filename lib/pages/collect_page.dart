import 'package:flutter/material.dart';
import 'package:memos/utils/toast.dart';
import 'package:uuid/uuid.dart';

import '../view/delete_card_view.dart';

class CollectPage extends StatefulWidget {
  const CollectPage({Key? key}) : super(key: key);

  @override
  State<CollectPage> createState() => _CollectPageState();
}

class _CollectPageState extends State<CollectPage> {
  List<Widget> _queryHoldUpBoxData() {
    List<Widget> list = [Container()];
    list.clear();
    list.add(DeleteCard(
      createTime: "2023-11-23 03:11:32",
      data: "1111",
      user: "@lifenghua",
    ));
    list.add(DeleteCard(
      createTime: "2023-11-23 03:11:32",
      data: "1111",
      user: "@lifenghua",
    ));
    list.add(DeleteCard(
      createTime: "2023-11-23 03:11:32",
      data: "1111",
      user: "@lifenghua",
    ));
    list.add(DeleteCard(
      createTime: "2023-11-23 03:11:32",
      data: "1111",
      user: "@lifenghua",
    ));
    list.add(DeleteCard(
      createTime: "2023-11-23 03:11:32",
      data: "1111",
      user: "@lifenghua",
    ));
    list.add(DeleteCard(
      createTime: "2023-11-23 03:11:32",
      data: "1111",
      user: "@lifenghua",
    ));
    list.add(DeleteCard(
      createTime: "2023-11-23 03:11:32",
      data: "1111",
      user: "@lifenghua",
    ));
    list.add(DeleteCard(
      createTime: "2023-11-23 03:11:32",
      data: "1111",
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                '暂存箱',
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.only(top: 5, right: 5, bottom: 5),
                child: Icon(
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
      backgroundColor: Colors.white,
      body: Column(
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
          SizedBox(
            height: 7,
          ),
          Expanded(
            child: ListView.builder(
              // physics: const NeverScrollableScrollPhysics(),
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
      ),
    );
  }
}
