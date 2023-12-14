import 'package:flutter/material.dart';
import '../utils/SpUtils.dart';

typedef OnClicked = Function(bool isSelected);

const String THEME_COLOR_SAVE = "THEME_COLOR";

class ThemeCard extends StatefulWidget {
  const ThemeCard({Key? key}) : super(key: key);

  @override
  State<ThemeCard> createState() => _ThemeCardState();
}

class _ThemeCardState extends State<ThemeCard> {
  int currentTheme = SpUtil.getInt(THEME_COLOR_SAVE) ?? COLOR_WHITE;

  List<ColorCard> themes = [];
  static const int COLOR_RED = 0;
  static const int COLOR_BLUE = 1;
  static const int COLOR_GREEN = 2;
  static const int COLOR_BLACK = 3;
  static const int COLOR_WHITE = 4;

  bool COLOR_RED_SELECTED = false;
  bool COLOR_BLUE_SELECTED = false;
  bool COLOR_GREEN_SELECTED = false;
  bool COLOR_BLACK_SELECTED = false;
  bool COLOR_WHITE_SELECTED = false;

  @override
  void initState() {
    super.initState();
    initThemes();
    _switchTheme(currentTheme);
  }

  void initThemes() {
    themes = [
      ColorCard(
        color: Colors.red,
        value: COLOR_RED,
        onClickListener: () => _switchTheme(COLOR_RED),
        isSelected: false,
      ),
      ColorCard(
        color: Colors.blue,
        value: COLOR_BLUE,
        onClickListener: () => _switchTheme(COLOR_BLUE),
        isSelected: false,
      ),
      ColorCard(
        color: Colors.green,
        value: COLOR_GREEN,
        onClickListener: () => _switchTheme(COLOR_GREEN),
        isSelected: false,
      ),
      ColorCard(
        color: Colors.black,
        value: COLOR_BLACK,
        onClickListener: () => _switchTheme(COLOR_BLACK),
        isSelected: false,
        updateState: (bool isSelected) {
          isSelected = COLOR_BLACK_SELECTED;
        },
      ),
      ColorCard(
        color: Colors.white,
        value: COLOR_WHITE,
        onClickListener: () => _switchTheme(COLOR_WHITE),
        isSelected: false,
      ),
    ];

    _switchTheme(currentTheme);
  }

  /* _switchTheme(int value) {
    print('_switchTheme0---->$value');
    SpUtil.setInt(THEME_COLOR_SAVE, value);
    setState(() {
      for (int i = 0; i < themes.length; i++) {
        var colorCard = themes[i];
        print('_switchTheme1---->${i}');
        if (value == i) {
          print('_switchTheme2---->${i}');
        } else {
          // colorCard.isSelected = false;
        }
      }
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 6.0,
          childAspectRatio: 1,
        ),
        itemCount: themes.length,
        itemBuilder: (BuildContext context, int index) {
          return themes.toList()[index];
        });
  }

  _switchTheme(int value) {
    SpUtil.setInt(THEME_COLOR_SAVE, value);
    switch (value) {
      case COLOR_RED:
        _setRedColorSwitch();
        break;
      case COLOR_BLUE:
        _setBlueColorSwitch();
        break;
      case COLOR_GREEN:
        _setGreenColorSwitch();
        break;
      case COLOR_BLACK:
        _setBlackColorSwitch();
        break;
      case COLOR_WHITE:
        _setWhiteColorSwitch();
        break;
      default:
        _setWhiteColorSwitch();
        break;
    }
  }

  _setRedColorSwitch() {
    setState(() {
      COLOR_RED_SELECTED = true;
      COLOR_BLUE_SELECTED = false;
      COLOR_GREEN_SELECTED = false;
      COLOR_BLACK_SELECTED = false;
      COLOR_WHITE_SELECTED = false;
    });
  }

  _setBlueColorSwitch() {
    setState(() {
      COLOR_RED_SELECTED = false;
      COLOR_BLUE_SELECTED = true;
      COLOR_GREEN_SELECTED = false;
      COLOR_BLACK_SELECTED = false;
      COLOR_WHITE_SELECTED = false;
    });
  }

  _setGreenColorSwitch() {
    setState(() {
      COLOR_RED_SELECTED = false;
      COLOR_BLUE_SELECTED = false;
      COLOR_GREEN_SELECTED = true;
      COLOR_BLACK_SELECTED = false;
      COLOR_WHITE_SELECTED = false;
    });
  }

  _setBlackColorSwitch() {
    setState(() {
      COLOR_RED_SELECTED = false;
      COLOR_BLUE_SELECTED = false;
      COLOR_GREEN_SELECTED = false;
      COLOR_BLACK_SELECTED = true;
      COLOR_WHITE_SELECTED = false;
    });
  }

  _setWhiteColorSwitch() {
    setState(() {
      COLOR_RED_SELECTED = false;
      COLOR_BLUE_SELECTED = false;
      COLOR_GREEN_SELECTED = false;
      COLOR_BLACK_SELECTED = false;
      COLOR_WHITE_SELECTED = true;
    });
  }
}

class ColorCard extends StatefulWidget {
  const ColorCard({
    Key? key,
    required this.color,
    required this.onClickListener,
    required this.value,
    required this.isSelected,
  }) : super(key: key);
  final Color color;
  final VoidCallback onClickListener;
  final int value;
  final bool isSelected;

  @override
  State<ColorCard> createState() => _ColorCardState();
}

class _ColorCardState extends State<ColorCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClickListener,
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.all(8),
        color: widget.color,
        shadowColor: Colors.grey.withOpacity(0.6),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: widget.isSelected
              ? const BorderSide(
                  color: Colors.yellow,
                  width: 5.0,
                )
              : BorderSide.none,
        ),
        child: Container(
          color: widget.color,
        ),
      ),
    );
  }
}
