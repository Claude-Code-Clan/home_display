// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Alerts {
  Alerts({
    required this.id,
    required this.alert,
  });

  final int id;
  final String alert;

  Alerts copyWith({
    int? id,
    String? alert,
  }) {
    return Alerts(
      id: id ?? this.id,
      alert: alert ?? this.alert,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'alert': alert,
    };
  }

  factory Alerts.fromMap(Map<String, dynamic> map) {
    return Alerts(
      id: map['id'] as int,
      alert: map['message'] as String? ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Alerts.fromJson(String source) =>
      Alerts.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Alerts(id: $id, alert: $alert)';

  @override
  bool operator ==(covariant Alerts other) {
    if (identical(this, other)) return true;

    return other.id == id && other.alert == alert;
  }

  @override
  int get hashCode => id.hashCode ^ alert.hashCode;
}
