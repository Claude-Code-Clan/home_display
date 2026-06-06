// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

import 'dart:convert';

class WidgetPosition {
  WidgetPosition({
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

  WidgetPosition copyWith({
    int? id,
    int? xPos,
    int? yPos,
    int? width,
    int? height,
    String? type,
  }) {
    return WidgetPosition(
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
      'widgetType': type,
      'x': xPos,
      'y': yPos,
      'w': width,
      'h': height,
    };
  }

  factory WidgetPosition.fromMap(Map<String, dynamic> map) {
    return WidgetPosition(
      id: map['id'] as int,
      xPos: map['x'] as int,
      yPos: map['y'] as int,
      width: map['w'] as int,
      height: map['h'] as int,
      type: map['widgetType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WidgetPosition.fromJson(String source) =>
      WidgetPosition.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WidgetPosition(id: $id, xPos: $xPos, yPos: $yPos, width: $width, height: $height, type: $type)';
  }

  @override
  bool operator ==(covariant WidgetPosition other) {
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
