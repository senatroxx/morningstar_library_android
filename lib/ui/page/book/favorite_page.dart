part of "../page.dart";

class BookFavoritePage extends StatefulWidget {
  const BookFavoritePage({super.key});

  @override
  State<BookFavoritePage> createState() => _BookFavoritePageState();
}

class _BookFavoritePageState extends State<BookFavoritePage> {
  final form = FormGroup({
    "formName": FormControl<String>(validators: [Validators.required]),
  });

  @override
  Widget build(BuildContext context) {
    return MyListView(
      children: [
        const SizedBox(
          height: 10,
        ),
        // ReactiveForm(
        //   formGroup: form,
        //   child: const CustomTextField(
        //     "Search your favorited book",
        //     formName: "formName",
        //     icon: Icon(Icons.search),
        //   ),
        // ),
        const SizedBox(height: 10),
        Text(
          "170 Books",
          style: kSmallSemiBoldTextStyle,
        ),
        const SizedBox(height: 10),
        GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          shrinkWrap: true,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          physics: const ClampingScrollPhysics(),
          children: List.generate(20, (index) {
            return Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Important to prevent overflow
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
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
                  Expanded(
                    child: Text(
                      "The Tell Tale Heart And Other Stories",
                      style: kSmallTextStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
