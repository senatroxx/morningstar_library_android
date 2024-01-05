part of '../page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _borrowDuration = 1;
  List<Book> carts = [];
  List<bool> isCheckeds = [];
  int total = 0;
  Membership? membership;
  bool plusDisabled = false;
  CheckoutRequest? data;

  @override
  void initState() {
    super.initState();
    StoreKeyValue().getCart().then((value) {
      setState(() {
        carts = value ?? [];
        isCheckeds = List.generate(carts.length, (index) => false);
      });
    });
    StoreKeyValue().getUser().then((value) {
      setState(() {
        membership = value!.membership;
      });
    });
  }

  void _onChanged(int value) {
    setState(() {
      if ((value + 1).numOfWeeks() > membership!.maxBorrowWeeks!) {
        plusDisabled = true;
      }
      if (plusDisabled &&
          (value + 1).numOfWeeks() <= membership!.maxBorrowWeeks!) {
        plusDisabled = false;
      }

      _borrowDuration = value;
      total = isCheckeds.where((item) => item == true).length *
          membership!.finePerWeeks! *
          _borrowDuration.numOfWeeks();
    });
  }

  void _onChecked(index) {
    setState(() {
      isCheckeds[index] = !isCheckeds[index];
      total = isCheckeds.where((item) => item == true).length *
          membership!.finePerWeeks! *
          _borrowDuration.numOfWeeks();
    });
  }

  void _onCheckout() async {
    List<Book> selectedBooks = [];
    isCheckeds.asMap().forEach((index, value) {
      if (value) {
        selectedBooks.add(carts[index]);
      }
    });
    data = CheckoutRequest(
      total: total,
      books: selectedBooks,
      borrowDuration: _borrowDuration,
    );
    await StoreKeyValue().setCheckout(data!);
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
                Counter(
                  value: _borrowDuration,
                  onChanged: _onChanged,
                  plusDisabled: plusDisabled,
                ),
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
                  "Rp $total",
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
                    _onCheckout();
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
          itemCount: carts.length,
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
                        value: isCheckeds[index],
                        onChanged: (_) {
                          _onChecked(index);
                        },
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: ImageNetwork(
                        carts[index].thumbnail!,
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
                            carts[index].title!,
                            style: kBaseSemiBoldTextStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            carts[index]
                                .authors!
                                .map((e) => e.name!)
                                .join(", "),
                            style: kSmallTextStyle,
                          ),
                          Divider(
                            color: kBorderColor,
                          ),
                          Row(
                            children: [
                              Text(
                                "Available: ${carts[index].quantity}",
                                style: kSmallTextStyle,
                              ),
                              const Spacer(),
                              Text(
                                "Rp ${membership!.finePerWeeks}",
                                style: kSmallTextStyle,
                              ),
                            ],
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
