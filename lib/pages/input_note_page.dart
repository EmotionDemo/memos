import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

import '../utils/ScreenUtil.dart';
import '../view/flag_item.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> with WidgetsBindingObserver {
  final TextEditingController _noteController = TextEditingController();
  bool _isKeyboardShow = false;
  double _notInputFiledHeight = 350;
  Widget tags = Container();
  bool _isShowTags = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromARGB(240, 255, 255, 255),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:const Text(
          '此刻 📝',
          style: TextStyle(color: Colors.black),
        ),
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
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            constraints: BoxConstraints(
                maxHeight: _notInputFiledHeight,
                minHeight: _notInputFiledHeight),
            child: TextField(
              controller: _noteController,
              textAlignVertical: TextAlignVertical.center,
              maxLines: null,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  letterSpacing: 1.5,
                  height: 1.3),
              minLines: 60,
              autofocus: true,
              cursorColor: Colors.green,
              keyboardType: TextInputType.multiline,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                // hintText: "好的想法",
                hintStyle: const TextStyle(color: Colors.black26),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    style: BorderStyle.solid,
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  tags,
                  Card(
                    elevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    child: SizedBox(
                      height: 70,
                      child: Row(
                        children: [
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black12.withOpacity(0.08),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10.0)),
                              margin: const EdgeInsets.all(3),
                              padding: const EdgeInsets.all(6),
                              child: Image.asset(
                                'images/ic_tag_select.png',
                                width: 24,
                                height: 24,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                if (!_isShowTags) {
                                  tags = Card(
                                    elevation: 0,
                                    color: Colors.white,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Wrap(
                                          direction: Axis.horizontal,
                                          spacing: 8.0,
                                          // gap between adjacent chips
                                          runSpacing: 8.0,
                                          // gap between lines
                                          children: [
                                            FlagItem(tagText: '#肖申克的救赎'),
                                            FlagItem(tagText: '#阿甘正传'),
                                            FlagItem(tagText: '#泰坦尼克号'),
                                            FlagItem(tagText: '#这个杀手不太冷'),
                                            FlagItem(tagText: '#美丽人生'),
                                            FlagItem(tagText: '#辛德勒的名单'),
                                            FlagItem(tagText: '#星际穿越'),
                                            FlagItem(tagText: '#楚门的世界'),
                                            FlagItem(tagText: '#忠犬八公的故事'),
                                            FlagItem(tagText: '#机器人总动员'),
                                            FlagItem(tagText: '#疯狂动物城'),
                                            FlagItem(tagText: '#控方证人'),
                                            FlagItem(tagText: '#情妇'),
                                            FlagItem(tagText: '#书记的名单'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                  _isShowTags = true;
                                } else {
                                  tags = Container();
                                  _isShowTags = false;
                                }
                                _notifyTagsShow();
                              });
                            },
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black12.withOpacity(0.08),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10.0)),
                            margin: const EdgeInsets.all(3),
                            padding: const EdgeInsets.all(3),
                            child: InkWell(
                              child: Image.asset(
                                'images/ic_photo_album.png',
                                width: 30,
                                height: 30,
                              ),
                              onTap: () {},
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black12.withOpacity(0.08),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10.0)),
                            margin: const EdgeInsets.all(3),
                            padding: const EdgeInsets.all(3),
                            child: InkWell(
                              child: Image.asset(
                                'images/ic_camera_select.png',
                                width: 30,
                                height: 30,
                              ),
                              onTap: () {},
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black12.withOpacity(0.08),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10.0)),
                            margin: const EdgeInsets.all(3),
                            padding: const EdgeInsets.all(3),
                            child: Image.asset(
                              'images/ic_voice.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            alignment: Alignment.centerRight,
                            margin: const EdgeInsets.all(10),
                            child: InkWell(
                              child: Image.asset(
                                'images/ic_submit_note.png',
                                width: 40,
                                height: 40,
                              ),
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    print('---dispose');
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    // 监听键盘高度变化
    setState(() {
      _notifyTagsShow();
      print('_isKeyboardShow------>${_isKeyboardShow}');
    });
  }

  ///监听键盘的弹出状态
  void _notifyTagsShow() {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    _isKeyboardShow = keyboardHeight > 0;
    if (_isKeyboardShow && _isShowTags) {
      _notInputFiledHeight = 310;
    } else if(_isKeyboardShow && !_isShowTags){
      _notInputFiledHeight = 360;
    }else if(!_isKeyboardShow && _isShowTags){
      _notInputFiledHeight = 560;
    }
    else if(!_isKeyboardShow && !_isShowTags){
      _notInputFiledHeight = 610;
    }
    setState(() {
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('-------didChangeDependencies-----');
  }

}
