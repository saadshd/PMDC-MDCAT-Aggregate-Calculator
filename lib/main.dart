import 'package:flutter/material.dart';
import 'package:merit_calculator/utils/app_color.dart';
import 'package:merit_calculator/view/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:merit_calculator/provider/aggregate_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AggregateProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aggregate Calculator',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

