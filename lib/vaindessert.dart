import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Finder',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ViandDessert(),
    );
  }
}

class ViandDessert extends StatefulWidget {
  @override
  _ViandDessertState createState() => _ViandDessertState();
}

class _ViandDessertState extends State<ViandDessert> {
  bool _showMoreViand = false;
  bool _showMoreDessert = false;

  final List<Map<String, String>> viandRecipes = [
    {'name': 'Letchon Baboy', 'image': 'images/dessert1.png', 'time': '3 hours'},
    {'name': 'Christmas Ham', 'image': 'images/ham.jfif', 'time': '2 hours'},
    {'name': 'Beef Kaldereta', 'image': 'images/kaldereta.jfif', 'time': '30 mins'},
    {'name': 'Embutido', 'image': 'images/eran.png', 'time': '1 hour'},
    {'name': 'Pork Menudo', 'image': 'images/menuds.png', 'time': '1.5 hours'},
    {'name': 'Letchon Manok', 'image': 'images/letc.jfif', 'time': '2 hours'},
    {'name': 'Pork BBQ', 'image': 'images/PBBQ.jfif', 'time': '1 hour'},
    {'name': 'Pork Sisig', 'image': 'images/SIGEEE.jfif', 'time': '2.5 hours'},
    {'name': 'Relenong Bangus', 'image': 'images/bangus.jfif', 'time': '1.5 hours'},
  ];

