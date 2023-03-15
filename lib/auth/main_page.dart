import 'package:flutter/material.dart';
import 'package:memos/pages/collect_page.dart';
import 'package:memos/pages/more_page.dart';
import 'package:memos/pages/resource_page.dart';
import 'package:memos/pages/tag_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = -1;
  final List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.collections,
        ),
        label: ""),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.tag_rounded,
        ),
        label: ""),
    BottomNavigationBarItem(
        icon: Icon(Icons.photo), label: ""),
    BottomNavigationBarItem(
        icon: Icon(Icons.more_horiz),
        label: ""),
  ];

  final pages = const [
    CollectPage(),
    TagPage(),
    ResourcePage(),
    MorePage(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomItems,
        backgroundColor: Colors.white,
        elevation: 5.0,
        iconSize: 30,
        currentIndex: currentIndex,
        fixedColor: Colors.pink,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _changePage(index);
        },
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          pages[currentIndex],
        ],
      ),
    );
  }

  void _changePage(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }
}
