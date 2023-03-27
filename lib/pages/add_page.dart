import 'package:flutter/material.dart';
import 'package:memos/view/note_card_view.dart';
import 'package:memos/view/search_view.dart';

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
        title: '《彬彬来了2021》',
        data: '欢迎本期特约来彬2 ![](https://c-ssl.duitang.com/uploads/blog/202104/12/20210412130955_c2d4c.jpg)'));
    notes.add(NoteCard(
        title: '《彬彬来了2021》',
        data: '欢迎本期特约来彬3 ![](https://c-ssl.duitang.com/uploads/blog/202104/12/20210412130955_c2d4c.jpg)'));
    notes.add(NoteCard(
        title: '《彬彬来了2021》',
        data: '欢迎本期特约来彬5 ![](https://c-ssl.duitang.com/uploads/blog/202104/12/20210412130955_c2d4c.jpg)'));
    notes.add(NoteCard(
        title: '《彬彬来了2021》',
        data: '欢迎本期特约来彬2 ![](https://c-ssl.duitang.com/uploads/blog/202104/12/20210412130955_c2d4c.jpg)'));
    notes.add(NoteCard(
        title: '《彬彬来了2021》',
        data: '欢迎本期特约来彬3 ![](https://c-ssl.duitang.com/uploads/blog/202104/12/20210412130955_c2d4c.jpg)'));
    notes.add(NoteCard(
        title: '《彬彬来了2021》',
        data: '欢迎本期特约来彬5 ![](https://c-ssl.duitang.com/uploads/blog/202104/12/20210412130955_c2d4c.jpg)'));
    notes.add(NoteCard(
        title: '《彬彬来了2021》',
        data: '欢迎本期特约来彬2 ![](https://c-ssl.duitang.com/uploads/blog/202104/12/20210412130955_c2d4c.jpg)'));
    notes.add(NoteCard(
        title: '《彬彬来了2021》',
        data: '欢迎本期特约来彬3 ![](https://c-ssl.duitang.com/uploads/blog/202104/12/20210412130955_c2d4c.jpg)'));
    notes.add(NoteCard(
        title: '《彬彬来了XXXX》',
        data: '欢迎本期特约来彬5 ![](https://c-ssl.duitang.com/uploads/blog/202104/12/20210412130955_c2d4c.jpg)'));
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
    final size = MediaQuery.of(context).size;
    return Container(
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            Container(
                height: size.height,
              margin: const EdgeInsets.only(bottom: 200),
              child: Expanded(
                child: RefreshIndicator(
                    onRefresh: queryNotes,
                      child:
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        controller: scrollController,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == notes.length - 1) {
                            return SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      '加载更多...',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF111111),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 15)),
                                    SizedBox(
                                      width: 20,
                                      height: 20,
                                      child:
                                      CircularProgressIndicator(strokeWidth: 3),
                                    ),
                                  ],
                                ));
                          } else {
                            return Center(
                              child: notes.toList()[index],
                            );
                          }
                        },
                        itemCount: notes.length,
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}