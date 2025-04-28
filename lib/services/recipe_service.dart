// fichier : lib/services/recipe_service.dart

import '../data/recipe_data.dart';
import '../models/recipe.dart';

class RecipeService {
  /// Retourne les recettes correspondantes à au moins 50% des ingrédients disponibles
  List<Recipe> findMatchingRecipes(List<String> selectedIngredients) {
    // Si aucun ingrédient n'est sélectionné, retourne une liste vide
    if (selectedIngredients.isEmpty) {
      return [];
    }

    return allRecipes.where((recipe) {
      // Vérifie si au moins un des ingrédients sélectionnés est dans les ingrédients de la recette
      return selectedIngredients.any((ingredient) => 
          recipe.ingredients.contains(ingredient));
    }).toList();
  }
}
