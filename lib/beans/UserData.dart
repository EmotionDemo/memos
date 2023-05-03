import 'dart:core';

import 'package:json_holder_impl/json_holder_impl.dart';

class UserData with JsonHolderImpl<UserData>{
  String userName;
  String nickName;
  String email;
  String role;
  String avatarUrl;
  String rowStatus;

  UserData(
      {required this.userName,
      required this.nickName,
      required this.email,
      required this.role,
      required this.avatarUrl,
      required this.rowStatus});

  @override
  JsonHolderImpl<UserData> provideCreator(Map<String, dynamic> json) {
    // TODO: implement provideCreator
    throw UnimplementedError();
  }

  @override
  List provideListCreator() {
    // TODO: implement provideListCreator
    throw UnimplementedError();
  }

  @override
  List provideListListCreator() {
    // TODO: implement provideListListCreator
    throw UnimplementedError();
  }


}
