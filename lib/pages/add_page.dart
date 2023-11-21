import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memos/beans/MemosBean.dart';
import 'package:memos/utils/ImgUtil.dart';
import 'package:memos/utils/ScreenUtil.dart';
import 'package:memos/utils/SpUtils.dart';
import 'package:memos/utils/file_utils.dart';
import 'package:memos/view/note_card_view.dart';
import 'package:memos/view/search_view.dart';
import '../constants/constant.dart';
import '../network/network.dart';

// import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'input_note_page.dart';

class AddPage extends StatefulWidget {
 const AddPage({Key? key}) : super(key: key);
  // final VoidCallback? onCallback;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> with WidgetsBindingObserver{
  final TextEditingController controller = TextEditingController();
  List<Widget> _notes = [Container()];
  late Future<List<Widget>> _future;
  late bool initializedFirst;

  @override
  void initState() {
    super.initState();
    print('lfh---initState2333');
    _future = _initNotes();
    initializedFirst = false;
    // 添加 WidgetsBindingObserver 监听器
    WidgetsBinding.instance.addObserver(this);
  }

  ScrollController scrollController = ScrollController();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 5, top: 5),
                child: const Text(
                  'MEMOS',
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 5, top: 5),
                  child: Image.asset(
                    'images/ic_round_add.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                onTap: () {
                  // Navigator.push(
                  //                   context,
                  //                   CupertinoPageRoute(
                  //                       builder: (context) => MemoDetail(
                  //                             data: MemoDetailBean(widget.data,widget.title),
                  //                           )));

                  // Navigator.pushNamed(context, "/input_note_page");
                  //IOS切换动画
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => const InputPage()));
                },
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 43,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: SearchView(
                onSearchInputComplete: () {
                  FocusScope.of(context).unfocus();
                  print('aaa');
                },
                controller: controller,
                hintText: "快捷搜索",
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            FutureBuilder(
              future: _future,
              initialData: _notes,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text('请求失败...${snapshot.error}');
                  } else {
                    if (snapshot.hasData) {
                      if (!initializedFirst) {
                        _notes = snapshot.data;
                        initializedFirst = true;
                      }
                      return Expanded(
                          child: SmartRefresher(
                        controller: _refreshController,
                        enablePullDown: true,
                        enablePullUp: false,
                        header: const ClassicHeader(),
                        onRefresh: _onRefresh,
                        child: ListView.builder(
                          // key: UniqueKey(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: _notes.toList().length,
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 0, right: 0),
                          itemBuilder: (BuildContext context, int index) {
                            return _notes.toList()[index];
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
        ));
  }

  ///初始化笔记内容
  Future<List<Widget>> _initNotes() async {
    List<Widget> notes = [];
    int currentTimeStart = DateTime.now().millisecondsSinceEpoch;

    print('_initNotes开始时间${currentTimeStart}');
    MemosBean memosBean =
        await RequestManager.getClient().queryAllMemos("NORMAL");
    int currentTimeEnd = DateTime.now().millisecondsSinceEpoch;
    print('_initNotes结束时间${currentTimeEnd}');

    print("请求耗时：${currentTimeEnd - currentTimeStart} ms");
    // MemosBean
    var memoData = memosBean.data;
    int currentTimeStart2 = DateTime.now().millisecondsSinceEpoch;

    print('_initNotes开始时间2${currentTimeStart2}');
    for (var data in memoData) {
      var titleReal = '';
      var updateTime =
          DateTime.fromMillisecondsSinceEpoch(data.updatedTs * 1000).toString();
      List<ResourceListBean> resourceList = data.resourceList;
      var resList = "";
      if (data.content.length < 10) {
        titleReal = FileUtils.removeSpecialCharacters(data.content);
      } else {
        titleReal = data.content.substring(0, 10);
      }
      if (resourceList.isNotEmpty) {
        for (var resData in resourceList) {
          if (resData.type.contains("image")) {
            resList +=
                "![](${SpUtil.getString(Global.BASE_PATH)}/o/r/${resData.id}/${resData.filename})";
          } else if (resData.type.contains("video")) {
            // resList+="[![]](${SpUtil.getString(Global.BASE_PATH)}/o/r/${resData.id}/${resData.filename}})";
            // resList += "![](../images/ic_desc_video.png)";
            // resList += ""+"[[🎦${resData.filename}-type:${resData.type}]](${SpUtil.getString(Global.BASE_PATH)}/o/r/${resData.id}/${resData.filename})";
            // resList += """ \n <video src="http://43.138.80.236:5230/o/r/26/video.mp4"> """;
            // resList += "![](../images/ic_desc_video.png)";
          }
        }
      }
      var calculateItemHeight = 0.0;
      calculateItemHeight = ScreenUtil.calculateItemHeight(
          data.content + resList, ScreenUtil.hc_ScreenWidth(), 25);
      List<String> img = ImgUtil.getImgFromTxt(data.content + resList);
      if (img.isNotEmpty) {
        // print('img.isNotEmpty');
        for (var imgUrl in img) {
          if (imgUrl.isNotEmpty && imgUrl != "") {
            /*int currentTimestart3 = DateTime.now().millisecondsSinceEpoch;
            int? imageHeight = await ImgUtil.getImageHeight(imgUrl);
            int currentTimeend3 = DateTime.now().millisecondsSinceEpoch;
            print("请求耗时3：${currentTimeend3 - currentTimestart3} ms");
            calculateItemHeight += imageHeight!;*/
            calculateItemHeight += 300;
            /*print('calculateItemHeight------->${calculateItemHeight}');
            print('data--->${data.content + resList}');*/
          }
        }
      }
      notes.add(NoteCard(
        title: titleReal,
        data: data.content + resList,
        visibility: data.visibility,
        itemHeight: calculateItemHeight,
        updateTime: updateTime.substring(0, updateTime.length - 4),
      ));
    }
    int currentTimeEnd2 = DateTime.now().millisecondsSinceEpoch;
    print('_initNotes结束时间2${currentTimeEnd2}');
    print("请求耗时2：${currentTimeEnd2 - currentTimeStart2} ms");
    return notes;
  }

  ///刷新笔记内容
  void _onRefresh() async {
    var notes = await _initNotes();
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
    // 移除 WidgetsBindingObserver 监听器
    WidgetsBinding.instance!.removeObserver(this);
    _refreshController.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('lfh---didChangeDependencies');
    _future = _initNotes();
    initializedFirst = false;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // 应用程序进入 resumed 状态，类似于 onResume
      print('lfh---didChangeAppLifecycleState');
      _onRefresh();
    }
  }
}
