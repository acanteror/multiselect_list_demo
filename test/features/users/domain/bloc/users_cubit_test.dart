import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiselect_list_demo/features/users/domain/bloc/users_cubit.dart';
import 'package:multiselect_list_demo/features/users/domain/entities/user.dart';
import 'package:multiselect_list_demo/features/users/domain/repositories/users_repository.dart';

class MockUsersCubit extends MockBloc<UsersCubit, UsersState>
    implements UsersCubit {}

class MockUsersRepository extends Mock implements UsersRepository {}

class UsersCubitFake extends Fake implements UsersCubit {}

class UsersStateFake extends Fake implements UsersState {}

void main() {
  late UsersRepository usersRepository;
  late UsersCubit usersCubit;

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    usersRepository = MockUsersRepository();
    usersCubit = UsersCubit(userRepository: usersRepository);
  });

  setUpAll(() {
    registerFallbackValue<UsersCubit>(UsersCubitFake());
    registerFallbackValue<UsersState>(UsersStateFake());
  });

  tearDown(() {
    usersCubit.close();
  });

  final tUser = User(
    id: 'id',
    name: 'name',
    lastName: 'lastName',
    gender: Gender.male,
    selected: false,
  );
  final UsersState tUsersInitial = UsersState(users: []);
  final UsersState tUsersLoaded = UsersState(users: [tUser]);

  group('whenListen', () {
    test("Let's mock the RaeBloc's stream!", () {
      // Create Mock RaeBloc Instance
      final _mockedBloc = MockUsersCubit();

      // Stub the listen with a fake Stream
      whenListen(
          _mockedBloc, Stream.fromIterable([tUsersInitial, tUsersLoaded]));

      // Expect that the RaeState instance emitted the stubbed Stream of
      // states
      expectLater(_mockedBloc.stream,
          emitsInOrder(<UsersState>[tUsersInitial, tUsersLoaded]));
    });
  });

  group('raeBlocTest', () {
    blocTest<UsersCubit, UsersState>(
      'emits [] when nothing is added',
      build: () => usersCubit,
      expect: () => [],
    );

    test('has a correct initialState', () {
      expect(usersCubit.state, tUsersInitial);
    });

    blocTest<UsersCubit, UsersState>(
      'emits [tRaeLoading, tRaeSuccess] when RaeSubmit event is added and service returns correct description',
      build: () {
        when(() => usersRepository.getUsers()).thenAnswer((_) async => [tUser]);
        return usersCubit;
      },
      act: (bloc) async => bloc.getUsers(),
      expect: () => <UsersState>[tUsersLoaded],
    );
  });
}
