import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gritstone_task_shamsu/provider/route_provider.dart';
import 'package:gritstone_task_shamsu/screens/home_screen.dart';
import 'package:gritstone_task_shamsu/utils/my_http_orverride.dart';
import 'package:provider/provider.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RouteProvider>(
      create: (_) => RouteProvider()..loadRoutes(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
