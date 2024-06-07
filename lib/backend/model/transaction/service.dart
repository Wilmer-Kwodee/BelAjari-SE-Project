class Service {
  String serviceId;
  String name;
  String description;
  double price;
  
  Service({
    required this.serviceId,
    required this.name,
    required this.description,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'serviceId': serviceId,
      'name': name,
      'description': description,
      'price': price,
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      serviceId: map['serviceId'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
    );
  }
}
