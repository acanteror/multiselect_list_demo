import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiselect_list_demo/features/users/domain/bloc/users_cubit.dart';
import 'package:multiselect_list_demo/ui/users/widgets/user_list_item.dart';

class UsersList extends StatelessWidget {
  const UsersList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        if (state.users.isEmpty) {
          context.read<UsersCubit>().getUsers();
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: state.users.length,
          itemBuilder: (BuildContext context, int index) {
            return UserListItem(user: state.users[index]);
          },
        );
      },
    );
  }
}
