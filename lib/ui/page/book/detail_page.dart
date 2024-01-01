part of '../page.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "",
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(children: [
          Expanded(
            child: ButtonPrimary(
              title: "Add to cart",
              callbackfunc: () {},
              color: kWhiteColor,
              borderSide: BorderSide(color: kPrimaryColor, width: 2),
              fontColor: kPrimaryColor,
            ),
          ),
          const SizedBox(width: 10),
          ButtonPrimary(
            title: "Borrow",
            callbackfunc: () {},
          ),
        ]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Image(
              image: NetworkImage(
                'https://picsum.photos/200/350',
              ),
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
                  "The Tell Tale Heart And Other Stories",
                  style: kHeadline4TextStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Michael Kelahan",
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
                      "Available: 10",
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
                  "Lorem ipsum dolo sit amet, consectetur a dipiscing elit. Nulla vitae nunc sed dolor pretium aliquet. Sed auctor, nisl quis tincidunt aliquam, nunc nibh ultricies diam, quis luctus nisl magna ut nisl. Sed auctor, nisl quis tincidunt aliquam, nunc nibh ultricies diam, quis luctus nisl magna ut nisl.",
                  style: kSmallTextStyle,
                  textAlign: TextAlign.justify,
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
                                text: "The Tell Tale Heart And Other Stories",
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
      ),
    );
  }
}