  final List<Map<String, String>> dessertRecipes = [
    {'name': 'Leche Flan', 'image': 'images/letche.jfif', 'time': '1 hour'},
    {'name': 'Puto', 'image': 'images/spag.jfif', 'time': '45 mins'},
    {'name': 'Buko Pandan', 'image': 'images/buko.jfif', 'time': '1 hour'},
    {'name': 'Kalamay Ube', 'image': 'images/kamale.jfif', 'time': '2 hours'},
    {'name': 'Puto Bungbong', 'image': 'images/putobb.jfif', 'time': '1 hour'},
    {'name': 'Buko Salad', 'image': 'images/bukosalsal.jfif', 'time': '2 hours'},
    {'name': 'Bibingka', 'image': 'images/bibingka.jfif', 'time': '1.5 hours'},
    {'name': 'Fruit Salad', 'image': 'images/fruits.jfif', 'time': '1 hour'},
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> displayedViandRecipes;
    if (_showMoreViand) {
      displayedViandRecipes = viandRecipes;
    } else {
      displayedViandRecipes = viandRecipes.take(2).toList();
    }

    List<Map<String, String>> displayedDessertRecipes;
    if (_showMoreDessert) {
      displayedDessertRecipes = dessertRecipes;
    } else {
      displayedDessertRecipes = dessertRecipes.take(2).toList();
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom Header
              Row(
                children: [
                  Icon(Icons.person, size: 40, color: Colors.brown),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hi, Lia!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('Good day!', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.notifications, color: Colors.red),
                ],
              ),
              SizedBox(height: 20),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  labelText: 'Find recipes',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 20),

              // Viand Section
              SectionTitle(title: 'VIAND'),
              SizedBox(height: 10),
              for (int i = 0; i < displayedViandRecipes.length; i += 2)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeDetailPage(
                              name: displayedViandRecipes[i]['name']!,
                              imagePath: displayedViandRecipes[i]['image']!,
                              description: 'Lechon baboy is a traditional Filipino dish...',
                              ingredients: [
                                '1 whole pig (15-20 lbs)',
                                '2 tablespoons salt',
                                '2 tablespoons black pepper',
                                '1 head of garlic, minced',
                                '2 onions, quartered',
                                '1 bunch of lemongrass, trimmed and tied',
                                '2-3 bay leaves',
                              ],
                              equipment: [
                                'Grill',
                                'Charcoal',
                                'Roasting spit',
                                'Basting brush',
                              ],
                              directions: [
                                'Prepare the pig by cleaning it thoroughly.',
                                'Season the pig with salt, pepper, garlic, and lemongrass.',
                                'Skewer the pig and place it on the roasting spit.',
                                'Roast the pig over the charcoal, basting periodically.',
                                'Once the skin is crispy and the meat is tender, serve and enjoy.',
                              ],
                            ),
                          ),
                        );
                      },
                      child: RecipeCard(
                        imagePath: displayedViandRecipes[i]['image']!,
                        name: displayedViandRecipes[i]['name']!,
                        time: displayedViandRecipes[i]['time']!,
                      ),
                    ),
                    if (i + 1 < displayedViandRecipes.length)
                      RecipeCard(
                        imagePath: displayedViandRecipes[i + 1]['image']!,
                        name: displayedViandRecipes[i + 1]['name']!,
                        time: displayedViandRecipes[i + 1]['time']!,
                      ),
                  ],
                ),
              SizedBox(height: 20),
              Center(
                child: CustomButton(
                  label: _showMoreViand ? 'SEE LESS' : 'SEE MORE',
                  onPressed: () {
                    setState(() {
                      _showMoreViand = !_showMoreViand;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),

              // Dessert Section
              SectionTitle(title: 'DESSERT'),
              SizedBox(height: 10),
              for (int i = 0; i < displayedDessertRecipes.length; i += 2)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeDetailPage(
                              name: displayedDessertRecipes[i]['name']!,
                              imagePath: displayedDessertRecipes[i]['image']!,
                              description: 'A sweet Filipino dessert...',
                              ingredients: [
                                '1 cup coconut milk',
                                '1/2 cup sugar',
                                '1 cup ube (purple yam)',
                                '1/4 cup glutinous rice',
                                '1/2 cup cream',
                              ],
                              equipment: [
                                'Steamer',
                                'Mixing bowl',
                                'Spatula',
                              ],
                              directions: [
                                'Combine the coconut milk and sugar in a pot.',
                                'Add the ube and cook until soft.',
                                'Prepare the glutinous rice and steam.',
                                'Mix everything together and serve chilled.',
                              ],
                            ),
                          ),
                        );
                      },
                      child: RecipeCard(
                        imagePath: displayedDessertRecipes[i]['image']!,
                        name: displayedDessertRecipes[i]['name']!,
                        time: displayedDessertRecipes[i]['time']!,
                      ),
                    ),
                    if (i + 1 < displayedDessertRecipes.length)
                      RecipeCard(
                        imagePath: displayedDessertRecipes[i + 1]['image']!,
                        name: displayedDessertRecipes[i + 1]['name']!,
                        time: displayedDessertRecipes[i + 1]['time']!,
                      ),
                  ],
                ),
              SizedBox(height: 20),
              Center(
                child: CustomButton(
                  label: _showMoreDessert ? 'SEE LESS' : 'SEE MORE',
                  onPressed: () {
                    setState(() {
                      _showMoreDessert = !_showMoreDessert;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String time;

  RecipeCard({required this.imagePath, required this.name, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 5))],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Image.asset(imagePath, width: double.infinity, height: 120, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text(time, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold));
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  CustomButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: Text(label, style: TextStyle(fontSize: 16)),
    );
  }
}

class RecipeDetailPage extends StatelessWidget {
  final String name;
  final String imagePath;
  final String description;
  final List<String> ingredients;
  final List<String> equipment;
  final List<String> directions;

  RecipeDetailPage({
    required this.name,
    required this.imagePath,
    required this.description,
    required this.ingredients,
    required this.equipment,
    required this.directions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath),
            SizedBox(height: 20),
            Text(name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return RecipeDetailSection(
                        title: 'Ingredients',
                        items: ingredients,
                      );
                    },
                  );
                }, child: Text('Ingredients')),
                ElevatedButton(onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return RecipeDetailSection(
                        title: 'Equipment',
                        items: equipment,
                      );
                    },
                  );
                }, child: Text('Equipment')),
                ElevatedButton(onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return RecipeDetailSection(
                        title: 'Directions',
                        items: directions,
                      );
                    },
                  );
                }, child: Text('Directions')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeDetailSection extends StatelessWidget {
  final String title;
  final List<String> items;

  RecipeDetailSection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          for (var item in items)
            Text(item, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
