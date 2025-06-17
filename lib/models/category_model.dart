import 'package:flutter/material.dart';
import 'dart:convert';

class CategoryModel {
  final String name;
  final IconData iconData;
  final DateTime createdAt;

  CategoryModel({required this.name, IconData? iconData, DateTime? createdAt})
    : createdAt = createdAt ?? DateTime.now(),
      iconData = iconData ?? IconData(Icons.file_open.codePoint);

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: map["name"],
      iconData: map["iconData"],
      createdAt: map["createdAt"],
    );
  }

  factory CategoryModel.fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    return CategoryModel(
      name: map["name"],
      iconData: map["iconData"],
      createdAt: map["createdAt"],
    );
  }

  Map<String, dynamic> toMap() {
    return {"name": name, "iconData": iconData, "createdAt": createdAt};
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  @override
  String toString() =>
      "name: $name, iconData: $iconData, createdAt: $createdAt";

  @override
  bool operator ==(Object other) {
    return super.hashCode == other.hashCode;
  }
}
