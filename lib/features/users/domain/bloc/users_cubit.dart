import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:multiselect_list_demo/features/users/domain/entities/user.dart';
import 'package:multiselect_list_demo/features/users/domain/repositories/users_repository.dart';
import 'package:multiselect_list_demo/features/users/infraestructure/repositories/fake_users_repository.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UsersRepository userRepository;
  UsersCubit({UsersRepository? userRepository})
      : userRepository = userRepository ?? FakeUsersRepository(),
        super(UsersState(users: []));

  Future<void> getUsers() async {
    List<User> _users = await userRepository.getUsers();
    emit(state.copyWith(users: _users));
  }

  void selectDeselectUser(String id) {
    final List<User> _currentList = state.users;
    _currentList.forEach(
      (user) {
        if (user.id == id) {
          final User _updatedUser = user.copyWith(selected: !user.selected);
          final int userIndex = _currentList.indexOf(user);
          _currentList[userIndex] = _updatedUser;
        }
      },
    );
    print(_currentList);
    emit(state.copyWith(users: _currentList));
  }
}
