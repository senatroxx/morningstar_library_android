part of '../page.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int _borrowDuration = 1;

  @override
  void initState() {
    super.initState();
    context.read<CheckoutCubit>().init();
    context.read<CheckoutCubit>().getCheckoutData();
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          content: const Text("Please add your address first"),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _onChanged(int value) {
    setState(() {
      _borrowDuration = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state is CheckoutDataLoaded) {
          if (state.statusWidget == StatusWidget.LOAD) {
            return showLoad(context);
          } else {
            hideLoad(context);
          }
        }
      },
      child: Scaffold(
        appBar: const MyAppBar(
          title: "Checkout",
          showAction: false,
        ),
        backgroundColor: kWhiteBgColor,
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  Counter(onChanged: _onChanged, value: _borrowDuration),
                  const SizedBox(width: 10),
                  Text(_borrowDuration > 1 ? "Days" : "Day",
                      style: kBaseTextStyle),
                ],
              ),
              Divider(
                color: kBorderColor,
              ),
              Row(
                children: [
                  Text(
                    "Total Borrow Price",
                    style: kBaseTextStyle,
                  ),
                  const Spacer(),
                  Text(
                    "Rp 100.000",
                    style: kBaseTextStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Shipping",
                    style: kBaseTextStyle,
                  ),
                  const Spacer(),
                  Text(
                    "Rp 10.000",
                    style: kBaseTextStyle,
                  ),
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
                    "Rp 110.000",
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
          child: BlocBuilder<CheckoutCubit, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutDataLoaded) {
                if (state.statusWidget == StatusWidget.FAILURE) {
                  return const Center(
                    child: Text("Error"),
                  );
                }

                if (state.statusWidget == StatusWidget.SUCCESS) {
                  User user = state.user!;
                  CheckoutRequest data = state.data!;

                  return Padding(
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
                                      // Navigator.pushNamed(context, "/address");
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
                                user.name ?? "-",
                                style: kBaseSemiBoldTextStyle,
                              ),
                              Text(
                                "${user.primaryAddress?.streetAddress1}, ${user.primaryAddress?.streetAddress2 ?? ""}",
                                style: kSmallTextStyle,
                              ),
                              Text(
                                "${user.primaryAddress?.city?.name}, ${user.primaryAddress?.province?.name}",
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
                                    user.primaryAddress?.phone ?? "-",
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
                            itemCount: data.books.length,
                            itemBuilder: ((context, index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      data.books[index].thumbnail!,
                                      width: 60,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.data!.books[index].title!,
                                          style: kBaseSemiBoldTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          state.data!.books[index].authors!
                                              .map((e) => e.name!)
                                              .join(", "),
                                          style: kSmallTextStyle,
                                        ),
                                        Divider(
                                          color: kBorderColor,
                                        ),
                                        Text(
                                          "1 x Rp ${user.membership?.finePerWeeks}",
                                          style: kSmallSemiBoldTextStyle,
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
                          onTap: () {
                            Modular.to.pushNamed(Routes.shipping);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Text("Choose Shipping Method",
                                    style: kBaseTextStyle),
                                const Spacer(),
                                Row(
                                  children: [
                                    Text("-", style: kBaseTextStyle),
                                    const SizedBox(width: 5),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16,
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
                  );
                }
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }
}
