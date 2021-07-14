import 'package:flutter/material.dart';
import 'package:healthy_food/model/food.dart';

class DetailScreen extends StatelessWidget {
  final Food food;

  DetailScreen({required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(tag: food.name, child: Image.asset(food.image)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(food.description),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${food.weight} g | ${food.calories} cal',
                    style: TextStyle(color: Colors.green),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: StarRating(value: food.rating),
                      ),
                      Text(
                        food.rating.toString(),
                        style: TextStyle(color: Colors.green),
                      )
                    ],
                  ),
                ],
              ),
            ),
            PriceCounter(food: food),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(left: 24, right: 24, bottom: 48),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        )),
                    onPressed: () {},
                    child: Text('Add to Card'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final num value;

  const StarRating({Key? key, this.value = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (value % 1 == 0) {
          if (index < value)
            return Icon(Icons.star, color: Colors.green, size: 20);
          else
            return Icon(Icons.star_border, color: Colors.green, size: 20);
        } else {
          if (index < value.toInt()) {
            return Icon(Icons.star, color: Colors.green, size: 20);
          } else if (index == value.toInt()) {
            return Icon(Icons.star_half_outlined,
                color: Colors.green, size: 20);
          } else {
            return Icon(Icons.star_border, color: Colors.green, size: 20);
          }
        }
      }),
    );
  }
}

class PriceCounter extends StatefulWidget {
  final Food food;

  const PriceCounter({Key? key, required this.food}) : super(key: key);

  @override
  _PriceCounterState createState() =>
      _PriceCounterState(price: food.price.toInt());
}

class _PriceCounterState extends State<PriceCounter> {
  int price;

  _PriceCounterState({required this.price});

  int _amount = 1;
  int _totalPrice = 0;

  void _calculatePrice() {
    setState(() {
      _totalPrice = price * _amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    _calculatePrice();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Ink(
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  onPressed: () {
                    if (_amount > 1) _amount--;
                    _calculatePrice();
                  },
                  icon: Icon(
                    Icons.remove,
                    color: Colors.green[700],
                    size: 20,
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints(minWidth: 40, maxWidth: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _amount.toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Ink(
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  onPressed: () {
                    if (_amount < 10) _amount++;
                    _calculatePrice();
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.green[700],
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text(
            'IDR $_totalPrice',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
