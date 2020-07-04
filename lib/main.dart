// Providers
import 'package:auth_starter/providers/auth_provider.dart';
import 'package:auth_starter/providers/task_provider.dart';
import 'package:auth_starter/screens/home_screen.dart';

// Screens
import 'package:auth_starter/screens/login_screen.dart';
import 'package:auth_starter/screens/tasks/create_screen.dart';
import 'package:auth_starter/screens/tasks/index_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>.value(value: AuthProvider()),
        ChangeNotifierProvider<TaskProvider>.value(value: TaskProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        initialRoute: '/login',
        title: 'Daycare App',
        routes: {
          '/': (context) => HomeScreen(),
          '/login': (context) => LoginScreen(),
          '/tasks': (context) => TaskIndexScreen(),
          '/tasks/create': (context) => TaskCreateScreen()
        },
      ),
    ));
