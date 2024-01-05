part of "../page.dart";

class ShippingPage extends StatefulWidget {
  const ShippingPage({super.key});

  @override
  State<ShippingPage> createState() => _ShippingPageState();
}

class _ShippingPageState extends State<ShippingPage> {
  @override
  void initState() {
    super.initState();
    context.read<CheckoutCubit>().init();
    context.read<CheckoutCubit>().getCheckoutData();
    // context.read<CheckoutCubit>().getCost(origin: origin, destination: destination, weight: weight, courier: courier)
  }

  Future showOptions(CheckoutCubit cubit) async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return BlocListener<CheckoutCubit, CheckoutState>(
              listener: (context, state) {
                if (state is CheckoutDataLoaded) {
                  setModalState(() {});
                }
              },
              child: Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * 0.5,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    if (cubit.state.statusWidget == StatusWidget.LOADMORE)
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    if (cubit.state.statusWidget == StatusWidget.SUCCESS)
                      for (var item in cubit.state.costs!)
                        GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "${item.service!} (Rp. ${item.price}) ${item.etd!} Hari",
                                    style: kBaseSemiBoldTextStyle),
                                const Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "Choose Courier",
      child: BlocBuilder<CheckoutCubit, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutDataLoaded) {
            if (state.statusWidget == StatusWidget.FAILURE) {
              return Center(
                child: Text(state.err!),
              );
            }

            if (state.statusWidget == StatusWidget.SUCCESS) {
              User user = state.user!;

              void _getCost(String courier) {
                context.read<CheckoutCubit>().getCost(
                      origin: "9",
                      destination: user.primaryAddress!.city!.id!.toString(),
                      weight: 1000,
                      courier: courier,
                    );
              }

              return Column(children: [
                GestureDetector(
                  onTap: () {
                    _getCost("jne");
                    showOptions(context.read<CheckoutCubit>());
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: const BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(children: [
                      Text(
                        "JNE",
                        style: kBaseSemiBoldTextStyle,
                      ),
                      const Spacer(),
                      Icon(Icons.arrow_forward_ios, color: kPrimaryColor)
                    ]),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    _getCost("tiki");
                    showOptions(context.read<CheckoutCubit>());
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: const BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(children: [
                      Text(
                        "TIKI",
                        style: kBaseSemiBoldTextStyle,
                      ),
                      const Spacer(),
                      Icon(Icons.arrow_forward_ios, color: kPrimaryColor)
                    ]),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    _getCost("pos");
                    showOptions(context.read<CheckoutCubit>());
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: const BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(children: [
                      Text(
                        "POS",
                        style: kBaseSemiBoldTextStyle,
                      ),
                      const Spacer(),
                      Icon(Icons.arrow_forward_ios, color: kPrimaryColor)
                    ]),
                  ),
                ),
              ]);
            }
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
