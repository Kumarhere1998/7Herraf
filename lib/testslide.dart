// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:rsa_app/Gallery.dart';
// import 'package:rsa_app/api/api_service.dart';
// import 'package:rsa_app/diets_plan.dart';
// import 'package:rsa_app/invoice.dart';
// import 'package:rsa_app/memberships_renewal.dart';
// import 'dart:io';
// import 'package:rsa_app/thankyou.dart';
// import 'package:rsa_app/workout_plan.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'franchise.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// _launchURLBrowser() async {
//   var url = Uri.parse(
//       "https://app.ramagyasportsacademy.com/api/user-invoice/eyJpdiI6ImRYekNPdU5GSHoyaTcrTkNmYmJ6bGc9PSIsInZhbHVlIjoieTlQT3BJQUJtV09KUUdZdE9ZMFFLS2ZtaHVtdDRONVZieDVkVXpQUVJLbz0iLCJtYWMiOiI5NjFlZmJiOGM3ZjFlZjE3ODRlYjI4Njk3ZmVkODM0YTFmNGM4NWNlOTM5OTNhZjVhNmQ5ZmJlNWQ3NGNiNmY2IiwidGFnIjoiIn0=?signature=363e56cb5e8d92b9b898a7d79c0732b235e917a972783b135d8b69ad529d594c");
//   if (await canLaunchUrl(url)) {
//     await launchUrl(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

// _launchURLApp() async {
//   var url = Uri.parse(
//       "https://app.ramagyasportsacademy.com/api/user-invoice/eyJpdiI6ImRYekNPdU5GSHoyaTcrTkNmYmJ6bGc9PSIsInZhbHVlIjoieTlQT3BJQUJtV09KUUdZdE9ZMFFLS2ZtaHVtdDRONVZieDVkVXpQUVJLbz0iLCJtYWMiOiI5NjFlZmJiOGM3ZjFlZjE3ODRlYjI4Njk3ZmVkODM0YTFmNGM4NWNlOTM5OTNhZjVhNmQ5ZmJlNWQ3NGNiNmY2IiwidGFnIjoiIn0=?signature=363e56cb5e8d92b9b898a7d79c0732b235e917a972783b135d8b69ad529d594c");
//   if (await canLaunchUrl(url)) {
//     await launchUrl(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

// class MembershipCard extends StatefulWidget {
//   @override
//   State<MembershipCard> createState() => _MembershipCardState();
// }

// class _MembershipCardState extends State<MembershipCard> {
//   List<dynamic> _memberships = [];

//   InAppWebViewController? webViewController;
//   InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
//       crossPlatform: InAppWebViewOptions(
//         useShouldOverrideUrlLoading: true,
//         mediaPlaybackRequiresUserGesture: false,
//       ),
//       android: AndroidInAppWebViewOptions(
//         useHybridComposition: true,
//       ),
//       ios: IOSInAppWebViewOptions(
//         allowsInlineMediaPlayback: true,
//       ));

//   late PullToRefreshController pullToRefreshController;
//   late ContextMenu contextMenu;
//   String url = "";
//   double progress = 0;
//   final urlController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _userInfo();
//     _invoicedata();

//     contextMenu = ContextMenu(
//         menuItems: [
//           ContextMenuItem(
//               androidId: 1,
//               iosId: "1",
//               title: "Special",
//               action: () async {
//                 print("Menu item Special clicked!");
//                 print(await webViewController?.getSelectedText());
//                 await webViewController?.clearFocus();
//               })
//         ],
//         options: ContextMenuOptions(hideDefaultSystemContextMenuItems: false),
//         onCreateContextMenu: (hitTestResult) async {
//           print("onCreateContextMenu");
//           print(hitTestResult.extra);
//           print(await webViewController?.getSelectedText());
//         },
//         onHideContextMenu: () {
//           print("onHideContextMenu");
//         },
//         onContextMenuActionItemClicked: (contextMenuItemClicked) async {
//           var id = (Platform.isAndroid)
//               ? contextMenuItemClicked.androidId
//               : contextMenuItemClicked.iosId;
//           print("onContextMenuActionItemClicked: " +
//               id.toString() +
//               " " +
//               contextMenuItemClicked.title);
//         });

