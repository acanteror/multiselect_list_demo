import 'package:flutter_test/flutter_test.dart';
import 'package:multiselect_list_demo/features/users/domain/entities/user.dart';

final User tUnselectedUser = User(
  id: 'id',
  name: 'name',
  lastName: 'lastName',
  gender: Gender.male,
);

final User tSelectedUser = User(
    id: 'id',
    name: 'name',
    lastName: 'lastName',
    gender: Gender.male,
    selected: true);

void main() {
  group('user', () {
    test(
      'equal',
      () async {
        final User _selectedUser = tUnselectedUser.copyWith();

        expect(_selectedUser, tUnselectedUser);
      },
    );

    test(
      'copyWith',
      () async {
        final User _selectedUser = tUnselectedUser.copyWith(selected: true);

        expect(_selectedUser, tSelectedUser);
      },
    );
  });
}
