

import 'package:json_holder_impl/json_holder_impl.dart';

class MeBean with JsonHolderImpl<MeBean> {
  /// [key : value] => [data : null]
  DataBean get data => getValue("data");
  set data(DataBean value) => setValue("data", value);

  MeBean.fromJson([Map<String, dynamic>? json]) {
    fromJson(json);
    DataBean.fromJson();
  }

  @override
  JsonHolderImpl<MeBean> provideCreator(Map<String, dynamic> json) {
    return MeBean.fromJson(json);
  }

  @override
  List<MeBean> provideListCreator() {
    return <MeBean>[];
  }

  @override
  List<List<MeBean>> provideListListCreator() {
    return <List<MeBean>>[];
  }

}

class DataBean with JsonHolderImpl<DataBean> {
  /// [key : value] => [id : 1]
  int get id => getValue("id");
  set id(int value) => setValue("id", value);

  /// [key : value] => [rowStatus : NORMAL]
  String get rowStatus => getValue("rowStatus");
  set rowStatus(String value) => setValue("rowStatus", value);

  /// [key : value] => [createdTs : 1677548868]
  int get createdTs => getValue("createdTs");
  set createdTs(int value) => setValue("createdTs", value);

  /// [key : value] => [updatedTs : 1683185742]
  int get updatedTs => getValue("updatedTs");
  set updatedTs(int value) => setValue("updatedTs", value);

  /// [key : value] => [username : MingYue]
  String get username => getValue("username");
  set username(String value) => setValue("username", value);

  /// [key : value] => [role : HOST]
  String get role => getValue("role");
  set role(String value) => setValue("role", value);

  /// [key : value] => [email : a17853461844@gmail.com]
  String get email => getValue("email");
  set email(String value) => setValue("email", value);

  /// [key : value] => [nickname : lifenghua]
  String get nickname => getValue("nickname");
  set nickname(String value) => setValue("nickname", value);

  /// [key : value] => [openId : b49fbed5-6238-4706-b6e2-0669869bb8a7]
  String get openId => getValue("openId");
  set openId(String value) => setValue("openId", value);

  /// [key : value] => [avatarUrl : data:image/png;base64,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]
  String get avatarUrl => getValue("avatarUrl");
  set avatarUrl(String value) => setValue("avatarUrl", value);

  /// [key : value] => [userSettingList : null]
  List<UserSettingListBean> get userSettingList => getValue("userSettingList");
  set userSettingList(List<UserSettingListBean> value) => setValue("userSettingList", value);

  DataBean.fromJson([Map<String, dynamic>? json]) {
    fromJson(json);
    UserSettingListBean.fromJson();
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

class UserSettingListBean with JsonHolderImpl<UserSettingListBean> {
  /// [key : value] => [UserID : 1]
  int get UserID => getValue("UserID");
  set UserID(int value) => setValue("UserID", value);

  /// [key : value] => [key : appearance]
  String get key => getValue("key");
  set key(String value) => setValue("key", value);

  /// [key : value] => [value : "system"]
  String get value => getValue("value");
  set value(String value) => setValue("value", value);

  UserSettingListBean.fromJson([Map<String, dynamic>? json]) {
    fromJson(json);
  }

  @override
  JsonHolderImpl<UserSettingListBean> provideCreator(Map<String, dynamic> json) {
    return UserSettingListBean.fromJson(json);
  }

  @override
  List<UserSettingListBean> provideListCreator() {
    return <UserSettingListBean>[];
  }

  @override
  List<List<UserSettingListBean>> provideListListCreator() {
    return <List<UserSettingListBean>>[];
  }

}

