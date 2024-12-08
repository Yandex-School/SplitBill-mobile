// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/features/event_room/domain/entities/create_room_request_entity.dart';
import 'package:split_bill/features/event_room/domain/entities/create_room_response_entity.dart';
import 'package:split_bill/features/event_room/domain/entities/created_rooms_response_entity.dart';

import 'package:split_bill/features/event_room/domain/repository/event_room_repository.dart';

class EventRoomProvider extends ChangeNotifier {
  final IEventRoomRepository eventRoomRepository;
  CreateRoomResponseEntity? roomResponse;
  List<CreatedRoomsResponseItemsEntity>? roomsData;
  bool? isJoined;
  Failure? failure;

  EventRoomProvider({required this.eventRoomRepository});

  void createRoom(
    String name,
    Function(int? roomId)? onSuccess,
  ) async {
    final response = await eventRoomRepository.createRoom(CreateRoomRequestEntity(name: name));

    response.fold((error) {
      failure = error;
      notifyListeners();
    }, (data) {
      roomResponse = data;
      if (onSuccess != null) {
        onSuccess(roomResponse?.id);
      }
      notifyListeners();
    });
  }

  void joinRoom(
    String id,
  ) async {
    final response = await eventRoomRepository.joinRoom(id);

    response.fold(
      (error) {
        failure = error;

        notifyListeners();
      },
      (data) {
        isJoined = data;
        notifyListeners();
      },
    );
  }

  void getRooms() async {
    final response = await eventRoomRepository.getRooms();

    response.fold(
      (error) {
        failure = error;
        notifyListeners();
      },
      (data) {
        roomsData = data.items;
        notifyListeners();
      },
    );
  }
}
