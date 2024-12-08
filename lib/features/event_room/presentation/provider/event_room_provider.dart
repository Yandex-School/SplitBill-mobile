// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/core/local_data/shared_preferences.dart';
import 'package:split_bill/core/utils/const.dart';
import 'package:split_bill/features/event_room/domain/entities/create_room_request_entity.dart';
import 'package:split_bill/features/event_room/domain/entities/create_room_response_entity.dart';
import 'package:split_bill/features/event_room/domain/entities/created_rooms_response_entity.dart';
import 'package:split_bill/features/event_room/domain/repository/event_room_repository.dart';

class EventRoomProvider extends ChangeNotifier {
  final IEventRoomRepository eventRoomRepository;
  final SharedPrefsService sharedPrefsService;
  CreateRoomResponseEntity? roomResponse;
  List<CreatedRoomsResponseItemsEntity>? roomsData;
  bool? isJoined;
  String? currentRoomId;
  Failure? failure;

  EventRoomProvider({
    required this.eventRoomRepository,
    required this.sharedPrefsService,
  });

  Future<bool> logout() async {
    try {
      // TODO: не круто
      await sharedPrefsService.delete(Constants.USER_ID);
      return true;
    } on Object catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<void> createRoom(
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
        getRooms();
      }
      notifyListeners();
    });
  }

  Future<void> setRoomId(String id) async {
    if (currentRoomId == id) {
      return;
    }
    // log('test join');
    currentRoomId = id;
    await joinRoom(id);
  }

  Future<void> joinRoom(
    String id,
  ) async {
    final response = await eventRoomRepository.joinRoom(id);

    response.fold(
      (error) {
        failure = error;
        notifyListeners();
        currentRoomId = null;
      },
      (data) {
        isJoined = data;
        notifyListeners();
      },
    );
  }

  void closeRoom() {
    currentRoomId = null;
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
