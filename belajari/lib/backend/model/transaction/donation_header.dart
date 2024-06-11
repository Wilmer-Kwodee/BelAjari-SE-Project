import 'package:flutter_app_testing/backend/model/transaction/payment_method.dart';

class DonationHeader {
  String userId;
  String tutorId;
  PaymentMethod paymentMethod;
  double amount;

  DonationHeader({
    required this.userId,
    required this.tutorId,
    required this.paymentMethod,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'tutorId': tutorId,
      'paymentMethod': paymentMethod.toString().split(".").last,
      'amount': amount,
    };
  }

  factory DonationHeader.fromMap(Map<String, dynamic> map) {
    return DonationHeader(
      userId: map['userId'],
      tutorId: map['tutorId'],
      paymentMethod: PaymentMethod.values.firstWhere(
        (e) => e.toString() == map['paymentMethod'],
      ),
      amount: map['amount'],
    );
  }
}
