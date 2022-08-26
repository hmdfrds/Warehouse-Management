// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Section {
  String id = "";
  final String name;
  final int capacity;
  final Map<String, dynamic> items;
  final Timestamp lastUpdateDate;

  Section({
    required this.name,
    required this.capacity,
    required this.items,
    required this.lastUpdateDate,
  });

  Section copyWith({
    String? name,
    int? capacity,
    Map<String, dynamic>? items,
    Timestamp? lastUpdateDate,
  }) {
    return Section(
      name: name ?? this.name,
      capacity: capacity ?? this.capacity,
      items: items ?? this.items,
      lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'capacity': capacity,
      'items': items,
      'lastUpdateDate': lastUpdateDate,
    };
  }

  factory Section.fromMap(Map<String, dynamic> map) {
    return Section(
      name: map['name'] as String,
      capacity: map['capacity'] as int,
      items: Map<String, dynamic>.from((map['items'] as Map<String, dynamic>)),
      lastUpdateDate: map["lastUpdateDate"] as Timestamp,
    );
  }

  String toJson() => json.encode(toMap());

  factory Section.fromJson(String source) =>
      Section.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Section(name: $name, capacity: $capacity, items: $items, lastUpdateDate: $lastUpdateDate)';
  }

  @override
  bool operator ==(covariant Section other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.capacity == capacity &&
        mapEquals(other.items, items) &&
        other.lastUpdateDate == lastUpdateDate;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        capacity.hashCode ^
        items.hashCode ^
        lastUpdateDate.hashCode;
  }
}
