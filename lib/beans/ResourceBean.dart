//******************************************************************
//**************************** Generate By JsonToDartBean  **********
//**************************** Mon Dec 04 14:07:43 CST 2023  **********
//******************************************************************

import 'package:json_holder_impl/json_holder_impl.dart';

class ResourceBean with JsonHolderImpl<ResourceBean> {
  /// [key : value] => [data : null]
  List<DataBean> get data => getValue("data");
  set data(List<DataBean> value) => setValue("data", value);

  ResourceBean.fromJson([Map<String, dynamic>? json]) {
    fromJson(json);
    DataBean.fromJson();
  }

  @override
  JsonHolderImpl<ResourceBean> provideCreator(Map<String, dynamic> json) {
    return ResourceBean.fromJson(json);
  }

  @override
  List<ResourceBean> provideListCreator() {
    return <ResourceBean>[];
  }

  @override
  List<List<ResourceBean>> provideListListCreator() {
    return <List<ResourceBean>>[];
  }

}

class DataBean with JsonHolderImpl<DataBean> {
  /// [key : value] => [id : 100]
  int get id => getValue("id");
  set id(int value) => setValue("id", value);

  /// [key : value] => [creatorId : 1]
  int get creatorId => getValue("creatorId");
  set creatorId(int value) => setValue("creatorId", value);

  /// [key : value] => [createdTs : 1701249594]
  int get createdTs => getValue("createdTs");
  set createdTs(int value) => setValue("createdTs", value);

  /// [key : value] => [updatedTs : 1701249594]
  int get updatedTs => getValue("updatedTs");
  set updatedTs(int value) => setValue("updatedTs", value);

  /// [key : value] => [filename : image.png]
  String get filename => getValue("filename");
  set filename(String value) => setValue("filename", value);

  /// [key : value] => [externalLink : ]
  String get externalLink => getValue("externalLink");
  set externalLink(String value) => setValue("externalLink", value);

  /// [key : value] => [type : image/png]
  String get type => getValue("type");
  set type(String value) => setValue("type", value);

  /// [key : value] => [size : 45479]
  int get size => getValue("size");
  set size(int value) => setValue("size", value);

  /// [key : value] => [linkedMemoAmount : 0]
  int get linkedMemoAmount => getValue("linkedMemoAmount");
  set linkedMemoAmount(int value) => setValue("linkedMemoAmount", value);

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

