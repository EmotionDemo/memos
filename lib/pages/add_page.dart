import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memos/view/note_card_view.dart';
import 'package:memos/view/search_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view/MyAppbar.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController controller = TextEditingController();
  List<Widget> notes = [Container()];

  void _initNotes() {
    notes.add(NoteCard(
        title: '快来加入快乐1+1',
        data:
            '123131 !'));
    notes.add(NoteCard(title: '快来加入快乐1+2', data: '安达市多 !'));
    notes.add(NoteCard(title: '快来加入快乐1+3', data: '欢迎本期特约来彬5 !'));
    notes.add(NoteCard(
        title: '快来加入Tom and jerry ',
        data:
            '欢迎本期特约来彬2 ![](https://c-ssl.duitang.com/uploads/blog/202104/12/20210412130955_c2d4c.jpg)'));
    notes.add(NoteCard(
        title: '快来加入Tom and jerry ',
        data:
            '欢迎本期特约来彬3 ![](https://c-ssl.duitang.com/uploads/blog/202104/12/20210412130955_c2d4c.jpg)'));
    notes.add(NoteCard(
        title: '烦恼统统忘掉',
        data:
            '欢迎本期特约来彬5 ![](https://c-ssl.duitang.com/uploads/blog/202104/12/20210412130955_c2d4c.jpg)'));
    notes.add(NoteCard(
        title: '《我要喝糁汤》',
        data:
            '欢迎本期特约来彬2 ![](https://c-ssl.duitang.com/uploads/blog/202104/12/20210412130955_c2d4c.jpg)'));
    notes.add(NoteCard(
        title: '《我要喝糁汤》',
        data:
            '欢迎本期特约来彬3 ![](https://c-ssl.duitang.com/uploads/blog/202104/12/20210412130955_c2d4c.jpg)'));
    notes.add(NoteCard(
        title: '《我要喝糁汤》',
        data:
            '欢迎本期特约来彬5 ![](https://c-ssl.duitang.com/uploads/blog/202104/12/20210412130955_c2d4c.jpg)'));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initNotes();
  }

  Future<void> queryNotes() async {}
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.transparent,
          elevation: 0,
            title:  Row(
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
                    print('bvbvbbvvb');
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
            Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              // itemExtent: 200,
              itemCount: notes.length,
              padding:
                  const EdgeInsets.only(top: 5, bottom: 5, left: 0, right: 0),
              itemBuilder: (BuildContext context, int index) {
                return notes.toList()[index];
              },
            )),
          ],
        ));
  }
}
