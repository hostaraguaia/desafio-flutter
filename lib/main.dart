import 'package:flutter/material.dart';

import 'env/env_app.dart';
import 'main/main_widget.dart';
import 'theme/theme_app.dart';

void main() {
  runApp(
    MainWidget(
      title: EnvApp.title,
      theme: ThemeApp.data,
      child: const Material(
        child: Center(child: Text('Hello World!')),
      ),
    ),
  );
}
