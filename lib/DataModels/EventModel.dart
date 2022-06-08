import 'dart:ffi';
import 'package:flutter/material.dart';

class EventModel {
  String? name; // Touch Face
  DateTime? createdAt; // DateTime.now()
  String? createdBy; // UUID
  Double? duration; // null
  TrackedFieldType? trackedFieldType; // count

  EventModel(this.name, this.createdAt, this.createdBy, this.duration, this.trackedFieldType);

  String? createdAtLongDisplayText() {
    var createdAtToLocal = createdAt?.toLocal();
    return " $createdAtToLocal ";
  }
}

enum TrackedFieldType {
  count,
  duration
}