import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/animation/ScaleRoute.dart';
// import 'package:flutter_app/pages/HomePage.dart';
import 'package:flutter_app/pages/SignUpPage.dart';
import 'package:flutter_app/widgets/BottomNavBarWidget.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  bool mySpiner = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;
    double defaultIconSize = 17;
    bool _showPassword = true;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: mySpiner,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
            width: double.infinity,
            color: Colors.white70,
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: InkWell(
                    child: Container(
                      child: Align(
                          alignment: Alignment.topRight, child: Text('Skip>>')),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        BottomNavBarWidget.id,
                      );
                    },
                  ),
                ),
                Flexible(
                  flex: 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 230,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text('SAVAN'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        showCursor: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Color(0xFF666666),
                            size: defaultIconSize,
                          ),
                          fillColor: Color(0xFFF2F3F5),
                          hintStyle: TextStyle(
                              color: Color(0xFF666666),
                              fontFamily: defaultFontFamily,
                              fontSize: defaultFontSize),
                          hintText: "Email Address",
                        ),
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: passwordController,
                        obscureText: _showPassword,
                        showCursor: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xFF666666),
                            size: defaultIconSize,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _showPassword = true;
                            },
                            child: _showPassword
                                ? Icon(
                                    Icons.remove_red_eye,
                                    color: Color(0xFF666666),
                                    size: defaultIconSize,
                                  )
                                : Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.red,
                                  ),
                          ),
                          fillColor: Color(0xFFF2F3F5),
                          hintStyle: TextStyle(
                            color: Color(0xFF666666),
                            fontFamily: defaultFontFamily,
                            fontSize: defaultFontSize,
                          ),
                          hintText: "Password",
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          "Forgot your password?",
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontFamily: defaultFontFamily,
                            fontSize: defaultFontSize,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SignInButtonWidget(
                        onTap: () async {
                          String email = emailController.text;
                          String password = passwordController.text;

                          setState(() {
                            mySpiner = true;
                          });
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                            if (user != null) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => BottomNavBarWidget(),
                                ),
                              );
                            }
                            setState(() {
                              mySpiner = false;
                            });
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                      SizedBox(
                        height: 2,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          ScaleRoute(
                            page: SignUpPage(),
                          ),
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontFamily: defaultFontFamily,
                                fontSize: defaultFontSize,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Color(0xFFf7418c),
                                fontFamily: defaultFontFamily,
                                fontSize: defaultFontSize,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignInButtonWidget extends StatelessWidget {
  const SignInButtonWidget({
    Key key,
    this.onTap,
  }) : super(key: key);
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xFFfbab66),
          ),
          BoxShadow(
            color: Color(0xFFf7418c),
          ),
        ],
        gradient: new LinearGradient(
            colors: [Color(0xFFf7418c), Color(0xFFfbab66)],
            begin: const FractionalOffset(0.2, 0.2),
            end: const FractionalOffset(1.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: MaterialButton(
        highlightColor: Colors.transparent,
        splashColor: Color(0xFFf7418c),
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
          child: Text(
            "SIGN IN",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontFamily: "WorkSansBold"),
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}
