import 'package:flutter/material.dart';
import 'recipe_detail_screen.dart';

// ЭКРАН 2. Список рецептов
class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  final items = List.generate(5, (index) => 'Рецепт №${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список рецептов'),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  items.removeAt(items.length - 1);
                });
              },
              icon: const Icon(Icons.remove),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  items.add("Рецепт №${items.length + 1}");
                });
              },
              icon: const Icon(Icons.add),
            ),
          ]
      ),

      body: Padding(
        padding: const EdgeInsets.all(8),
        child: (() {
          if (items.isEmpty) {
            return const Center(
              child: Text(
                'Список пуст',
                style: TextStyle(fontSize: 16),
              ),
            );
          } else {
            return ListView.separated(
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      items[index],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 116),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeDetailScreen(recipeName: items[index]),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("Посмотреть рецепт"),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: items.length,
              padding: const EdgeInsets.all(16),
            );
          }
        }()),
      ),
    );
  }
}

