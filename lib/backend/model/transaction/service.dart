class Service {
  String serviceId;
  String courseId;
  String name;
  String description;
  double price;
  
  Service({
    required this.serviceId,
    required this.courseId,
    required this.name,
    required this.description,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'serviceId': serviceId,
      'courseId': courseId,
      'name': name,
      'description': description,
      'price': price,
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      serviceId: map['serviceId'],
      courseId: map['courseId'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
    );
  }
}
