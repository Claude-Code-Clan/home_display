// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

import 'dart:convert';

class CardData {
  CardData({
    required this.id,
    required this.xPos,
    required this.yPos,
    required this.width,
    required this.height,
    required this.type,
  });

  final int id;
  final int xPos;
  final int yPos;
  final int width;
  final int height;
  final String type;

  CardData copyWith({
    int? id,
    int? xPos,
    int? yPos,
    int? width,
    int? height,
    String? type,
  }) {
    return CardData(
      id: id ?? this.id,
      xPos: xPos ?? this.xPos,
      yPos: yPos ?? this.yPos,
      width: width ?? this.width,
      height: height ?? this.height,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'xPos': xPos,
      'yPos': yPos,
      'width': width,
      'height': height,
      'type': type,
    };
  }

  factory CardData.fromMap(Map<String, dynamic> map) {
    return CardData(
      id: map['id'] as int,
      xPos: map['xPos'] as int,
      yPos: map['yPos'] as int,
      width: map['width'] as int,
      height: map['height'] as int,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CardData.fromJson(String source) =>
      CardData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CardData(id: $id, xPos: $xPos, yPos: $yPos, width: $width, height: $height, type: $type)';
  }

  @override
  bool operator ==(covariant CardData other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.xPos == xPos &&
        other.yPos == yPos &&
        other.width == width &&
        other.height == height &&
        other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        xPos.hashCode ^
        yPos.hashCode ^
        width.hashCode ^
        height.hashCode ^
        type.hashCode;
  }
}
