import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:memos/network/network.dart';
import 'package:memos/utils/ScreenUtil.dart';
import 'package:memos/utils/SpUtils.dart';

import '../beans/ResourceBean.dart';
import '../constants/constant.dart';

import 'package:flutter_advanced_networkimage_2/provider.dart';

import '../generated/l10n.dart';

class ResourcePage extends StatefulWidget {
  const ResourcePage({Key? key}) : super(key: key);

  @override
  State<ResourcePage> createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  List<Card> list = [];
  var screenWidth = ScreenUtil.hc_ScreenWidth();
  var screenHeight = ScreenUtil.hc_ScreenHeight();
  late Future<List<Widget>> _future;
  bool _initializedFirst = false;
  List<Widget> getResources(List<Card> list) {
    return list;
  }

  @override
  void initState() {
    super.initState();
    // getResources();
    Future<ResourceBean> resources =
        RequestManager.getClient().queryResources();
    resources.then((resourceBean) => {
          resourceBean.data.forEach((element) {
            Widget showItem = Container();
            if (element.type.contains("image")) {
              showItem = Image.network(
                "${SpUtil.getString(Global.BASE_PATH)!}/o/r/${element.id}/${element.filename}",
                width: ScreenUtil.hc_ScreenWidth() / 4,
                height: ScreenUtil.hc_ScreenWidth() / 4,
              );
            } else if (element.type.contains("video")) {
              showItem = Image(
                image: AdvancedNetworkImage(
                  "${SpUtil.getString(Global.BASE_PATH)!}/o/r/${element.id}/${element.filename}",
                  useDiskCache: true,
                  cacheRule: const CacheRule(maxAge: Duration(days: 7)),
                ),
                fit: BoxFit.cover,
              );
            }
            setState(() {
              list.add(Card(
                // margin:const EdgeInsets.all(3),
                clipBehavior: Clip.antiAlias,
                color: Colors.white,
                shadowColor: Colors.grey.withOpacity(0.6),
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10, top: 10),
                          child: showItem,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          margin: const EdgeInsets.only(top: 10, right: 10),
                          child: const InkWell(
                            child: Icon(
                              Icons.more_horiz,
                              size: 30,
                              color: Colors.black45,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 10, top: 6),
                      child: Text('${element.type}',
                          style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.w500)),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(left: 10, top: 6),
                      child: const Text(
                        'size: 0.9MB',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ));
            });
          }),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 5, top: 5),
                child: Text(
                  S.of(context).resource_title,
                  style: /*const TextStyle(color: Colors.black, fontSize: 22)*/ Get
                      .textTheme.headline6,
                ),
              ),
            ],
          ),
        ),
        body: Container(
          child:  FutureBuilder(
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
                                                },
                                              ))
                                        ]),
                                    child: Container(
                                    ),
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
        ));

    /* GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 6.0,
              childAspectRatio: 1,
            ),
            itemCount: list.toList().length,
            itemBuilder: (BuildContext context, int index) {
              return list.toList()[index];
            }));*/
  }
}
