import 'package:clientes_manager/models/category_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:clientes_manager/models/client_model.dart';

class ClientRepository extends ChangeNotifier {
  static final _instance = ClientRepository._();
  final List<ClientModel> _store = [
    ClientModel(
      name: "Empresa A",
      cnpj: "00.000.000/0001-00",
      category: CategoryModel(name: "Tecnologia", iconData: Icons.computer),
    ),
    ClientModel(
      name: "Empresa B",
      cnpj: "11.111.111/0001-11",
      category: CategoryModel(name: "Tecnologia", iconData: Icons.computer),
    ),
    ClientModel(
      name: "Empresa C",
      cnpj: "22.222.222/0001-22",
      category: CategoryModel(name: "Tecnologia", iconData: Icons.computer),
      status: "inativo",
    ),
    ClientModel(
      name: "Empresa D",
      cnpj: "33.333.333/0001-33",
      category: CategoryModel(name: "Tecnologia", iconData: Icons.computer),
      createdAt: DateTime(2023, 5, 10),
    ),
  ];

  List<ClientModel> get store => _store;

  ClientRepository._();

  factory ClientRepository() {
    return _instance;
  }

  void add({required ClientModel value}) {
    try {
      _store.add(value);
      notifyListeners();
    } catch (e) {
      e.toString();
    }
  }

  void remove({required ClientModel value}) {
    try {
      _store.remove(value);
      notifyListeners();
    } catch (e) {
      e.toString();
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};

    for (ClientModel value in _store) {
      map.addAll(value.toMap());
    }

    return map;
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
