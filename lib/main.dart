import 'package:flutter/material.dart';
import 'injectable/injectable_init.dart';
import 'presentation/app/app_page.dart';

void main() {
  configureDependencies();
  runApp(const AppPage());
}
