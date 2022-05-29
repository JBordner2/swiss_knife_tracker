import 'dart:ffi';

import 'package:flutter/material.dart';

/*

final now = DateTime.now();
final berlinWallFell = DateTime.utc(1989, 11, 9);
final moonLanding = DateTime.parse('1969-07-20 20:18:04Z');

 */

class Event {
  String name; // Touch Face
  DateTime createdAt; // DateTime.now()
  String createdBy; // UUID
  Double? duration; // null
  TrackedFieldType trackedFieldType; // count

  Event(this.name, this.createdAt, this.createdBy, this.duration, this.trackedFieldType);

  String createdAtLongDisplayText() {
    var createdAtToLocal = createdAt.toLocal();
    return " $createdAtToLocal ";
  }
}

enum TrackedFieldType {
  count,
  duration
}

generateTouchFaceEvents() {
  var event0 = Event('Touch Face', DateTime.now(), 'jackbordner', null, TrackedFieldType.count);
  var event1 = Event('Touch Face', DateTime.now(), 'jackbordner', null, TrackedFieldType.count);
  var event2 = Event('Touch Face', DateTime.now(), 'jackbordner', null, TrackedFieldType.count);
  var event3 = Event('Touch Face', DateTime.now(), 'jackbordner', null, TrackedFieldType.count);
  var event4 = Event('Touch Face', DateTime.now(), 'jackbordner', null, TrackedFieldType.count);
  var event5 = Event('Touch Face', DateTime.now(), 'jackbordner', null, TrackedFieldType.count);
  return [event0, event1, event2, event3, event4, event5];
}

generateRandomEvents() {
  var event0 = Event('Event A', DateTime.now(), 'jackbordner', null, TrackedFieldType.count);
  var event1 = Event('Event B', DateTime.now(), 'jackbordner', null, TrackedFieldType.count);
  var event2 = Event('Event C', DateTime.now(), 'jackbordner', null, TrackedFieldType.count);
  var event3 = Event('Event D', DateTime.now(), 'jackbordner', null, TrackedFieldType.count);
  var event4 = Event('Event F', DateTime.now(), 'jackbordner', null, TrackedFieldType.count);
  var event5 = Event('Event G', DateTime.now(), 'jackbordner', null, TrackedFieldType.count);
  return [event0, event1, event2, event3, event4, event5];
}