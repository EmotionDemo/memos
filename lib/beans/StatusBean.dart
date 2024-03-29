//******************************************************************
//**************************** Generate By JsonToDartBean  **********
//**************************** Tue May 02 12:29:33 CST 2023  **********
//******************************************************************

import 'package:json_holder_impl/json_holder_impl.dart';

class StatusBean with JsonHolderImpl<StatusBean> {
  /// [key : value] => [data : null]
  DataBean get data => getValue("data");
  set data(DataBean value) => setValue("data", value);

  StatusBean.fromJson([Map<String, dynamic>? json]) {
    fromJson(json);
    DataBean.fromJson();
  }

  @override
  JsonHolderImpl<StatusBean> provideCreator(Map<String, dynamic> json) {
    return StatusBean.fromJson(json);
  }

  @override
  List<StatusBean> provideListCreator() {
    return <StatusBean>[];
  }

  @override
  List<List<StatusBean>> provideListListCreator() {
    return <List<StatusBean>>[];
  }

}

class DataBean with JsonHolderImpl<DataBean> {
  /// [key : value] => [host : null]
  HostBean get host => getValue("host");
  set host(HostBean value) => setValue("host", value);

  /// [key : value] => [profile : null]
  ProfileBean get profile => getValue("profile");
  set profile(ProfileBean value) => setValue("profile", value);

  /// [key : value] => [dbSize : 9265152]
  int get dbSize => getValue("dbSize");
  set dbSize(int value) => setValue("dbSize", value);

  /// [key : value] => [allowSignUp : false]
  bool get allowSignUp => getValue("allowSignUp");
  set allowSignUp(bool value) => setValue("allowSignUp", value);

  /// [key : value] => [disablePublicMemos : false]
  bool get disablePublicMemos => getValue("disablePublicMemos");
  set disablePublicMemos(bool value) => setValue("disablePublicMemos", value);

  /// [key : value] => [additionalStyle : ]
  String get additionalStyle => getValue("additionalStyle");
  set additionalStyle(String value) => setValue("additionalStyle", value);

  /// [key : value] => [additionalScript : ]
  String get additionalScript => getValue("additionalScript");
  set additionalScript(String value) => setValue("additionalScript", value);

  /// [key : value] => [customizedProfile : null]
  CustomizedProfileBean get customizedProfile => getValue("customizedProfile");
  set customizedProfile(CustomizedProfileBean value) => setValue("customizedProfile", value);

  /// [key : value] => [storageServiceId : 0]
  int get storageServiceId => getValue("storageServiceId");
  set storageServiceId(int value) => setValue("storageServiceId", value);

  DataBean.fromJson([Map<String, dynamic>? json]) {
    fromJson(json);
    HostBean.fromJson();
    ProfileBean.fromJson();
    CustomizedProfileBean.fromJson();
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

class HostBean with JsonHolderImpl<HostBean> {
  /// [key : value] => [id : 1]
  int get id => getValue("id");
  set id(int value) => setValue("id", value);

  /// [key : value] => [rowStatus : NORMAL]
  String get rowStatus => getValue("rowStatus");
  set rowStatus(String value) => setValue("rowStatus", value);

  /// [key : value] => [createdTs : 1677548868]
  int get createdTs => getValue("createdTs");
  set createdTs(int value) => setValue("createdTs", value);

  /// [key : value] => [updatedTs : 1682043272]
  int get updatedTs => getValue("updatedTs");
  set updatedTs(int value) => setValue("updatedTs", value);

  /// [key : value] => [username : MingYue]
  String get username => getValue("username");
  set username(String value) => setValue("username", value);

  /// [key : value] => [role : HOST]
  String get role => getValue("role");
  set role(String value) => setValue("role", value);

  /// [key : value] => [email : ]
  String get email => getValue("email");
  set email(String value) => setValue("email", value);

  /// [key : value] => [nickname : lifenghua]
  String get nickname => getValue("nickname");
  set nickname(String value) => setValue("nickname", value);

  /// [key : value] => [openId : ]
  String get openId => getValue("openId");
  set openId(String value) => setValue("openId", value);

  /// [key : value] => [avatarUrl : data:image/gif;base64,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]
  String get avatarUrl => getValue("avatarUrl");
  set avatarUrl(String value) => setValue("avatarUrl", value);

  /// [key : value] => [userSettingList : null]
  Object get userSettingList => getValue("userSettingList");
  set userSettingList(Object value) => setValue("userSettingList", value);

  HostBean.fromJson([Map<String, dynamic>? json]) {
    fromJson(json);
  }

  @override
  JsonHolderImpl<HostBean> provideCreator(Map<String, dynamic> json) {
    return HostBean.fromJson(json);
  }

  @override
  List<HostBean> provideListCreator() {
    return <HostBean>[];
  }

  @override
  List<List<HostBean>> provideListListCreator() {
    return <List<HostBean>>[];
  }

}

class ProfileBean with JsonHolderImpl<ProfileBean> {
  /// [key : value] => [mode : prod]
  String get mode => getValue("mode");
  set mode(String value) => setValue("mode", value);

  /// [key : value] => [version : 0.11.0]
  String get version => getValue("version");
  set version(String value) => setValue("version", value);

  ProfileBean.fromJson([Map<String, dynamic>? json]) {
    fromJson(json);
  }

  @override
  JsonHolderImpl<ProfileBean> provideCreator(Map<String, dynamic> json) {
    return ProfileBean.fromJson(json);
  }

  @override
  List<ProfileBean> provideListCreator() {
    return <ProfileBean>[];
  }

  @override
  List<List<ProfileBean>> provideListListCreator() {
    return <List<ProfileBean>>[];
  }

}

class CustomizedProfileBean with JsonHolderImpl<CustomizedProfileBean> {
  /// [key : value] => [name : memos]
  String get name => getValue("name");
  set name(String value) => setValue("name", value);

  /// [key : value] => [logoUrl : ]
  String get logoUrl => getValue("logoUrl");
  set logoUrl(String value) => setValue("logoUrl", value);

  /// [key : value] => [description : ]
  String get description => getValue("description");
  set description(String value) => setValue("description", value);

  /// [key : value] => [locale : en]
  String get locale => getValue("locale");
  set locale(String value) => setValue("locale", value);

  /// [key : value] => [appearance : system]
  String get appearance => getValue("appearance");
  set appearance(String value) => setValue("appearance", value);

  /// [key : value] => [externalUrl : ]
  String get externalUrl => getValue("externalUrl");
  set externalUrl(String value) => setValue("externalUrl", value);

  CustomizedProfileBean.fromJson([Map<String, dynamic>? json]) {
    fromJson(json);
  }

  @override
  JsonHolderImpl<CustomizedProfileBean> provideCreator(Map<String, dynamic> json) {
    return CustomizedProfileBean.fromJson(json);
  }

  @override
  List<CustomizedProfileBean> provideListCreator() {
    return <CustomizedProfileBean>[];
  }

  @override
  List<List<CustomizedProfileBean>> provideListListCreator() {
    return <List<CustomizedProfileBean>>[];
  }

}

