import 'package:flutter/material.dart';

class HistoryDb {
  int? id;
  String? operation;
  String? time;

  HistoryDb({this.id, this.operation, this.time});

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['operation'] = operation;
    map['time'] = time;
    return map;
  }

  HistoryDb.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    operation = map['operation'];
    time = map['time'];
  }

}
