import 'package:multiselect_list_demo/features/users/domain/entities/user.dart';

import '../../domain/repositories/users_repository.dart';

class FakeUsersRepository implements UsersRepository {
  @override
  Future<List<User>> getUsers() async {
    final List<User> _users = [];
    await Future.delayed(
      Duration(seconds: 3),
      () {
        _users.addAll([
          User(
              id: '1',
              name: 'Manolo',
              lastName: 'Castro',
              gender: Gender.male,
              selected: false),
          User(
              id: '2',
              name: 'Luisa',
              lastName: 'Perez',
              gender: Gender.female,
              selected: false),
          User(
              id: '3',
              name: 'Fernando',
              lastName: 'Romero',
              gender: Gender.male,
              selected: false),
          User(
              id: '4',
              name: 'Maria',
              lastName: 'Lillo',
              gender: Gender.female,
              selected: false),
        ]);
      },
    );
    return _users;
  }
}
