part of 'custom_field.dart';

class CustomDropdownField2 extends StatefulWidget {
  final String title;
  final List<String> items;
  final Function(String?) onChanged;

  const CustomDropdownField2(this.title,
      {super.key, required this.items, required this.onChanged});

  @override
  State<CustomDropdownField2> createState() => _CustomDropdownField2State();
}

class _CustomDropdownField2State extends State<CustomDropdownField2> {
  String? _selectedItem = null;

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    final List<DropdownMenuItem<String>> menuItems = [];
    for (final String item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return menuItems;
  }

  List<double> _getCustomItemsHeights() {
    final List<double> itemsHeights = [];
    for (int i = 0; i < (widget.items.length * 2) - 1; i++) {
      if (i.isEven) {
        itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        itemsHeights.add(4);
      }
    }
    return itemsHeights;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        hint: Text(
          widget.title,
          style: kSubtitleTextStyle,
        ),
        onChanged: (value) {
          setState(() {
            _selectedItem = value;
            widget.onChanged(value);
          });
        },
        value: _selectedItem,
        items: _addDividersAfterItems(widget.items),
        isDense: true,
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            border: Border.all(
              color: kBorderColor,
            ),
            color: kWhiteColor,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: kBorderColor),
          ),
          padding: EdgeInsets.zero,
          elevation: 0,
        ),
        menuItemStyleData: MenuItemStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          customHeights: _getCustomItemsHeights(),
        ),
        iconStyleData: const IconStyleData(
          openMenuIcon: Icon(Icons.arrow_drop_up),
        ),
      ),
    );
  }
}
