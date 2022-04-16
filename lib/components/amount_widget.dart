import 'package:flutter/material.dart';

class AmountWidget extends StatefulWidget {
  String title;
  TextEditingController ctrlr;
  bool isEditable = true;

  AmountWidget({
    Key? key,
    required this.title,
    required this.ctrlr,
    this.isEditable = true,
  }) : super(key: key);

  @override
  _AmountWidgetState createState() => _AmountWidgetState();
}

class _AmountWidgetState extends State<AmountWidget> {
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
            child: TextFormField(
              controller: widget.ctrlr,
              enabled: widget.isEditable,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
