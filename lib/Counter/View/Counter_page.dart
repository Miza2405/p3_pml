import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p3_pml/Counter/Block/Counter_bloc.dart';
import 'package:p3_pml/Counter/Block/Counter_event.dart';
import 'package:p3_pml/Counter/Block/Counter_state.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final TextEditingController _stepController = TextEditingController(text: '1');

  int get _stepValue {
    final value = int.tryParse(_stepController.text.trim());
    return value ?? 1;
  }

  void _showMultipleOfTenSnackBar(int value) {
    if (value % 10 == 0 && value != 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Nilai mencapai kelipatan 10: $value'),
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  void dispose() {
    _stepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Bloc')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocListener<CounterBloc, Counterstate>(
             listener: (context, state) {
               _showMultipleOfTenSnackBar(state.angka);
             },
             child: BlocBuilder<CounterBloc, Counterstate>(
               builder: (context, state) {
                 Color textColor;
                 if (state.angka > 0) {
                   textColor = Colors.green;
                 } else if (state.angka < 0) {
                   textColor = Colors.red;
                 } else {
                   textColor = Colors.black;
                 }

                 return Text(
                   '${state.angka}',
                   style: TextStyle(
                     fontSize: 48,
                     fontWeight: FontWeight.bold,
                     color: textColor,
                   ),
                 );
               },
             ),
            ),
            const SizedBox(height: 20),
            SizedBox(
             width: 180,
             child: TextField(
               controller: _stepController,
               keyboardType: TextInputType.number,
               textAlign: TextAlign.center,
               decoration: const InputDecoration(
                 labelText: 'Masuakan Angka',
                 border: OutlineInputBorder(),
                 contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
               ),
             ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'tambah',
            onPressed: () {
             context.read<CounterBloc>().add(CounterTambahan(Jumblah: _stepValue));
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'kurang',
            onPressed: () {
             context.read<CounterBloc>().add(CounterKurangan(Jumblah: _stepValue));
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'reset',
            onPressed: () {
             context.read<CounterBloc>().add(CounterRiset());
            },
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

