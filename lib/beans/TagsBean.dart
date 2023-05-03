

import 'package:json_holder_impl/json_holder_impl.dart';

class TagsBean with JsonHolderImpl<TagsBean> {
  /// [key : value] => [data : null]
  List<String> get data => getValue("data");
  set data(List<String> value) => setValue("data", value);

  TagsBean.fromJson([Map<String, dynamic>? json]) {
    fromJson(json);
  }

  @override
  JsonHolderImpl<TagsBean> provideCreator(Map<String, dynamic> json) {
    return TagsBean.fromJson(json);
  }

  @override
  List<TagsBean> provideListCreator() {
    return <TagsBean>[];
  }

  @override
  List<List<TagsBean>> provideListListCreator() {
    return <List<TagsBean>>[];
  }

}

