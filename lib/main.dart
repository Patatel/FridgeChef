import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/ingredients.dart';
import 'screens/recipe.dart';
import 'screens/details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FridgeChef',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/ingredients': (context) => const IngredientsScreen(),
        '/recipes': (context) => const RecipesScreen(),
        '/recipe-detail': (context) => const RecipeDetailScreen(),
      },
    );
  }
}