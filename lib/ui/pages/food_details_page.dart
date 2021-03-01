part of 'pages.dart';

class FoodDetailPage extends StatefulWidget {
  final Transaction transaction;

  FoodDetailPage(this.transaction);
  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: 330,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          NetworkImage(widget.transaction.food.picturePath)))),
          SafeArea(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      "assets/back_arrow_white.png",
                      width: 24,
                      height: 24,
                    ),
                  ))),
          SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(16, 26, 16, 0),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(23),
                        topRight: Radius.circular(23)),
                  ),
                  margin: EdgeInsets.only(top: 280),
                  child: ListView(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width -
                                        32 -
                                        120,
                                    child: Text(widget.transaction.food.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.clip,
                                        style: blackTextStyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  RatingStars(widget.transaction.food.rate),
                                ]),
                            Row(children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity = max(1, quantity - 1);
                                  });
                                },
                                child: Image.asset("assets/btn_min.png",
                                    height: 26, width: 26),
                              ),
                              SizedBox(width: 10),
                              Text(quantity.toString(),
                                  style: blackTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity = min(999, quantity + 1);
                                  });
                                },
                                child: Image.asset("assets/btn_add.png",
                                    height: 26, width: 26),
                              ),
                            ]),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(widget.transaction.food.description,
                            style: greyTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400)),
                        SizedBox(
                          height: 16,
                        ),
                        Text("Ingredients",
                            style: blackTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400)),
                        SizedBox(
                          height: 4,
                        ),
                        Text(widget.transaction.food.ingredients,
                            style: greyTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400)),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Total Price:",
                                    style: greyTextStyle.copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                  NumberFormat.currency(
                                          locale: "id-ID",
                                          symbol: "IDR",
                                          decimalDigits: 0)
                                      .format(widget.transaction.food.price *
                                          quantity),
                                  style: blackTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            Container(
                              height: 45,
                              width: 163,
                              child: RaisedButton(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: mainColor,
                                  child: Text("Order Now",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 14)),
                                  onPressed: () {
                                    Get.to(() => PaymentPage(widget.transaction
                                        .copyWith(
                                            quantity: quantity,
                                            total:
                                                (widget.transaction.food.price *
                                                    quantity))));
                                  }),
                            )
                          ],
                        )
                      ],
                    )
                  ]))),
        ],
      ),
    );
  }
}
