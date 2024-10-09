import 'package:flutter/material.dart';
import 'package:statefulclickcounter/model/stock.dart';
import 'package:statefulclickcounter/model/stock_data.dart';
import 'package:statefulclickcounter/pages/stock_page.dart';
import 'package:statefulclickcounter/service/http_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relatório de Ações'),
      ),
      body: FutureBuilder(
        future: HttpService().getStocks(),
        initialData: const [],
        builder: (context, stocks) {
          if (stocks.data != null) {
            return ListView.builder(
              itemCount: stocks.data?.length,
              itemBuilder: (context, index) {
                Stock stock = stocks.data![index];

                return ListTile(
                  onTap: () async {
                    try {
                      StockData data =
                          await HttpService().getSpecificStock(stock);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StockPage(data: data),
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Erro ao buscar detalhes de ${stock.name}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  title: Text(stock.name),
                  subtitle: Text(stock.stock),
                  leading: SvgPicture.network(stock.logo),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Variação',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        stock.change >= 0
                            ? '+${stock.change.toStringAsFixed(2)}%'
                            : '${stock.change.toStringAsFixed(2)}%',
                        style: TextStyle(
                          fontSize: 12,
                          color: stock.change >= 0 ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
