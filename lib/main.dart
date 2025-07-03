import 'package:flutter/material.dart';
import 'screens/fortune_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('tr_TR', null);
  runApp(const KahveFaliApp());
}

class KahveFaliApp extends StatelessWidget {
  const KahveFaliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kahve Falı Makinesi',
      debugShowCheckedModeBanner: false,
      home: const FortuneScreen(),
    );
  }
}
