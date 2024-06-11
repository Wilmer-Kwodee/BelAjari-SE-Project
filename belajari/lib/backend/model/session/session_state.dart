class SessionState {
  String state;
  String location;

  SessionState({
    required this.state,
    required this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      'state': state,
      'location': location,
    };
  }

  factory SessionState.fromMap(Map<String, dynamic> map) {
    return SessionState(
      state: map['state'],
      location: map['location'],
    );
  }
}
