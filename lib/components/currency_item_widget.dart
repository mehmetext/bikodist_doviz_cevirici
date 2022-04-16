import 'dart:ui';

import 'package:flutter/material.dart';

class CurrencyItemWidget extends StatefulWidget {
  String title;
  void Function(String) callback;

  CurrencyItemWidget({
    Key? key,
    required this.title,
    required this.callback,
  }) : super(key: key);

  @override
  _CurrencyItemWidgetState createState() => _CurrencyItemWidgetState();
}

class _CurrencyItemWidgetState extends State<CurrencyItemWidget> {
  String _selected = 'TRY';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${widget.title}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: DropdownButton<String>(
              isExpanded: true,
              value: _selected,
              hint: Text('Para Birimi Seç'),
              onChanged: (String? val) {
                setState(() {
                  _selected = val!;
                });
                widget.callback(val!);
              },
              items: [
                DropdownMenuItem(
                  value: 'TRY',
                  child: Text(
                    'TRY',
                  ),
                ),
                DropdownMenuItem(
                  value: 'USD',
                  child: Text(
                    'USD',
                  ),
                ),
                DropdownMenuItem(
                  value: 'EUR',
                  child: Text(
                    'EUR',
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
