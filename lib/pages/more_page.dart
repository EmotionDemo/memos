import 'dart:collection';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memos/auth/start_page.dart';
import 'package:memos/constants/constant.dart';
import 'package:memos/network/network.dart';
import 'package:memos/utils/SpUtils.dart';

import '../beans/MemosBean.dart';
import '../beans/TagsBean.dart';
import '../generated/l10n.dart';
import '../view/heat_map.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage>
    with AutomaticKeepAliveClientMixin {
  final Map<DateTime, int> dateTimeMap = {};

  //笔记总数
  int memosNum = 0;

  //日期数
  int daysDiff = 0;

  //标签数
  int tasNum = 0;

  @override
  void initState() {
    super.initState();
    _countDays();
    final Map<String, int> dateMap = {};
    final List<String> dateReal = [];
    //查询提交次数浓度
    _queryCommitDays(dateReal, dateMap);

    ///获取memos数目
    _queryMomesNum();

    ///获取tas总数
    _queryTagsNum();
  }

  void _queryTagsNum() {
    Future<TagsBean> tags = RequestManager.getClient().queryAllTags();
    tags.then((value) {
      tasNum = value.data.length;
    });
  }

  void _queryMomesNum() {
    Future<MemosBean> memos = RequestManager.getClient().queryAllMemos("");
    memos.then((value) {
      memosNum = value.data.length;
    });
  }

  void _queryCommitDays(List<String> dateReal, Map<String, int> dateMap) {
    Future<List<String>> queryNoteDates =
    RequestManager.getClient().queryNoteDates();
    queryNoteDates.then((dateList) {
      setState(() {
        //解析出所有年月日按格式xxxx-xx-xx存储
        for (String date in dateList) {
          DateTime timeReal =
          DateTime.fromMillisecondsSinceEpoch(int.parse(date) * 1000);
          int year = timeReal.year;
          int month = timeReal.month;
          int day = timeReal.day;
          dateReal.add("$year-$month-$day");
        }
        //统计当天出现的次数
        for (String date in dateReal) {
          dateMap[date] = (dateMap[date] ?? 0) + 1;
        }
        //组装数据
        dateMap.forEach((key, value) {
          List<String> realDate = key.split('-');
          int year = int.parse(realDate[0]);
          int month = int.parse(realDate[1]);
          int day = int.parse(realDate[2]);
          dateTimeMap[DateTime(year, month, day)] = value;
        });
      });
    });
  }

  ///获取用户使用天数
  void _countDays() {
    DateTime now = DateTime.fromMillisecondsSinceEpoch(
        DateTime.now().millisecondsSinceEpoch);
    DateTime oldTime = DateTime.fromMillisecondsSinceEpoch(
        int.parse(SpUtil.getInt(Global.USER_LOGIN_DAYS).toString()) * 1000);
    Duration diff = now.difference(oldTime);
    daysDiff = diff.inDays + 1;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.transparent,
          toolbarHeight: 0.0,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          memosNum.toString(),
                          style:const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text('Memos',
                            style:
                            TextStyle(fontSize: 18, color: Colors.black26))
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          tasNum.toString(),
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text('Tags',
                            style:
                            TextStyle(fontSize: 18, color: Colors.black26))
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          daysDiff.toString(),
                          style:const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text('Days',
                            style:
                            TextStyle(fontSize: 18, color: Colors.black26))
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 10, right: 0, top: 20),
                child: CusHeatMap(
                  datasets: dateTimeMap,
                ),
              ),
              Container(
                height: 65,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 10),
                padding:
                const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                child: InkWell(
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    shadowColor: Colors.grey,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Container(
                      width: double.maxFinite,
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Image.asset(
                              'images/ic_user_num.png',
                              width: 20,
                              height: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            SpUtil.getString(Global.USER_NAME).toString(),
                            style: const TextStyle(
                                color: Colors.black54, fontSize: 15),
                          ),
                          const Spacer(),
                          Container(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.navigate_next_rounded,
                                color: Colors.black26,
                                size: 25,
                              ))
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/user_info");
                  },
                ),
              ),
              Container(
                height: 65,
                alignment: Alignment.topLeft,
                padding:
                const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white,
                  shadowColor: Colors.grey,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Image.asset(
                            'images/ic_net_main.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          S.of(context).lang_official_website,
                          style: const TextStyle(
                              color: Colors.black87, fontSize: 15),
                        ),
                        Spacer(),
                        Text(
                          'memos.moe',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: InkWell(
                              child: Icon(
                                Icons.navigate_next_rounded,
                                color: Colors.black26,
                                size: 25,
                              ),
                              onTap: () {},
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 120,
                padding:
                const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white,
                  shadowColor: Colors.grey,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Column(
                    children: [
                      Container(
                        width: double.maxFinite,
                        margin:
                        const EdgeInsets.only(left: 10, right: 10, top: 13),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/ic_clause.png',
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              S.of(context).lang_terms_conditions,
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 15),
                            ),
                            const Spacer(),
                            InkWell(
                              child: const Icon(
                                Icons.navigate_next_rounded,
                                color: Colors.black26,
                                size: 25,
                              ),
                              onTap: () {},
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          indent: 20,
                          color: Colors.black12.withOpacity(0.05),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: double.maxFinite,
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/ic_privacy.png',
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              S.of(context).lang_privacy_policy,
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 15),
                            ),
                            const Spacer(),
                            InkWell(
                              child: const Icon(
                                Icons.navigate_next_rounded,
                                color: Colors.black26,
                                size: 25,
                              ),
                              onTap: () {},
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  height: 160,
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 5, right: 5),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    shadowColor: Colors.grey,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Column(
                      children: [
                        Container(
                          width: double.maxFinite,
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 15),
                          child: InkWell(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'images/ic_call_back.png',
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  S.of(context).lang_feedback,
                                  style: const TextStyle(
                                      color: Colors.black87, fontSize: 15),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.navigate_next_rounded,
                                  color: Colors.black26,
                                  size: 25,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          margin: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Divider(
                            height: 1,
                            thickness: 1,
                            indent: 20,
                            color: Colors.black12.withOpacity(0.05),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: double.maxFinite,
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 5),
                          child: InkWell(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'images/ic_contract_us.png',
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  S.of(context).lang_contact,
                                  style:const TextStyle(
                                      color: Colors.black87, fontSize: 15),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.navigate_next_rounded,
                                  color: Colors.black26,
                                  size: 25,
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, "/contact_me");
                            },
                          ),
                        ),
                        const Spacer(),
                        Container(
                          margin: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Divider(
                            height: 1,
                            thickness: 1,
                            indent: 20,
                            color: Colors.black12.withOpacity(0.05),
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: InkWell(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'images/ic_update.png',
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  S.of(context).lang_update_records,
                                  style:const TextStyle(
                                      color: Colors.black87, fontSize: 15),
                                ),
                                Spacer(),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(top: 5, bottom: 5),
                                  child: Text(
                                    'V0.1.1',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ),
                                const Icon(
                                  Icons.navigate_next_rounded,
                                  color: Colors.black26,
                                  size: 25,
                                ),
                              ],
                            ),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 65,
                alignment: Alignment.topLeft,
                padding:
                const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                child: InkWell(
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    shadowColor: Colors.grey,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Container(
                      width: double.maxFinite,
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Image.asset(
                              'images/ic_about_us.png',
                              width: 20,
                              height: 20,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            S.of(context).lang_about,
                            style: const TextStyle(
                                color: Colors.black87, fontSize: 15),
                          ),
                          Spacer(),
                          Text(
                            '',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Icons.navigate_next_rounded,
                            color: Colors.black26,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return LeadPage(showStart: false);
                        }));
                  },
                ),
              ),
            ],
          ),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
