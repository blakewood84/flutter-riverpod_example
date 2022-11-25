import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) => 0);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.blueAccent,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            ref.read(counterProvider.notifier).state++;
          },
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final counter = ref.watch(counterProvider);
                return Text(
                  'Count $counter',
                  style: const TextStyle(fontSize: 30),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
