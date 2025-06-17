import 'package:clientes_manager/repository/category_repository.dart';
import 'package:clientes_manager/repository/client_repository.dart';
import 'package:clientes_manager/view/screens/client_screen.dart';
import 'package:clientes_manager/view/theme/my_theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryRepository>(
          create: (context) => CategoryRepository(),
        ),
        ChangeNotifierProvider<ClientRepository>(
          create: (context) => ClientRepository(),
        ),
      ],
      builder: (context, child) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Clients Manager',
      theme: themeData,
      home: const ClientScreen(),
    );
  }
}
