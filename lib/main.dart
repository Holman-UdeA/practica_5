import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/exchange_rate.dart';
import 'pages/converter_page.dart';
import 'pages/favorites_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ExchangeRateAdapter());
  await Hive.openBox<ExchangeRate>('favoritesBox');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final _pages = [ConverterPage(), FavoritesPage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fixer Currency',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.currency_exchange), label: "Conversor"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favoritos"),
          ],
          onTap: (index) => setState(() => _currentIndex = index),
        ),
      ),
    );
  }
}