//     pullToRefreshController = PullToRefreshController(
//       options: PullToRefreshOptions(
//         color: Colors.white,
//       ),
//       onRefresh: () async {
//         if (Platform.isAndroid) {
//           webViewController?.reload();
//         } else if (Platform.isIOS) {
//           webViewController?.loadUrl(
//               urlRequest: URLRequest(url: await webViewController?.getUrl()));
//         }
//       },
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   bool isLoading = true;
//   var data = [];
//   _userInfo() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     ApiService.memberships(pref.getInt("user_id"), pref.getString("token"))
//         .then((value) {
//       data = value["data"];
//       setState(() {
//         print(data.length);
//         isLoading = false;
//       });
//     });
//   }

//   var dval;
//   _invoicedata() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     print("user_membership_id");
//     print(pref.getInt("user_membership_id"));
//     ApiService.invoice(pref.getInt("user_id"),
//             pref.getInt("user_membership_id"), pref.getString("token"))
//         .then((value) {
//       dval = value["data"];
//       setState(() {
//         print("invoice111111$dval");
//         isLoading = false;
//       });
//     });
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: const Color(0xffFFFFFF),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Color(0xff000000)),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text(
//           "Choose Membership",
//           textAlign: TextAlign.left,
//           style: GoogleFonts.roboto(
//             fontSize: 16,
//             color: const Color(0xff000000),
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [Color(0xffFFFFFF), Color(0xffFFFFFF)],
//         )),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 // margin: const EdgeInsets.only(
//                 //     left: 20, right: 20, bottom: 20, top: 10),
//                 height: 170,
//                 // width: MediaQuery.of(context).size.width,
//                 child: isLoading
//                     ? const Center(child: CircularProgressIndicator())
//                     : ListView(
//                         physics: const AlwaysScrollableScrollPhysics(),
//                         shrinkWrap: true,
//                         itemExtent: MediaQuery.of(context).size.width,
//                         scrollDirection: Axis.horizontal,
//                         children: [
//                             if (data.length > 0) ...[
//                               for (var i = 0; i < data.length; i++) ...[
//                                 // child: Container(
//                                 //   decoration: const BoxDecoration(
//                                 //       borderRadius:
//                                 //           BorderRadius.all(
//                                 //               Radius.circular(20)),
//                                 //       gradient: LinearGradient(
//                                 //         begin: Alignment.topCenter,
//                                 //         end: Alignment.bottomCenter,
//                                 //         colors: [
//                                 //           Color(0xff21AB89),
//                                 //           Color(0xff269FA5),
//                                 //         ],
//                                 //       )),
//                                 Card(
//                                     color: const Color(0xff21AB89),
//                                     margin: const EdgeInsets.only(
//                                         left: 40, right: 40, bottom: 0, top: 0),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10.0),
//                                     ),
//                                     child: Container(
//                                       padding: const EdgeInsets.only(
//                                           left: 10, right: 10),
//                                       // height: MediaQuery.of(context)
//                                       //         .size
//                                       //         .height *
//                                       //     80,
//                                       decoration: const BoxDecoration(
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(20)),
//                                           gradient: LinearGradient(
//                                             begin: Alignment.topCenter,
//                                             end: Alignment.bottomCenter,
//                                             colors: [
//                                               Color(0xff21AB89),
//                                               Color(0xff269FA5),
//                                             ],
//                                           )),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(0.0),
//                                         child: Column(
//                                           // crossAxisAlignment:
//                                           //     CrossAxisAlignment.stretch,
//                                           children: [
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 IconButton(
//                                                   icon: Image.asset(
//                                                     'assets/icon/rsa_logo_old.png',
//                                                     fit: BoxFit.fill,
//                                                   ),
//                                                   iconSize: 60,
//                                                   onPressed: () {},
//                                                 ),
//                                                 // height: MediaQuery.of(
//                                                 //             context)
//                                                 //         .size
//                                                 //         .height *
//                                                 //     0.06,
//                                                 // Image.asset(
//                                                 //     'assets/icon/rsa_logo_old.png'),

//                                                 Text(
//                                                   '${data[i]["duration"]} month',
//                                                   style: GoogleFonts.roboto(
//                                                     color:
//                                                         const Color(0xffffffff),
//                                                     fontSize: 16,
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             GestureDetector(
//                                               onTap: () {},
//                                               child: Text(
//                                                 '${data[i]["membership_name"]} | ${data[i]["session"]} Session',
//                                                 textAlign: TextAlign.center,
//                                                 style: GoogleFonts.roboto(
//                                                   color:
//                                                       const Color(0xffffffff),
//                                                   fontSize: 18,
//                                                   fontWeight: FontWeight.w500,
//                                                 ),
//                                               ),
//                                             ),
//                                             const SizedBox(
//                                               height: 35,
//                                             ),
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.all(0.0),
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Text(
//                                                     'From: ${data[i]["startdate"]}',
//                                                     style: GoogleFonts.roboto(
//                                                       color: const Color(
//                                                           0xffffffff),
//                                                       fontSize: 14,
//                                                       fontWeight:
//                                                           FontWeight.w600,
//                                                     ),
//                                                   ),
//                                                   Text(
//                                                     'To: ${data[i]["endtdate"]}',
//                                                     style: GoogleFonts.roboto(
//                                                       color: const Color(
//                                                           0xffffffff),
//                                                       fontSize: 14,
//                                                       fontWeight:
//                                                           FontWeight.w600,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     )),
//                               ],
//                             ] else ...[
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 10, right: 10),
//                                 child: Card(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10.0),
//                                   ),
//                                   child: Container(
//                                     decoration: const BoxDecoration(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(20)),
//                                         gradient: LinearGradient(
//                                           begin: Alignment.topCenter,
//                                           end: Alignment.bottomCenter,
//                                           colors: [
//                                             Color(0xff21A09A),
//                                             Color(0xff21AB89)
//                                           ],
//                                         )),
//                                     child: Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Expanded(
//                                           child: Container(
//                                             width: MediaQuery.of(context)
//                                                 .size
//                                                 .width,
//                                             height: MediaQuery.of(context)
//                                                 .size
//                                                 .height,
//                                             padding: const EdgeInsets.only(
//                                               top: 20,
//                                               left: 20,
//                                             ),
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.stretch,
//                                               children: [
//                                                 GestureDetector(
//                                                     onTap: () {
//                                                       Navigator.push(
//                                                           context,
//                                                           MaterialPageRoute(
//                                                               builder: (BuildContext
//                                                                       context) =>
//                                                                   MembershipCard()));
//                                                     },
//                                                     child: Text(
//                                                       'All memberships expired',
//                                                       textAlign: TextAlign.left,
//                                                       style: GoogleFonts.roboto(
//                                                         color: const Color(
//                                                             0xffFFFFFF),
//                                                         fontSize: 16,
//                                                         fontWeight:
//                                                             FontWeight.w600,
//                                                       ),
//                                                     )),
//                                                 GestureDetector(
//                                                     onTap: () {
//                                                       Navigator.push(
//                                                           context,
//                                                           MaterialPageRoute(
//                                                               builder: (BuildContext
//                                                                       context) =>
//                                                                   MembershipCard()));
//                                                     },
//                                                     child: Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               bottom: 20),
//                                                       child: Text(
//                                                         'Tap to renew now',
//                                                         textAlign:
//                                                             TextAlign.left,
//                                                         style:
//                                                             GoogleFonts.roboto(
//                                                           color: const Color(
//                                                               0xffFFFFFF),
//                                                           fontSize: 20,
//                                                           fontWeight:
//                                                               FontWeight.w700,
//                                                         ),
//                                                       ),
//                                                     )),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ]
//                           ]),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               isLoading
//                   ? Center(child: CircularProgressIndicator())
//                   : data.length > 0
//                       ? Container(
//                           padding: const EdgeInsets.only(left: 10.0, right: 10),
//                           width: 340,
//                           height: 150,
//                           child: Card(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             color: const Color(0xff88E797),
//                             child: Column(
//                               children: [
//                                 const Padding(
//                                     padding: EdgeInsets.only(top: 15)),
//                                 Text(
//                                   'Status',
//                                   style: GoogleFonts.poppins(
//                                     color: const Color(0xffFFFFFF),
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 30,
//                                 ),
//                                 Text(
//                                   'Ongoing',
//                                   style: GoogleFonts.poppins(
//                                     color: const Color(0xffFFFFFF),
//                                     fontSize: 22,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       : Container(
//                           padding: const EdgeInsets.only(left: 10.0, right: 10),
//                           width: 320,
//                           height: 120,
//                           child: Card(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             color: const Color(0xffD85A72),
//                             child: Column(
//                               children: [
//                                 const Padding(
//                                     padding: EdgeInsets.only(top: 15)),
//                                 Text(
//                                   'Status',
//                                   style: GoogleFonts.poppins(
//                                     color: const Color(0xffFFFFFF),
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 30,
//                                 ),
//                                 Text(
//                                   'Expire',
//                                   style: GoogleFonts.poppins(
//                                     color: const Color(0xffFFFFFF),
//                                     fontSize: 22,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) =>
//                                     const WorkoutPlan()));
//                       },
//                       child: Container(
//                         height: MediaQuery.of(context).size.height * 0.10,
//                         width: MediaQuery.of(context).size.width * 0.48,
//                         child: Card(
//                           color: const Color(0xff99D7FE),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: <Widget>[
//                               Container(
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.06,
//                                 child:
//                                     Image.asset('assets/images/personal.png'),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (BuildContext context) =>
//                                               const WorkoutPlan()));
//                                 },
//                                 child: Container(
//                                   padding: EdgeInsets.only(left: 10),
//                                   child: Text(
//                                     "Plan",
//                                     style: GoogleFonts.poppins(
//                                       color: const Color(0xff314545),
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                     textAlign: TextAlign.left,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       )),
//                   GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) =>
//                                     MembershipsRenewal()));
//                       },
//                       child: Container(
//                         height: MediaQuery.of(context).size.height * 0.10,
//                         width: MediaQuery.of(context).size.width * 0.48,
//                         child: Card(
//                           color: const Color(0xff99D7FE),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: <Widget>[
//                               Container(
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.06,
//                                 child: Image.asset('assets/images/credit.png'),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (BuildContext context) =>
//                                               MembershipsRenewal()));
//                                 },
//                                 child: Container(
//                                   padding: const EdgeInsets.only(left: 10),
//                                   child: Text(
//                                     "Renew",
//                                     style: GoogleFonts.poppins(
//                                       color: const Color(0xff2E4141),
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                     textAlign: TextAlign.left,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       )),
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) =>
//                                     DietsPlan()));
//                       },
//                       child: Container(
//                         height: MediaQuery.of(context).size.height * 0.10,
//                         width: MediaQuery.of(context).size.width * 0.48,
//                         child: Card(
//                           color: const Color(0xff99D7FE),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: <Widget>[
//                               Container(
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.06,
//                                 child: Image.asset('assets/images/diet.png'),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (BuildContext context) =>
//                                               DietsPlan()));
//                                 },
//                                 child: Container(
//                                   padding: const EdgeInsets.only(left: 10),
//                                   child: Text(
//                                     "Diet",
//                                     style: GoogleFonts.poppins(
//                                       color: Color(0xff314545),
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                     textAlign: TextAlign.left,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       )),
//                   GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) =>
//                                     HotelWebview(dval)));
//                       },
//                       child: Container(
//                         height: MediaQuery.of(context).size.height * 0.10,
//                         width: MediaQuery.of(context).size.width * 0.48,
//                         child: Card(
//                           color: const Color(0xff99D7FE),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: <Widget>[
//                               Container(
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.06,
//                                 child: Image.asset('assets/images/invoice.png'),
//                               ),
//                               GestureDetector(
//                                 onTap: () async {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (BuildContext context) =>
//                                               HotelWebview(dval)));
//                                 },
//                                 child: Container(
//                                   padding: EdgeInsets.only(left: 10),
//                                   child: Text(
//                                     "Invoice",
//                                     style: GoogleFonts.poppins(
//                                       color: const Color(0xff2E4141),
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                     textAlign: TextAlign.left,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       )),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }