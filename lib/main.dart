import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'consts/theme_data.dart';
import 'providers/theme_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return ThemeProvider();
        })
      ],
      child: Consumer<ThemeProvider>(builder: (
        context,
        themeProvider,
        child,
      ) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tadas new app',
          theme: Styles.themeData(
            isDarkTheme: themeProvider.getIsDarkTheme,
            context: context,
          ),
          home: const HomeScreen(),
        );
      }),
    );
  }
}
