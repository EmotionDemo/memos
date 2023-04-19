import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memos/utils/ScreenUtil.dart';

class ResourcePage extends StatefulWidget {
  const ResourcePage({Key? key}) : super(key: key);

  @override
  State<ResourcePage> createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  List<Widget> list = [];
  var screenWidth = ScreenUtil.hc_ScreenWidth();
  var screenHeight = ScreenUtil.hc_ScreenHeight();

  List<Widget> getResources() {
     list.add(Card(
       // margin:const EdgeInsets.all(3),
       clipBehavior: Clip.antiAlias,
       color: Colors.white,
       shadowColor: Colors.grey.withOpacity(0.6),
       elevation: 1,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(10),
       ),
       child: Column(
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 margin: EdgeInsets.only(left: 10, top: 10),
                 child: Image.asset(
                   "images/ic_desc_pho.png",
                   width: ScreenUtil.hc_ScreenWidth() / 4,
                   height: ScreenUtil.hc_ScreenWidth() / 4,
                 ),
               ),
               Container(
                 alignment: Alignment.topRight,
                 child: InkWell(
                   child: Icon(
                     Icons.more_horiz,
                     size: 30,
                     color: Colors.black45,
                   ),
                 ),
                 margin: EdgeInsets.only(top: 10, right: 10),
               )
             ],
           ),
           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.only(left: 10,top: 6),
             child: Text('image/png',
                 style:
                 TextStyle(color: Colors.black54, fontSize: 18,fontWeight: FontWeight.w500
                 )),
           ),
           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.only(left: 10,top: 6),
             child: Text('size: 0.9MB',style: TextStyle(color: Colors.grey),),
           ),
         ],
       ),
     ));
     list.add(Card(
       // margin:const EdgeInsets.all(3),
       clipBehavior: Clip.antiAlias,
       color: Colors.white,
       shadowColor: Colors.grey.withOpacity(0.6),
       elevation: 1,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(10),
       ),
       child: Column(
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 margin: EdgeInsets.only(left: 10, top: 10),
                 child: Image.asset(
                   "images/ic_desc_pho.png",
                   width: ScreenUtil.hc_ScreenWidth() / 4,
                   height: ScreenUtil.hc_ScreenWidth() / 4,
                 ),
               ),
               Container(
                 alignment: Alignment.topRight,
                 child: InkWell(
                   child: Icon(
                     Icons.more_horiz,
                     size: 30,
                     color: Colors.black45,
                   ),
                 ),
                 margin: EdgeInsets.only(top: 10, right: 10),
               )
             ],
           ),
           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.only(left: 10,top: 6),
             child: Text('image/jpeg',
                 style:
                 TextStyle(color: Colors.black54, fontSize: 18,fontWeight: FontWeight.w500
                 )),
           ),
           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.only(left: 10,top: 6),
             child: Text('size: 1.9MB',style: TextStyle(color: Colors.grey),),
           ),
         ],
       ),
     ));
     list.add(Card(
       // margin:const EdgeInsets.all(3),
       clipBehavior: Clip.antiAlias,
       color: Colors.white,
       shadowColor: Colors.grey.withOpacity(0.6),
       elevation: 1,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(10),
       ),
       child: Column(
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 margin: EdgeInsets.only(left: 10, top: 10),
                 child: Image.asset(
                   "images/ic_desc_video.png",
                   width: ScreenUtil.hc_ScreenWidth() / 4,
                   height: ScreenUtil.hc_ScreenWidth() / 4,
                 ),
               ),
               Container(
                 alignment: Alignment.topRight,
                 child: InkWell(
                   child: Icon(
                     Icons.more_horiz,
                     size: 30,
                     color: Colors.black45,
                   ),
                 ),
                 margin: EdgeInsets.only(top: 10, right: 10),
               )
             ],
           ),
           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.only(left: 10,top: 6),
             child: Text('video/mp4',
                 style:
                 TextStyle(color: Colors.black54, fontSize: 18,fontWeight: FontWeight.w500
                 )),
           ),
           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.only(left: 10,top: 6),
             child: Text('size: 11.9MB',style: TextStyle(color: Colors.grey),),
           ),
         ],
       ),
     ));
     list.add(Card(
       // margin:const EdgeInsets.all(3),
       clipBehavior: Clip.antiAlias,
       color: Colors.white,
       shadowColor: Colors.grey.withOpacity(0.6),
       elevation: 1,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(10),
       ),
       child: Column(
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 margin: EdgeInsets.only(left: 10, top: 10),
                 child: Image.asset(
                   "images/ic_desc_music.png",
                   width: ScreenUtil.hc_ScreenWidth() / 4,
                   height: ScreenUtil.hc_ScreenWidth() / 4,
                 ),
               ),
               Container(
                 alignment: Alignment.topRight,
                 child: InkWell(
                   child: Icon(
                     Icons.more_horiz,
                     size: 30,
                     color: Colors.black45,
                   ),
                 ),
                 margin: EdgeInsets.only(top: 10, right: 10),
               )
             ],
           ),
           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.only(left: 10,top: 6),
             child: Text('audio/mpeg',
                 style:
                 TextStyle(color: Colors.black54, fontSize: 18,fontWeight: FontWeight.w500
                 )),
           ),
           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.only(left: 10,top: 6),
             child: Text('size: 3.9MB',style: TextStyle(color: Colors.grey),),
           ),
         ],
       ),
     ));
     list.add(Card(
       // margin:const EdgeInsets.all(3),
       clipBehavior: Clip.antiAlias,
       color: Colors.white,
       shadowColor: Colors.grey.withOpacity(0.6),
       elevation: 1,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(10),
       ),
       child: Column(
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 margin: EdgeInsets.only(left: 10, top: 10),
                 child: Image.asset(
                   "images/ic_desc_pho.png",
                   width: ScreenUtil.hc_ScreenWidth() / 4,
                   height: ScreenUtil.hc_ScreenWidth() / 4,
                 ),
               ),
               Container(
                 alignment: Alignment.topRight,
                 child: InkWell(
                   child: Icon(
                     Icons.more_horiz,
                     size: 30,
                     color: Colors.black45,
                   ),
                 ),
                 margin: EdgeInsets.only(top: 10, right: 10),
               )
             ],
           ),
           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.only(left: 10,top: 6),
             child: Text('image/jpeg',
                 style:
                 TextStyle(color: Colors.black54, fontSize: 18,fontWeight: FontWeight.w500
                 )),
           ),
           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.only(left: 10,top: 6),
             child: Text('size: 0.9MB',style: TextStyle(color: Colors.grey),),
           ),
         ],
       ),
     ));
     list.add(Card(
       // margin:const EdgeInsets.all(3),
       clipBehavior: Clip.antiAlias,
       color: Colors.white,
       shadowColor: Colors.grey.withOpacity(0.6),
       elevation: 1,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(10),
       ),
       child: Column(
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 margin: EdgeInsets.only(left: 10, top: 10),
                 child: Image.asset(
                   "images/ic_desc_pho.png",
                   width: ScreenUtil.hc_ScreenWidth() / 4,
                   height: ScreenUtil.hc_ScreenWidth() / 4,
                 ),
               ),
               Container(
                 alignment: Alignment.topRight,
                 child: InkWell(
                   child: Icon(
                     Icons.more_horiz,
                     size: 30,
                     color: Colors.black45,
                   ),
                 ),
                 margin: EdgeInsets.only(top: 10, right: 10),
               )
             ],
           ),
           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.only(left: 10,top: 6),
             child: Text('image/png',
                 style:
                 TextStyle(color: Colors.black54, fontSize: 18,fontWeight: FontWeight.w500
                 )),
           ),
           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.only(left: 10,top: 6),
             child: Text('size: 0.9MB',style: TextStyle(color: Colors.grey),),
           ),
         ],
       ),
     ));
     list.add(Card(
       // margin:const EdgeInsets.all(3),
       clipBehavior: Clip.antiAlias,
       color: Colors.white,
       shadowColor: Colors.grey.withOpacity(0.6),
       elevation: 1,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(10),
       ),
       child: Column(
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 margin: EdgeInsets.only(left: 10, top: 10),
                 child: Image.asset(
                   "images/ic_desc_pho.png",
                   width: ScreenUtil.hc_ScreenWidth() / 4,
                   height: ScreenUtil.hc_ScreenWidth() / 4,
                 ),
               ),
               Container(
                 alignment: Alignment.topRight,
                 child: InkWell(
                   child: Icon(
                     Icons.more_horiz,
                     size: 30,
                     color: Colors.black45,
                   ),
                 ),
                 margin: EdgeInsets.only(top: 10, right: 10),
               )
             ],
           ),
           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.only(left: 10,top: 6),
             child: Text('image/jpeg',
                 style:
                 TextStyle(color: Colors.black54, fontSize: 18,fontWeight: FontWeight.w500
                 )),
           ),
           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.only(left: 10,top: 6),
             child: Text('size: 1.9MB',style: TextStyle(color: Colors.grey),),
           ),
         ],
       ),
     ));
     list.add(Card(
       // margin:const EdgeInsets.all(3),
       clipBehavior: Clip.antiAlias,
       color: Colors.white,
       shadowColor: Colors.grey.withOpacity(0.6),
       elevation: 1,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(10),
       ),
       child: Column(
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 margin: EdgeInsets.only(left: 10, top: 10),
                 child: Image.asset(
                   "images/ic_desc_video.png",
                   width: ScreenUtil.hc_ScreenWidth() / 4,
                   height: ScreenUtil.hc_ScreenWidth() / 4,
                 ),
               ),
               Container(
                 alignment: Alignment.topRight,
                 child: InkWell(
                   child: Icon(
                     Icons.more_horiz,
                     size: 30,
                     color: Colors.black45,
                   ),
                 ),
                 margin: EdgeInsets.only(top: 10, right: 10),
               )
             ],
           ),
           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.only(left: 10,top: 6),
             child: Text('video/mp4',
                 style:
                 TextStyle(color: Colors.black54, fontSize: 18,fontWeight: FontWeight.w500
                 )),
           ),
           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.only(left: 10,top: 6),
             child: Text('size: 11.9MB',style: TextStyle(color: Colors.grey),),
           ),
         ],
       ),
     ));
     list.add(Card(
       // margin:const EdgeInsets.all(3),
       clipBehavior: Clip.antiAlias,
       color: Colors.white,
       shadowColor: Colors.grey.withOpacity(0.6),
       elevation: 1,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(10),
       ),
       child: Column(
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 margin: EdgeInsets.only(left: 10, top: 10),
                 child: Image.asset(
                   "images/ic_desc_music.png",
                   width: ScreenUtil.hc_ScreenWidth() / 4,
                   height: ScreenUtil.hc_ScreenWidth() / 4,
                 ),
               ),
               Container(
                 alignment: Alignment.topRight,
                 child: InkWell(
                   child: Icon(
                     Icons.more_horiz,
                     size: 30,
                     color: Colors.black45,
                   ),
                 ),
                 margin: EdgeInsets.only(top: 10, right: 10),
               )
             ],
           ),
           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.only(left: 10,top: 6),
             child: Text('audio/mpeg',
                 style:
                 TextStyle(color: Colors.black54, fontSize: 18,fontWeight: FontWeight.w500
                 )),
           ),
           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.only(left: 10,top: 6),
             child: Text('size: 3.9MB',style: TextStyle(color: Colors.grey),),
           ),
         ],
       ),
     ));
     list.add(Card(
       // margin:const EdgeInsets.all(3),
       clipBehavior: Clip.antiAlias,
       color: Colors.white,
       shadowColor: Colors.grey.withOpacity(0.6),
       elevation: 1,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(10),
       ),
       child: Column(
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 margin: EdgeInsets.only(left: 10, top: 10),
                 child: Image.asset(
                   "images/ic_desc_pho.png",
                   width: ScreenUtil.hc_ScreenWidth() / 4,
                   height: ScreenUtil.hc_ScreenWidth() / 4,
                 ),
               ),
               Container(
                 alignment: Alignment.topRight,
                 child: InkWell(
                   child: Icon(
                     Icons.more_horiz,
                     size: 30,
                     color: Colors.black45,
                   ),
                 ),
                 margin: EdgeInsets.only(top: 10, right: 10),
               )
             ],
           ),
           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.only(left: 10,top: 6),
             child: Text('image/jpeg',
                 style:
                 TextStyle(color: Colors.black54, fontSize: 18,fontWeight: FontWeight.w500
                 )),
           ),
           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.only(left: 10,top: 6),
             child: Text('size: 0.9MB',style: TextStyle(color: Colors.grey),),
           ),
         ],
       ),
     ));
    return list;
  }

  @override
  void initState() {
    super.initState();
    getResources();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.1),
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 5, top: 5),
                child: const Text(
                  '资源',
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 6.0,
                childAspectRatio: 1,
              ),
              itemCount: list.toList().length,
              itemBuilder: (BuildContext context, int index) {
                return list.toList()[index];
              }),
        ));
  }
}
