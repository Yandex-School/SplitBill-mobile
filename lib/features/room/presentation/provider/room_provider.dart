// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:split_bill/features/room/domain/entities/room_info_response_entity.dart';
import 'package:split_bill/features/room/domain/repository/room_repository.dart';

class RoomProvider extends ChangeNotifier {
  final IRoomRepository repository;
  RoomInfoResponseEntity? roomInfo;

  RoomProvider({required this.repository});

  Future<void> initData(String roomId) async {
    final failOrResponse = await repository.getRoomInfoById(roomId);

    failOrResponse.fold(
      (error) {},
      (data) {},
    );
  }
}
