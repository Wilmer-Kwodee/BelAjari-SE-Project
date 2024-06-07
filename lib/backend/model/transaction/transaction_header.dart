import 'package:flutter_app_testing/backend/model/transaction/payment_method.dart';

class TransactionHeader {
  String userId;
  String serviceId;
  PaymentMethod paymentMethod;
  double amount;

  TransactionHeader({
    required this.userId,
    required this.serviceId,
    required this.paymentMethod,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'serviceId': serviceId,
      'paymentMethod': paymentMethod.toString().split(".").last,
      'amount': amount,
    };
  }

  factory TransactionHeader.fromMap(Map<String, dynamic> map) {
    return TransactionHeader(
      userId: map['userId'],
      serviceId: map['serviceId'],
      paymentMethod: PaymentMethod.values.firstWhere(
        (e) => e.toString() == map['paymentMethod'],
      ),
      amount: map['amount'],
    );
  }
}
