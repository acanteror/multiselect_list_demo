import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiselect_list_demo/features/users/domain/bloc/users_cubit.dart';

class MyBlocProvider extends StatelessWidget {
  final Widget child;

  const MyBlocProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => UsersCubit(),
      child: child,
    );
  }
}
