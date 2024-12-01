import 'package:split_bill/core/errors/exeptions.dart';
import 'package:split_bill/features/home/data/models/room_model.dart';

abstract class RoomRemouteDatasource {
  Future<RoomModel> fetchRoom();
  Future<List<RoomModel>> fetchAllRooms();
  Future<RoomModel> updateRoom(RoomModel room);
}

class RoomRemouteDatasourceImpl extends RoomRemouteDatasource {
  @override
  Future<List<RoomModel>> fetchAllRooms() async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));
      final List<RoomModel> mockRooms = [
        RoomModel(
          id: 1,
          name: "Room 1",
          ownerId: 1,
        ),
        RoomModel(
          id: 2,
          name: "Room 2",
          ownerId: 2,
        ),
        RoomModel(
          id: 3,
          name: "Room 3",
          ownerId: 3,
        ),
      ];

      return mockRooms;
    } catch (e) {
      throw ServerExeption(message: "Time out");
    }
  }

  @override
  Future<RoomModel> fetchRoom() async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));
      final mockRoom = RoomModel(
        id: 1,
        name: "Room 1",
        ownerId: 1,
      );
      return mockRoom;
    } catch (e) {
      throw ServerExeption(message: "Time out");
    }
  }

  @override
  Future<RoomModel> updateRoom(RoomModel room) async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));
      final mockUpdatedRoom =
          RoomModel(id: 1, name: "Updated Room", ownerId: 2);
      return mockUpdatedRoom;
    } catch (e) {
      throw ServerExeption(message: 'connection time out');
    }
  }
}
