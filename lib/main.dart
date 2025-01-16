import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'auth_screen.dart';
import 'recipes_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: "/pageRecipes",
        builder: (context, state) => const RecipesScreen(),
      ),
      GoRoute(
        path: "/pageAuth",
        builder: (context, state) => AuthScreen(),
      ),
    ],
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Кулинарные рецепты',
      debugShowCheckedModeBanner: false,
        routerConfig: _router
    );
  }
}

// ЭКРАН 1. Главный экран
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Кулинарные рецепты'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Добро пожаловать!',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 26),

            ElevatedButton(
              onPressed: () {
                context.push("/pageRecipes");
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(256, 56),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Посмотреть рецепты"),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                context.pushReplacement("/pageAuth");
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(256, 56),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Выйти из аккаунта"),
            ),
          ],
        ),
      ),
    );
  }
}

