part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onBackButton;
  final Widget child;
  final Color backColor;

  GeneralPage(
      {this.title = "Title",
      this.subtitle = "Subtitle",
      this.onBackButton,
      this.child,
      this.backColor});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(child: Container(color: backColor ?? whiteColor)),
          SafeArea(
              child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        defaultMargin, 30, 0, defaultMargin),
                    height: 108,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: [
                        onBackButton != null
                            ? Container(
                                margin: EdgeInsets.only(right: 26),
                                child: InkWell(
                                  onTap: () {
                                    onBackButton();
                                  },
                                  child: Image.asset(
                                    "assets/back_arrow.png",
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                              )
                            : SizedBox(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: blackTextStyle,
                            ),
                            Text(
                              subtitle,
                              style: greyTextStyle,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(height: defaultMargin, color: "FAFAFC".toColor()),
                  child ?? SizedBox()
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
