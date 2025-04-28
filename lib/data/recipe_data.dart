// fichier : lib/data/recipes_data.dart

import '../models/recipe.dart';

final List<Recipe> allRecipes = [
  Recipe(
    id: 'r1',
    title: 'Omelette classique',
    imageUrl: 'https://source.unsplash.com/featured/?omelette',
    ingredients: ['Oeufs', 'Lait', 'Beurre', 'Sel', 'Poivre'],
    steps: [
      'Battre les oeufs avec le lait.',
      'Faire fondre le beurre dans une poêle.',
      'Verser le mélange et cuire à feu doux.',
      'Assaisonner avec sel et poivre.',
    ],
    environmentScore: 8.2,
  ),
  Recipe(
    id: 'r2',
    title: 'Pâtes à la sauce tomate',
    imageUrl: 'https://source.unsplash.com/featured/?pasta,tomato',
    ingredients: ['Pâtes', 'Tomates', 'Ail', 'Oignons', 'Huile d\'olive'],
    steps: [
      'Cuire les pâtes dans de l\'eau bouillante salée.',
      'Faire revenir ail et oignons.',
      'Ajouter les tomates et laisser mijoter.',
      'Mélanger la sauce aux pâtes et servir.',
    ],
    environmentScore: 7.5,
  ),
  Recipe(
    id: 'r3',
    title: 'Poulet rôti',
    imageUrl: 'https://source.unsplash.com/featured/?roast,chicken',
    ingredients: ['Poulet', 'Pommes de terre', 'Carottes', 'Ail', 'Thym'],
    steps: [
      'Préchauffer le four à 200°C.',
      'Assaisonner le poulet et le disposer dans un plat.',
      'Ajouter les légumes autour.',
      'Cuire pendant 1h20 en arrosant régulièrement.',
    ],
    environmentScore: 6.8,
  ),
  Recipe(
    id: 'r4',
    title: 'Gratin dauphinois',
    imageUrl: 'https://source.unsplash.com/featured/?gratin',
    ingredients: ['Pommes de terre', 'Crème', 'Lait', 'Fromage', 'Beurre'],
    steps: [
      'Éplucher et couper les pommes de terre en fines tranches.',
      'Mélanger crème et lait.',
      'Disposer les pommes de terre en couches dans un plat beurré.',
      'Verser le mélange crème-lait, ajouter du fromage, et enfourner.',
    ],
    environmentScore: 7.2,
  ),
  Recipe(
    id: 'r5',
    title: 'Salade de riz',
    imageUrl: 'https://source.unsplash.com/featured/?rice,salad',
    ingredients: ['Riz', 'Tomates', 'Oignons', 'Poivrons', 'Maïs'],
    steps: [
      'Cuire le riz et le laisser refroidir.',
      'Couper les légumes en petits dés.',
      'Mélanger le riz avec les légumes.',
      'Assaisonner selon votre goût.',
    ],
    environmentScore: 8.5,
  ),
  Recipe(
    id: 'r6',
    title: 'Croque-monsieur',
    imageUrl: 'https://source.unsplash.com/featured/?croque-monsieur',
    ingredients: ['Pain', 'Fromage', 'Jambon', 'Beurre'],
    steps: [
      'Beurrer les tranches de pain.',
      'Ajouter du jambon et du fromage.',
      'Assembler les croques et cuire à la poêle ou au four.',
    ],
    environmentScore: 7.0,
  ),
  Recipe(
    id: 'r7',
    title: 'Soupe de carottes',
    imageUrl: 'https://source.unsplash.com/featured/?carrot,soup',
    ingredients: ['Carottes', 'Oignons', 'Lait', 'Beurre', 'Bouillon'],
    steps: [
      'Faire revenir les oignons.',
      'Ajouter les carottes coupées en rondelles.',
      'Couvrir avec le bouillon et cuire jusqu\'à tendreté.',
      'Mixer et ajouter un peu de lait pour plus de douceur.',
    ],
    environmentScore: 8.7,
  ),
  Recipe(
    id: 'r8',
    title: 'Gâteau au yaourt',
    imageUrl: 'https://source.unsplash.com/featured/?cake,yogurt',
    ingredients: ['Yaourt', 'Farine', 'Sucre', 'Oeufs', 'Huile'],
    steps: [
      'Mélanger yaourt, sucre et oeufs.',
      'Ajouter la farine et l\'huile.',
      'Verser dans un moule beurré.',
      'Cuire au four à 180°C pendant 30 minutes.',
    ],
    environmentScore: 7.8,
  ),
  Recipe(
    id: 'r9',
    title: 'Quiche lorraine',
    imageUrl: 'https://source.unsplash.com/featured/?quiche,lorraine',
    ingredients: ['Oeufs', 'Crème', 'Lardons', 'Fromage', 'Pâte brisée'],
    steps: [
      'Préchauffer le four à 180°C.',
      'Garnir un moule avec la pâte.',
      'Disposer les lardons puis le mélange oeufs-crème.',
      'Ajouter du fromage râpé et enfourner.',
    ],
    environmentScore: 6.5,
  ),
  Recipe(
    id: 'r10',
    title: 'Tartine tomate mozzarella',
    imageUrl: 'https://source.unsplash.com/featured/?tomato,mozzarella',
    ingredients: ['Pain', 'Tomates', 'Mozzarella', 'Basilic', 'Huile d\'olive'],
    steps: [
      'Toaster légèrement le pain.',
      'Disposer des tranches de tomates et mozzarella.',
      'Arroser d\'huile d\'olive et parsemer de basilic.',
    ],
    environmentScore: 8.0,
  ),
];
