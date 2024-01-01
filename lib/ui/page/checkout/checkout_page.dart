part of '../page.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
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
        title: "Checkout",
        showAction: false,
      ),
      backgroundColor: kWhiteBgColor,
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
            const SizedBox(height: 10),
            ButtonPrimary(
              title: "Pay Now",
              fullWidth: true,
              callbackfunc: () {
                Navigator.pushNamed(context, "/checkout");
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: kBorderColor.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Shipping Address",
                          style: kBaseTextStyle,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/address");
                          },
                          child: Row(
                            children: [
                              Text(
                                "Change",
                                style: kSmallTextStyle.copyWith(
                                  color: kPrimaryColor,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: kPrimaryColor,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Michael Jackson",
                      style: kBaseSemiBoldTextStyle,
                    ),
                    Text(
                      "Jl. Raya Bogor KM 30, Jakarta Timur",
                      style: kSmallTextStyle,
                    ),
                    Text(
                      "Jakarta, Indonesia",
                      style: kSmallTextStyle,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Phone Number",
                          style: kSmallTextStyle,
                        ),
                        const Spacer(),
                        Text(
                          "08123456789",
                          style: kSmallTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: ((context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                "1 x 50.000",
                                style: kBaseSemiBoldTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                  separatorBuilder: (context, index) =>
                      Divider(color: kBorderColor),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text("Choose Shipping Method", style: kBaseTextStyle),
                      const Spacer(),
                      Row(
                        children: [
                          // Text("JNE", style: kBaseTextStyle),
                          // const SizedBox(width: 5),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: kPrimaryColor,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
