import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiselect_list_demo/features/users/domain/bloc/users_cubit.dart';
import 'package:multiselect_list_demo/features/users/domain/entities/user.dart';

class UserListItem extends StatefulWidget {
  final User user;

  const UserListItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _UserListItemState createState() => _UserListItemState();
}

class _UserListItemState extends State<UserListItem> {
  late User _user;
  @override
  void initState() {
    super.initState();
    _user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<UsersCubit>().selectDeselectUser(_user.id);

        setState(() {
          _user = _user.copyWith(selected: !_user.selected);
        });
        print('tapped ${_user.name}');
      },
      child: ListTile(
        title: Text('${_user.name} ${_user.lastName}'),
        subtitle: Text('${_user.gender.toString()}'),
        trailing: _user.selected
            ? Icon(
                Icons.check,
                color: Colors.green,
              )
            : Icon(
                Icons.close,
                color: Colors.red,
              ),
      ),
    );
  }
}
