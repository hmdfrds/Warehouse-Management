import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Worker {
 final String name;
 final  String imgUrl;
  final String id;
  Worker({
    required this.name,
    required this.imgUrl,
    required this.id,
  });

  Worker copyWith({
    String? name,
    String? imgUrl,
    String? id,
  }) {
    return Worker(
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imgUrl': imgUrl,
      'id': id,
    };
  }

  factory Worker.fromMap(Map<String, dynamic> map) {
    return Worker(
      name: map['name'] as String,
      imgUrl: map['imgUrl'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Worker.fromJson(String source) => Worker.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Worker(name: $name, imgUrl: $imgUrl, id: $id)';

  @override
  bool operator ==(covariant Worker other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.imgUrl == imgUrl &&
      other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ imgUrl.hashCode ^ id.hashCode;
  }
