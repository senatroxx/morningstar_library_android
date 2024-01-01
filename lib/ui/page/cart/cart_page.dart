part of '../page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _borrowDuration = 1;

  void _onChanged(int value) {
    setState(() {
      _borrowDuration = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: "My Cart",
        showAction: false,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: const BoxDecoration(
          color: kWhiteColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  "Borrow Duration",
                  style: kBaseTextStyle,
                ),
                const Spacer(),
                Counter(onChanged: _onChanged),
                const SizedBox(width: 10),
                Text(_borrowDuration > 1 ? "Days" : "Day",
                    style: kBaseTextStyle),
              ],
            ),
            Divider(
              color: kBorderColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: kBaseTextStyle,
                ),
                Text(
                  "Rp 100.000",
                  style: kBaseSemiBoldTextStyle,
                ),
              ],
            ),
            Divider(
              color: kBorderColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonPrimary(
                  title: "Checkout",
                  callbackfunc: () {
                    Modular.to.pushNamed(Routes.checkout);
                  },
                )
              ],
            ),
          ],
        ),
      ),
      backgroundColor: kWhiteBgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  left: 0,
                  right: 16.0,
                  bottom: 16.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.translate(
                      offset: const Offset(0, -14),
                      child: Checkbox(
                        value: true,
                        onChanged: (bool? newValue) {},
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        "https://picsum.photos/200/300",
                        width: 60,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "The Tell Tale Heart And Other Stories",
                            style: kBaseSemiBoldTextStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "Michael Jackson",
                            style: kSmallTextStyle,
                          ),
                          Divider(
                            color: kBorderColor,
                          ),
                          Text(
                            "Available: 10",
                            style: kSmallTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
