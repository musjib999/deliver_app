import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  int foodItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          'Cart Items',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 12.0,
                right: 12.0,
                top: 10.0,
                bottom: 5.0,
              ),
              child: Text(
                'Your Food Item',
                style: TextStyle(
                  fontSize: 21,
                ),
              ),
            ),
            CartItemCard(
              itemName: 'Big Burger',
              itemCaption: 'This is a tasty burger',
              itemPrice: '20.00',
              itemImage:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR9Iu-naXaxcK9eEKG0tdSAWWWS3-Qx0DXiew&usqp=CAU',
            ),
            CartItemCard(
              itemName: 'Chicken Pie',
              itemCaption: 'This is a tasty Chicken Pie',
              itemPrice: '20.00',
              itemImage:
                  'https://www.belle.ng/pub/media/catalog/product//i/m/images_50__1.jpeg',
            ),
            CartItemCalculator(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.red,
                ),
                child: Text(
                  'Order Now',
                  style: TextStyle(
                    color: Colors.white,
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

class CartItemCalculator extends StatelessWidget {
  const CartItemCalculator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(
        left: 12.0,
        right: 12.0,
        top: 10.0,
        bottom: 10.0,
      ),
      width: double.infinity,
      height: 130.0, //for now
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Big Burger x1'),
              Text('₹20.00'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Chicken Pie x1'),
              Text('₹20.00'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('₹40.00'),
            ],
          ),
        ],
      ),
    );
  }
}

class CartItemCard extends StatefulWidget {
  const CartItemCard({
    Key key,
    this.itemName,
    this.itemPrice,
    this.itemCaption,
    this.add,
    this.remove,
    this.itemImage,
  }) : super(key: key);
  final String itemImage;
  final String itemName;
  final String itemPrice;
  final String itemCaption;
  final Function add;
  final Function remove;

  @override
  _CartItemCardState createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  int itemCount = 0;
  addToCart() {
    setState(() {
      itemCount++;
    });
  }

  removeFromCart() {
    setState(() {
      itemCount--;
    });
    if (itemCount < 1) {
      setState(() {
        itemCount = 0;
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
                        widget.itemCaption,
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
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 5.0),
                                  // padding: EdgeInsets.all(8.0),
                                  width: 25.5,
                                  height: 25.5,
                                  child: Material(
                                    shape: CircleBorder(),
                                    clipBehavior: Clip.hardEdge,
                                    color: Colors.grey.withOpacity(0.05),
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
                                    '$itemCount',
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
                                    color: Colors.grey.withOpacity(0.05),
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
