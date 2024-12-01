import 'package:split_bill/core/errors/exeptions.dart';
import 'package:split_bill/core/models/user_model.dart';

abstract class UserDataSource {
  Future<List<UserModel>> fetchUsersData();
}

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<UserModel>> fetchUsersData() async {
    try {
      await Future.delayed(const Duration(microseconds: 100));

      final List<UserModel> mockUsers = [
        UserModel(
          id: 1,
          userName: 'johndoe',
          fullName: 'John Doe',
          photo: 'https://example.com/johndoe.jpg',
          password: 'password123',
        ),
        UserModel(
          id: 2,
          userName: 'janedoe',
          fullName: 'Jane Doe',
          photo: 'https://example.com/janedoe.jpg',
          password: 'securepass456',
        ),
        UserModel(
          id: 3,
          userName: 'alexsmith',
          fullName: 'Alex Smith',
          photo: 'https://example.com/alexsmith.jpg',
          password: 'testpassword789',
        ),
      ];

      return mockUsers;
    } catch (e) {
      throw ServerExeption(message: "Time out");
    }
  }
}
