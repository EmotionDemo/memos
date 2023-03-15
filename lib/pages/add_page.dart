import 'package:flutter/material.dart';
import 'package:memos/view/search_view.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 20,top: 20),
          child: const Text(
            'MEMOS',
            style: TextStyle(color: Colors.black,fontSize: 22),
          ),
        ),
        Container(
          height: 43,
          margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: SearchView(
            onSearchInputComplete: () {},
            controller: controller,
            hintText: "快速搜索",
          ),
        ),
      ],
    );
  }
}
