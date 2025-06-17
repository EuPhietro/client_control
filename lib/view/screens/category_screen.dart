import 'package:clientes_manager/repository/category_repository.dart';

import 'package:clientes_manager/view/screens/category_create.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clientes_manager/view/components/drawer.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          title: Text("Categoria", style: TextStyle(color: Colors.white)),
        ),
        body: Consumer<CategoryRepository>(
          builder:
              (
                BuildContext context,
                CategoryRepository categoryRepository,
                Widget? chil,
              ) {
                return ListView.builder(
                  itemCount: categoryRepository.legth(),
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      background: ClipRRect(
                        child: Container(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          color: Colors.red,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.delete),
                          ),
                        ),
                      ),
                      key: ValueKey(categoryRepository.store[index].name),
                      child: ListTile(
                        title: Text(categoryRepository.store[index].name),
                        subtitle: Text(
                          categoryRepository.store[index].createdAt.toString(),
                        ),
                        leading: Icon(categoryRepository.store[index].iconData),
                      ),
                    );
                  },
                );
              },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(
            context,
          ).floatingActionButtonTheme.backgroundColor,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => CategoryCreate(),
              ),
            );
          },
          tooltip: 'Criar Categoria',
          child: Icon(Icons.add, color: Theme.of(context).iconTheme.color),
        ),
      ),
    );
  }
}
