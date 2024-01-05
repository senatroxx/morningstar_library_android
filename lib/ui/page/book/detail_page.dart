part of '../page.dart';

class BookDetailPage extends StatefulWidget {
  final String slug;
  const BookDetailPage({super.key, required this.slug});

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    context.read<BookCubit>().setStatePaginate();
    context.read<BookCubit>().show(slug: widget.slug);
    print(widget.slug);
  }

  void _toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        Widget child = Container();
        if (state is BookDataLoaded) {
          if (state.statusWidget == StatusWidget.INITIAL) {
            child = const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.statusWidget == StatusWidget.FAILURE) {
            child = Center(
              child: Text(state.err ?? ""),
            );
          }

          if (state.statusWidget == StatusWidget.LOAD) {
            child = const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.statusWidget == StatusWidget.SUCCESS) {
            Book book = state.books.first;

            child = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ImageNetwork(
                    book.thumbnail!,
                    fit: BoxFit.fitHeight,
                    height: 300,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.title!,
                        style: kHeadline4TextStyle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        book.authors!.map((e) => e.name!).join(", "),
                        style: kBaseTextStyle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Divider(
                        color: kBorderColor,
                      ),
                      Row(
                        children: [
                          Text(
                            "Available: ${book.quantity!}",
                            style: kSmallTextStyle,
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.favorite_outline,
                            ),
                          ),
                          const SizedBox(width: 16),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.share,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: kBaseSemiBoldTextStyle,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        book.description!,
                        style: kSmallTextStyle,
                        maxLines: isExpanded ? null : 10,
                        overflow: TextOverflow.fade,
                      ),
                      const SizedBox(height: 10),
                      ButtonPrimary(
                        title: isExpanded ? "Read Less" : "Read More",
                        color: kWhiteColor,
                        fontColor: kPrimaryColor,
                        borderSide: BorderSide(color: kPrimaryColor, width: 2),
                        fullWidth: true,
                        callbackfunc: _toggleExpanded,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Other Books",
                        style: kBaseSemiBoldTextStyle,
                      ),
                      SizedBox(
                        height: 330,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 20,
                          scrollDirection: Axis.horizontal,
                          // padding: EdgeInsets.symmetric(horizontal: 16),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.all(10),
                              width: 180,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 240,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        "https://picsum.photos/200/300",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  RichText(
                                    text: TextSpan(
                                      text:
                                          "The Tell Tale Heart And Other Stories",
                                      style: kSubtitleTextStyle,
                                    ),
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          // ignore: no_leading_underscores_for_local_identifiers
          _addToCart() {
            CustomSnackBar(context).showSnackbar("Added to cart");
            StoreKeyValue().addCart(state.books.first);
          }

          return MyScaffold(
            title: "",
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(children: [
                Expanded(
                  child: ButtonPrimary(
                    title: "Add to cart",
                    callbackfunc: state.statusWidget == StatusWidget.SUCCESS
                        ? _addToCart
                        : null,
                    color: kWhiteColor,
                    borderSide: BorderSide(color: kPrimaryColor, width: 2),
                    fontColor: kPrimaryColor,
                  ),
                ),
                const SizedBox(width: 10),
                const ButtonPrimary(
                  title: "Borrow",
                  callbackfunc: null,
                ),
              ]),
            ),
            child: child,
          );
        }

        return Container();
      },
    );
  }
}
