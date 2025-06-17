import 'dart:convert';
import 'package:clientes_manager/models/category_model.dart';

class ClientModel {
  final String name;
  final String cnpj;
  final CategoryModel? category;
  final DateTime createdAt;
  final String status;

  ClientModel({
    required this.name,
    required this.cnpj,
    CategoryModel? category,
    DateTime? createdAt,
    String? status,
  }) : createdAt = createdAt ?? DateTime.now(),
       status = status ?? "ativo",
       category = category ?? CategoryModel(name: "Category Empty");

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      name: map["name"],
      cnpj: map["cnpj"],
      createdAt: map["createdAt"],
      status: map["status"],
    );
  }

  factory ClientModel.fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);

    return ClientModel(
      name: map["name"],
      cnpj: map["cnpj"],
      createdAt: map["createdAt"],
      status: map["status"],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "cnpj": cnpj,
      "createdAt": createdAt,
      "status": status,
    };
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  @override
  String toString() =>
      "name: $name, cnpj: $cnpj, createdAt: $createdAt, status: $status ";

  @override
  bool operator ==(Object other) {
    return super.hashCode == other.hashCode;
  }
}
