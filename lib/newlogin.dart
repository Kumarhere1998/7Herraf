import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:herraf_app/api_servivce.dart';
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

  final Color logoGreen = Color(0xff25bcbb);
  GoogleSignIn _googleSignIn = GoogleSignIn(
      // Optional clientId
      // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
      scopes: <String>['email']);
  _LoginData _loginData = new _LoginData();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  _facebookLogin() async {
    print("FaceBook");
    try {
      final result =
          await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.i.getUserData();
        print(userData);
        setState(() {
          print('ID==>${userData['id']}');

          print('Name==>${userData['name']}');
          print('Email==>${userData["email"]}');
          print('Image==>${userData["picture"]["data"]["url"]}');

          _saveUserInfo(
            userData["id"],
            userData["name"],
            userData["email"],
            userData["picture"]["data"]["url"],
            "facebook",
          );
        });
      }
    } catch (error) {
      print(error);
    }
  }

  _saveUserInfo(id, first_name, email, photo, type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('Name==>$first_name');
    print(photo);
    print(email);
    setState(() {
      _loginData.id = id;
      _loginData.first_name = first_name;
      _loginData.user_email = email;
      _loginData.photo = photo;
      _loginData.type = type;

      ApiService.postLogin(_loginData).then((value) {
        var res = value["data"];
        print(res["user_id "]);
        print(res["user_image"]);

        prefs.setString("user_id", res["id"].toString());
        prefs.setString("first_name", res["first_name"].toString());
        prefs.setString("last_name", res["last_name"].toString());
        prefs.setString("user_email", res["user_email"].toString());
        prefs.setString("user_email", res["user_email"].toString());
        prefs.setString("photo", res["user_image"].toString());
        // prefs.setString("user_image", res["user_image"].toString());

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => HomePage1(),
            ));
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("𝓁ℴℊ𝒾𝓃 𝓈𝓊𝒸𝒸ℯ𝓈𝓈𝒻𝓊𝓁𝓁𝓎")));
      });
    });
  }

  var name;
  _googleLogin() async {
    print('_googleSignIn sdfsdf');
    try {
      await _googleSignIn.signIn();
      setState(() {
        print(
          _googleSignIn.currentUser?.displayName,
        );
        _saveUserInfo(
          _googleSignIn.currentUser?.id,
          _googleSignIn.currentUser?.displayName,
          _googleSignIn.currentUser?.email,
          _googleSignIn.currentUser?.photoUrl,
          "google",
        );
      });
    } catch (err) {
      print("this error$err");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Text(
                  "Sign up",
                  style: GoogleFonts.poppins(
                      color: Color(0xff212121),
                      fontSize: 32,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                child: Text(
                  "Login",
                  style: GoogleFonts.poppins(
                      color: Color(0xffB0A9A9),
                      fontSize: 32,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ]),
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
            _googleLogin();
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
          onTap: () {
            print('Clicked');
          },
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
                onTap: () {
                  print('Clicked');
                },
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
}
