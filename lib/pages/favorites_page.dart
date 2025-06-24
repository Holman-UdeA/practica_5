import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/exchange_rate.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final _box = Hive.box<ExchangeRate>('favoritesBox');

  @override
  Widget build(BuildContext context) {
    final keys = _box.keys.cast<String>().toList();

    return SafeArea(
      child: keys.isEmpty
          ? Center(child: Text('No hay favoritos'))
          : ListView.builder(
        itemCount: keys.length,
        itemBuilder: (_, index) {
          final rate = _box.get(keys[index]);
          return ListTile(
            title: Text('${rate?.currency}'),
            subtitle: Text('Base: ${rate?.base}, Tasa: ${rate?.rate.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _box.delete(keys[index]);
                setState(() {});
              },
            ),
          );
        },
      ),
    );
  }
}