import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/exchange_rate.dart';
import '../repository/fixer_api.dart';
import '../widgets/rate_card.dart';
import 'exchange_detail_page.dart';

class ConverterPage extends StatefulWidget {
  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  final _fixerService = FixerService();
  String _selectedBase = 'EUR';
  Map<String, dynamic> _rates = {};
  String _date = '';

  @override
  void initState() {
    super.initState();
    _loadRates();
  }

  Future<void> _loadRates() async {
    final data = await _fixerService.getRates(_selectedBase);
    setState(() {
      _rates = data['rates'];
      _date = data['date'];
    });
  }

  void _addToFavorites(String currency, double rate) async {
    final box = Hive.box<ExchangeRate>('favoritesBox');
    if (box.containsKey(currency)) {
      // Eliminar si ya está
      await box.delete(currency);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Eliminado de favoritos')));
    } else {
      // Agregar nuevo
      final exchange = ExchangeRate(
        currency: currency,
        rate: rate,
        base: _selectedBase,
        date: _date,
      );
      await box.put(currency, exchange);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Agregado a favoritos')));
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 20),
          Text('Moneda base: EUR', style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children:
                  _rates.entries.map((e) {
                    final favoritesBox = Hive.box<ExchangeRate>('favoritesBox');
                    final isFav = favoritesBox.containsKey(e.key);
                    return RateCard(
                      currency: e.key,
                      rate: (e.value as num).toDouble(),
                      isFavorite: isFav,
                      onFavorite:
                          () => _addToFavorites(
                            e.key,
                            (e.value as num).toDouble(),
                          ),
                      onTap: () {
                        final selected = ExchangeRate(
                          currency: e.key,
                          rate: (e.value as num).toDouble(),
                          base: _selectedBase,
                          date: _date,
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ExchangeDetailPage(rate: selected),
                          ),
                        );
                      },
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
