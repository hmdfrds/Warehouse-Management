// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Section {
  // final String id;
  final String name;
  final int capacity;
  final Map<String, dynamic> items;
  Section({
    required this.name,
    required this.capacity,
    required this.items,
  });

  Section copyWith({
    String? name,
    int? capacity,
    Map<String, dynamic>? items,
  }) {
    return Section(
      name: name ?? this.name,
      capacity: capacity ?? this.capacity,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'capacity': capacity,
      'items': items,
    };
  }

  factory Section.fromMap(Map<String, dynamic> map) {
    return Section(
      name: map['name'] as String,
      capacity: map['capacity'] as int,
      items: map["items"],
    );
  }

  String toJson() => json.encode(toMap());

  factory Section.fromJson(String source) =>
      Section.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Section(name: $name, capacity: $capacity, items: $items)';

  @override
  bool operator ==(covariant Section other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.capacity == capacity &&
        mapEquals(other.items, items);
  }

  @override
  int get hashCode => name.hashCode ^ capacity.hashCode ^ items.hashCode;
}
