// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:split_bill/core/enums/enums.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/features/room/domain/entities/room_info_response_entity.dart';
import 'package:split_bill/features/room/domain/entities/room_info_users_response_entity.dart';
import 'package:split_bill/features/room/domain/repository/room_repository.dart';

class RoomProvider extends ChangeNotifier {
  final IRoomRepository repository;
  Failure? failure;
  Status status = Status.initial;
  RoomInfoResponseEntity? roomInfo;
  RoominfoUsersResponseEntity? userData;

  RoomProvider({required this.repository});

  Future<void> initData(String roomId) async {
    status = Status.loading;
    notifyListeners();
    final failOrResponse = await repository.getRoomInfoById(roomId);
    final failOrUserData = await repository.getRoomUsers(roomId);

    failOrResponse.fold(
      (error) {
        failure = error;
        status = Status.error;
        notifyListeners();
      },
      (data) {
        roomInfo = data;
        notifyListeners();
      },
    );

    failOrUserData.fold(
      (error) {
        failure = error;
        status = Status.error;
        notifyListeners();
      },
      (data) {
        userData = data;
        status = Status.loaded;
        notifyListeners();
      },
    );
  }
}
