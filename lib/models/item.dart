// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Item {
   String id;
   String imageUrl;
   String name;
   String origin;
   String size;
   String wareHouseLocation;
   int wareHouseSubLocation;
   String status;
   DateTime? receivedDate;
   DateTime? sendDate;
   DateTime? expectedDate;
   double weight;
  Item({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.origin,
    required this.size,
    required this.wareHouseLocation,
    required this.wareHouseSubLocation,
    required this.status,
    this.receivedDate,
    this.sendDate,
    this.expectedDate,
    required this.weight,
  });


  Item copyWith({
    String? id,
    String? imageUrl,
    String? name,
    String? origin,
    String? size,
    String? wareHouseLocation,
    int? wareHouseSubLocation,
    String? status,
    DateTime? receivedDate,
    DateTime? sendDate,
    DateTime? expectedDate,
    double? weight,
  }) {
    return Item(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      origin: origin ?? this.origin,
      size: size ?? this.size,
      wareHouseLocation: wareHouseLocation ?? this.wareHouseLocation,
      wareHouseSubLocation: wareHouseSubLocation ?? this.wareHouseSubLocation,
      status: status ?? this.status,
      receivedDate: receivedDate ?? this.receivedDate,
      sendDate: sendDate ?? this.sendDate,
      expectedDate: expectedDate ?? this.expectedDate,
      weight: weight ?? this.weight,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
      'origin': origin,
      'size': size,
      'wareHouseLocation': wareHouseLocation,
      'wareHouseSubLocation': wareHouseSubLocation,
      'status': status,
      'receivedDate': receivedDate?.millisecondsSinceEpoch,
      'sendDate': sendDate?.millisecondsSinceEpoch,
      'expectedDate': expectedDate?.millisecondsSinceEpoch,
      'weight': weight,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as String,
      imageUrl: map['imageUrl'] as String,
      name: map['name'] as String,
      origin: map['origin'] as String,
      size: map['size'] as String,
      wareHouseLocation: map['wareHouseLocation'] as String,
      wareHouseSubLocation: map['wareHouseSubLocation'] as int,
      status: map['status'] as String,
      receivedDate: map['receivedDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['receivedDate'] as int) : null,
      sendDate: map['sendDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['sendDate'] as int) : null,
      expectedDate: map['expectedDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['expectedDate'] as int) : null,
      weight: map['weight'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, imageUrl: $imageUrl, name: $name, origin: $origin, size: $size, wareHouseLocation: $wareHouseLocation, wareHouseSubLocation: $wareHouseSubLocation, status: $status, receivedDate: $receivedDate, sendDate: $sendDate, expectedDate: $expectedDate, weight: $weight)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.imageUrl == imageUrl &&
      other.name == name &&
      other.origin == origin &&
      other.size == size &&
      other.wareHouseLocation == wareHouseLocation &&
      other.wareHouseSubLocation == wareHouseSubLocation &&
      other.status == status &&
      other.receivedDate == receivedDate &&
      other.sendDate == sendDate &&
      other.expectedDate == expectedDate &&
      other.weight == weight;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      imageUrl.hashCode ^
      name.hashCode ^
      origin.hashCode ^
      size.hashCode ^
      wareHouseLocation.hashCode ^
      wareHouseSubLocation.hashCode ^
      status.hashCode ^
      receivedDate.hashCode ^
      sendDate.hashCode ^
      expectedDate.hashCode ^
      weight.hashCode;
  }
}
