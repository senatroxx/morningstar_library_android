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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      right: 16,
                      left: 16,
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
                          style: kXSmallTextStyle,
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
                      style: kXSmallSemiBoldTextStyle.copyWith(
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
            IntrinsicHeight(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      "https://picsum.photos/200/300",
                      width: 50,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "The Tell Tale Heart And Other Stories",
                          style: kBaseSemiBoldTextStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "1 Barang",
                          style: kSmallTextStyle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text("+1 Produk lainnya", style: kSmallTextStyle),
            Divider(
              color: kBorderColor,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Total",
                        style: kXSmallSemiBoldTextStyle,
                      ),
                      Text(
                        "Rp 100.000",
                        style: kSmallSemiBoldTextStyle,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Ongkir",
                        style: kXSmallSemiBoldTextStyle,
                      ),
                      Text(
                        "Rp 10.000",
                        style: kSmallSemiBoldTextStyle,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Total Bayar",
                        style: kXSmallSemiBoldTextStyle,
                      ),
                      Text(
                        "Rp 110.000",
                        style: kSmallSemiBoldTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
