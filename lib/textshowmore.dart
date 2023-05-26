import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herraf_app/addcheckout.dart';
import 'package:herraf_app/api_servivce.dart';
import 'package:herraf_app/catalog.dart';
import 'package:page_transition/page_transition.dart';

class Catalogdescription extends StatefulWidget {
  final pack_name;
  final pack_description;
  final image1;
  final pack_category;
  final pack_price;
  final pack_discount;

//List<dynamic> memberList;

  Catalogdescription(this.pack_name, this.pack_description, this.image1,
      this.pack_category, this.pack_discount, this.pack_price);

  //const Catalogdescription({Key? key}) : super(key: key);

  @override
  State<Catalogdescription> createState() => _CatalogdescriptionState();
}

class _CatalogdescriptionState extends State<Catalogdescription> {
  final GlobalKey webViewKey = GlobalKey();

  //final GlobalKey<ScaffoldState> _key = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<dynamic> catalog = [];

  @override
  void initState() {
    catalogdata();
    super.initState();
    print("printimagedata");
    print(widget.pack_name);
  }

  catalogdata() {
    ApiService.catalogdata().then((value) {
      // ApiService.class_data("3,4", pref.getString("token"),date).then((value) {

      print("hoglllg");
      setState(() {
        print("rakhi${value}");
        catalog = value;
      });
    });
  }

  // void initState() {
  //   // print("${widget.id}");
  //   // print("${widget.id}");
  //   // Educationdetail("id");

  //   // TODO: implement initState

