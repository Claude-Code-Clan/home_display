// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

import 'dart:convert';

import 'package:flutter/foundation.dart';

class Card {
  Card({
    required this.xPos,
    required this.yPos,
    required this.width,
    required this.height,
    required this.type,
    required this.data,
  });

  final int xPos;
  final int yPos;
  final int width;
  final int height;
  final String type;
  final Map<String, dynamic> data;

  Card copyWith({
    int? xPos,
    int? yPos,
    int? width,
    int? height,
    String? type,
    Map<String, dynamic>? data,
  }) {
    return Card(
      xPos: xPos ?? this.xPos,
      yPos: yPos ?? this.yPos,
      width: width ?? this.width,
      height: height ?? this.height,
      type: type ?? this.type,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'xPos': xPos,
      'yPos': yPos,
      'width': width,
      'height': height,
      'type': type,
      'data': data,
    };
  }

  factory Card.fromMap(Map<String, dynamic> map) {
    return Card(
      xPos: map['xPos'] as int,
      yPos: map['yPos'] as int,
      width: map['width'] as int,
      height: map['height'] as int,
      type: map['type'] as String,
      data: Map<String, dynamic>.from(
        map['data'] as Map<String, dynamic>,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Card.fromJson(String source) =>
      Card.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Card(xPos: $xPos, yPos: $yPos, width: $width, height: $height, '
        'type: $type, data: $data)';
  }

  @override
  bool operator ==(covariant Card other) {
    if (identical(this, other)) return true;

    return other.xPos == xPos &&
        other.yPos == yPos &&
        other.width == width &&
        other.height == height &&
        other.type == type &&
        mapEquals(other.data, data);
  }

  @override
  int get hashCode {
    return xPos.hashCode ^
        yPos.hashCode ^
        width.hashCode ^
        height.hashCode ^
        type.hashCode ^
        data.hashCode;
  }
}
