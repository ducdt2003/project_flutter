import 'package:flutter_hello_template/event/event_model.dart';
import 'package:localstore/localstore.dart';

class EventService {
  final db = Localstore.getInstance(useSupportDir: true);

// tên collection trong localstore
  final path = 'events';
  // hàm lấy danh sách sự kiện từ localstore
  Future<List<EventModel>> getAllEvents() async {
  final eventsMap = await db.collection(path).get();

  if (eventsMap != null) {
    return eventsMap.entries.map((entry) {
      final eventData = entry.value as Map<String, dynamic>;
      if (!eventData.containsKey('id')) {
        eventData['id'] = entry.key.split('/').last;
      }
      return EventModel.fromMap(eventData); // Sử dụng fromJson thay vì fromMap nếu class EventModel hỗ trợ
    }).toList();
  }
  return [];
}



  // hàm lưu 1 sự kiện vào localStore
  Future<void> saveEvent(EventModel item) async {
    // id không tồn tại thì lấy 1 id ngẫu nhiên
    item.id ??= db.collection(path).doc().id;
    await db.collection(path).doc(item.id).set(item.toMap());
  }

  // hàm xóa 1 sự kiện từ localstore

  Future<void> deleteEvent(EventModel item) async {
    await db.collection(path).doc(item.id).delete();
  }
}