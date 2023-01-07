//     final getsearchsResponse = getsearchsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:talkgpt/src/models/search_output.dart';


class searchResponse {
  searchResponse({
    this.success = false,
    this.message,
    this.statusCode,
    this.searchList,
  });

  bool success = false;
  int? statusCode;
  String? message;
  List<search>? searchList;

  bool get isSuccess => this.success;

  searchResponse.withError({
    int? statusCode,
    bool success = false,
    String? msg,
  })  : this.statusCode = statusCode,
        this.success = success,
        this.message = msg;

  factory searchResponse.fromRawJson(String str) =>
      searchResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory searchResponse.fromJson(Map<String, dynamic> json) =>
      searchResponse(
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        message: json["message"] == null ? null : json["message"],
        success: json["success"] == null ? null : json["success"],
        searchList: json["search_list"] == null
            ? null
            : List<search>.from(
                json["search_list"].map((x) => search.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "statusCode": statusCode == null ? null : statusCode,
        "success": success == null ? null : success,
        "search_list": searchList == null
            ? null
            : List<dynamic>.from(searchList!.map((x) => x.toJson())),
      };
}
