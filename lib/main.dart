import 'package:colorize_lumberdash/colorize_lumberdash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:multiselect_list_demo/di/my_bloc_provider.dart';
import 'package:multiselect_list_demo/ui/users/pages/users_page.dart';

import 'debug/my_bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  putLumberdashToWork(withClients: [ColorizeLumberdash()]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Multiselect Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyBlocProvider(
        child: UsersPage(),
      ),
    );
  }
}
