// Providers
import 'package:auth_starter/providers/auth_provider.dart';
import 'package:auth_starter/screens/home_screen.dart';

// Screens
import 'package:auth_starter/screens/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>.value(value: AuthProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        initialRoute: '/',
        title: 'Daycare App',
        routes: {
          '/': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
        },
      ),
    ));
