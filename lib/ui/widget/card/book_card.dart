part of "card.dart";

class BookCard extends StatelessWidget {
  final Book book;
  final double? width;

  const BookCard(
    this.book, {
    super.key,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed("${Routes.bookDetail}${book.slug}");
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        width: width,
        child: Column(
          children: [
            SizedBox(
              height: 240,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ImageNetwork(
                  book.thumbnail!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              book.title!,
              style: kSubtitleTextStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
