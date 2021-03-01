part of 'widgets.dart';

class FoodOrderListItem extends StatelessWidget {
  final Transaction transaction;
  FoodOrderListItem(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(transaction.food.picturePath,
                  height: 60, width: 60, fit: BoxFit.cover),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 2) - 70,
                  child: Text(transaction.food.name,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w400)),
                ),
                Row(
                  children: [
                    Text("${transaction.quantity} item ",
                        style: greyTextStyle.copyWith(
                            fontSize: 13, fontWeight: FontWeight.w400)),
                    Container(
                      height: 4,
                      width: 4,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: greyColor,
                      ),
                    ),
                    Text(
                        NumberFormat.currency(
                                locale: "id-ID",
                                symbol: " IDR ",
                                decimalDigits: 0)
                            .format(transaction.total),
                        style: greyTextStyle.copyWith(
                            fontSize: 13, fontWeight: FontWeight.w400))
                  ],
                )
              ],
            )
          ],
        ),
        Column(children: [
          Text(transaction.dateTime.shortDateTime,
              style: greyTextStyle.copyWith(
                  fontSize: 10, fontWeight: FontWeight.w400)),
          Text(
            (transaction.transactionStatus == TransactionStatus.delivered)
                ? "Delivered"
                : (transaction.transactionStatus ==
                        TransactionStatus.on_delivery)
                    ? "On Delivery"
                    : (transaction.transactionStatus ==
                            TransactionStatus.pending)
                        ? "Pending"
                        : "Cancelled",
            style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: (transaction.transactionStatus ==
                        TransactionStatus.delivered)
                    ? "1ABC9C".toColor()
                    : (transaction.transactionStatus ==
                            TransactionStatus.on_delivery)
                        ? mainColor
                        : (transaction.transactionStatus ==
                                TransactionStatus.cancelled)
                            ? "D9435E".toColor()
                            : "D9435E".toColor()),
          ),
        ]),
      ],
    );
  }
}
