part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  final Transaction transaction;

  PaymentPage(this.transaction);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Payment",
      subtitle: "You deserve better meal",
      onBackButton: () {
        Get.back();
      },
      backColor: "FAFAFC".toColor(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Item Ordered",
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            widget.transaction.food.picturePath,
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width -
                                  2 * defaultMargin -
                                  60 -
                                  12 -
                                  70,
                              child: Text(widget.transaction.food.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: blackTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                            ),
                            Text(
                                NumberFormat.currency(
                                  locale: "id-ID",
                                  symbol: "IDR ",
                                  decimalDigits: 0,
                                ).format(widget.transaction.food.price),
                                style: greyTextStyle.copyWith(
                                    fontSize: 13, fontWeight: FontWeight.w400))
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.transaction.quantity.toString(),
                          style: greyTextStyle.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          " items",
                          style: greyTextStyle.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 16),
                Text("Details Transaction",
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400)),
                SizedBox(height: 8),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 2) - 10,
                        child: Text(
                          widget.transaction.food.name,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: greyTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Text(
                          NumberFormat.currency(
                            locale: "id-ID",
                            symbol: "IDR ",
                            decimalDigits: 0,
                          ).format(widget.transaction.total),
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400))
                    ]),
                SizedBox(
                  height: 6,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Driver",
                        style: greyTextStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(
                          NumberFormat.currency(
                            locale: "id-ID",
                            symbol: "IDR ",
                            decimalDigits: 0,
                          ).format(50000),
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400))
                    ]),
                SizedBox(
                  height: 6,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tax 10%",
                        style: greyTextStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(
                          NumberFormat.currency(
                            locale: "id-ID",
                            symbol: "IDR ",
                            decimalDigits: 0,
                          ).format(widget.transaction.total * 0.1),
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400))
                    ]),
                SizedBox(
                  height: 6,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Price",
                        style: greyTextStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(
                          NumberFormat.currency(
                            locale: "id-ID",
                            symbol: "IDR ",
                            decimalDigits: 0,
                          ).format(widget.transaction.total * 1.1 + 50000),
                          style: blackTextStyle.copyWith(
                              color: "1ABC9C".toColor(),
                              fontSize: 14,
                              fontWeight: FontWeight.w500))
                    ]),
                SizedBox(
                  height: 6,
                ),
              ],
            ),
          ),
          SizedBox(
            height: defaultMargin,
          ),
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Deliver to:",
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 8,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name",
                        style: greyTextStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(widget.transaction.user.name,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w500))
                    ]),
                SizedBox(
                  height: 6,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Phone No.",
                        style: greyTextStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(widget.transaction.user.phoneNumber.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w500))
                    ]),
                SizedBox(
                  height: 6,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Address",
                        style: greyTextStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(widget.transaction.user.address,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w500))
                    ]),
                SizedBox(
                  height: 6,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "House No.",
                        style: greyTextStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(widget.transaction.user.houseNumber.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w500))
                    ]),
                SizedBox(
                  height: 6,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "City",
                        style: greyTextStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(widget.transaction.user.city,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w500))
                    ]),
                SizedBox(
                  height: 6,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          isLoading
              ? Center(child: loadingIndicator)
              : Container(
                  height: 45,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: RaisedButton(
                      color: mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Text("Checkout Now",
                          style: blackTextStyle.copyWith(fontSize: 14)),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        // ignore: deprecated_member_use
                        String paymentURL = await context
                            // ignore: deprecated_member_use
                            .bloc<TransactionCubit>()
                            .submitTransactions(widget.transaction.copyWith(
                                dateTime: DateTime.now(),
                                total:
                                    (widget.transaction.total * 1.1).toInt() +
                                        50000));

                        if (paymentURL != null) {
                          Get.to(() => PaymentMethodPage(paymentURL));
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                          Get.snackbar("title", " message",
                              backgroundColor: Colors.pink,
                              colorText: Colors.white,
                              titleText: Text("Failed"),
                              messageText: Text("Please try again later"));
                        }
                      }),
                )
        ],
      ),
    );
  }
}
