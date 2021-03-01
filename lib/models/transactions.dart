part of 'models.dart';

enum TransactionStatus { delivered, on_delivery, pending, cancelled }

class Transaction extends Equatable {
  final int id;
  final Food food;
  final int quantity;
  final int total;
  final DateTime dateTime;
  final TransactionStatus transactionStatus;
  final UserModel user;
  final String paymentUrl;

  Transaction(
      {this.id,
      this.dateTime,
      this.food,
      this.quantity,
      this.total,
      this.transactionStatus,
      this.user,
      this.paymentUrl});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
        id: json['id'],
        food: Food.fromJson(json['food']),
        quantity: json['quantity'],
        dateTime: DateTime.fromMillisecondsSinceEpoch(json['created_at']),
        total: json['total'],
        user: UserModel.fromJson(json['user']),
        paymentUrl: json['payment_url'],
        transactionStatus: json['status'] == "PENDING"
            ? TransactionStatus.pending
            : json['status'] == "CANCELLED"
                ? TransactionStatus.cancelled
                : json['status'] == "DELIVERED"
                    ? TransactionStatus.delivered
                    : TransactionStatus.on_delivery);
  }

  Transaction copyWith(
          {int id,
          Food food,
          int quantity,
          int total,
          DateTime dateTime,
          TransactionStatus transactionStatus,
          UserModel user,
          String paymentUrl}) =>
      Transaction(
          id: id ?? this.id,
          dateTime: dateTime ?? this.dateTime,
          food: food ?? this.food,
          quantity: quantity ?? this.quantity,
          total: total ?? this.total,
          transactionStatus: transactionStatus ?? this.transactionStatus,
          user: user ?? this.user,
          paymentUrl: paymentUrl ?? this.paymentUrl);

  @override
  List<Object> get props => [
        id,
        food,
        quantity,
        total,
        dateTime,
        transactionStatus,
        user,
        paymentUrl
      ];
}

List<Transaction> mockTransactions = [
  Transaction(
      id: 1,
      food: mockFoods[1],
      quantity: 10,
      dateTime: DateTime.now(),
      total: (mockFoods[1].price * 10 * 1.1).round() + 50000,
      transactionStatus: TransactionStatus.delivered,
      user: mockUser),
  Transaction(
      id: 2,
      food: mockFoods[2],
      quantity: 7,
      dateTime: DateTime.now(),
      total: (mockFoods[2].price * 7 * 1.1).round() + 50000,
      transactionStatus: TransactionStatus.on_delivery,
      user: mockUser),
  Transaction(
      id: 3,
      food: mockFoods[3],
      quantity: 3,
      dateTime: DateTime.now(),
      total: (mockFoods[3].price * 3 * 1.1).round() + 50000,
      transactionStatus: TransactionStatus.cancelled,
      user: mockUser),
  Transaction(
      id: 4,
      food: mockFoods[4],
      quantity: 8,
      dateTime: DateTime.now(),
      total: (mockFoods[4].price * 8 * 1.1).round() + 50000,
      transactionStatus: TransactionStatus.pending,
      user: mockUser),
];

// List<Transaction> mockTransactions = [
//   Transaction(
//       id: 1,
//       food: mockFoods[1],
//       quantity: 10,
//       total: (mockFoods[1].price * 10 * 1.1).round() + 50000,
//       dateTime: DateTime.now(),
//       transactionStatus: TransactionStatus.on_delivery,
//       user: mockUser),
//   Transaction(
//       id: 2,
//       food: mockFoods[2],
//       quantity: 7,
//       total: (mockFoods[2].price * 7 * 1.1).round() + 50000,
//       dateTime: DateTime.now(),
//       transactionStatus: TransactionStatus.delivered,
//       user: mockUser),
//   Transaction(
//       id: 3,
//       food: mockFoods[3],
//       quantity: 5,
//       total: (mockFoods[3].price * 5 * 1.1).round() + 50000,
//       dateTime: DateTime.now(),
//       transactionStatus: TransactionStatus.cancelled,
//       user: mockUser)
// ];
