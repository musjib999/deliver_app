import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/BestFoodWidget.dart';
import 'package:flutter_app/widgets/TopMenus.dart';

class HomePage extends StatefulWidget {
  static const String id = 'HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
        title: Text(
          "What would you like to eat?",
          style: TextStyle(
              color: Color(0xFF3a3737),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        brightness: Brightness.light,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Color(0xFF3a3737),
              ),
              onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TopMenus(),
            FoodWidget(
              itemName: 'Tasty Noodles',
              itemPhrase: '',
              itemPrice: '200.0',
              itemImage:
                  'https://olist-uc.feednews.com/upload/20200109/iglmqumru9u.jpg',
            ),
            FoodWidget(
              itemName: 'Big Burger',
              itemPhrase: '',
              itemPrice: '120.0',
              itemImage:
                  'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2012/6/1/2/FNM_070112-Copy-That-Almost-Famous-Animal-Style-Burger-Recipe_s4x3.jpg.rend.hgtvcom.406.305.suffix/1382541460839.jpeg',
            ),
            FoodWidget(
              itemName: 'Chicken Pie',
              itemPhrase: '',
              itemPrice: '500.0',
              itemImage:
                  'https://www.belle.ng/pub/media/catalog/product//i/m/images_50__1.jpeg',
            ),
            FoodWidget(
              itemName: 'Chicken Pie',
              itemPhrase: '',
              itemPrice: '500.0',
              itemImage:
                  'https://www.belle.ng/pub/media/catalog/product//i/m/images_50__1.jpeg',
            ),
          ],
        ),
      ),
    );
  }
}
