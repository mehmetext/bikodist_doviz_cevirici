import 'dart:convert';

import 'package:bikodist_doviz_cevirici/components/amount_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'components/currency_item_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String from = 'TRY', to = 'TRY';
  TextEditingController amountCtrlr = TextEditingController();
  TextEditingController resultCtrlr = TextEditingController();

  String apiKey = '3256e7ed60974e1bc8ca';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bi Kodist Döviz Çevirici'),
      ),
      body: _bodyWidget,
    );
  }

  Widget get _bodyWidget => SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CurrencyItemWidget(
              title: 'Şundan:',
              callback: (String val) {
                from = val;
              },
            ),
            CurrencyItemWidget(
              title: 'Şuna:',
              callback: (String val) {
                to = val;
              },
            ),
            AmountWidget(
              ctrlr: amountCtrlr,
              title: 'Miktar Gir:',
            ),
            ElevatedButton(
              onPressed: _convert,
              child: Text("Çevir"),
            ),
            AmountWidget(
              ctrlr: resultCtrlr,
              title: 'Sonuç:',
              isEditable: false,
            ),
          ],
        ),
      );

  Future<void> _convert() async {
    if (from != '' && to != '') {
      try {
        Uri url = Uri.parse(
            'https://free.currconv.com/api/v7/convert?q=${from}_$to&compact=ultra&apiKey=$apiKey');
        http.Response response = await http.get(url);
        Map<String, dynamic> decoded = jsonDecode(response.body);
        num rate = decoded['${from}_$to'];
        double result = double.parse(amountCtrlr.text) * rate;
        resultCtrlr.text = result.toStringAsFixed(4);
      } catch (e) {
        print(e);
      }
    }
  }
}
