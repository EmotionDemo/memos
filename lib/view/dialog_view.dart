import 'package:flutter/material.dart';
import 'package:memos/view/Button.dart';

typedef OnDeleteCallback = void Function(bool isDelete);

class DialogView {
  static Future<void> alertDialog(
      BuildContext context,
      String title,
      List<String> operas,
      String content,
      Color operateColor,
      OnDeleteCallback onDeleteCallback) async {
    var result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17.0),
            ),
            title: Text(
              title,
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
            content: Text(
              content,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
            elevation: 0.0,
            actions: [
              Row(
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      onDeleteCallback(true);
                      Navigator.pop(context, "ok");
                    },
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        width: 100,
                        height: 40,
                        color: operateColor,
                        alignment: Alignment.center,
                        child: Text(
                          operas[0],
                          style: const TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      onDeleteCallback(false);
                      Navigator.pop(context);
                    },
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        width: 100,
                        height: 40,
                        color: Colors.black12,
                        alignment: Alignment.center,
                        child: Text(
                          operas[1],
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          );
        });
    return result;
  }

  ///显示等待框
  static Future<void> waitDialog(BuildContext context) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            elevation: 0,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              height: 100,
              padding: const EdgeInsets.only(left: 10, right: 10),
              alignment: Alignment.center,
              child: const LinearProgressIndicator(),
            ),
          );
        });
  }
}
