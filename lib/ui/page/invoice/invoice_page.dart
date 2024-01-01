part of '../page.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListView(children: [
      const SizedBox(
        height: 10,
      ),
      const CustomTextField(
        "Search transaction, invoice, etc.",
        formName: "formName",
        icon: Icon(Icons.search),
      ),
      const SizedBox(
        height: 5,
      ),
      SizedBox(
        height: 35,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            CustomDropdownField2(
              "All Status",
              items: const ["All Status", "Success", "Failed", "Pending"],
              onChanged: (a) {},
            ),
            const SizedBox(width: 10),
            CustomDropdownField2(
              "All Product",
              items: const ["All Status", "Success", "Failed", "Pending"],
              onChanged: (a) {},
            ),
            const SizedBox(width: 10),
            CustomDropdownField2(
              "All Date",
              items: const ["All Status", "Success", "Failed", "Pending"],
              onChanged: (a) {},
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      InvoiceCard(),
    ]);
  }
}
