import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/dialog/center_dialog.dart';
import 'package:lafyuu/src/theme/app_theme.dart';
import 'package:lafyuu/src/widgets/item_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController userNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController passwordAgainController = new TextEditingController();

  bool onPasswordObscure = true;
  bool onPasswordAgainObscure = true;

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
        },
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          children: [
            SizedBox(height: 32),
            SvgPicture.asset('assets/icons/logo.svg'),
            SizedBox(height: 16),
            Text(
              'Let’s Get Started',
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
              'Create a new account',
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
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppTheme.white,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: userNameController,
                  autofocus: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Full name',
                    hintStyle: TextStyle(
                      fontFamily: AppTheme.fontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      height: 1.8,
                      letterSpacing: 0.5,
                      color: AppTheme.grey,
                    ),
                    isDense: true,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: AppTheme.light),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppTheme.blue),
                    ),
                    prefixIcon: Container(
                      width: 44,
                      margin: EdgeInsets.only(left: 8),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/user.svg',
                          color: AppTheme.grey,
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                    contentPadding: EdgeInsets.all(0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 48,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppTheme.white,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: emailController,
                  autofocus: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Your email',
                    hintStyle: TextStyle(
                      fontFamily: AppTheme.fontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      height: 1.8,
                      letterSpacing: 0.5,
                      color: AppTheme.grey,
                    ),
                    isDense: true,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: AppTheme.light),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppTheme.blue),
                    ),
                    prefixIcon: Container(
                      width: 44,
                      margin: EdgeInsets.only(left: 6),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/message.svg',
                          color: AppTheme.grey,
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                    contentPadding: EdgeInsets.all(0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 48,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppTheme.white,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: passwordController,
                  autofocus: false,
                  obscureText: onPasswordObscure,
                  style: TextStyle(
                    fontFamily: AppTheme.fontFamily,
                    fontSize: 12,
                    height: 1.8,
                    letterSpacing: 0.5,
                    color: AppTheme.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontFamily: AppTheme.fontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      height: 1.8,
                      letterSpacing: 0.5,
                      color: AppTheme.grey,
                    ),
                    isDense: true,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: AppTheme.light),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppTheme.blue),
                    ),
                    prefixIcon: Container(
                      width: 44,
                      margin: EdgeInsets.only(left: 6),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/password.svg',
                          color: AppTheme.grey,
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          onPasswordObscure = !onPasswordObscure;
                        });
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/eye.svg',
                        color: onPasswordObscure? AppTheme.light : AppTheme.blue,
                        height: 24,
                        width: 24,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 48,
              width: MediaQuery.of(context).size.width,
              // padding: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                color: AppTheme.white,
              ),
              child: TextField(
                cursorColor: AppTheme.blue,
                controller: passwordAgainController,
                autofocus: false,
                obscureText: onPasswordAgainObscure,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password Again',
                  hintStyle: TextStyle(
                    fontFamily: AppTheme.fontFamily,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    height: 1.8,
                    letterSpacing: 0.5,
                    color: AppTheme.grey,
                  ),
                  // isDense: true,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: AppTheme.light),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.blue),
                  ),
                  prefixIcon: Container(
                    width: 44,
                    margin: EdgeInsets.only(left: 6),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/password.svg',
                        color: AppTheme.grey,
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        onPasswordAgainObscure = !onPasswordAgainObscure;
                      });
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/eye.svg',
                      color: onPasswordAgainObscure? AppTheme.light: AppTheme.blue,
                      height: 24,
                      width: 24,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(0),
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                _saveInfo(emailController.text, userNameController.text,
                    passwordController.text, passwordAgainController.text);

                userNameController.text = '';
                emailController.text = '';
                passwordController.text = '';
                passwordAgainController.text = '';
              },
              child: ItemView(
                margin: EdgeInsets.all(0),
                text: 'Sign up',
              )
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: Container()),
                Text(
                  'have an account? ',
                  style: TextStyle(
                    fontFamily: AppTheme.fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    height: 1.5,
                    letterSpacing: 0.5,
                    color: AppTheme.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontFamily: AppTheme.fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      height: 1.5,
                      letterSpacing: 0.5,
                      color: AppTheme.blue,
                    ),
                  ),
                ),
                Expanded(child: Container()),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _saveInfo(
      String emain, String userName, String pas, String pasAgain) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", emain);
    prefs.setString("username", userName);
    prefs.setString("password", pas);
    prefs.setString("password", pasAgain);

    if (emain.length > 4 &&
        userName.length > 1 &&
        pas.length > 7 &&
        pas == pasAgain) {
      Navigator.pop(context);
    } else if (emain.length < 5 &&
        userName.length > 1 &&
        pas.length > 7 &&
        pas == pasAgain) {
      setState(() {
        CenterDialog.showErrorDialog(context, 'Invalid Email Address');
      });
    } else if (emain.length > 4 &&
        userName.length < 2 &&
        pas.length > 7 &&
        pas == pasAgain) {
      setState(() {
        CenterDialog.showErrorDialog(context, 'Invalid User Name');
      });
    } else if (emain.length > 4 &&
        userName.length > 1 &&
        pas.length > 7 &&
        pas != pasAgain) {
      setState(() {
        CenterDialog.showErrorDialog(context, 'Password Again Error');
      });
    } else if (emain.length < 5 &&
        userName.length < 2 &&
        pas.length > 7 &&
        pas == pasAgain) {
      setState(() {
        CenterDialog.showErrorDialog(
            context, 'Invalid User Name\nInvalid Email Address');
      });
    } else if (emain.length > 4 && userName.length > 1 && pas.length < 8) {
      setState(() {
        CenterDialog.showErrorDialog(context, 'Invalid Password');
      });
    } else if (emain.length > 4 && userName.length < 2 && pas.length < 8) {
      setState(() {
        CenterDialog.showErrorDialog(
            context, 'Invalid User Name\nInvalid Password');
      });
    } else if (emain.length < 5 && userName.length > 1 && pas.length < 8) {
      setState(() {
        CenterDialog.showErrorDialog(
            context, 'Invalid Email Address\nInvalid Password');
      });
    } else if (emain.length < 5 && userName.length < 2 && pas.length < 8) {
      setState(() {
        CenterDialog.showErrorDialog(context,
            'Invalid User Name\nInvalid Email Address\nInvalid Password');
      });
    } else if (emain.length > 4 &&
        userName.length < 2 &&
        pas.length > 7 &&
        pas != pasAgain) {
      setState(() {
        CenterDialog.showErrorDialog(
            context, 'Invalid User Name\nPassword Again Error');
      });
    } else if (emain.length < 5 &&
        userName.length > 1 &&
        pas.length > 7 &&
        pas != pasAgain) {
      setState(() {
        CenterDialog.showErrorDialog(
            context, 'Invalid Email Address\nPassword Again Error');
      });
    } else if (emain.length < 5 &&
        userName.length < 2 &&
        pas.length > 7 &&
        pas != pasAgain) {
      setState(() {
        CenterDialog.showErrorDialog(context,
            'Invalid Email Address\nPassword Again Error\nPassword Again Error');
      });
    } else if (emain.length < 5 &&
        userName.length < 2 &&
        pas.length < 8 &&
        pas != pasAgain) {
      setState(() {
        CenterDialog.showErrorDialog(context,
            'Invalid Email Address\nPassword Again Error\nInvalid Password');
      });
    }
  }
}