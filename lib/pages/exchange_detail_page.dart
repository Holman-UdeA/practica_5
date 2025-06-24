import 'package:flutter/material.dart';
import '../models/exchange_rate.dart';

class ExchangeDetailPage extends StatelessWidget {
  final ExchangeRate rate;

  const ExchangeDetailPage({Key? key, required this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle de ${rate.currency}'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.monetization_on, size: 64, color: Colors.green[800]),
              const SizedBox(height: 16),
              Text(
                rate.currency,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Tasa respecto a ${rate.base}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                rate.rate.toStringAsFixed(4),
                style: TextStyle(fontSize: 26, color: Colors.green[900]),
              ),
              const SizedBox(height: 10),
              Divider(),
              Text(
                'Actualizado el ${rate.date}',
                style: TextStyle(color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}