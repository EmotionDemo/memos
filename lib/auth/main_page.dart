import 'package:flutter/material.dart';
import 'package:memos/pages/collect_page.dart';
import 'package:memos/pages/more_page.dart';
import 'package:memos/pages/resource_page.dart';
import 'package:memos/pages/tag_page.dart';
import 'package:memos/utils/SpUtils.dart';

import '../pages/add_page.dart';
import 'login_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  int _currentIndex = -1;
  late AssetImage collectImg;
  late AssetImage collectSelectedImg;
  late AssetImage labelImg;
  late AssetImage labelSelectedImg;
  late AssetImage srcImg;
  late AssetImage srcSelectedImg;
  late AssetImage moreImg;
  late AssetImage moreSelectedImg;
  late AssetImage addImg;
  late AssetImage addSelectedImg;
  final _pageController = PageController(initialPage: 2, keepPage: true);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
    imageCache.clear();
  }

  List<BottomNavigationBarItem> bottomItems = [];
  final pages = [
    const CollectPage(),
    const TagPage(),
    const AddPage(),
    const ResourcePage(),
    const MorePage()
  ];

  @override
  void initState() {
    super.initState();
    print('flutter--------->main_init');
    //默认初始化显示的页数
    _currentIndex = 2;
    collectImg = const AssetImage('images/ic_collect.png');
    collectSelectedImg = const AssetImage('images/ic_collect_selected.png');
    labelImg = const AssetImage('images/ic_label.png');
    labelSelectedImg = const AssetImage('images/ic_label_selected.png');
    srcImg = const AssetImage('images/ic_src.png');
    srcSelectedImg = const AssetImage('images/ic_src_selected.png');
    moreImg = const AssetImage('images/ic_more.png');
    moreSelectedImg = const AssetImage('images/ic_more_selected.png');
    addImg = const AssetImage('images/ic_add.png');
    addSelectedImg = const AssetImage('images/ic_add_selected.png');
    bottomItems = [
      BottomNavigationBarItem(
          icon: Image(
            width: 24,
            height: 24,
            image: collectImg,
          ),
          activeIcon: Image(
            width: 24,
            height: 24,
            image: collectSelectedImg,
          ),
          label: ""),
      BottomNavigationBarItem(
          icon: Image(
            width: 24,
            height: 24,
            image: labelImg,
          ),
          activeIcon: Image(
            width: 24,
            height: 24,
            image: labelSelectedImg,
          ),
          label: ""),
      BottomNavigationBarItem(
          icon: Image(
            width: 24,
            height: 24,
            image: addImg,
          ),
          activeIcon: Image(
            width: 24,
            height: 24,
            image: addSelectedImg,
          ),
          label: ""),
      BottomNavigationBarItem(
          icon: Image(
            width: 24,
            height: 24,
            image: srcImg,
          ),
          activeIcon: Image(
            width: 24,
            height: 24,
            image: srcSelectedImg,
          ),
          label: ""),
      BottomNavigationBarItem(
          icon: Image(
            width: 24,
            height: 24,
            image: moreImg,
          ),
          activeIcon: Image(
            width: 24,
            height: 24,
            image: moreSelectedImg,
          ),
          label: ""),
    ];
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(collectImg, context);
    precacheImage(collectSelectedImg, context);
    precacheImage(labelImg, context);
    precacheImage(labelSelectedImg, context);
    precacheImage(srcImg, context);
    precacheImage(srcSelectedImg, context);
    precacheImage(moreImg, context);
    precacheImage(moreSelectedImg, context);
    precacheImage(addImg, context);
    precacheImage(addSelectedImg, context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomItems,
        backgroundColor: Colors.white,
        elevation: 5.0,
        // iconSize: 30,
        currentIndex: _currentIndex,
        fixedColor: Colors.pink,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _onTap(index);
        },
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: _changePage,
        pageSnapping: false,
        scrollDirection: Axis.horizontal,
        children: pages,
      ),
    );
  }

  void _changePage(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  void _onTap(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  bool get wantKeepAlive => true;
}
