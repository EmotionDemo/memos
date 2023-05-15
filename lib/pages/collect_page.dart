import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:memos/constants/constant.dart';
import 'package:memos/utils/ImgUtil.dart';
import 'package:memos/utils/ScreenUtil.dart';
import 'package:memos/utils/SpUtils.dart';
import 'package:memos/utils/toast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../beans/MemosBean.dart';
import '../network/network.dart';
import '../view/delete_card_view.dart';

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

  late Widget showPage;

  var listItemCount = 0;
  List<Widget> _notes = [Container()];
  late Future<List<Widget>> _future;
  late bool _initializedFirst;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final key = Key(Uuid().v4().toString());
  @override
  void initState() {
    super.initState();
    _initializedFirst = false;
    _future = _queryCollectNotes();
  }

  ///查询被删除的笔记们
  Future<List<Widget>> _queryCollectNotes() async {
    List<Widget> notes = [];
    MemosBean memos = await RequestManager.getClient()
        .queryAllMemos(Global.MEMO_TYPE_ARCHIVED);
    List<DataBean> dataBean = memos.data;
    print('xidoubao0---->${dataBean.length}');
    int num = 0;
    for (int i = 0; i < dataBean.length; i++) {
      print('lfh233---->${dataBean[i].content}');
      var calculateItemHeight = 0.0;
      var updateTime =
          DateTime.fromMillisecondsSinceEpoch(dataBean[i].updatedTs * 1000)
              .toString();
      var userName = dataBean[i].creatorName;
      List<ResourceListBean> resourceList = dataBean[i].resourceList;
      var resList = "";
      if (resourceList.isNotEmpty) {
        for (var resData in resourceList) {
          if (resData.type.contains(Global.CONTENT_TYPE_IMAGE)) {
            resList +=
                "![](${SpUtil.getString(Global.BASE_PATH)}/o/r/${resData.id}/${resData.filename})";
          } else if (resData.type.contains("video")) {
            // resList+="[![]](${SpUtil.getString(Global.BASE_PATH)}/o/r/${resData.id}/${resData.filename}})";
            // resList += "![](../images/ic_desc_video.png)";
            // resList += ""+"[[🎦${resData.filename}-type:${resData.type}]](${SpUtil.getString(Global.BASE_PATH)}/o/r/${resData.id}/${resData.filename})";
            resList +=
                """ \n <video src="http://43.138.80.236:5230/o/r/26/video.mp4"> """;
            // resList += "![](../images/ic_desc_video.png)";
          }
          var data = dataBean[i];
          List<String> img = ImgUtil.getImgFromTxt(data.content + resList);
          print('1111--->calculateItemHeight->${calculateItemHeight}');
          if (img.isNotEmpty) {
            print('img.isNotEmpty');
            for (var imgUrl in img) {
              if (imgUrl.isNotEmpty && imgUrl != "") {
                int? imageHeight = await ImgUtil.getImageHeight(imgUrl);
                calculateItemHeight += imageHeight!;
                print('data--->${data.content + resList}');
              }
            }
          }
          // print('wangzhibin----->${calculateItemHeight}');
          /*notes.add(CollectedCard(
            data: data.content + resList,
            createTime: updateTime.substring(0, updateTime.length - 4),
            user: userName,
            itemHeight: calculateItemHeight,
          ));*/
        }
      } else {
        calculateItemHeight = ScreenUtil.calculateItemHeight(
            dataBean[i].content, ScreenUtil.hc_ScreenWidth(), 25);
      }
      notes.add(CollectedCard(
        data: dataBean[i].content + resList,
        createTime: updateTime.substring(0, updateTime.length - 4),
        user: userName,
        itemHeight: calculateItemHeight,
      ));
      print('num-->${num},i--->${i}-->notes.length->${notes.length}');
      num++;
      print('xidoubao---->${notes.length}');
    }

    return notes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          const SizedBox(
            height: 7,
          ),
          FutureBuilder(
            future: _future,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text('请求失败...${snapshot.error}');
                } else {
                  if (snapshot.hasData) {
                    if (!_initializedFirst) {
                      _notes = snapshot.data;
                      _initializedFirst = true;
                    }
                    if (_notes.isEmpty) {
                      _notes.add(defaultPage);
                    }
                    return Expanded(
                        child: SmartRefresher(
                      controller: _refreshController,
                      enablePullDown: true,
                      enablePullUp: false,
                      header: const ClassicHeader(),
                      onRefresh: _onRefresh,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _notes.length,
                        itemBuilder: (context, index) {
                          final item = _notes[index];
                          return Dismissible(
                            key: key,
                            direction: DismissDirection.endToStart,
                            onDismissed: (DismissDirection direction) {
                              if (direction == DismissDirection.endToStart) {
                                //恢复
                                _notes.removeAt(index);
                                setState(() {
                                  listItemCount = _notes.length;
                                });
                              } else {
                                //永久删除
                                ToastUtil.showToast(message: direction.name);
                              }
                            },
                            child: Slidable(
                              key: key,
                              child: item,
                              endActionPane: ActionPane(
                                  extentRatio:0.3,
                                  motion: ScrollMotion(),
                                 /* dismissible: DismissiblePane(
                                    onDismissed: () {},
                                  ),*/
                                  children: [
                                    Flexible(
                                      flex:2,
                                      child: InkWell(
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.red, width: 2),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.red
                                          ),
                                          child: Icon(Icons.delete_forever,color: Colors.white,),
                                        ),
                                        onTap: (){
                                          ToastUtil.showToast(message: "进行永久删除操作");
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Flexible(
                                      flex:2,
                                      child: InkWell(
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.blue, width: 2),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.blue
                                          ),
                                          child: Icon(Icons.settings_backup_restore_sharp,color: Colors.white,),
                                        ),
                                        onTap: (){
                                          ToastUtil.showToast(message: "进行数据恢复操作");
                                        },
                                      ),
                                    )
                                  ]),
                            ),
                            background: Container(
                              color: Colors.red,
                              width: 200,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // TODO: 编辑操作
                                    },
                                    child: Text(
                                      '编辑',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // TODO: 删除操作
                                    },
                                    child: Text(
                                      '删除',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ));
                  } else {
                    return Text('获取信息失败....');
                  }
                }
              } else if (snapshot.connectionState == ConnectionState.none ||
                  snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.connectionState == ConnectionState.active) {
                return Text('正在请求中....');
              } else {
                return Text('未知错误....');
              }
            },
          ),
        ],
      ),
    );
  }

  ///刷新笔记内容
  void _onRefresh() async {
    var notes = await _queryCollectNotes();
    if (_notes.isNotEmpty) {
      if (mounted) {
        setState(() {
          _notes = notes;
          _refreshController.refreshCompleted();
        });
      }
    } else {
      _refreshController.refreshFailed();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }
}
