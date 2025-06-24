import 'package:flutter/material.dart';

class RateCard extends StatelessWidget {
  final String currency;
  final double rate;
  final VoidCallback onFavorite;
  final VoidCallback? onTap;
  final bool isFavorite;

  RateCard({
    required this.currency,
    required this.rate,
    required this.onFavorite,
    this.onTap,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(currency),
        subtitle: Text('Tasa: ${rate.toStringAsFixed(2)}'),
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : null,
          ),
          onPressed: onFavorite,
        ),
        onTap: onTap,
      ),
    );
  }
}
