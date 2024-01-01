part of 'card.dart';

class InvoiceCard extends StatelessWidget {
  const InvoiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kBorderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      right: 18,
                      left: 10,
                    ),
                    child: Icon(
                      Icons.receipt_long_rounded,
                      color: kPrimaryColor,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Book",
                          style: kSmallSemiBoldTextStyle,
                        ),
                        Text(
                          "23 Des 2023",
                          style: kSubtitleTextStyle,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: kSuccessBgColor,
                    ),
                    child: Text(
                      "Success",
                      style: kSmallSemiBoldTextStyle.copyWith(
                        color: kSuccessColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: kBorderColor,
            ),
          ],
        ),
      ),
    );
  }
}
