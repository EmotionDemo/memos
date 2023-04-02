import 'package:flutter/material.dart';
import 'package:memos/view/note_card_view.dart';
import 'package:memos/view/search_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        title: '1111《彬彬来了2021》',
        data:
            '欢迎本期特约来彬2 ![](https://c-ssl.duitang.com/uploads/blog/202104/12/20210412130955_c2d4c.jpg)'));
    notes.add(NoteCard(
        title: '《彬彬来了2021》',
        data:
            '欢迎本期特约来彬3 ![](https://c-ssl.duitang.com/uploads/blog/202104/12/20210412130955_c2d4c.jpg)'));
    notes.add(NoteCard(
        title: '《彬彬来了2021》',
        data:
            '欢迎本期特约来彬5 ![](https://c-ssl.duitang.com/uploads/blog/202104/12/20210412130955_c2d4c.jpg)'));
    notes.add(NoteCard(
        title: '《彬彬来了2021》',
        data:
            '欢迎本期特约来彬2 ![](https://c-ssl.duitang.com/uploads/blog/202104/12/20210412130955_c2d4c.jpg)'));
    notes.add(NoteCard(
        title: '《彬彬来了2021》',
        data:
            '欢迎本期特约来彬3 ![](https://c-ssl.duitang.com/uploads/blog/202104/12/20210412130955_c2d4c.jpg)'));
    notes.add(NoteCard(
        title: '《彬彬来了2021》',
        data:
            '欢迎本期特约来彬5 ![](https://c-ssl.duitang.com/uploads/blog/202104/12/20210412130955_c2d4c.jpg)'));
    notes.add(NoteCard(
        title: '《彬彬来了2021》',
        data:
            '欢迎本期特约来彬2 ![](https://c-ssl.duitang.com/uploads/blog/202104/12/20210412130955_c2d4c.jpg)'));
    notes.add(NoteCard(
        title: '《彬彬来了2021》',
        data:
            '欢迎本期特约来彬3 ![](https://c-ssl.duitang.com/uploads/blog/202104/12/20210412130955_c2d4c.jpg)'));
    notes.add(NoteCard(
        title: '《彬彬来了XXXX》',
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
    // final size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 20, top: 20),
                child: const Text(
                  'MEMOS',
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 20, top: 20),
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
          Container(
            height: 43,
            margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: SearchView(
              onSearchInputComplete: () {
                FocusScope.of(context).unfocus();
                print('aaa');
              },
              controller: controller,
              hintText: "快捷搜索",
            ),
          ),
          Expanded(
              child: Container(
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
            ),
          )),
        ],
      ),
    );
  }
}
