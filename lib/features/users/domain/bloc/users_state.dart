part of 'users_cubit.dart';

@immutable
class UsersState extends Equatable {
  final List<User> users;
  UsersState({required this.users});

  UsersState copyWith({
    List<User>? users,
  }) {
    if ((users == null || identical(users, this.users))) {
      return this;
    }

    return UsersState(
      users: users,
    );
  }

  @override
  List<Object> get props => [users];
}
