import 'package:flutter/material.dart';
import 'package:flutter_example/di/dependency_injection.dart' as dependency;
import 'package:flutter_example/ui/search_page.dart';

void main() async {
  await dependency.inject();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}
