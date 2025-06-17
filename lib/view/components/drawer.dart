import 'package:clientes_manager/view/screens/category_screen.dart';
import 'package:clientes_manager/view/screens/client_screen.dart';

import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: ListView(
          children: [
            DrawerHeader(child: Center(child: Text("L O G O "))),
            Column(
              children: [
                itemDrawer(
                  context: context,
                  title: "Categorias",
                  icon: Icons.list,
                  onClicked: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => CategoryScreen()),
                  ),
                ),
              ],
            ),

            itemDrawer(
              context: context,
              title: "Clientes",
              icon: Icons.people,
              onClicked: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ClientScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemDrawer({
    required BuildContext context,
    required String title,
    required IconData icon,
    required VoidCallback onClicked,
  }) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withAlpha(100),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: BoxBorder.all(
          color: Theme.of(context).colorScheme.secondary,
          width: 2,
        ),
      ),
      child: ClipRect(
        child: ListTile(
          title: Text(title, style: TextStyle(fontSize: 18)),
          leading: Icon(icon, size: 24),
          onTap: onClicked,
        ),
      ),
    );
  }
}
