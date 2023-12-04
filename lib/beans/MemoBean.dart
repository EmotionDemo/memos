//******************************************************************
//**************************** Generate By JsonToDartBean  **********
//**************************** Wed May 31 20:50:12 CST 2023  **********
//******************************************************************

import 'package:json_holder_impl/json_holder_impl.dart';

class MemoBean with JsonHolderImpl<MemoBean> {
  /// [key : value] => [data : null]
  DataBean get data => getValue("data");
  set data(DataBean value) => setValue("data", value);

  MemoBean.fromJson([Map<String, dynamic>? json]) {
    fromJson(json);
    DataBean.fromJson();
  }

  @override
  JsonHolderImpl<MemoBean> provideCreator(Map<String, dynamic> json) {
    return MemoBean.fromJson(json);
  }

  @override
  List<MemoBean> provideListCreator() {
    return <MemoBean>[];
  }

  @override
  List<List<MemoBean>> provideListListCreator() {
    return <List<MemoBean>>[];
  }

}

class DataBean with JsonHolderImpl<DataBean> {
  /// [key : value] => [id : 255]
  int get id => getValue("id");
  set id(int value) => setValue("id", value);

  /// [key : value] => [rowStatus : NORMAL]
  String get rowStatus => getValue("rowStatus");
  set rowStatus(String value) => setValue("rowStatus", value);

  /// [key : value] => [creatorId : 1]
  int get creatorId => getValue("creatorId");
  set creatorId(int value) => setValue("creatorId", value);

  /// [key : value] => [createdTs : 1685537329]
  int get createdTs => getValue("createdTs");
  set createdTs(int value) => setValue("createdTs", value);

  /// [key : value] => [updatedTs : 1685537329]
  int get updatedTs => getValue("updatedTs");
  set updatedTs(int value) => setValue("updatedTs", value);

  /// [key : value] => [content : 哈哈哈]
  String get content => getValue("content");
  set content(String value) => setValue("content", value);

  /// [key : value] => [visibility : PUBLIC]
  String get visibility => getValue("visibility");
  set visibility(String value) => setValue("visibility", value);

  /// [key : value] => [pinned : false]
  bool get pinned => getValue("pinned");
  set pinned(bool value) => setValue("pinned", value);

  /// [key : value] => [creatorName : lifenghua]
  String get creatorName => getValue("creatorName");
  set creatorName(String value) => setValue("creatorName", value);

  /// [key : value] => [resourceList : null]
  List get resourceList => getValue("resourceList");
  set resourceList(List value) => setValue("resourceList", value);

  DataBean.fromJson([Map<String, dynamic>? json]) {
  fromJson(json);
  }

  @override
  JsonHolderImpl<DataBean> provideCreator(Map<String, dynamic> json) {
  return DataBean.fromJson(json);
  }

  @override
  List<DataBean> provideListCreator() {
  return <DataBean>[];
  }

  @override
  List<List<DataBean>> provideListListCreator() {
  return <List<DataBean>>[];
  }

}

