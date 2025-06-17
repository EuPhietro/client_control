import 'package:clientes_manager/repository/category_repository.dart';
import 'package:clientes_manager/repository/client_repository.dart';

import 'package:clientes_manager/view/screens/category_create.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clientes_manager/view/components/drawer.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({super.key});

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
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
          title: Text("Clientes", style: TextStyle(color: Colors.white)),
        ),
        body: Consumer<ClientRepository>(
          builder: (context, clientStore, child) {
            return ListView.builder(
              itemCount: clientStore.store.length,
              itemBuilder: (context, index) => ClipRRect(
                child: Dismissible(
                  key: ValueKey(clientStore.store[index].name),
                  background: ClipRRect(child: Container(color: Colors.red)),
                  onDismissed: (element) => clientStore.remove(
                    value: clientStore.store[element.index],
                  ),
                  child: ListTile(
                    title: Text(clientStore.store[index].name),
                    leading: clientStore.store[index].category?.iconData == null
                        ? Icon(Icons.no_accounts)
                        : Icon(clientStore.store[index].category?.iconData),
                    subtitle: Text(
                      clientStore.store[index].createdAt.toString(),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
