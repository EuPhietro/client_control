import 'package:clientes_manager/models/category_model.dart';
import 'package:clientes_manager/repository/category_repository.dart';
import 'package:clientes_manager/view/components/costumer_tile.dart';
import 'package:clientes_manager/view/components/icon_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryCreate extends StatefulWidget {
  const CategoryCreate({super.key});

  @override
  State<CategoryCreate> createState() => _CategoryCreateState();
}

class _CategoryCreateState extends State<CategoryCreate> {
  TextEditingController categoryController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  IconData? selectedIcon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text(
            "Criar Categoria",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CostumerTile(
                title: categoryController.text,
                leading: selectedIcon,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    controller: categoryController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      hintText: "Categoria ",
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Insira um valor válido";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.secondary,
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    selectedIcon = await iconPicker(context);
                    setState(() {});
                  },
                  child: Text(
                    "Escolha um ícone",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  padding: EdgeInsets.all(36),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.redAccent.shade400,
                              ),
                            ),
                            child: Text(
                              "Cancelar",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate() &&
                                  selectedIcon != null) {
                                context.read<CategoryRepository>().add(
                                  CategoryModel(
                                    name: categoryController.text,
                                    iconData: selectedIcon,
                                  ),
                                );
                                Navigator.pop(context);
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.green.shade400,
                              ),
                            ),
                            child: Text(
                              "Salvar",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
