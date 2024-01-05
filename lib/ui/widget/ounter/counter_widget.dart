import 'package:flutter/material.dart';
import 'package:morningstar_library/core/helper/helper.dart';

class Counter extends StatefulWidget {
  final Function(int) onChanged;
  final bool plusDisabled;
  final int value;
  final bool minusDisabled;

  const Counter({
    super.key,
    required this.value,
    required this.onChanged,
    this.plusDisabled = false,
    this.minusDisabled = false,
  });

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
      widget.onChanged(_counter);
    });
  }

  void _decrementCounter() {
    if (_counter > 1) {
      setState(() {
        _counter--;
        widget.onChanged(_counter);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: kBorderColor, // Color of the border
          width: 1.0, // Width of the border
        ),
        borderRadius: BorderRadius.circular(5.0), // Border corner radius
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: widget.minusDisabled ? null : _decrementCounter,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: kBorderColor, // Color of the border
                    width: 1.0, // Width of the border
                  ),
                ),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.remove,
                size: 16,
                color: widget.minusDisabled ? kGreyColor : null,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('${widget.value}', style: kBaseTextStyle),
          ),
          GestureDetector(
            onTap: widget.plusDisabled ? null : _incrementCounter,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: kBorderColor, // Color of the border
                    width: 1.0, // Width of the border
                  ),
                ),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.add,
                size: 16,
                color: widget.plusDisabled ? kGreyColor : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
