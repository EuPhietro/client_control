import 'package:flutter/material.dart';
import '../models/category_model.dart';

class CategoryRepository extends ChangeNotifier {
  static final CategoryRepository _categoryRepository = CategoryRepository._();

  CategoryRepository._();

  factory CategoryRepository() {
    return _categoryRepository;
  }

  List<CategoryModel> store = [
    CategoryModel(name: "Tecnologia", iconData: Icons.computer),
    CategoryModel(name: "Finanças", iconData: Icons.attach_money),
    CategoryModel(name: "Saúde", iconData: Icons.favorite),
    CategoryModel(name: "Educação", iconData: Icons.school),
    CategoryModel(name: "Entretenimento", iconData: Icons.movie),
    CategoryModel(name: "Esportes", iconData: Icons.sports_soccer),
    CategoryModel(name: "Viagem", iconData: Icons.flight),
    CategoryModel(name: "Alimentação", iconData: Icons.fastfood),
    CategoryModel(name: "Negócios", iconData: Icons.business),
    CategoryModel(name: "Casa", iconData: Icons.home),
  ];

  int legth() {
    return store.length;
  }

  void add(CategoryModel value) {
    try {
      store.add(value);
      notifyListeners();
    } catch (e) {
      e.toString();
    }
  }

  void remove(CategoryModel value) {
    try {
      store.remove(value);
      notifyListeners();
    } catch (e) {
      e.toString();
    }
  }

  CategoryModel? findByName([String? name]) {
    CategoryModel? category;
    try {
      assert(name != null);
      category = store.firstWhere(
        (value) => value.name == name,
        orElse: () => CategoryModel(name: "Categoria não encontrada"),
      );
      notifyListeners();
    } catch (e) {
      e.toString();
    }
    return category;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};

    for (CategoryModel value in store) {
      map.addAll(value.toMap());
    }

    return map;
  }
}
