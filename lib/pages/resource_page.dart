import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          print('ResourcePage--->${resourceBean.data}'),
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
            print('xjpppp----->' +
                "${SpUtil.getString(Global.BASE_PATH)!}/o/r/${element.id}/${element.filename}");
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
                      margin: EdgeInsets.only(left: 10, top: 6),
                      child: Text(
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
                  style: const TextStyle(color: Colors.black, fontSize: 22),
                ),
              ),
            ],
          ),
        ),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 6.0,
              childAspectRatio: 1,
            ),
            itemCount: list.toList().length,
            itemBuilder: (BuildContext context, int index) {
              return list.toList()[index];
            }));
  }
}
