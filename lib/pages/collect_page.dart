import 'dart:io';

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

class _CollectPageState extends State<CollectPage>
    with AutomaticKeepAliveClientMixin {
  late Widget showPage;

  var listItemCount = 0;
  List<Widget> _notes = [Container()];
  late Future<List<Widget>> _future;
  late bool _initializedFirst;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final key = Key(Uuid().v4().toString());

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
        id: dataBean[i].id,
      ));
      print('num-->${num},i--->${i}-->notes.length->${notes.length}');
      num++;
      print('xidoubao---->${notes.length}');
    }

    return notes;
  }

  late BuildContext mContext;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _initializedFirst = false;
    _future = _queryCollectNotes();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _scrollController.addListener(() {
      setState(() {
        print('scroller---->');
      });
    });

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
                      return InkWell(
                        onTap: () {
                          _onRefresh();
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              top: ScreenUtil.hc_ScreenHeight() / 5),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'images/ic_not_data.png',
                                width: ScreenUtil.hc_ScreenWidth() / 3 * 2,
                                height: ScreenUtil.hc_ScreenWidth() / 3 * 2,
                              ),
                              const Text(
                                '什么都没有，点击尝试刷新~',
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 18),
                              )
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Expanded(
                          child: SmartRefresher(
                        controller: _refreshController,
                        enablePullDown: true,
                        enablePullUp: false,
                        header: const ClassicHeader(),
                        onRefresh: _onRefresh,
                        child: SlidableAutoCloseBehavior(
                          key: key,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _notes.length,
                            controller: _scrollController,
                            physics: const ScrollPhysics(),
                            // physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final item = _notes[index] as CollectedCard;
                              return Slidable(
                                key: key,
                                endActionPane: ActionPane(
                                    extentRatio: 0.3,
                                    dragDismissible: true,
                                    motion: const ScrollMotion(),
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: InkWell(
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.red,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: Colors.red),
                                            child: const Icon(
                                              Icons.delete_forever,
                                              color: Colors.white,
                                            ),
                                          ),
                                          onTap: () {
                                            Future<bool> deleteMemo =
                                                RequestManager.getClient()
                                                    .deleteMemo(
                                                        item.id.toString());
                                            deleteMemo.then((isDeleted) {
                                              if (isDeleted) {
                                                setState(() {
                                                  _notes.removeAt(index);
                                                });
                                                ToastUtil.showToast(
                                                    message: "进行永久删除操作");
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Flexible(
                                          flex: 2,
                                          child: InkWell(
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.blue,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: Colors.blue),
                                              child: const Icon(
                                                Icons
                                                    .settings_backup_restore_sharp,
                                                color: Colors.white,
                                              ),
                                            ),
                                            onTap: () {
                                              ToastUtil.showToast(
                                                  message: "进行数据恢复操作");
                                            },
                                          ))
                                    ]),
                                child: LayoutBuilder(builder:
                                    (contextFromLayoutBuilder,
                                        BoxConstraints constraints) {
                                  Slidable.of(contextFromLayoutBuilder)
                                      ?.close();
                                  return item;
                                }),
                              );
                            },
                          ),
                        ),
                      ));
                    }
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
    if (notes.isNotEmpty) {
      print('kkkkkkk');
      if (mounted) {
        print('222223333322');
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

  @override
  bool get wantKeepAlive => true;
}
