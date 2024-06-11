import 'package:flutter_app_testing/backend/model/session/session_materials.dart';
import 'package:flutter_app_testing/backend/model/session/session_state.dart';

class Session {
  String scheduleId;
  String sessionNumber;
  DateTime sessionDateTime;
  SessionState sessionState;
  List<SessionMaterial> sessionMaterials;

  Session({
    required this.scheduleId,
    required this.sessionNumber,
    required this.sessionDateTime,
    required this.sessionState,
    required this.sessionMaterials,
  });

  Map<String, dynamic> toMap() {
    return {
      'scheduleId': scheduleId,
      'sessionNumber': sessionNumber,
      'sessionDateTime': sessionDateTime.toIso8601String(),
      'sessionState': sessionState.toMap(), 
      'sessionMaterials': sessionMaterials.map((material) => material.toMap()).toList(),
    };
  }

  factory Session.fromMap(Map<String, dynamic> map) {
    return Session(
      scheduleId: map['scheduleId'],
      sessionNumber: map['sessionNumber'],
      sessionDateTime: DateTime.parse(map['sessionDateTime']),
      sessionState: SessionState.fromMap(map['sessionState']), 
      sessionMaterials: List<SessionMaterial>.from(map['sessionMaterials'].map((materialMap) => SessionMaterial.fromMap(materialMap))),
    );
  }
}
