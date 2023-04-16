import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:memos/auth/start_page.dart';

import '../view/heat_map.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.07),
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
                      '14',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Memos')
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '14',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Tags')
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '14',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Days')
                  ],
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 10, right: 0, top: 20),
            child: CusHeatMap(
              datasets: {
                DateTime(2023, 4, 6): 1,
                DateTime(2023, 4, 7): 10,
                DateTime(2023, 4, 8): 10,
                DateTime(2023, 4, 9): 10,
                DateTime(2023, 4, 13): 1,
              },
            ),
          ),
          Container(
            height: 70,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 10),
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
                      child: Image.asset(
                        'images/ic_user_num.png',
                        width: 22,
                        height: 22,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      '啦啦啦',
                      style: TextStyle(color: Colors.black54, fontSize: 17),
                    ),
                    const Spacer(),
                    Container(
                        alignment: Alignment.center,
                        child: InkWell(
                          child: Icon(
                            Icons.navigate_next_rounded,
                            color: Colors.black26,
                            size: 28,
                          ),
                          onTap: () {},
                        ))
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 70,
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
                        width: 25,
                        height: 25,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '官方网站',
                      style: const TextStyle(
                          color: Colors.black87, fontSize: 17),
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
                            size: 28,
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
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          '用户条款',
                          style:
                              TextStyle(color: Colors.black87, fontSize: 17),
                        ),
                        const Spacer(),
                        InkWell(
                          child: const Icon(
                            Icons.navigate_next_rounded,
                            color: Colors.black26,
                            size: 28,
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
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          '隐私政策',
                          style:
                              TextStyle(color: Colors.black87, fontSize: 17),
                        ),
                        const Spacer(),
                        InkWell(
                          child: const Icon(
                            Icons.navigate_next_rounded,
                            color: Colors.black26,
                            size: 28,
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
          Container(
            height: 180,
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
                        const EdgeInsets.only(left: 10, right: 10, top: 15),
                    child: InkWell(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/ic_call_back.png',
                            width: 25,
                            height: 25,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            '反馈与建议',
                            style: TextStyle(
                                color: Colors.black87, fontSize: 17),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.navigate_next_rounded,
                            color: Colors.black26,
                            size: 28,
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
                    margin:
                        const EdgeInsets.only(left: 10, right: 10, top: 5),
                    child: InkWell(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/ic_contract_us.png',
                            width: 25,
                            height: 25,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            '联系我们',
                            style: TextStyle(
                                color: Colors.black87, fontSize: 17),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.navigate_next_rounded,
                            color: Colors.black26,
                            size: 28,
                          ),
                        ],
                      ),
                      onTap: () {},
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
                            width: 25,
                            height: 25,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            '更新记录',
                            style: TextStyle(
                                color: Colors.black87, fontSize: 17),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.navigate_next_rounded,
                            color: Colors.black26,
                            size: 28,
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
          Container(
            height: 70,
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
                          width: 25,
                          height: 25,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '关于',
                        style: const TextStyle(
                            color: Colors.black87, fontSize: 17),
                      ),
                      Spacer(),
                      Text(
                        '',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(
                        Icons.navigate_next_rounded,
                        color: Colors.black26,
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return const LeadPage();
                    }));
              },
            ),
          ),
        ],
      ),
    ));
  }
}
