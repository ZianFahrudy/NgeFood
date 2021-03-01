part of 'services.dart';

class TransactionServices {
  static Future<ApiReturnValue<List<Transaction>>> getTransaction(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + "transaction";

    var response = await client.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${UserModel.token}'
    });

    var data = jsonDecode(response.body);
    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again");
    } else {
      List<Transaction> transaction = (data['data']['data'] as Iterable)
          .map((e) => Transaction.fromJson(e))
          .toList();

      return ApiReturnValue(value: transaction);
    }
  }

  static Future<ApiReturnValue<Transaction>> submitTransaction(
      Transaction transaction,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + "checkout";

    var response = await client.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${UserModel.token}'
        },
        body: jsonEncode(<String, dynamic>{
          'id': transaction.id,
          'food_id': transaction.food.id,
          'user_id': transaction.user.id,
          'quantity': transaction.quantity,
          'total': transaction.total,
          'status': "PENDING",
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again");
    } else {
      var data = jsonDecode(response.body);

      Transaction transaction = Transaction.fromJson(data['data']);
      return ApiReturnValue(value: transaction);
    }

    // return ApiReturnValue(message: "Gagal");
  }
}
