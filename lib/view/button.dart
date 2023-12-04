import 'dart:ffi';
import 'package:flutter/material.dart';

typedef OnClickListener = Function();

class Button extends StatefulWidget {
  Button(
      {Key? key,
      required this.onClickListener,
      required this.title,
      this.colorBg = Colors.lightBlueAccent,
      this.icon =const Icon(Icons.login,
        color: Colors.white,size: 22,)
      })
      : super(key: key);
  final OnClickListener onClickListener;
  final String title;
  Color colorBg;
  Icon icon;
  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: widget.onClickListener,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Container(
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
          color: widget.colorBg,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.icon,
            const SizedBox(width: 5),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
