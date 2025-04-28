import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Récupérer les recettes depuis les arguments passés lors de la navigation
    final List<Recipe> recipes = ModalRoute.of(context)!.settings.arguments as List<Recipe>;
    print(recipes);  // Vérifie que les recettes sont bien passées

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recettes suggérées'),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Retourne directement à la page IngredientsScreen
            Navigator.popUntil(context, ModalRoute.withName('/ingredients'));
          },
        ),
      ),
      body: recipes.isEmpty
          ? const Center(
              child: Text(
                'Aucune recette trouvée.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : Column(
              children: [
                // En-tête avec explication
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.green.shade50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${recipes.length} recettes trouvées',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade800,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Notre IA a analysé vos ingrédients et optimisé les suggestions pour réduire le gaspillage et l\'impact environnemental.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                
                // Liste des recettes
                Expanded(
                  child: ListView.builder(
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = recipes[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/recipe-detail',
                            arguments: recipe,
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          clipBehavior: Clip.antiAlias,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Image de la recette
                              Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(recipe.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: recipe.imageUrl.isEmpty
                                    ? const Center(
                                        child: Icon(Icons.image, size: 50, color: Colors.grey),
                                      )
                                    : null,
                              ),
                              
                              // Infos de la recette
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            recipe.title,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        _buildEcoScore(recipe.environmentScore),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      recipe.ingredients.take(3).join(', ') + 
                                      (recipe.ingredients.length > 3 ? '...' : ''),
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildEcoScore(double score) {
    final Color color = score > 7 
        ? Colors.green 
        : (score > 4 ? Colors.orange : Colors.red);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.eco,
            size: 16,
            color: color,
          ),
          const SizedBox(width: 4),
          Text(
            score.toStringAsFixed(1),
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
