import 'package:flutter/material.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
    required this.title,
    required this.theme,
    required this.child,
  });

  final String title;
  final ThemeData theme;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: theme,
      home: child,
    );
  }
}
