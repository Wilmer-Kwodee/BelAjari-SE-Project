class Tutor {
  String userId;
  String tutorId;
  String description;
  String introductionVideoUrl;
  String cvUrl;
  List<String> certificateUrls;
  double balance;
  List<String> serviceIds;
  String phoneNumber;

  Tutor({
    required this.tutorId, 
    required this.userId,
    required this.description,
    required this.introductionVideoUrl,
    required this.cvUrl,
    required this.certificateUrls,
    required this.balance,
    required this.serviceIds,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'tutorId': tutorId,
      'userId': userId,
      'description': description,
      'introductionVideoUrl': introductionVideoUrl,
      'cvUrl': cvUrl,
      'certificateUrls': certificateUrls,
      'balance': balance,
      'serviceIds': serviceIds,
      'phoneNumber': phoneNumber
    };
  }

  factory Tutor.fromMap(Map<String, dynamic> map) {
    return Tutor(
      tutorId: map['tutorId'],
      userId: map['userId'],
      description: map['description'],
      introductionVideoUrl: map['introductionVideoUrl'],
      cvUrl: map['cvUrl'],
      certificateUrls: List<String>.from(map['certificateUrls']),
      balance: map['balance'],
      serviceIds: List<String>.from(map['serviceIds']),
      phoneNumber: map['phoneNumber'],
    );
  }
}
