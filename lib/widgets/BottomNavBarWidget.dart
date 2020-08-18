import 'package:flutter/material.dart';
import 'package:flutter_app/pages/HomePage.dart';
import 'package:flutter_app/pages/SignInPage.dart';
import 'package:flutter_app/pages/SignUpPage.dart';
import 'package:flutter_app/pages/cart.dart';
import 'package:flutter_app/provider/provider_skip_profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BottomNavBarWidget extends StatefulWidget {
  static const String id = 'BottomNavBarWidget';
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  final List<Widget> children = [
    HomePage(),
    ContactUs(),
    MyCart(),
    UserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    final PageController _pageController = PageController();

    //
    void pageChanged(int index) {
      selectedIndex = index;
      _pageController.jumpToPage(index);

      setState(() {});
    }

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: children,
        onPageChanged: (pageIndex) {
          pageChanged(pageIndex);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(color: Color(0xFF2c2b2b)),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text(
              'About',
              style: TextStyle(color: Color(0xFF2c2b2b)),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            title: Text(
              'Cart',
              style: TextStyle(color: Color(0xFF2c2b2b)),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user),
            title: Text(
              'Account',
              style: TextStyle(color: Color(0xFF2c2b2b)),
            ),
          ),
        ],
        onTap: pageChanged,
        currentIndex: selectedIndex,
        selectedItemColor: Color(0xFFfd5352),
      ),
    );
  }
}

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  Future<String> getUserEmail() async {
    final user = await _auth.currentUser();
    if (user != null) {
      loggedInUser = user;
    }
    return loggedInUser.email;
  }

  @override
  Widget build(BuildContext context) {
    final skipValueChange = Provider.of<UserSkip>(context, listen: false);

    return skipValueChange.isSkipped
        ? Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(SignUpPage.id);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Create an account',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        : Container(
            child: FutureBuilder(
              future: getUserEmail(),
              builder: (context, snapshot) {
                if (!snapshot.hasData){
                  return Center(
                    child: CircularProgressIndicator(backgroundColor: Colors.blueAccent,),
                  );
                }
                
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Profile',
                      style: TextStyle(fontSize: 30),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.mail),
                        Text(snapshot.data),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    RaisedButton.icon(
                      onPressed: () async {
                        await _auth.signOut();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInPage(),
                          ),
                        );
                      },
                      icon: Icon(Icons.exit_to_app),
                      label: Text('Logout'),
                    ),
                  ],
                );
              },
            ),
          );
  }
}

class ContactUs extends StatelessWidget {
  // const ContactUs({
  //   Key key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final skipValueChange = Provider.of<UserSkip>(context, listen: false);

    return skipValueChange.isSkipped
        ? Container(
            child: Center(
              child: Text('About'),
            ),
          )
        : Container(
            child: Text('log in first'),
          );
  }
}
