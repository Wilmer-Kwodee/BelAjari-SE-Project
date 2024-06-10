class Schedule {
  String scheduleId;
  String tutorId;
  String courseId;
  String studentId; 

  Schedule({
    required this.scheduleId,
    required this.tutorId,
    required this.courseId,
    required this.studentId,
  });

  Map<String, dynamic> toMap() {
    return {
      'scheduleId': scheduleId,
      'tutorId': tutorId,
      'courseId': courseId,
      'studentId': studentId,
    };
  }

  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
      scheduleId: map['scheduleId'],
      tutorId: map['tutorId'],
      courseId: map['courseId'],
      studentId: map['studentId'],
    );
  }
}
