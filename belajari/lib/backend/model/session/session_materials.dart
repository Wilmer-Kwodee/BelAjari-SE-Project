class SessionMaterial {
  String materialUrl;

  SessionMaterial({
    required this.materialUrl,
  });

  String materialType() {
    if (materialUrl.toLowerCase().endsWith(".pdf")) {
      return "pdf";
    } else if (materialUrl.toLowerCase().endsWith(".doc") || 
               materialUrl.toLowerCase().endsWith(".docx")) {
      return "doc";
    } else if (materialUrl.toLowerCase().endsWith(".jpg") || 
               materialUrl.toLowerCase().endsWith(".jpeg") || 
               materialUrl.toLowerCase().endsWith(".png")) {
      return "image";
    } else {
      return "unknown";
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'materialUrl': materialUrl,
    };
  }

  factory SessionMaterial.fromMap(Map<String, dynamic> map) {
    return SessionMaterial(
      materialUrl: map['materialUrl'],
    );
  }
}
