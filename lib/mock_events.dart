import 'dart:ffi';
import 'DataModels/EventModel.dart';
import 'package:flutter/material.dart';

/*

final now = DateTime.now();
final berlinWallFell = DateTime.utc(1989, 11, 9);
final moonLanding = DateTime.parse('1969-07-20 20:18:04Z');

 */

generateTouchFaceEvents() {
  var event0 = EventModel('Touch Face', DateTime.now(), 'jackbordner', null, TrackedFieldType.count);
  var event1 = EventModel('Touch Face', DateTime.now(), 'jackbordner', null, TrackedFieldType.count);
  var event2 = EventModel('Touch Face', DateTime.now(), 'jackbordner', null, TrackedFieldType.count);
  var event3 = EventModel('Touch Face', DateTime.now(), 'jackbordner', null, TrackedFieldType.count);
  var event4 = EventModel('Touch Face', DateTime.now(), 'jackbordner', null, TrackedFieldType.count);
  var event5 = EventModel('Touch Face', DateTime.now(), 'jackbordner', null, TrackedFieldType.count);
  return [event0, event1, event2, event3, event4, event5];
}

generateRandomEvents() {
  var event0 = EventModel('Event A', DateTime.now(), 'jackbordner', null, TrackedFieldType.count);
  var event1 = EventModel('Event B', DateTime.now(), 'jackbordner', null, TrackedFieldType.count);
  var event2 = EventModel('Event C', DateTime.now(), 'jackbordner', null, TrackedFieldType.count);
  var event3 = EventModel('Event D', DateTime.now(), 'jackbordner', null, TrackedFieldType.count);
  var event4 = EventModel('Event F', DateTime.now(), 'jackbordner', null, TrackedFieldType.count);
  var event5 = EventModel('Event G', DateTime.now(), 'jackbordner', null, TrackedFieldType.count);
  return [event0, event1, event2, event3, event4, event5];
}