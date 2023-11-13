import 'package:flutter/material.dart';
import '../utils/toast.dart';

typedef OnClicked = Function(String data);
class FlagItem extends StatefulWidget {
  FlagItem({Key? key, required this.tagText, required this.onClickListener}) : super(key: key);
  String tagText;
  final OnClicked onClickListener;

  @override
  State<FlagItem> createState() => _FlagItemState();
}

class _FlagItemState extends State<FlagItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: GlobalKey(),
      child: Chip(
        backgroundColor: Colors.grey.withOpacity(0.3),
        label: Text(
          widget.tagText,
          style: TextStyle(
              color: Colors.blue.withOpacity(0.7),
              fontSize: 13,
              fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal
          ),
        ),
      ),
      onTap: () {
        widget.onClickListener(widget.tagText);
      },
    );
  }
}
