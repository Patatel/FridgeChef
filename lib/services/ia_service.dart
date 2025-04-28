import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';

class RecipeAIService {
  // Dans un vrai projet, ce serait une vraie API comme OpenAI ou autre
  // Pour le MVP, nous simulons les réponses
  Future<List<Recipe>> getRecipeSuggestions(List<String> ingredients) async {
    // Simulons un délai réseau pour l'effet
    await Future.delayed(Duration(seconds: 1));
    
    // En production, nous ferions un appel API comme:
    // final response = await http.post(
    //   Uri.parse('https://api.openai.com/v1/completions'),
    //   headers: {...},
    //   body: jsonEncode({...}),
    // );
    
    // Pour le prototype, retournons des recettes simulées
    return [
      Recipe(
        id: '1',
        title: 'Omelette aux légumes',
        imageUrl: 'https://via.placeholder.com/150',
        ingredients: ['œufs', 'poivron', 'oignon', 'sel', 'poivre'],
        steps: [
          'Battre les œufs dans un bol',
          'Couper les légumes en petits morceaux',
          'Faire revenir les légumes dans une poêle',
          'Verser les œufs battus',
          'Cuire à feu moyen pendant 5 minutes'
        ],
        environmentScore: 8.5,
      ),
      Recipe(
        id: '2',
        title: 'Salade de pâtes',
        imageUrl: 'https://via.placeholder.com/150',
        ingredients: ['pâtes', 'tomates', 'concombre', 'huile d\'olive', 'basilic'],
        steps: [
          'Cuire les pâtes al dente',
          'Couper les légumes en dés',
          'Mélanger tous les ingrédients',
          'Assaisonner avec l\'huile d\'olive et les herbes'
        ],
        environmentScore: 7.8,
      ),
      Recipe(
        id: '3',
        title: 'Smoothie aux fruits',
        imageUrl: 'https://via.placeholder.com/150',
        ingredients: ['banane', 'fraises', 'yaourt', 'miel'],
        steps: [
          'Éplucher et couper les fruits',
          'Mettre tous les ingrédients dans un mixeur',
          'Mixer jusqu\'à obtention d\'une texture lisse'
        ],
        environmentScore: 9.2,
      ),
    ];
  }
}