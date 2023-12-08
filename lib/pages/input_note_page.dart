import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memos/beans/MemoBean.dart';
import 'package:memos/network/network.dart';
import 'package:memos/utils/SpUtils.dart';
import 'package:memos/utils/constant.dart';
import 'package:memos/utils/toast.dart';
import 'package:memos/view/dialog_view.dart';
import '../beans/ModifyNoteBean.dart';
import '../constants/constant.dart';
import '../utils/ScreenUtil.dart';
import '../view/flag_item.dart';
import '../view/img_card.dart';

typedef OnDeleteClickListener = Function(bool isDelete);

class InputPage extends StatefulWidget {
  const InputPage({Key? key, required this.modifyNoteBean}) : super(key: key);
  final ModifyNoteBean modifyNoteBean;

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage>
    with WidgetsBindingObserver, AutomaticKeepAliveClientMixin {
  late TextEditingController _noteController;
  bool _isKeyboardShow = false;
  double _notInputFiledHeight = 350;
  Widget tags = Container();
  bool _isShowTags = false;
  List<FlagItem> tagsReal = [];
  var visibilityColor = Colors.green;
  var visibilityContent = '登录可见';
  var visibilityReal = "PROTECTED";
  late FocusNode _focusNode;
  var currentImageIndex = 0;
  late Card card;

  // Map<int,Card> cards = HashMap();

  // List<dynamic> serousList = [];
  List<String> upLoadImage = [];

  // String get dataInput => "123";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _noteController = TextEditingController();
    _focusNode = FocusNode();
    List<String> tagsInfo = SpUtil.getString(Global.TAGS)!.split('-');
    if (widget.modifyNoteBean.type == ModifyNoteBean.DEIT) {
      _addContent(widget.modifyNoteBean.content);
    }
    for (var tag in tagsInfo) {
      tagsReal.add(FlagItem(
        tagText: '#$tag',
        onClickListener: (data) {
          _addContent(data);
          setState(() {
            tags = Container();
            _isShowTags = false;
            _notifyKeyboardShow();
          });
        },
      ));
    }
  }

