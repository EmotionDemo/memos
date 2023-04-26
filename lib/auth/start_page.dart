
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memos/auth/login_page.dart';
import 'package:memos/pages/more_page.dart';
import 'package:memos/view/Button.dart';
import 'package:memos/view/indicator_widget.dart';

class LeadPage extends StatefulWidget {
  LeadPage({Key? key, required this.showStart}) : super(key: key);
  bool showStart;

  @override
  State<LeadPage> createState() => _LeadPageState();
}

class _LeadPageState extends State<LeadPage> {
  void onPageChanged(int value) {}
  final pageController = PageController();
  var indicatorIndex = 0;
  final List<Widget> leadPages = [];
  late Widget startButton;

  List<Widget> _getLeadPage() {
    leadPages.add(Container(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 160),
      child: Column(
        children: [
          Image.asset('images/img_start_create.png'),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Create free notes & collaborate with your team',
            style: TextStyle(fontSize: 22),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: const Text(
              '整个世界如一座金字塔将我们笼罩，有人高高在上而我只是运转的供料',
              style: TextStyle(color: Colors.black54),
            ),
          )
        ],
      ),
    ));
    leadPages.add(Container(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 160),
      child: Column(
        children: [
          Image.asset('images/ic_start_lead.png'),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Create free notes & collaborate with your team',
            style: TextStyle(fontSize: 22),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: const Text(
              '推杯换盏纸醉金迷， 笙歌燕舞不必心急',
              style: TextStyle(color: Colors.black54),
            ),
          )
        ],
      ),
    ));
    leadPages.add(Container(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 160),
      child: Column(
        children: [
          Image.asset('images/ic_start_idea.png'),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Create free notes & collaborate with your team',
            style: TextStyle(fontSize: 22),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: const Text(
              '我也并非是数典忘祖 我也并非是逆来顺受，每个人不过是被囚禁 放弃挣扎的困兽',
              style: TextStyle(color: Colors.black54),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          startButton
        ],
      ),
    ));
    return leadPages;
  }

  int maxSize = 0;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.showStart) {
      startButton = SizedBox(
        width: 100,
        height: 40,
        child: Button(
          onClickListener: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const LoginPage();
            }));
          },
          title: '开始',
          icon: const Icon(
            Icons.arrow_forward_sharp,
            color: Colors.white,
          ),
        ),
      );
    } else {
      startButton = Container(
        width: 100,
        height: 40,
        child: Button(
          onClickListener: () {
            //退出当前界面
            Navigator.of(context).pop();
          },
          title: '完成',
          icon: const Icon(
            Icons.arrow_forward_sharp,
            color: Colors.white,
          ),
        ),
      );
    }
    _getLeadPage();
    maxSize = leadPages.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.white,
          ),
          Column(
            children: [
              Expanded(
                  child: PageView.builder(
                itemCount: maxSize,
                physics: const AlwaysScrollableScrollPhysics(),
                controller: pageController,
                itemBuilder: (BuildContext context, int index) {
                  return leadPages[index % maxSize];
                },
              )),
              IndicatorWidget(
                color: Colors.green.withOpacity(0.8),
                controller: pageController,
                itemCount: maxSize,
              )
            ],
          ),
        ],
      ),
    );
  }
}
