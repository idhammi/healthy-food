class Food {
  String name;
  String description;
  String image;
  num weight;
  num calories;
  num rating;
  num price;

  Food({
    required this.name,
    required this.description,
    required this.image,
    required this.weight,
    required this.calories,
    required this.rating,
    required this.price,
  });
}

var foodList = [
  Food(
    name: 'Virginia Salad',
    description:
        'Mix salad with egg, bread crunches, tomatos, cheese, mustard and lemon sauce',
    image: 'images/virginia-salad.jpg',
    weight: 250,
    calories: 150,
    rating: 4.5,
    price: 25000,
  ),
  Food(
    name: 'Silverbeet fatteh',
    description:
        'Dish with roast cauliflower, eggplant or roast pumpkin instead of silverbeet for a variation',
    image: 'images/silverbeet.jpg',
    weight: 400,
    calories: 350,
    rating: 4,
    price: 37000,
  ),
  Food(
    name: 'Lemon Chicken',
    description:
        'A luscious, tangy stir-fry that makes two generous portions for very few calories',
    image: 'images/lemon-chicken.jpg',
    weight: 350,
    calories: 250,
    rating: 5,
    price: 54000,
  ),
  Food(
    name: 'Iceberg',
    description: 'Mix dried oregano dressing and creamy sheep\'s milk cheese',
    image: 'images/iceberg.jpg',
    weight: 150,
    calories: 100,
    rating: 4.5,
    price: 25000,
  ),
  Food(
    name: 'Green Tea Noodles',
    description:
        'With sticky sweet chilli salmon green tea noodles bring a pop of colour to this easy midweek dinner',
    image: 'images/green-tea.jpg',
    weight: 300,
    calories: 150,
    rating: 4.5,
    price: 45000,
  ),
  Food(
    name: 'Tofu Scramble',
    description:
        'With shredded cabbage and chilli sambal add a kick to your breakfast or lunch with this tofu scramble',
    image: 'images/tofu-scramble.jpg',
    weight: 250,
    calories: 150,
    rating: 4,
    price: 35000,
  ),
];
