import 'package:flutter/material.dart';

void main() {
  runApp(const ShopLiteApp());
}

class ShopLiteApp extends StatelessWidget {
  const ShopLiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopLite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo),
      home: const MyHomePage(title: 'ShopLite — Сагс'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const int _max = 10;
  int _count = 0;

  void _increment() => setState(() => _count++);

  void _decrement() {
    if (_count > 0) setState(() => _count--);
  }

  void _reset() => setState(() => _count = 0);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Тэглэх',
            onPressed: _reset,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Сагсанд байгаа бараа:'),
            Text('$_count', style: Theme.of(context).textTheme.headlineMedium),
            if (_count >= _max)
              Text(
                'Нэг удаад 10-аас олон бараа захиалах боломжгүй',
                style: TextStyle(color: colors.error),
              ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: _count >= _max ? null : _increment,
            tooltip: 'Нэмэх',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: _decrement,
            tooltip: 'Хасах',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
