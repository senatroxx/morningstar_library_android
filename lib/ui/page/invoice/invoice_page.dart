part of '../page.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({super.key});

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  final form = FormGroup({
    ...CustomFormControl.name,
  });

  @override
  Widget build(BuildContext context) {
    return MyListView(children: [
      const SizedBox(
        height: 10,
      ),
      // ReactiveForm(
      //   formGroup: form,
      //   child: const CustomTextField(
      //     "Search transaction, invoice, etc.",
      //     formName: "formName",
      //     icon: Icon(Icons.search),
      //   ),
      // ),
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
