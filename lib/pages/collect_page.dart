import 'package:flutter/material.dart';
import 'package:memos/utils/toast.dart';

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

  @override
  Widget build(BuildContext context) {
    List<Widget> list = _queryHoldUpBoxData().toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('11'),
        elevation: 0,
      ),
      backgroundColor: Colors.black12.withOpacity(0.06),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    '暂存箱',
                    style: TextStyle(
                        color: Colors.black54.withOpacity(0.5), fontSize: 22),
                  ),
                ),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.only(top: 10, right: 20, bottom: 10),
                    child: Icon(
                      Icons.search,
                      size: 25,
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
              // height: 35,
              // color: Colors.red,
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.black12.withOpacity(0.05),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
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

            ListView.builder(
             physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                final item = list[index];
                return Dismissible(
                  key: Key(index.toString()),
                  onDismissed: (DismissDirection direction) {
                    if (direction == DismissDirection.endToStart) {
                      //恢复
                      list.removeAt(index);
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
          ],
        ),
      ),
    );
  }
}
