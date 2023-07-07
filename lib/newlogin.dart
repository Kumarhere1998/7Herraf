import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/bottomNavBar.dart';
import 'package:herraf_app/selectcountry.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleloginPage1 extends StatefulWidget {
  //const MyHomePage3({Key? key}) : super(key: key);

  @override
  State<GoogleloginPage1> createState() => _GoogleloginPage1State();
}

class _LoginData {
  String id = "0";
  String first_name = '';
  String user_email = '';
  String photo = '';
  String type = '';
  String user_password = '';
}

class _GoogleloginPage1State extends State<GoogleloginPage1> {
  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);
  int currentPage = 0;
  bool _isSelected = false;
  List<String> textBotton = ['Sign up', 'Sign in'];

  GoogleSignIn _googleSignIn = GoogleSignIn(
      // Optional clientId
      // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
      scopes: <String>['email']);
  _LoginData _loginData = new _LoginData();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  _facebookLogin() async {
    try {
      final result =
          await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.i.getUserData();
        setState(() {
          _saveUserInfo(
              userData["id"],
              userData["name"],
              userData["email"],
              userData["picture"]["data"]["url"],
              "facebook",
              // bottonType
              '');
        });
      }
    } catch (error) {}
  }

  _saveUserInfo(id, first_name, email, photo, type, bottonType) async {
    print("I'm here $bottonType");

    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _loginData.id = id;
      _loginData.first_name = first_name;
      _loginData.user_email = email;
      _loginData.photo = photo;
      _loginData.type = type;

      ApiService.postLogin(_loginData).then((value) {
        print('VALUE==>$value');
        var res = value["data"];

        prefs.setString("user_id", res["id"].toString());
        prefs.setString("first_name", res["first_name"].toString());
        prefs.setString("last_name", res["last_name"].toString());
        prefs.setString("user_email", res["user_email"].toString());
        prefs.setString("user_email", res["user_email"].toString());
        prefs.setString("photo", res["user_image"].toString());
        // prefs.setString("user_image", res["user_image"].toString());

        if (bottonType == 'SignUp') {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => HomePage1(),
              ));
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("account created successfully")));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => BottomNav(2),
              ));
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("𝓁ℴℊ𝒾𝓃 𝓈𝓊𝒸𝒸ℯ𝓈𝓈𝒻𝓊𝓁𝓁𝓎")));
        }
      });
    });
  }

  var name;
  _googleLogin(bottonType) async {
    print("I'm here $bottonType");
    try {
      await _googleSignIn.signIn();
      setState(() {
        _saveUserInfo(
          _googleSignIn.currentUser?.id,
          _googleSignIn.currentUser?.displayName,
          _googleSignIn.currentUser?.email,
          _googleSignIn.currentUser?.photoUrl,
          "google",
          bottonType,
        );
      });
    } catch (err) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        Container(
          child: Image.asset(
            'assets/images/background-top(2).png',
            height: 260,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                currentPage = 0;

                setState(() {
                  if (_isSelected) {
                    _isSelected = false;
                  } else {
                    _isSelected = true;
                  }
                });
              },
              child: Text(
                '${textBotton[0]}',
                style: TextStyle(
                  fontSize: _isSelected ? 20 : 35,
                  color: _isSelected ? Colors.grey : Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentPage = 1;
                  if (_isSelected) {
                    _isSelected = false;
                  } else {
                    _isSelected = true;
                  }
                });
              },
              child: Text(
                '${textBotton[1]}',
                style: TextStyle(
                  fontSize: _isSelected ? 35 : 20,
                  color: _isSelected ? Colors.black : Colors.grey,
                ),
              ),
            ),
          ],
        ),
        Container(
          child: currentPage == 0 ? signUpSide() : loginSide(),
        ),
        Container(
          margin: EdgeInsets.only(top: 60),
          height: 150,
          width: 300,
          child: Stack(alignment: Alignment.bottomCenter, children: <Widget>[
            Image(
              image: AssetImage('assets/images/pattern(1).png'),
            ),
            Positioned(
              bottom: 20,
              child: InkWell(
                onTap: () {},
                child: Text(
                  "Have a code from a friend?",
                  style: GoogleFonts.poppins(
                      color: const Color(0xffCE8C8C),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ]),
        )
      ])),
    );
  }

  Widget signUpSide() {
    return Container(
        child: Column(
      children: [
        InkWell(
          onTap: () {
            _facebookLogin();
          },
          child: Container(
            padding: const EdgeInsets.only(
              top: 40,
            ),
            width: 320,
            child: Image.asset(
              'assets/images/facebook.png',
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
        SizedBox(height: 25),
        InkWell(
          onTap: () {
            _googleLogin('Signup');
          },
          child: Container(
              width: 320,
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: const Color(0xffB0A9A9),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32),
                  )),
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      height: 35,
                      width: 35,
                      child: Image.asset('assets/images/Group 356.png')),
                  SizedBox(
                    width: 33,
                  ),
                  Text('Sign up with Google',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500))
                ],
              )),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: Text(
            "or",
            style: GoogleFonts.poppins(
                color: Color(0xff212121),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 65),
        InkWell(
          onTap: () {},
          child: Container(
              height: 55,
              width: 320,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: const Color(0xffB0A9A9),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32),
                  )),
              child: Center(
                child: Text(
                  "Continue as a guest",
                  style: GoogleFonts.poppins(
                      color: const Color(0xffB0A9A9),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              )),
        ),
      ],
    ));
  }

  Widget loginSide() {
    return Container(
        child: Column(
      children: [
        InkWell(
          onTap: () {
            _facebookLogin();
          },
          child: Container(
              width: 320,
              height: 55,
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                  color: const Color(0xff0079FB),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xff0079FB),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32),
                  )),
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      height: 35,
                      width: 35,
                      child: Image.asset('assets/images/facebookLogo.png')),
                  SizedBox(
                    width: 33,
                  ),
                  Text('Sign in with facbook',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500))
                ],
              )),
        ),
        SizedBox(height: 20),
        InkWell(
          onTap: () {
            _googleLogin('Login');
          },
          child: Container(
              width: 320,
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: const Color(0xffB0A9A9),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32),
                  )),
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      height: 35,
                      width: 35,
                      child: Image.asset('assets/images/Group 356.png')),
                  SizedBox(
                    width: 33,
                  ),
                  Text('Sign in with Google',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500))
                ],
              )),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: Text(
            "or",
            style: GoogleFonts.poppins(
                color: Color(0xff212121),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 65),
        InkWell(
          onTap: () {},
          child: Container(
              height: 55,
              width: 320,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: const Color(0xffB0A9A9),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32),
                  )),
              child: Center(
                child: Text(
                  "Continue as a guest",
                  style: GoogleFonts.poppins(
                      color: const Color(0xffB0A9A9),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              )),
        ),
      ],
    ));
  }
}
