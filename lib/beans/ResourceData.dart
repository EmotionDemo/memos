import 'package:flutter/material.dart';

class Resource {
  var id;
  var createdTs;
  var creatorId;
  var filename;
  var size;
  var type;
  var updatedTs;
  String? externalLink;
  String? publicId;

  Resource(
      {required var id,
      required var createdTs,
      required var creatorId,
      required var filename,
      required var size,
      required var type,
      required var updatedTs,
      required String? externalLink,
      required String? publicId});

  Uri toUri(String host) {
    if (externalLink != null && externalLink != null) {
      return Uri.parse(externalLink!);
    }
    if (publicId != null && publicId!.isNotEmpty) {
      return Uri.parse(host).resolve("o/r/${id.toString()}/publicId");
    }
    return Uri.parse(host).resolve("o/r/${id.toString()}/filename");
  }


}
