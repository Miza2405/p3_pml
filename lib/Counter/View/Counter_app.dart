import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p3_pml/Counter/Block/Counter_bloc.dart';
import 'package:p3_pml/Counter/View/Counter_page.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
            home: CounterPage(),
        ),
    );
  }
}