import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:statefulclickcounter/model/stock_data.dart';

class StockPage extends StatelessWidget {
  const StockPage({required this.data, super.key});

  final StockData data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.shortName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SvgPicture.network(
                  data.logoUrl,
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                _infoSquare(
                  'Ativo',
                  data.symbol,
                  context,
                ),
                _infoSquare(
                  'Desempenho',
                  data.regularMarketChangePercent >= 0
                      ? '+${data.regularMarketChangePercent.toStringAsFixed(2)}%'
                      : '${data.regularMarketChangePercent.toStringAsFixed(2)}%',
                  context,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                _infoSquare(
                  'Valor Atual',
                  'R\$ ${data.regularMarketPrice.toStringAsFixed(2)}',
                  context,
                ),
                _infoSquare(
                  'Fechamento Anterior',
                  'R\$ ${data.regularMarketPreviousClose.toStringAsFixed(2)}',
                  context,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                _infoSquare(
                  'Máximo Dia',
                  'R\$ ${data.regularMarketDayHigh.toStringAsFixed(2)}',
                  context,
                ),
                _infoSquare(
                  'Mínimo Dia',
                  'R\$ ${data.regularMarketDayLow.toStringAsFixed(2)}',
                  context,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget _infoSquare(String title, String value, BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.08,
    width: MediaQuery.of(context).size.height * 0.2,
    padding: const EdgeInsets.all(8),
    margin: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
