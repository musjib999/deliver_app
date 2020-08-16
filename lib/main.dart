import 'package:flutter/material.dart';
import 'package:flutter_app/models/cart_model.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/pages/HomePage.dart';
import 'package:flutter_app/pages/SignUpPage.dart';
import 'package:flutter_app/provider/provider_skip_profile.dart';
import 'package:flutter_app/widgets/BottomNavBarWidget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

/// Providers are above [MyApp] instead of inside it, so that tests
/// can use [MyApp] while mocking the providers
///
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProvider(create: (context) => UserSkip()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Roboto', hintColor: Color(0xFFd0cece)),
        initialRoute: SignUpPage.id,
        routes: {
          BottomNavBarWidget.id: (context) => BottomNavBarWidget(),
          SignUpPage.id: (context) => SignUpPage(),
          HomePage.id: (context) => HomePage(),
        },
      ),
    );
  }
}
