import 'package:flutter/material.dart';

class FoodWidget extends StatefulWidget {
  const FoodWidget({
    Key key,
    this.itemName,
    this.itemPhrase,
    this.itemPrice,
    this.onTap,
    this.itemImage,
  }) : super(key: key);
  final String itemName;
  final String itemImage;

  final String itemPhrase;
  final String itemPrice;
  final Function onTap;
  @override
  _FoodWidgetState createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<FoodWidget> {
  int addedToCart = 0;
  bool isAddedToCart = false;
  void addToCart() {
    addedToCart++;
    if (addedToCart > 0) {
      setState(() {
        isAddedToCart = true;
      });
    } else {
      setState(() {
        isAddedToCart = true;
      });
    }
  }

  void removeFromCart() {
    addedToCart--;
    if (addedToCart < 1) {
      setState(() {
        isAddedToCart = false;
      });
    } else {
      setState(() {
        isAddedToCart = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 12.0,
        right: 12.0,
        top: 10.0,
        bottom: 10.0,
      ),
      width: double.infinity,
      height: 130.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 100.0,
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Image.network(
                widget.itemImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.only(
                left: 12.0,
                right: 12.0,
                top: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.itemName,
                    style: TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Center(
                    child: Container(
                      width: 200,
                      child: Text(
                        widget.itemPhrase,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xff333300),
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '₹ ' + widget.itemPrice,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              addToCart();
                            },
                            child: isAddedToCart
                                ? Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 5.0),
                                          // padding: EdgeInsets.all(8.0),
                                          width: 25.5,
                                          height: 25.5,
                                          child: Material(
                                            shape: CircleBorder(),
                                            clipBehavior: Clip.hardEdge,
                                            color:
                                                Colors.grey.withOpacity(0.05),
                                            child: InkWell(
                                              onTap: () {
                                                removeFromCart();
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          child: Text(
                                            '$addedToCart',
                                            style: TextStyle(fontSize: 18.0),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 5.0),
                                          // padding: EdgeInsets.all(8.0),
                                          width: 25.5,
                                          height: 25.5,
                                          child: Material(
                                            shape: CircleBorder(),
                                            clipBehavior: Clip.hardEdge,
                                            color:
                                                Colors.grey.withOpacity(0.05),
                                            child: InkWell(
                                              onTap: () {
                                                addToCart();
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.red,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.red,
                                        )),
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'Add to cart',
                                      style: TextStyle(
                                        fontSize: 11.0,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BestFoodTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[],
      ),
    );
  }
}

class BestFoodTiles extends StatelessWidget {
  String name;
  String imageUrl;
  String rating;
  String numberOfRating;
  String price;
  String slug;

  BestFoodTiles(
      {Key key,
      @required this.name,
      @required this.imageUrl,
      @required this.rating,
      @required this.numberOfRating,
      @required this.price,
      @required this.slug})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
            decoration: BoxDecoration(boxShadow: [
              /* BoxShadow(
                color: Color(0xFFfae3e2),
                blurRadius: 15.0,
                offset: Offset(0, 0.75),
              ),*/
            ]),
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(
                'assets/images/bestfood/' + imageUrl + ".jpeg",
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 1,
              margin: EdgeInsets.all(5),
            ),
          ),
        ],
      ),
    );
  }
}

class BestFoodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        BestFoodTiles(
            name: "Fried Egg",
            imageUrl: "ic_best_food_8",
            rating: '4.9',
            numberOfRating: '200',
            price: '15.06',
            slug: "fried_egg"),
        BestFoodTiles(
            name: "Mixed vegetable",
            imageUrl: "ic_best_food_9",
            rating: "4.9",
            numberOfRating: "100",
            price: "17.03",
            slug: ""),
        BestFoodTiles(
            name: "Salad with chicken meat",
            imageUrl: "ic_best_food_10",
            rating: "4.0",
            numberOfRating: "50",
            price: "11.00",
            slug: ""),
        BestFoodTiles(
            name: "New mixed salad",
            imageUrl: "ic_best_food_5",
            rating: "4.00",
            numberOfRating: "100",
            price: "11.10",
            slug: ""),
        BestFoodTiles(
            name: "Red meat with salad",
            imageUrl: "ic_best_food_1",
            rating: "4.6",
            numberOfRating: "150",
            price: "12.00",
            slug: ""),
        BestFoodTiles(
            name: "New mixed salad",
            imageUrl: "ic_best_food_2",
            rating: "4.00",
            numberOfRating: "100",
            price: "11.10",
            slug: ""),
        BestFoodTiles(
            name: "Potato with meat fry",
            imageUrl: "ic_best_food_3",
            rating: "4.2",
            numberOfRating: "70",
            price: "23.0",
            slug: ""),
        BestFoodTiles(
            name: "Fried Egg",
            imageUrl: "ic_best_food_4",
            rating: '4.9',
            numberOfRating: '200',
            price: '15.06',
            slug: "fried_egg"),
        BestFoodTiles(
            name: "Red meat with salad",
            imageUrl: "ic_best_food_5",
            rating: "4.6",
            numberOfRating: "150",
            price: "12.00",
            slug: ""),
        BestFoodTiles(
            name: "Red meat with salad",
            imageUrl: "ic_best_food_6",
            rating: "4.6",
            numberOfRating: "150",
            price: "12.00",
            slug: ""),
        BestFoodTiles(
            name: "Red meat with salad",
            imageUrl: "ic_best_food_7",
            rating: "4.6",
            numberOfRating: "150",
            price: "12.00",
            slug: ""),
      ],
    );
  }
}
