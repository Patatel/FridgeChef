import 'package:flutter/material.dart';
import '../models/ingredients.dart';
import '../services/ia_service.dart';
import 'load.dart'; // Assure-toi que la page LoadingScreen est bien importée

class IngredientsScreen extends StatefulWidget {
  const IngredientsScreen({Key? key}) : super(key: key);

  @override
  State<IngredientsScreen> createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends State<IngredientsScreen> {
  final TextEditingController _ingredientController = TextEditingController();
  final List<String> _ingredients = [];
  bool _isLoading = false;

  final List<String> _suggestedIngredients = [
    'Oeufs',
    'Lait',
    'Farine',
    'Sucre',
    'Beurre',
    'Poulet',
    'Tomates',
    'Oignons',
    'Ail',
    'Pommes de terre',
    'Carottes',
    'Riz',
    'Pâtes',
    'Pain',
    'Fromage'
  ];

  @override
  void dispose() {
    _ingredientController.dispose();
    super.dispose();
  }

  void _addIngredient(String ingredient) {
    if (ingredient.trim().isNotEmpty &&
        !_ingredients.contains(ingredient.trim())) {
      setState(() {
        _ingredients.add(ingredient.trim());
        _ingredientController.clear();
      });
    }
  }

  void _removeIngredient(String ingredient) {
    setState(() {
      _ingredients.remove(ingredient);
    });
  }

  void _findRecipes() async {
    if (_ingredients.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ajoutez au moins un ingrédient')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final recipeService = RecipeAIService();
      final recipes = await recipeService.getRecipeSuggestions(_ingredients);

      if (mounted) {
        setState(() {
          _isLoading = false;
        });

        // Navigation vers la page LoadingScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoadingScreen(selectedIngredients: _ingredients),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes ingrédients'),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Entrée d'ingrédients
            TextField(
              controller: _ingredientController,
              decoration: InputDecoration(
                hintText: 'Ajouter un ingrédient',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
                suffixIcon: Icon(Icons.restaurant_menu,
                    color: Colors.green.shade700), // Optionnel: une petite icône déco
              ),
              onSubmitted: (value) => _addIngredient(value),
            ),

            const SizedBox(height: 20),

            // Suggestions d'ingrédients courants
            const Text(
              'Ingrédients courants',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _suggestedIngredients.map((ingredient) {
                return ActionChip(
                  label: Text(ingredient),
                  backgroundColor: Colors.green.shade100,
                  onPressed: () => _addIngredient(ingredient),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            // Liste des ingrédients ajoutés
            const Text(
              'Ingrédients disponibles',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _ingredients.isEmpty
                  ? Center(
                      child: Text(
                        'Aucun ingrédient ajouté',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _ingredients.length,
                      itemBuilder: (context, index) {
                        final ingredient = _ingredients[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            title: Text(ingredient),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _removeIngredient(ingredient),
                            ),
                          ),
                        );
                      },
                    ),
            ),

            const SizedBox(height: 20),

            // Bouton pour trouver des recettes
            ElevatedButton(
              onPressed: _isLoading ? null : () {
                if (_ingredients.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ajoutez au moins un ingrédient')),
                  );
                  return;
                }
                // Naviguer vers la page de chargement en passant la liste des ingrédients sélectionnés
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoadingScreen(selectedIngredients: _ingredients),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: _isLoading 
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text(
                    'Trouver des recettes',
                    style: TextStyle(fontSize: 18),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
