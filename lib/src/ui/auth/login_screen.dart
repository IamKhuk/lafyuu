import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/dialog/center_dialog.dart';
import 'package:lafyuu/src/theme/app_theme.dart';
import 'package:lafyuu/src/ui/auth/register_screen.dart';
import 'package:lafyuu/src/widgets/item_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController loginController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool onObscure = true;
  bool onBorderEmail = false;
  bool onBorderPassword = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.white,
      ),
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            setState(() {
              onBorderPassword = false;
              onBorderEmail = false;
            });
          },
          child: Stack(
            children: [
              ListView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior
                    .onDrag,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                children: [
                  SvgPicture.asset("assets/icons/logo.svg"),
                  SizedBox(height: 16),
                  Text(
                    "Welcome to Lafyuu",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppTheme.fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 1.5,
                      letterSpacing: 0.5,
                      color: AppTheme.dark,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Sign in to continue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppTheme.fontFamily,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      height: 1.8,
                      letterSpacing: 0.5,
                      color: AppTheme.grey,
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppTheme.white,
                      border: Border.all(
                        color: onBorderEmail == true ? AppTheme.blue : AppTheme
                            .light,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/message.svg",
                          color:
                          onBorderEmail == true ? AppTheme.blue : AppTheme.grey,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            onTap: () {
                              setState(() {
                                onBorderEmail = true;
                                onBorderPassword = false;
                              });
                            },
                            controller: loginController,
                            autofocus: false,
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              height: 1.8,
                              color: AppTheme.grey,
                            ),
                            decoration: InputDecoration(
                              hintText: "Your Email",
                              hintStyle: TextStyle(
                                fontFamily: AppTheme.fontFamily,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.8,
                                color: AppTheme.grey,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppTheme.white,
                      border: Border.all(
                        color:
                        onBorderPassword == true ? AppTheme.blue : AppTheme
                            .light,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/password.svg",
                          color: onBorderPassword == true
                              ? AppTheme.blue
                              : AppTheme.grey,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            onTap: () {
                              setState(() {
                                onBorderEmail = false;
                                onBorderPassword = true;
                              });
                            },
                            obscureText: onObscure,

                            /// OBSCURE TEXT
                            controller: passwordController,
                            autofocus: false,
                            // maxLength: 3,
                            // onChanged: (value){
                            //   print(value);
                            // },
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              height: 1.8,
                              color: AppTheme.grey,
                            ),
                            decoration: InputDecoration(
                              counterText: "",
                              hintText: "Password",
                              hintStyle: TextStyle(
                                fontFamily: AppTheme.fontFamily,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.8,
                                color: AppTheme.grey,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              onObscure = !onObscure;
                            });
                          },
                          child: onObscure
                              ? SvgPicture.asset(
                            'assets/icons/eye-crossed.svg',
                            color: AppTheme.light,
                            height: 24,
                            width: 24,
                          )
                              : SvgPicture.asset(
                            'assets/icons/eye.svg',
                            color: AppTheme.blue,
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        onBorderPassword = false;
                        onBorderEmail = false;
                      });
                      _getInfo(
                        loginController.text,
                        passwordController.text,
                      );
                    },
                    child: ItemView(
                      margin: EdgeInsets.all(0),
                      text: 'Sign in',
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: AppTheme.light,
                          height: 1,
                        ),
                      ),
                      SizedBox(width: 28),
                      Text(
                        'OR',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          height: 1.5,
                          fontFamily: AppTheme.fontFamily,
                          color: AppTheme.grey,
                        ),
                      ),
                      SizedBox(width: 28),
                      Expanded(
                        child: Container(
                          color: AppTheme.light,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          onBorderPassword = false;
                          onBorderEmail = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return RegisterScreen();
                            },
                          ),
                        );
                      },
                      child: ItemView(
                        margin: EdgeInsets.all(0),
                        text: 'Register',
                      )),
                ],
              ),
              isLoading ? Center(
                child: Container(
                  height: 64,
                  width: 64,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppTheme.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(5, 5),
                        blurRadius: 20,
                        spreadRadius: 0,
                        color: AppTheme.blue.withOpacity(0.4),
                      )
                    ],
                  ),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        AppTheme.blue),),
                ),
              ) : Container(),
            ],
          )
      ),
    );
  }

  Future<void> _getInfo(String emain, String pass) async {
    SharedPreferences vr = await SharedPreferences.getInstance();
    String email = vr.getString("email") ?? "";
    String password = vr.getString("password") ?? "";

    if (emain == email && password == pass) {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginController.text,
        password: passwordController.text,
      );
      setState(() {
        isLoading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MainScreen();
          },
        ),
      );
    } else if (emain != email) {
      setState(() {
        CenterDialog.showErrorDialog(context, 'Email error');
      });
    } else if (password != pass) {
      setState(() {
        CenterDialog.showErrorDialog(context, 'Password error');
      });
    } else {
      setState(() {
        CenterDialog.showErrorDialog(context, 'Email error\n Password error');
      });
    }
  }
}
