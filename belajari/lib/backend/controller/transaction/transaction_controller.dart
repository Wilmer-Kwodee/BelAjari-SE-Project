import 'package:flutter_app_testing/backend/model/transaction/payment_method.dart';
import 'package:flutter_app_testing/backend/model/transaction/transaction_header.dart';

class TransactionController {
  List<TransactionHeader> transactions = [];

  void addTransaction(TransactionHeader transaction) {
    transactions.add(transaction);
  }

  TransactionHeader? getTransactionById(String userId, String serviceId) {
    return transactions.firstWhere(
      (transaction) => transaction.userId == userId && transaction.serviceId == serviceId,
      orElse: () => null,
    );
  }

  void updateTransaction(TransactionHeader updatedTransaction) {
    var index = transactions.indexWhere(
      (transaction) => transaction.userId == updatedTransaction.userId && transaction.serviceId == updatedTransaction.serviceId,
    );
    if (index != -1) {
      transactions[index] = updatedTransaction;
    }
  }


  void deleteTransaction(String userId, String serviceId) {
    transactions.removeWhere(
      (transaction) => transaction.userId == userId && transaction.serviceId == serviceId,
    );
  }

  List<TransactionHeader> getTransactionsByUser(String userId) {
    return transactions.where((transaction) => transaction.userId == userId).toList();
  }
}
