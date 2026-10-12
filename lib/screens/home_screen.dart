import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const forestGreen = Color(0xFF245C43);
const freshGreen = Color(0xFF4F805B);
const cream = Color(0xFFFAF8F0);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const recipes = [
    _Recipe(
      name: 'Chicken Adobo',
      description: 'A Filipino classic',
      time: '40 min',
      emoji: '🍗',
      color: Color(0xFFF1E4D1),
    ),
    _Recipe(
      name: 'Garlic Fried Rice',
      description: 'Simple and satisfying',
      time: '15 min',
      emoji: '🍚',
      color: Color(0xFFE8EEDB),
    ),
    _Recipe(
      name: 'Tomato Omelette',
      description: 'An easy everyday meal',
      time: '10 min',
      emoji: '🍳',
      color: Color(0xFFF4E6D9),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(context),
              _buildHero(context),
              _buildHowItWorks(),
              _buildFeaturedRecipes(),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: Row(
        children: [
          const Icon(Icons.restaurant_menu, color: forestGreen, size: 32),
          const SizedBox(width: 8),
          const Text(
            'LutoReco',
            style: TextStyle(
              color: forestGreen,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () => context.go('/'),
            child: const Text('Home'),
          ),
          const SizedBox(width: 8),
          OutlinedButton(
            onPressed: () => context.go('/login'),
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 650;

          final textContent = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F0E5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'YOUR KITCHEN, YOUR INSPIRATION',
                  style: TextStyle(
                    color: forestGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: 22),
              const Text(
                'Your Ingredients.\nYour Next Favorite Meal.',
                style: TextStyle(
                  color: forestGreen,
                  fontSize: 36,
                  height: 1.15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Discover recipes you can make with the '
                'ingredients you already have at home. '
                'Less guessing, more delicious cooking.',
                style: TextStyle(
                  color: Color(0xFF5D675F),
                  fontSize: 16,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 26),
              ElevatedButton.icon(
                onPressed: () => context.go('/login'),
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Get Started'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: forestGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          );

          final foodVisual = Container(
            height: 290,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFE8F0E5),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Positioned(
                  top: 18,
                  right: 22,
                  child: Icon(Icons.eco, size: 46, color: Color(0xFFB8CEB2)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('🥬', style: TextStyle(fontSize: 44)),
                    const Text('🍅  🥕  🧄', style: TextStyle(fontSize: 38)),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Text(
                        'Start with what you have',
                        style: TextStyle(
                          color: forestGreen,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );

          if (isWide) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: textContent),
                const SizedBox(width: 40),
                Expanded(child: foodVisual),
              ],
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [textContent, const SizedBox(height: 30), foodVisual],
          );
        },
      ),
    );
  }

  Widget _buildHowItWorks() {
    const steps = [
      (
        icon: Icons.kitchen_outlined,
        title: '1. List your ingredients',
        description: 'Start with the food you already have.',
      ),
      (
        icon: Icons.search,
        title: '2. Discover recipes',
        description: 'Find meal ideas that match your ingredients.',
      ),
      (
        icon: Icons.restaurant,
        title: '3. Start cooking',
        description: 'Choose a recipe and make something delicious.',
      ),
    ];

    return Container(
      width: double.infinity,
      color: const Color(0xFFF0F3E9),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 44),
      child: Column(
        children: [
          const Text(
            'How LutoReco Works',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: forestGreen,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Three simple steps from your kitchen to your table.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF5D675F)),
          ),
          const SizedBox(height: 30),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 650;

              final cards = steps.map((step) {
                return Container(
                  width: isWide ? null : double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: cream,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(step.icon, color: freshGreen, size: 32),
                      const SizedBox(height: 16),
                      Text(
                        step.title,
                        style: const TextStyle(
                          color: forestGreen,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        step.description,
                        style: const TextStyle(
                          color: Color(0xFF5D675F),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList();

              if (isWide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: cards
                      .map(
                        (card) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: card,
                          ),
                        ),
                      )
                      .toList(),
                );
              }

              return Column(
                children: cards
                    .map(
                      (card) => Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: card,
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedRecipes() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 42),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'A Taste of Inspiration',
            style: TextStyle(
              color: forestGreen,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'A few familiar dishes to get you started.',
            style: TextStyle(color: Color(0xFF5D675F)),
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 650;

              final cards = recipes.map((recipe) {
                return _RecipeCard(recipe: recipe);
              }).toList();

              if (isWide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: cards
                      .map(
                        (card) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: card,
                          ),
                        ),
                      )
                      .toList(),
                );
              }

              return Column(children: cards);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(26),
      color: forestGreen,
      child: const Column(
        children: [
          Text(
            'LutoReco',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Good food starts with what you have.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFFE0E9DB)),
          ),
        ],
      ),
    );
  }
}

class _Recipe {
  const _Recipe({
    required this.name,
    required this.description,
    required this.time,
    required this.emoji,
    required this.color,
  });

  final String name;
  final String description;
  final String time;
  final String emoji;
  final Color color;
}

class _RecipeCard extends StatelessWidget {
  const _RecipeCard({required this.recipe});

  final _Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: Color(0xFFE7E9E0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 135,
            width: double.infinity,
            color: recipe.color,
            alignment: Alignment.center,
            child: Text(recipe.emoji, style: const TextStyle(fontSize: 55)),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.name,
                  style: const TextStyle(
                    color: forestGreen,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  recipe.description,
                  style: const TextStyle(color: Color(0xFF5D675F)),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.schedule, size: 16, color: freshGreen),
                    const SizedBox(width: 5),
                    Text(
                      recipe.time,
                      style: const TextStyle(
                        color: freshGreen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
