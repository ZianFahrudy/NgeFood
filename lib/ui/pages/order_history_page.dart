part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(builder: (_, state) {
      if (state is TransactionLoaded) {
        if (state.transaction.length == 0) {
          return IllustrationPage(
            title: "Ouch! Hungry",
            subtitle: "Seems like you have not\nordered any food yet",
            picturePath: "assets/love_burger.png",
            widthPicture: 200,
            heightPicture: 221,
            buttonTap1: () {},
            buttonText1: "Find Foods",
          );
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              // ignore: deprecated_member_use
              await context.bloc<TransactionCubit>().getTransactions();
            },
            child: GeneralPage(
                title: "Your Orders",
                subtitle: "Wait for the best meal",
                backColor: "FAFAFC".toColor(),
                child: Column(
                  children: [
                    CustomTabBars(
                      titles: ["In Progress", "Past Orders"],
                      selectedIndex: selectedIndex,
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 60),
                        width: double.infinity,
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: defaultMargin, vertical: 16),
                        child: Builder(builder: (_) {
                          List<Transaction> transaction = (selectedIndex == 0)
                              ? state.transaction
                                  .where((element) =>
                                      element.transactionStatus ==
                                          TransactionStatus.on_delivery ||
                                      element.transactionStatus ==
                                          TransactionStatus.pending)
                                  .toList()
                              : state.transaction
                                  .where((element) =>
                                      element.transactionStatus ==
                                          TransactionStatus.delivered ||
                                      element.transactionStatus ==
                                          TransactionStatus.cancelled)
                                  .toList();
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: transaction
                                  .map((e) => Padding(
                                        padding: EdgeInsets.only(
                                            top: (e != transaction.first)
                                                ? 16
                                                : 0),
                                        child: GestureDetector(
                                            onTap: (e.transactionStatus ==
                                                    TransactionStatus.pending)
                                                ? () async {
                                                    await launch(e.paymentUrl);
                                                  }
                                                : null,
                                            child: FoodOrderListItem(e)),
                                      ))
                                  .toList());
                        }))
                  ],
                )),
          );
        }
      } else {
        return Center(child: loadingIndicator);
      }
    });
  }
}
