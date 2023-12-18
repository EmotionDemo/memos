import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:memos/utils/SpUtils.dart';

import '../utils/ScreenUtil.dart';
import '../utils/ThemeController.dart';
import '../view/color_card.dart';

const String THEME_COLOR_SAVE = "THEME_COLOR_SAVE";
class ThemePage extends StatefulWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {

  List<ColorThemeCard> themes = [];
  int selectedIndex = SpUtil.getInt(THEME_COLOR_SAVE)!;
  final ThemeController themeController = ThemeController();
  final int COLOR_RED = 0;
  final int COLOR_BLUE = 1;
  final int COLOR_GREEN = 2;
  final int COLOR_BLACK = 3;
  final int COLOR_WHITE = 4;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(240, 255, 255, 255),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          // alignment: Alignment.topRight,
          margin: EdgeInsets.only(left: ScreenUtil.hc_ScreenWidth() / 20),
          child: InkWell(
            child: Icon(
              Icons.arrow_back_sharp,
              color: Colors.black.withOpacity(0.5),
              size: 30,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: const Text(
          '👗换肤',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: GridView.builder(
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 6.0,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return ColorThemeCard(
            index: index,
            isSelected: selectedIndex == index,
            onTap: () {
              setState(() {
                selectedIndex = index;
                SpUtil.setInt(THEME_COLOR_SAVE, selectedIndex);
                Get.changeTheme(themeController.switchThemeColor(selectedIndex));
                Get.forceAppUpdate();
              });
            },
           );
        },
      ),
    );
  }


}