  //   super.initState();
  //   print("printimagedata");
  //   print(widget.pack_name);
  //   print(widget.image);
  //   print(widget.description);
  //   catalogdata();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 38),
              margin: new EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              alignment: Alignment.centerLeft,
              child: Row(children: <Widget>[
                InkWell(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CatalogPage()),
                    );
                  }),
                  child: Icon(Icons.arrow_back_ios_outlined,
                      color: Color(0xff0093ED), size: 25),
                ),
                Padding(padding: const EdgeInsets.only(right: 267, left: 20)),
                InkWell(
                  onTap: (() {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => CartPage()),
                    // );
                  }),
                  child: Container(
                    child: Image.asset(
                      'assets/images/addcart.png',
                      height: 32,
                      width: 32,
                      // width: MediaQuery.of(context).size.width * 0.94,
                      // height: MediaQuery.of(context).size.height * 0.14,
                    ), // <-- SEE HERE
                  ),
                ),
              ]),
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: SizedBox(
                width: 340,
                height: 320,
                child: Stack(
                  children: [
                    Container(
                      //  width: 338.0,
                      height: 320.0,
                      decoration: BoxDecoration(
                        color: Color(0xffB6E1F3),
                        image: DecorationImage(
                            image: NetworkImage(
                                'http://165.22.215.103:4000/uploads/${widget.image1}'),
                            fit: BoxFit.cover),
                        // image: DecorationImage(
                        //     image: NetworkImage("${widget.image1}"),

                        //     // image: NetworkImage(
                        //     //     'http://165.22.215.103:4000/uploads/${[
                        //     //   "image1"
                        //     // ]}'),
                        //     fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(0.0)),
                        // ignore: prefer_const_literals_to_create_immutables
                        // boxShadow: [
                        //   BoxShadow(blurRadius: 7.0, color: Colors.black)
                        // ]
                      ),
                    ),
                    Positioned(
                      // The Positioned widget is used to position the text inside the Stack widget
                      // bottom: 80,
                      // right: 85,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment
                            .start, //change here don't //worked
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topRight,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 254, left: 4),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: new EdgeInsets.symmetric(
                                    horizontal: 11.0, vertical: 0),
                                alignment: Alignment.centerLeft,
                                // child:
                                // FlatButton(
                                //     height: 36,
                                //     minWidth: 100,
                                //     materialTapTargetSize:
                                //         MaterialTapTargetSize.shrinkWrap,
                                //     shape: RoundedRectangleBorder(
                                //         borderRadius:
                                //             BorderRadius.circular(30.0)),
                                //     color: Color(0xff0093ED),
                                //     onPressed: () {
                                //       // Navigator.of(
                                //       //         context)
                                //       //     .pushReplacement(
                                //       //         MaterialPageRoute(builder: (context) => CatalogPage2()));
                                //     },
                                //     child: Text(widget.pack_category,
                                //         //  'newest',
                                //         style: GoogleFonts.montserrat(
                                //             //color: Colors.red,
                                //             color: Color(0xffffffff),
                                //             fontSize: 12,
                                //             fontWeight: FontWeight.w700))),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // child: Card(
                //   margin: EdgeInsets.all(10),
                //   color: Color(0xffF1F6FF),
                //   //shadowColor: Colors.blueGrey,
                //   elevation: 0,
                //   child: Column(
                //     mainAxisAlignment:
                //         MainAxisAlignment.start, //change here don't //worked
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: <Widget>[
                //       Container(
                //         // margin: new EdgeInsets
                //         //         .symmetric(
                //         //     horizontal: 7.0,
                //         //     vertical: 3),
                //         alignment: Alignment.topRight,
                //         child: Container(
                //             width: 50.0,
                //             height: 50.0,
                //             child: Icon(
                //               Icons.delete,
                //               color: Color(0xff000000),
                //               size: 32,
                //             )
                //             // decoration: BoxDecoration(
                //             //   color: Color(0xffB6E1F3),
                //             //   image: DecorationImage(
                //             //       image: AssetImage(
                //             //           'assets/images/Vector(51).png'),
                //             //       fit: BoxFit.cover),
                //             //   borderRadius:
                //             //       BorderRadius.all(Radius.circular(0.0)),
                //             //   // ignore: prefer_const_literals_to_create_immutables
                //             //   // boxShadow: [
                //             //   //   BoxShadow(blurRadius: 7.0, color: Colors.black)
                //             //   // ]
                //             // ),
                //             ),
                //       ),
                //       Padding(
                //         padding: EdgeInsets.only(top: 180, right: 0),
                //       ),
                //       Row(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Container(
                //             margin: new EdgeInsets.symmetric(
                //                 horizontal: 11.0, vertical: 0),
                //             alignment: Alignment.centerLeft,
                //             child: FlatButton(
                //                 height: 36,
                //                 minWidth: 100,
                //                 materialTapTargetSize:
                //                     MaterialTapTargetSize.shrinkWrap,
                //                 shape: RoundedRectangleBorder(
                //                     borderRadius:
                //                         BorderRadius.circular(30.0)),
                //                 color: Color(0xff0093ED),
                //                 onPressed: () {
                //                   // Navigator.of(
                //                   //         context)
                //                   //     .pushReplacement(
                //                   //         MaterialPageRoute(builder: (context) => CatalogPage2()));
                //                 },
                //                 child: Text('newest',
                //                     style: GoogleFonts.montserrat(
                //                         //color: Colors.red,
                //                         color: Color(0xffffffff),
                //                         fontSize: 12,
                //                         fontWeight: FontWeight.w700))),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, right: 228, left: 20),
              child: Text(
                widget.pack_name,
                //'Pack 1 Name',
                style: GoogleFonts.poppins(
                    color: Color(0xff00253A),
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ExpandableText(
                widget.pack_description,
                //'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque scelerisque efficitur posuere. Curabitur tincidunt placerat diam ac efficitur. Cras rutrum egestas nisl vitae pulvinar. Donec id mollis diam, id hendrerit neque. Donec accumsan efficitur libero, vitae feugiat odio fringilla ac. Aliquam a turpis bibendum, varius erat dictum, feugiat libero. Nam et dignissim nibh. Morbi elementum varius elit, at dignissim ex accumsan a',
                trimLines: 2,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: "€",
                        style: GoogleFonts.poppins(
                            color: Color(0xff333333),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                            text: widget.pack_price,
                            // catalog[index]["pack_price"],
                            style: GoogleFonts.poppins(
                                color: Color(0xff333333),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          )
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 20),
                  ),
                  RichText(
                    text: TextSpan(
                        text: "€",
                        style: GoogleFonts.poppins(
                            color: Color(0xff0093ED),
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                        children: [
                          TextSpan(
                            text: widget.pack_discount,
                            //catalog[index]["pack_discount"],
                            style: GoogleFonts.poppins(
                                color: Color(0xff0093ED),
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 120, left: 20, right: 22),
              child: Divider(
                thickness: 0,
                color: Color(0xff0093ED),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 38),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => CatalogPage2()));
                          },
                          child: const Text(
                            "Add to cart",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      SizedBox(
                        height: 48,
                        width: 169,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.topToBottom,
                                      child: CartOnePage
                                          // CartOnePage
                                          ()));
                            },
                            child: const Text(
                              "Buy now",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandableText extends StatefulWidget {
  const ExpandableText(
    this.text, {
    Key? key,
    this.trimLines = 2,
  })  : assert(text != null),
        super(key: key);

  final String text;
  final int trimLines;

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText> {
  bool _readMore = true;

  void _onTapLink() {
    setState(() => _readMore = !_readMore);
  }

  @override
  Widget build(BuildContext context) {
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    final colorClickableText = Colors.blue;
    final widgetColor = Colors.black;
    TextSpan link = TextSpan(
        text: _readMore ? "... read more" : " read less",
        style: TextStyle(
          color: colorClickableText,
        ),
        recognizer: TapGestureRecognizer()..onTap = _onTapLink);
    Widget result = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;
        // Create a TextSpan with data
        final text = TextSpan(
          text: widget.text,
        );
        // Layout and measure link
        TextPainter textPainter = TextPainter(
          text: link,
          textDirection: TextDirection.rtl,
          //better to pass this from master widget if ltr and rtl both supported
          maxLines: widget.trimLines,
          ellipsis: '...',
        );
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final linkSize = textPainter.size;
        // Layout and measure text
        textPainter.text = text;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final textSize = textPainter.size;
        // Get the endIndex of data
        int endIndex;
        final pos = textPainter.getPositionForOffset(Offset(
          textSize.width - linkSize.width,
          textSize.height,
        ));
        endIndex = textPainter.getOffsetBefore(pos.offset)!;
        var textSpan;
        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            text: _readMore ? widget.text.substring(0, endIndex) : widget.text,
            style: TextStyle(
              color: widgetColor,
            ),
            children: <TextSpan>[link],
          );
        } else {
          textSpan = TextSpan(
            text: widget.text,
          );
        }
        return RichText(
          softWrap: true,
          overflow: TextOverflow.clip,
          text: textSpan,
        );
      },
    );
    return result;
  }
}
