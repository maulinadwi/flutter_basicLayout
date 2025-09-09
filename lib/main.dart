import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Strawberry Pavlova',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Strawberry Pavlova'),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9, // Responsif: 90% lebar layar
              height: MediaQuery.of(context).size.height * 0.5, // Responsif: 50% tinggi layar
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: const _PavlovaDescription(),
                  ),
                  Expanded(
                    flex: 1,
                    child: const _PavlovaPhoto(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PavlovaDescription extends StatelessWidget {
  const _PavlovaDescription();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Strawberry Pavlova',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.',
          ),
          const SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              const Icon(Icons.star, color: Colors.yellow),
              const Icon(Icons.star, color: Colors.yellow),
              const Icon(Icons.star, color: Colors.yellow),
              const Icon(Icons.star, color: Colors.yellow),
              const Icon(Icons.star_half, color: Colors.yellow),
              const SizedBox(width: 5.0),
              const Text('170 Reviews'),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const _CookingTime('PREP:', '25 min'),
              const _CookingTime('COOK:', '1 hr'),
              const _CookingTime('FEEDS:', '4-6'),
            ],
          ),
        ],
      ),
    );
  }
}

class _CookingTime extends StatelessWidget {
  const _CookingTime(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 12.0),
        ),
      ],
    );
  }
}

class _PavlovaPhoto extends StatelessWidget {
  const _PavlovaPhoto();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/pancake.jpeg', // Path ke gambar di folder assets
      fit: BoxFit.cover, // Menyesuaikan gambar agar sesuai dengan container
      errorBuilder: (context, error, stackTrace) {
        return const Center(
          child: Icon(
            Icons.error,
            color: Colors.red,
            size: 50.0,
          ),
        ); // Menampilkan ikon error jika gambar gagal dimuat
      },
    );
  }
}