  void _addContent(String data) {
    var realData = _noteController.value.text + data;
    _noteController.value = TextEditingValue(
        text: realData,
        selection: TextSelection.fromPosition(TextPosition(
            affinity: TextAffinity.downstream, offset: realData.length)));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromARGB(240, 255, 255, 255),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
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
        actions: [
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 13, bottom: 13),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: visibilityColor,
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Text(
                visibilityContent,
                style: const TextStyle(
                    color: Colors.white, fontSize: 13, height: 1.3),
              )),
          _visibilityPopMenu(context),
        ],
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 0),
            constraints: BoxConstraints(
                maxHeight: _notInputFiledHeight,
                minHeight: _notInputFiledHeight),
            child: TextField(
              controller: _noteController,
              focusNode: _focusNode,
              textAlignVertical: TextAlignVertical.center,
              maxLines: null,
              minLines: 60,
              style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  letterSpacing: 1.5,
                  height: 1.3),
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
                                        margin: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Wrap(
                                          direction: Axis.horizontal,
                                          spacing: 8.0,
                                          // gap between adjacent chips
                                          runSpacing: 8.0,
                                          // gap between lines
                                          children: tagsReal.toList(),
                                        ),
                                      ),
                                    ),
                                  );
                                  _isShowTags = true;
                                } else {
                                  tags = Container();
                                  _isShowTags = false;
                                }
                                _notifyKeyboardShow();
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
                              onTap: () {
                                _pickImage(ImageSource.gallery);
                              },
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
                              onTap: () {
                                _pickImage(ImageSource.camera);
                              },
                            ),
                          ),
                          /* Container(
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
                          ),*/
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              // ToastUtil.showToast(message: serousList[0]);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      elevation: 0,
                                      backgroundColor: const Color.fromARGB(
                                          215, 255, 255, 255),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7))),
                                      child: SizedBox(
                                        height:
                                            ScreenUtil.hc_ScreenHeight() / 2,
                                        width: ScreenUtil.hc_ScreenWidth(),
                                        child: StatefulBuilder(
                                          builder: (BuildContext context,
                                              void Function(void Function())
                                                  setState) {
                                            return GridView.builder(
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  mainAxisSpacing: 5.0,
                                                  crossAxisSpacing: 6.0,
                                                  childAspectRatio: 1,
                                                ),
                                                itemCount: upLoadImage.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return ImageCard(
                                                      imagePath: upLoadImage
                                                          .toList()[index],
                                                      onDelete: () {
                                                        setState(() {
                                                          upLoadImage
                                                              .removeAt(index);
                                                          if (upLoadImage
                                                              .isEmpty) {
                                                            Navigator.pop(
                                                                context);
                                                          }
                                                        });
                                                      });
                                                });
                                          },
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Visibility(
                              visible: upLoadImage.isNotEmpty,
                              child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.black12.withOpacity(0.08),
                                      shape: BoxShape.rectangle,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  margin: const EdgeInsets.all(3),
                                  padding: const EdgeInsets.all(3),
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${upLoadImage.length}',
                                      style: const TextStyle(
                                          color: Colors.black45,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16),
                                    ),
                                  )),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            alignment: Alignment.centerRight,
                            margin: const EdgeInsets.all(10),
                            child: InkWell(
                              child: Image.asset(
                                'images/ic_send.png',
                                width: 40,
                                height: 40,
                              ),
                              onTap: () {
                                String content =
                                    _noteController.text.toString();
                                if (content.isEmpty && upLoadImage.isEmpty) {
                                  ToastUtil.showToast(message: '内容为空,请完善内容');
                                  return;
                                }
                                DialogView.waitDialog(context);
                                if (upLoadImage.isNotEmpty) {
                                  //上传资源
                                  RequestManager.getClient().upload(
                                    upLoadImage[0],
                                  );
                                }
                                try {
                                  if (widget.modifyNoteBean.type ==
                                      ModifyNoteBean.INPUT) {
                                    Future<MemoBean> memoInputResult =
                                        RequestManager.getClient().createMemo(
                                            _noteController.text.toString(),
                                            [],
                                            visibilityReal);
                                    //String source,String fileName
                                    memoInputResult.then((value) {
                                      isSendNewMessage = true;
                                      //关闭对话框
                                      Navigator.pop(context);
                                      //退出编辑页面
                                      Navigator.pop(context);
                                    });
                                  } else {
                                    Future<int?> result =
                                        RequestManager.getClient().updateMemo(
                                      _noteController.text.toString().trim(),
                                      widget.modifyNoteBean.memoId,
                                      visibilityReal,
                                    );
                                    result.then((value) => {
                                          isSendNewMessage = true,
                                          //退出编辑页面
                                          Navigator.pop(context),
                                          Navigator.pop(context),
                                        });
                                  }
                                } on DioError catch (dioError) {
                                  ToastUtil.showToast(
                                      message: dioError.message);
                                }
                              },
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
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('didChangeAppLifecycleState${state}');
    if (state == AppLifecycleState.resumed) {
      setState(() {
        _notifyKeyboardShow();
      });
    }
  }

  @override
  void didChangeMetrics() {
    // 监听键盘高度变化
    setState(() {
      _notifyKeyboardShow();
    });
  }

  ///监听键盘的弹出状态
  void _notifyKeyboardShow() {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    _isKeyboardShow = keyboardHeight > 0;
    //键盘和标签控制是否显示
    if (_isKeyboardShow && _isShowTags) {
      _notInputFiledHeight =
          ScreenUtil.hc_ScreenHeight() / Global.HEIGHT_RATE_KEYBOARD_AND_TAG;
    } else if (_isKeyboardShow && !_isShowTags) {
      _notInputFiledHeight = ScreenUtil.hc_ScreenHeight() /
          Global.HEIGHT_RATE_KEYBOARD_AND_NOT_TAG;
    } else if (!_isKeyboardShow && _isShowTags) {
      _notInputFiledHeight = ScreenUtil.hc_ScreenHeight() /
          Global.HEIGHT_RATE_BOT_KEYBOARD_AND_TAG;
    } else if (!_isKeyboardShow && !_isShowTags) {
      _notInputFiledHeight = ScreenUtil.hc_ScreenHeight() /
          Global.HEIGHT_RATE_BOT_KEYBOARD_AND_NOT_TAG;
    }
  }

  ///权限选择框
  PopupMenuButton _visibilityPopMenu(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(
        Icons.lock_outline,
        color: Colors.black54,
      ),
      itemBuilder: (BuildContext context) {
        return const [
          PopupMenuItem(
            value: 0,
            child: Text('公开可见'),
          ),
          PopupMenuItem(
            value: 1,
            child: Text('自己可见'),
          ),
          PopupMenuItem(
            value: 2,
            child: Text('登录可见'),
          ),
        ];
      },
      onSelected: (value) {
        switch (value) {
          case 0:
            visibilityContent = '公开可见';
            visibilityReal = "PUBLIC";
            visibilityColor = Colors.green;
            break;
          case 1:
            visibilityContent = '自己可见';
            visibilityReal = "PRIVATE";
            visibilityColor = Colors.red;
            break;
          case 2:
            visibilityContent = '登录可见';
            visibilityReal = "PROTECTED";
            visibilityColor = Colors.blue;
            break;
          default:
            visibilityContent = '公开可见';
            visibilityReal = "PUBLIC";
            visibilityColor = Colors.green;
            break;
        }
        _focusNode.requestFocus();
      },
    );
  }

  ///进行照片的选取或者是拍照
  Future<void> _pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      final String imagePath = pickedFile.path;
      upLoadImage.add(imagePath);
    }
    Future.delayed(const Duration(milliseconds: 100), () async {
      setState(() {
        _focusNode.unfocus();
        _notifyKeyboardShow();
      });
    });
  }

  @override
  bool get wantKeepAlive => true;
}
