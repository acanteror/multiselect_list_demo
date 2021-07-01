import 'package:multiselect_list_demo/features/users/domain/entities/user.dart';

abstract class UsersRepository {
  Future<List<User>> getUsers();
}
