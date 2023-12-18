import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:memos/constants/constant.dart';
import 'package:memos/utils/ImgUtil.dart';
import 'package:memos/utils/ScreenUtil.dart';
import 'package:memos/utils/SpUtils.dart';
import 'package:memos/utils/toast.dart';
import 'package:memos/view/dialog_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../beans/MemosBean.dart';
import '../generated/l10n.dart';
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
  late BuildContext mContext;
  var listItemCount = 0;
  List<CollectedCard> _notes = [];
  late Future<List<Widget>> _future;
  late bool _initializedFirst;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final key = Key(Uuid().v4().toString());
  final String TAG = "CollectPage";
  String networkError = '数据空空~尝试点击刷新~';
  var noDataShow = 'images/ic_data_no_result.png';
  int notesLength=0;

  ///查询被删除的笔记们
  Future<List<CollectedCard>> _queryCollectNotes() async {
    List<CollectedCard> notes = [];
    try {
      MemosBean memos = await RequestManager.getClient()
          .queryAllMemos(Global.MEMO_TYPE_ARCHIVED);
      List<DataBean> dataBean = memos.data;
      for (int i = 0; i < dataBean.length; i++) {
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
                  /*int? imageHeight = await ImgUtil.getImageHeight(imgUrl);
                calculateItemHeight += imageHeight!;
                print('data--->${data.content + resList}');*/
                  calculateItemHeight += 300;
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
          visibility: dataBean[i].visibility,
        ));
      }
      setState((){
        notesLength = notes.length;
        networkError = '📒${S.of(context).lang_update_success} ${notes.length} ${S.of(context).lang_information_updated}';
      });
      noDataShow = 'images/ic_data_no_result.png';
     /* ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(networkError),
          duration: const Duration(milliseconds: 1000),
          backgroundColor: Colors.green,
        ),
      );*/
    } catch (error) {
      if (error is DioError) {
        print('TAG [_queryCollectNotes] error:$error');
        // notes.add(_requestError);
        networkError = "网络异常,请检查网络⚠️";
        noDataShow = 'images/ic_network_error.png';
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('📒 网络未连接'),
            duration: Duration(milliseconds: 1000),
            backgroundColor: Colors.green,
          ),
        );
      }
    }

    return notes;
  }

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _initializedFirst = false;
    _future = _queryCollectNotes();
    _scrollController.addListener(() {
      setState(() {
        print('scroller---->');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // FocusScope.of(context).unfocus();
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
              child:  Text(
                S.of(context).temporary_storage_title,
                style: /*const TextStyle(color: Colors.black, fontSize: 22)*/
                Get.textTheme.headlineSmall,
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
              children:  [
                const Icon(
                  Icons.info,
                  color: Colors.greenAccent,
                  size: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  S.of(context).lang_slide_delete,
                  style:const TextStyle(color: Colors.black54),
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
                          child: InkWell(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  noDataShow,
                                  width: ScreenUtil.hc_ScreenWidth() / 3 * 2,
                                  height: ScreenUtil.hc_ScreenWidth() / 3 * 2,
                                ),
                                Text(
                                  '📒${S.of(context).lang_update_success} $notesLength ${S.of(context).lang_information_updated}',
                                  style: const TextStyle(
                                      color: Colors.black45, fontSize: 15),
                                )
                              ],
                            ),
                            onTap: () {
                              _onRefresh();
                            },
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
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _notes.length,
                            controller: _scrollController,
                            physics: const ScrollPhysics(),
                            // physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final CollectedCard item =
                                  _notes[index] as CollectedCard;
                              /*if (_notes.length == 1 && _notes[0] is Center) {
                                return _notes[0];
                              } else {
                                item = _notes[index] as CollectedCard;
                              }*/
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
                                            DialogView.alertDialog(
                                                context,
                                                '删除提醒',
                                                ["删除", "取消"],
                                                '确定要删除该笔记吗?',
                                                Colors.red, (isDelete) {
                                              if (isDelete) {
                                                Future<bool> deleteMemo =
                                                    RequestManager.getClient()
                                                        .deleteMemo(
                                                            item.id.toString());
                                                deleteMemo.then((isDeleteOk) {
                                                  if (isDeleteOk) {
                                                    setState(() {
                                                      _notes.remove(item);
                                                      // _notes.removeAt(index);
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                          content:
                                                              Text('📒当前笔记已删除'),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  1000),
                                                          backgroundColor:
                                                              Colors.red,
                                                        ),
                                                      );
                                                    });
                                                  }
                                                });
                                              } else {
                                                print('late_BuildContext_mContext---${Slidable.of(mContext) == null}');
                                                setState(() {
                                                  Slidable.of(mContext)
                                                      ?.close();
                                                });
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
                                              DialogView.alertDialog(
                                                  context,
                                                  '笔记恢复',
                                                  ["恢复", "取消"],
                                                  '确定要恢复该笔记吗?',
                                                  Colors.blue, (isRestore) {
                                                if (isRestore) {
                                                  Future<int> restore =
                                                      RequestManager.getClient()
                                                          .restoreMemo(
                                                              item.visibility,
                                                              item.id);
                                                  restore.then((value) => {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          const SnackBar(
                                                            content: Text(
                                                                '笔记📒恢复成功'),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    700),
                                                            backgroundColor:
                                                                Colors.green,
                                                          ),
                                                        ),
                                                        setState(() {
                                                          // _notes.remove(item);
                                                          _onRefresh();
                                                        }),
                                                      });
                                                  setState(() {
                                                    Slidable.of(mContext)?.close();
                                                  });
                                                } else {
                                                  print(
                                                      'late_BuildContext_mContext---${Slidable.of(mContext) == null}');
                                                }
                                              });
                                            },
                                          ))
                                    ]),
                                child: LayoutBuilder(builder:
                                    (contextFromLayoutBuilder,
                                        BoxConstraints constraints) {
                                  Slidable.of(contextFromLayoutBuilder)
                                      ?.close();
                                  mContext = contextFromLayoutBuilder;
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
      if (mounted) {
        setState(() {
          _notes = notes;
        });
      }
    } else {
      setState(() {
        _notes = [];
      });
    }
    _refreshController.refreshCompleted();
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}

class CustomSlidableAutoCloseBehavior extends SlidableAutoCloseBehavior {
  CustomSlidableAutoCloseBehavior({required super.child});

  @override
  void onSlideIsOpenChanged(bool isOpen) {
    // 滑动操作完成后的处理逻辑
    // 触发ListView的滚动监听
  }
}
