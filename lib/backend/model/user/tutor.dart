class Tutor {
  String userId;
  String description;
  String introductionVideoUrl;
  String cvUrl;
  List<String> certificateUrls;
  double balance;
  List<String> serviceIds;

  Tutor({
    required this.userId,
    required this.description,
    required this.introductionVideoUrl,
    required this.cvUrl,
    required this.certificateUrls,
    required this.balance,
    required this.serviceIds,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'description': description,
      'introductionVideoUrl': introductionVideoUrl,
      'cvUrl': cvUrl,
      'certificateUrls': certificateUrls,
      'balance': balance,
      'serviceIds': serviceIds,
    };
  }

  factory Tutor.fromMap(Map<String, dynamic> map) {
    return Tutor(
      userId: map['userId'],
      description: map['description'],
      introductionVideoUrl: map['introductionVideoUrl'],
      cvUrl: map['cvUrl'],
      certificateUrls: List<String>.from(map['certificateUrls']),
      balance: map['balance'],
      serviceIds: List<String>.from(map['serviceIds']),
    );
  }
}
