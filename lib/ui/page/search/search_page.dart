part of '../page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final form = FormGroup({
    ...CustomFormControl.name,
  });

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      showAppBar: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Modular.to.maybePop();
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    right: 8.0,
                    bottom: 8.0,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: kBlackColor,
                    // size: 36,
                  ),
                ),
              ),
              // Expanded(
              //   child: ReactiveForm(
              //     formGroup: form,
              //     child: const CustomTextField(
              //       "Search",
              //       formName: "formName",
              //       icon: Icon(Icons.search),
              //     ),
              //   ),
              // ),
            ],
          ),
          ListView.builder(
            padding: const EdgeInsets.only(bottom: 5, top: 10),
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return Container(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.history,
                      color: kSubtitleColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Search History",
                      style: kBaseTextStyle,
                    ),
                    const Spacer(),
                    Icon(
                      Icons.close,
                      color: kSubtitleColor,
                    )
                  ],
                ),
              );
            }),
            itemCount: 5,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Recently Viewed",
            style: kBaseSemiBoldTextStyle,
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 280,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 20,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(10),
                  width: 140,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 190,
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
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        strutStyle: const StrutStyle(fontSize: 12.0),
                        text: TextSpan(
                          text: "The Tell Tale Heart And Other Stories",
                          style: kSmallTextStyle,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
