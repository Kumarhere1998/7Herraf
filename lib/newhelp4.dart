import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/api_servivce.dart';

class SupportRequest extends StatefulWidget {
  const SupportRequest({Key? key}) : super(key: key);

  @override
  State<SupportRequest> createState() => _SupportRequestState();
}

class _SupportRequestState extends State<SupportRequest> {
  final topicController = TextEditingController();
  final messageController = TextEditingController();
  Map support = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset("assets/images/background-top(2).png"),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 15),
                    child: Row(
                      children: [
                        InkWell(
                            child: const Icon(Icons.arrow_back),
                            onTap: () {
                              Navigator.pop(context);
                            }),
                        const SizedBox(width: 10),
                        Text(
                          "Support request",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: const Color(0xff212121)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Topic",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: const Color(0xff212121).withOpacity(0.8)),
                  ),
                  Container(
                    width: 340,
                    child: TextField(
                      controller: topicController,
                      scrollPhysics: const BouncingScrollPhysics(),
                      decoration: InputDecoration(
                          fillColor: Color(0xffFFFFFF),
                          filled: true,
                          hintStyle: GoogleFonts.poppins(
                              color: const Color(0xffB0A9A9).withOpacity(0.8),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE7E3E3)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(28)))),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "Message",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xff212121).withOpacity(0.8)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.225,
                  width: MediaQuery.of(context).size.width * 0.866,
                  child: TextField(
                    controller: messageController,
                    minLines: 7,
                    maxLines: 10,
                    scrollPhysics: const BouncingScrollPhysics(),
                    decoration: InputDecoration(
                        fillColor: Color(0xffFFFFFF),
                        filled: true,
                        hintStyle: GoogleFonts.poppins(
                            color: const Color(0xffB0A9A9).withOpacity(0.8),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffE7E3E3)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                  ),
                ),
              ]),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.021),
                    width: MediaQuery.of(context).size.width * 0.866,
                    height: MediaQuery.of(context).size.height * 0.082,
                    decoration: const BoxDecoration(
                        color: Color(0xffCE8C8C),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      "Send request",
                      style: GoogleFonts.poppins(
                          letterSpacing: 0.3,
                          color: const Color(0xffFFFFFF),
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  onTap: () {
                    if (topicController.text != null) {
                      ApiService.postsupport(
                              topicController.text, messageController.text)
                          .then((value) {
                        // .then((id) {
                        setState(() {
                         
                          support = value["data"];
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("${value['message']}")));
                        });
                        ;
                      });
                    }
                  })
            ],
          )
        ],
      ))),
    );
  }
}
