import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/invite.dart';
import 'package:herraf_app/pack.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InviteFriend extends StatefulWidget {
  const InviteFriend({Key? key}) : super(key: key);

  @override
  State<InviteFriend> createState() => _InviteFriendState();
}

class _InviteFriendState extends State<InviteFriend> {
  var Invitefriend;
  get invitefriend async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    ApiService.selectpack(pref.get('user_id')).then((value) {
      // print("hoglllg");
      setState(() {
        print("${value}");
        Invitefriend = value["data"];
        // isLoading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "Invite a friend",
          style: GoogleFonts.poppins(
              color: Color(0xff0093ED),
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        leading: InkWell(
          onTap: (() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InvitefriendPage()),
            );
          }),
          child: Container(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff0093ED),
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  child: Image.asset(
                    'assets/images/Frame(4).png',
                    height: 20,
                    width: 20,
                    // width: MediaQuery.of(context).size.width * 0.94,
                    // height: MediaQuery.of(context).size.height * 0.14,
                  ), // <-- SEE HERE
                ),
              )),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Invitefriend.lenght == 0
                  ? Center(
                      child: Text(
                        "No friends is avilable",
                        style: GoogleFonts.poppins(
                            color: Color(0xffB0A9A9), fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                      return BodyWidget();
                    })
          // BodyWidget(),

          ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  get imageFile => null;
  bool isSwitched = false;

  showAlert(BuildContext context) {
    var foldertitleController;
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            insetPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 45),
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0.0))),

            // title:
            content: Container(
                child: Form(
                    child: Container(
                        //  https://www.youtube.com/shorts/VgmnuQNjghs

                        // color: Colors.amber,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0)),
                            height: 354,
                            width: 294,
                            child: Column(children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 50, top: 10),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    // child: Text(
                                    //   'Create new folder ',
                                    //   style: GoogleFonts.poppins(
                                    //       color: Color(0xff089C78),
                                    //       fontSize: 18,
                                    //       fontWeight: FontWeight.w600),
                                    // ),
                                  ),
                                  Container(
                                      child: Image.asset(
                                    'assets/images/Auto Layout Horizontal(3).png',
                                    height: 23,
                                    width: 23,
                                    // width: MediaQuery.of(context).size.width * 0.94,
                                    // height: MediaQuery.of(context).size.height * 0.14,
                                  )), // <-- SEE HERE
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 12),
                                //   padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "Just so you know",
                                  style: GoogleFonts.poppins(
                                      color: Color(0xff00253A),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 0, bottom: 30),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text:
                                          'Unfortunately the friend you invited does not own the.',
                                      style: GoogleFonts.poppins(
                                          color: Color(0xff8D8D8D),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    TextSpan(
                                      text: '[Pack name]',
                                      style: GoogleFonts.poppins(
                                          color: Color(0xff000000),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    TextSpan(
                                      text:
                                          'and won’t be able to avoid in-game penalties',
                                      style: GoogleFonts.poppins(
                                          color: Color(0xff8D8D8D),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ]),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                height: 53,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                InvitefriendPage
                                                    //CatalogPage
                                                    ()));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xff0093ED),
                                        // style: BorderStyle.solid,
                                        width: 2.0,
                                      ),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Center(
                                          child: Text(
                                            'Send anyway',
                                            style: GoogleFonts.poppins(
                                                color: Color(0xff0093ED),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => InvitefriendPage
                                          //CatalogPage
                                          ()));
                                },
                                child: Container(
                                  margin: new EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 20),
                                  width: 309,
                                  height: 53,
                                  decoration: BoxDecoration(
                                    color: Color(0xff0093ED),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Invite to purchase',
                                      style: GoogleFonts.poppins(
                                        color: Color(0xffffffffff),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ])))))));
  }

  @override
  Widget build(BuildContext context) {
    var toggleSwitch;
    return ListView(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 10, bottom: 45),
          margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
          alignment: Alignment.centerLeft,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "My Friends (3)",
                  style: GoogleFonts.poppins(
                      color: Color(0xff000000),
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                // Padding(padding: const EdgeInsets.only(left: 65)),
                Text(
                  "Pack match",
                  style: GoogleFonts.poppins(
                      color: Color(0xff828282),
                      fontSize: 16,
                      fontWeight: FontWeight.w200),
                ),
                //Padding(padding: const EdgeInsets.only(left: 11, right: 20)),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    isSwitched = value;
                    print(isSwitched);
                  },
                  activeTrackColor: Color.fromRGBO(178, 255, 89, 1),
                  activeColor: Colors.green,
                ),
                // Image.asset(
                //   'assets/images/Active=False, Dark=False(2).png',
                //   height: 45,
                //   width: 45,
                //   // width: MediaQuery.of(context).size.width * 0.94,
                //   // height: MediaQuery.of(context).size.height * 0.14,
                // ), // <-- SEE HERE
              ]),
        ),
        //Padding(padding: const EdgeInsets.only(top: 5)),
        Container(
          margin: EdgeInsets.only(
            left: 10,
            right: 15,
            bottom: 10,
          ),
          height: 65,
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(33.0),
                ),
                labelText: 'Search by name',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                )),
          ),
        ),
        Card(
          child: ListTile(
            leading: CircleAvatar(
                backgroundColor: const Color(0xffffffff),
                radius: 25,
                backgroundImage: imageFile == null
                    ? const AssetImage('assets/images/girls.png')
                    : FileImage(imageFile) as ImageProvider),
            title: Row(
              children: <Widget>[
                Text(
                  'Jenny Wilsons',
                  style: GoogleFonts.poppins(
                      color: Color(0xff000000),
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 50,
                  ),
                ),
              ],
            ),
            subtitle: Container(
                padding: EdgeInsets.only(top: 7),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.left,
                  children: [
                    InkWell(
                      onTap: () {
                        showAlert(context);
                      },
                      child: Image.asset(
                        'assets/images/plus1.png',
                        height: 38,
                        width: 35,
                        // width: MediaQuery.of(context).size.width * 0.94,
                        // height: MediaQuery.of(context).size.height * 0.14,
                      ), // <-- SEE H
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                    ),
                    Text(
                      'Invite',
                      style: GoogleFonts.poppins(
                          color: Color(0xffCE8C8C),
                          fontSize: 17,
                          fontWeight: FontWeight.w400),
                    ),
                    // ClipOval(
                    //   child: Container(
                    //     height: 9,
                    //     width: 9,
                    //     color: Color(0xff27AE60),
                    //   ),
                    // ),
                  ],
                )),
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 10)),
        Card(
          child: ListTile(
            leading: CircleAvatar(
                backgroundColor: const Color(0xffffffff),
                radius: 23,
                backgroundImage: imageFile == null
                    ? const AssetImage('assets/images/boys.png')
                    : FileImage(imageFile) as ImageProvider),
            title: Row(
              children: <Widget>[
                Text(
                  'Cameron Williamson',
                  style: GoogleFonts.poppins(
                      color: Color(0xff000000),
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 50,
                  ),
                ),
              ],
            ),
            subtitle: Container(
                padding: EdgeInsets.only(top: 7),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.left,
                  children: [
                    InkWell(
                      onTap: () {
                        showAlert(context);
                      },
                      child: Image.asset(
                        'assets/images/plus1.png',
                        height: 38,
                        width: 35,
                        // width: MediaQuery.of(context).size.width * 0.94,
                        // height: MediaQuery.of(context).size.height * 0.14,
                      ), // <-- SEE H
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                    ),
                    Text(
                      'Invite',
                      style: GoogleFonts.poppins(
                          color: Color(0xffCE8C8C),
                          fontSize: 19,
                          fontWeight: FontWeight.w400),
                    ),
                    // ClipOval(
                    //   child: Container(
                    //     height: 9,
                    //     width: 9,
                    //     color: Color(0xff27AE60),
                    //   ),
                    // ),
                  ],
                )),
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 10)),
        Card(
          child: ListTile(
            leading: CircleAvatar(
                backgroundColor: const Color(0xffffffff),
                radius: 23,
                backgroundImage: imageFile == null
                    ? const AssetImage('assets/images/ronald.png')
                    : FileImage(imageFile) as ImageProvider),
            title: Row(
              children: <Widget>[
                Text(
                  'Ronald Richards',
                  style: GoogleFonts.poppins(
                      color: Color(0xff000000),
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 50,
                  ),
                ),
              ],
            ),
            subtitle: Container(
                padding: EdgeInsets.only(top: 7),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.left,
                  children: [
                    InkWell(
                      onTap: () {
                        showAlert(context);
                      },
                      child: Image.asset(
                        'assets/images/plus1.png',
                        height: 38,
                        width: 35,
                        // width: MediaQuery.of(context).size.width * 0.94,
                        // height: MediaQuery.of(context).size.height * 0.14,
                      ), // <-- SEE H
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                    ),
                    Text(
                      'Invite',
                      style: GoogleFonts.poppins(
                          color: Color(0xffCE8C8C),
                          fontSize: 17,
                          fontWeight: FontWeight.w400),
                    ),

                    // ClipOval(
                    //   child: Container(
                    //     height: 9,
                    //     width: 9,
                    //     color: Color(0xff27AE60),
                    //   ),
                    // ),
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
