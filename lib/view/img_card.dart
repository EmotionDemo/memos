import 'dart:io';

import 'package:flutter/material.dart';

import 'dialog_view.dart';

class ImageCard extends StatefulWidget {
  const ImageCard({Key? key, required this.imagePath, required this.onDelete}) : super(key: key);
   final String imagePath;
   final VoidCallback onDelete;
  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      shadowColor: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(fit: StackFit.expand, children: [
        Image.file(
          File(widget.imagePath),
          fit: BoxFit.cover,
        ),
        Positioned(
            right: 10,
            bottom: 5,
            child: InkWell(
              onTap: () {
                DialogView.alertDialog(
                    context, "确认删除", ["删除", "取消"], '确定要移除该资源吗?', Colors.red,
                    (isDelete) {
                  if (isDelete) {
                    setState(() {
                      widget.onDelete();
                    });
                  }
                });
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.black38.withOpacity(0.4),
                    border: Border.all(color: Colors.white,width: 0.2),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: const Icon(
                  Icons.delete_outline,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            )),
      ]),
    );
  }
}
