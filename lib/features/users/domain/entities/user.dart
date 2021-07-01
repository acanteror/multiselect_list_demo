import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String lastName;
  final Gender gender;
  final bool selected;

  const User(
      {required this.id,
      required this.name,
      required this.lastName,
      required this.gender,
      this.selected = false});

  User copyWith({
    String? name,
    String? lastName,
    Gender? gender,
    bool? selected,
  }) {
    if ((name == null || identical(name, this.name)) &&
        (lastName == null || identical(lastName, this.lastName)) &&
        (gender == null || identical(gender, this.gender)) &&
        (selected == null || identical(selected, this.selected))) {
      return this;
    }

    return new User(
      id: this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      selected: selected ?? this.selected,
    );
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, lastName: $lastName, gender: $gender, selected: $selected}';
  }

  @override
  List<Object> get props => [id, name, lastName, gender, selected];
}

enum Gender {
  male,
  female,
}
