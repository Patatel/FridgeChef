import 'package:flutter/material.dart';
import '../services/recipe_service.dart';
import '../models/recipe.dart';

class LoadingScreen extends StatefulWidget {
  final List<String> selectedIngredients;
  const LoadingScreen({Key? key, required this.selectedIngredients}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool _isLoading = true;
  List<Recipe> _recipes = [];

  @override
  void initState() {
    super.initState();
    _findRecipes();
  }

  Future<void> _findRecipes() async {
    try {
      final recipeService = RecipeService(); // Instancier ton service
      final recipes = await recipeService.findMatchingRecipes(widget.selectedIngredients);
      
      if (mounted) {
        setState(() {
          _isLoading = false;
          _recipes = recipes;
        });

        // Une fois les recettes récupérées, on navigue vers la page RecipesScreen
        Navigator.pushNamed(
          context,
          '/recipes',
          arguments: recipes, // Passe ici la liste des recettes
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur lors de la recherche des recettes: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chargement...'),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : const Text('Aucune recette trouvée'),
      ),
    );
  }
}
