
import 'package:json_holder_impl/json_holder_impl.dart';

class MemosBean with JsonHolderImpl<MemosBean> {
  /// [key : value] => [data : null]
  List<DataBean> get data => getValue("data");
  set data(List<DataBean> value) => setValue("data", value);

  MemosBean.fromJson([Map<String, dynamic>? json]) {
    fromJson(json);
    DataBean.fromJson();
  }

  @override
  JsonHolderImpl<MemosBean> provideCreator(Map<String, dynamic> json) {
    return MemosBean.fromJson(json);
  }

  @override
  List<MemosBean> provideListCreator() {
    return <MemosBean>[];
  }

  @override
  List<List<MemosBean>> provideListListCreator() {
    return <List<MemosBean>>[];
  }

}

class DataBean with JsonHolderImpl<DataBean> {
  /// [key : value] => [id : 61]
  int get id => getValue("id");
  set id(int value) => setValue("id", value);

  /// [key : value] => [rowStatus : NORMAL]
  String get rowStatus => getValue("rowStatus");
  set rowStatus(String value) => setValue("rowStatus", value);

  /// [key : value] => [creatorId : 1]
  int get creatorId => getValue("creatorId");
  set creatorId(int value) => setValue("creatorId", value);

  /// [key : value] => [createdTs : 1683190771]
  int get createdTs => getValue("createdTs");
  set createdTs(int value) => setValue("createdTs", value);

  /// [key : value] => [updatedTs : 1683192021]
  int get updatedTs => getValue("updatedTs");
  set updatedTs(int value) => setValue("updatedTs", value);

  /// [key : value] => [content : #CODE
  String get content => getValue("content");
  set content(String value) => setValue("content", value);

  /// [key : value] => [visibility : PROTECTED]
  String get visibility => getValue("visibility");
  set visibility(String value) => setValue("visibility", value);

  /// [key : value] => [pinned : false]
  bool get pinned => getValue("pinned");
  set pinned(bool value) => setValue("pinned", value);

  /// [key : value] => [creatorName : lifenghua]
  String get creatorName => getValue("creatorName");
  set creatorName(String value) => setValue("creatorName", value);

  /// [key : value] => [resourceList : null]
  List<ResourceListBean> get resourceList => getValue("resourceList");
  set resourceList(List<ResourceListBean> value) => setValue("resourceList", value);

  DataBean.fromJson([Map<String, dynamic>? json]) {
    fromJson(json);
    ResourceListBean.fromJson();
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

class ResourceListBean with JsonHolderImpl<ResourceListBean> {
  /// [key : value] => [id : 23]
  int get id => getValue("id");
  set id(int value) => setValue("id", value);

  /// [key : value] => [creatorId : 1]
  int get creatorId => getValue("creatorId");
  set creatorId(int value) => setValue("creatorId", value);

  /// [key : value] => [createdTs : 1683190971]
  int get createdTs => getValue("createdTs");
  set createdTs(int value) => setValue("createdTs", value);

  /// [key : value] => [updatedTs : 1683192021]
  int get updatedTs => getValue("updatedTs");
  set updatedTs(int value) => setValue("updatedTs", value);

  /// [key : value] => [filename : aaa.gif]
  String get filename => getValue("filename");
  set filename(String value) => setValue("filename", value);

  /// [key : value] => [externalLink : ]
  String get externalLink => getValue("externalLink");
  set externalLink(String value) => setValue("externalLink", value);

  /// [key : value] => [type : image/gif]
  String get type => getValue("type");
  set type(String value) => setValue("type", value);

  /// [key : value] => [size : 170647]
  int get size => getValue("size");
  set size(int value) => setValue("size", value);

  /// [key : value] => [linkedMemoAmount : 0]
  int get linkedMemoAmount => getValue("linkedMemoAmount");
  set linkedMemoAmount(int value) => setValue("linkedMemoAmount", value);

  ResourceListBean.fromJson([Map<String, dynamic>? json]) {
    fromJson(json);
  }

  @override
  JsonHolderImpl<ResourceListBean> provideCreator(Map<String, dynamic> json) {
    return ResourceListBean.fromJson(json);
  }

  @override
  List<ResourceListBean> provideListCreator() {
    return <ResourceListBean>[];
  }

  @override
  List<List<ResourceListBean>> provideListListCreator() {
    return <List<ResourceListBean>>[];
  }

}

