import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class URLS {
  static const String BASE_URL = 'http://165.22.215.103:4000';
  static const String IMAGE_URL =
      'http://165.22.215.103/projects/7herraf/uploads';
}

class ApiService {
  // String API_URL = "http://165.22.215.103:4000";

  static Future selectcountrydata() async {
    final response =
        await http.get(Uri.parse('${URLS.BASE_URL}/api/countries'));
    print("hhghhggg");
    print(response.statusCode);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future postLogin(_data) async {
    var body = {
      "first_name": "${_data.first_name}",
      "user_id": "${_data.id}",
      "country_id": "1",
      // "last_name": "${_data.last_name}",
      // "user_id": "${_data.id}",
      "user_email": "${_data.user_email}",
      "user_image": "${_data.photo}",
      // "photo": "${_data.photo}",
      "user_password": "12345678",
      "type": "${_data.type}",
    };
    print(body);

    final response = await http
        .post(Uri.parse('http://165.22.215.103:4000/api/login'), body: body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseJson = jsonDecode(response.body);
      print(responseJson);
      print(response.statusCode);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  // static Future checkout(_data) async {
  //   var body = {
  //     "user_id": "${_data.user_id}",
  //     "phone_no": "${_data.phone_no}",
  //     "address": "${_data.address}",
  //     "state": "${_data.state}",
  //     "state": "${_data.state}",
  //     "city": "${_data.city}",
  //     "zipcode": "${_data.zipcode}",
  //   };

  //   final response = await http
  //       .post(Uri.parse('http://165.22.215.103:4000/api/checkout'), body: body);
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> responseJson = jsonDecode(response.body);
  //     print(responseJson);
  //     print(response.statusCode);
  //     return responseJson;
  //   } else {
  //     return response.statusCode;
  //   }
  // }

  static Future addtocart(_addtocart) async {
    var body = {
      "user_id": "${_addtocart.user_id}",
      "pack_id": "${_addtocart.pack_id}",
      "price": "${_addtocart.price}",
      "discount": "${_addtocart.discount}",
      "quantity": "${_addtocart.quantity}",
    };
    print("CARTITEM${body}");
    final response = await http.post(
        Uri.parse('http://165.22.215.103:4000/api/add-to-cart'),
        body: body);

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      print(responseJson);

      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future addtocartdata(id) async {
    print('${URLS.BASE_URL}/api/cart/${id}');
    final response =
        await http.get(Uri.parse('${URLS.BASE_URL}/api/cart/${id}'));

    // print("Response value ==>${response.body}");
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      // return response.statusCode;
    }
  }

  static Future myflashcard(user_id) async {
    var body = {"user_id": "$user_id"};

    print(body);
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/myflashcard'), body: body);

    print("makepayment${response.body}");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

  // static Future myflashcard() async {
  //   var body = {"id": "10"};

  //   print(body);
  //   final response = await http
  //       .post(Uri.parse('${URLS.BASE_URL}/api/myflashcard'), body: body);
  //   print("url");

  //   print("makepayment${response.body}");
  //   if (response.statusCode == 200) {
  //     var responseJson = jsonDecode(response.body);
  //     return responseJson;
  //   } else {
  //     return response.statusCode;
  //   }
  // }
  static Future postqrdata(user_id, qr_value) async {
    var body = {"qr_value": "${qr_value}", "id": "$user_id"};

    print('BODY==> $body');

    final response = await http
        .post(Uri.parse('http://165.22.215.103:4000/api/qrscan'), body: body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

  static Future paymentdata(user_id) async {
    var body = {"user_id": "$user_id"};

    final response = await http.post(
        Uri.parse('http://165.22.215.103:4000/api/cartsummary'),
        body: body);

    print("cardsummary${response.body}");
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future deletedata(id) async {
    var body = {"ids": id.join(",")};

    print('BODY ==>$body');
    final response = await http.post(
        Uri.parse('http://165.22.215.103:4000/api/cart/delete'),
        body: body);

    // print("makepayment${response.body}");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

  static Future postaddressData(postAddress) async {
    var body = {
      "name": "${postAddress.name}",
      "email": "${postAddress.email}",
      // "last_name": "${_data.last_name}",
      "user_id": "${postAddress.user_id}",
      "phone_no": "${postAddress.phone_no}",
      "country": "${postAddress.country}",

      "address": "${postAddress.address}",
      "city": "${postAddress.city}",
      "state": "${postAddress.state}",
      "zipcode": "${postAddress.zipcode}",
    };
    print(body);
    final response = await http
        .post(Uri.parse('http://165.22.215.103:4000/api/checkout'), body: body);
    print(response.statusCode);
    // print("cashbody$body");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

  static Future casdeliveryhdata(_cashAddress) async {
    var body = {
      "user_id": "${_cashAddress.user_id}",
      "sub_total": "${_cashAddress.amount}",
      "total": "${_cashAddress.total}",
      "amount": "${_cashAddress.amount}",
      "status": "${_cashAddress.status}",
      "discount_price": "${_cashAddress.discount_price}",
      "payment_method": "${_cashAddress.payment_method}",
    };
    print("payment_method$body");
    final response = await http
        .post(Uri.parse('http://165.22.215.103:4000/api/order'), body: body);
    print("ontapcash");
    print(response.statusCode);
    print("cashpayment$body");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

  static Future soundupdatehdata(
      user_id, isSound, isMusic, isNotification) async {
    var body = {
      "user_id": user_id,
      "sound_effects": isSound ? "1" : "0",
      "music": isMusic ? "1" : "0",
      "notification_sound": isNotification ? "1" : "0",
    };
    print("soundMethod==> $body");
    final response = await http.post(
        Uri.parse('http://165.22.215.103:4000/api/sound-update'),
        body: body);
    print(response.statusCode);
    print("Sound==>$body");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

  static Future activatepackData(user_id, pack_id) async {
    var body = {
      "user_id": "${user_id}",
      "pack_id": "${pack_id}",
      "is_activated": "1"
    };
    print("payment_method$body");
    final response = await http.post(
        Uri.parse('http://165.22.215.103:4000/api/orders/update'),
        body: body);

    print(response.statusCode);
    print("activatepack$body");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }
  // static Future postaddressData(postAddress) async {
  //   try {
  //     var body = {
  //       "name": "${postAddress.name}",
  //       "email": "${postAddress.email}",
  //       // "last_name": "${_data.last_name}",
  //       "user_id": "${postAddress.user_id}",
  //       "phone_no": "${postAddress.phone_no}",
  //       "country": "${postAddress.country}",

  //       "address": "${postAddress.address}",
  //       "city": "${postAddress.city}",
  //       "state": "${postAddress.state}",
  //       "zipcode": "${postAddress.zipcode}",
  //     };

  //     final response = await http.post(
  //         Uri.parse('http://165.22.215.103:4000/api/checkout'),
  //         body: body);
  //     print(response.statusCode);
  //     print("checkout1");
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> responseJson = jsonDecode(response.body);
  //       print(responseJson);
  //       print(response.statusCode);
  //       return responseJson;
  //     } else {
  //       return response.statusCode;
  //     }
  //   } catch (e) {
  //     print(Exception(e));
  //     throw e;
  //   }
  // }
  static Future postsupport(title, message) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var body = {
        "user_id": pref.getString("user_id"),
        "user_email": pref.getString("user_email"),
        "title": title,
        "message": message
      };

      final response = await http
          .post(Uri.parse('${URLS.BASE_URL}/api/support-form'), body: body);
// print(response.statusCode);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseJson = jsonDecode(response.body);
        print(responseJson);
        print(response.statusCode);
        return responseJson;
      } else {
        return response.statusCode;
      }
    } catch (e) {
      print(Exception(e));
      throw e;
    }
  }

  static Future catalogdata() async {
    final response = await http.get(Uri.parse('${URLS.BASE_URL}/api/packs'));
    // print("hhghhggg");
    // print(response.statusCode);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future membership() async {
    final response =
        await http.get(Uri.parse('${URLS.BASE_URL}/api/game-modes'));
    print("membership");
    print(response.statusCode);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future sounddata(user_id) async {
    final response =
        await http.get(Uri.parse('${URLS.BASE_URL}/api/sound/${user_id}'));
    print(user_id);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future selectpack(user_id) async {
    final response = await http.get(
      Uri.parse('${URLS.BASE_URL}/api/playing-packs/${user_id}'),
    );

    // print(response.statusCode);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  // static Future randomplayer(user_id) async {
  //   final response = await http.get(
  //     Uri.parse('${URLS.BASE_URL}/api/playing-card/${user_id}'),
  //   );

  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     var responseJson = jsonDecode(response.body);
  //     return responseJson;
  //   } else {
  //     return response.statusCode;
  //   }
  // }

  static Future friendslist() async {
    final response = await http.get(Uri.parse('${URLS.BASE_URL}/api/users'));
    print("hhghhggg");
    print(response.statusCode);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future randomgame(user_id, pack_id) async {
    var body = {
      "user_id": "${user_id}",
      "pack_id": "${pack_id}",
      "no_of_players": "2",
      "is_over": "0"
    };
    print(body);
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/game-group'), body: body);

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      //print(responseJson);

      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future card_distribution(pack_id, group_id) async {
    var body = {"pack_id": "${pack_id}", "game_group_id": "${group_id}"};
    print('HEREBODy==> $body');
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/card-distribution'), body: body);

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);

      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future card_distribution_invite(pack_id, group_id) async {
    var body = {"pack_id": "${pack_id}", "game_group_id": "${group_id}"};
    print('HEREBODy==> $body');
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/card-distribution'), body: body);

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);

      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future sevenCardDistribution(pack_id, group_id, partnerID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var body = {
      "pack_id": "${pack_id}",
      "game_group_id": "${group_id}",
      "user_id": prefs.getString('user_id'),
      "other_user_id": '${partnerID}'
    };
    print('BODY==>$body');
    final response = await http.post(
        Uri.parse('${URLS.BASE_URL}/api/seven-card-distributed'),
        body: body);

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future takeCardFromDeck(user_id, group_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var body = {
      "game_group_id": "${group_id}",
      "user_id": prefs.getString('user_id')
    };
    print(body);
    final response =
        await http.post(Uri.parse('${URLS.BASE_URL}/api/take-one'), body: body);

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future cputakeCardFromDeck(group_id) async {
    var body = {"game_group_id": "${group_id}", "user_id": '1'};
    print(body);
    final response =
        await http.post(Uri.parse('${URLS.BASE_URL}/api/take-one'), body: body);

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future practicetakeCardFromDeck(user_id, group_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var body = {
      "game_group_id": "${group_id}",
      "user_id": prefs.getString('user_id')
    };
    print(body);
    final response =
        await http.post(Uri.parse('${URLS.BASE_URL}/api/take-one'), body: body);

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future deck_area(
      user_from_id, user_to_id, card_id, group_id, pack_id, card_type) async {
    print('CardType==>$card_type');

    var body = {
      "group_id": '$group_id',
      "user_from_id": '$user_from_id',
      "user_to_id": '$user_to_id',
      "card_id": '$card_id',
      "is_spell": '0',
      "pack_id": '$pack_id',
      'card_type': '$card_type'
    };
    // print(body);
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/play-game'), body: body);

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future praticeGame_deck_area(
      user_from_id, card_id, group_id, card_type) async {
    var body = {
      "group_id": "${group_id.toString()}",
      "user_from_id": "${user_from_id.toString()}",
      "user_to_id": "1",
      "card_id": "${card_id.toString()}",
      "is_spell": '0',
      "pack_id": '0',
      'card_type': card_type
    };
    // print("BODY HERE==>$body");
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/play-game'), body: body);

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future cpu_praticeGame_deck_area(
      user_from_id, card_id, group_id, card_type) async {
    var body = {
      "group_id": "${group_id.toString()}",
      "user_from_id": "1",
      "user_to_id": "${user_from_id.toString()}",
      "card_id": "${card_id.toString()}",
      "is_spell": '0',
      "pack_id": '0',
      'card_type': card_type
    };
    // print('BODY==>$body');
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/play-game'), body: body);

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future practice_get_deck_card(group_id) async {
    // print(group_id);
    final response = await http
        .get(Uri.parse('${URLS.BASE_URL}/api/played-cards/${group_id}'));

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future get_deck_card(group_id) async {
    // print('GroupID==>$group_id');
    final response = await http
        .get(Uri.parse('${URLS.BASE_URL}/api/played-cards/${group_id}'));

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future practice_first_get_deck_card(userID, gameID) async {
    var body = {'game_group_id': '$gameID', 'user_id': '$userID'};
    // print('here==>$body');
    final response = await http.post(
        Uri.parse('${URLS.BASE_URL}/api/first-card-distributed'),
        body: body);

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future first_get_deck_card(userID, gameID) async {
    var body = {'game_group_id': '$gameID', 'user_id': '$userID'};
    print('FirstCardBoddy==>$body');
    final response = await http.post(
        Uri.parse('${URLS.BASE_URL}/api/first-card-distributed'),
        body: body);

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future quiz_options(card_id) async {
    // print('After==>$card_id');
    final response = await http.get(Uri.parse(
        '${URLS.BASE_URL}/api/flash-card-acronyms-answers/${card_id}'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future searchlist(search_string) async {
    var body = {
      "search_string": "${search_string}",
    };
    print(body);
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/search-users'), body: body);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      print(responseJson);

      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future checking_answer(group_id, card_id, card_response) async {
    var body = {
      "card_id": "${card_id.toString()}",
      "card_response": "${card_response} ",
      "group_id": "$group_id"
    };
    print(body);

    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/check-card-acronym'), body: body);

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future friendlist(user_id) async {
    var body = {"user_id": "${user_id}", "status": '${1}'};
    print(body);
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/friend-list'), body: body);

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      // print(responseJson);

      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future send_request(
    user_from_id,
    user_to_id,
  ) async {
    var body = {
      "user_from_id": "${user_from_id}",
      "user_to_id": "${user_to_id}",
      "status": '${0}'
    };
    print(body);
    final response = await http.post(
        Uri.parse('${URLS.BASE_URL}/api/send-friend-request'),
        body: body);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future friend_request(user_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user_id = prefs.getString('user_id')!;

    final response = await http
        .get(Uri.parse('${URLS.BASE_URL}/api/friend-requests/${user_id}'));
    if (response.statusCode == 200) {
      // print(response.body);
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future penalty(group_id, limit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var body = {
      'user_id': prefs.getString('user_id'),
      'game_group_id': '$group_id',
      'limit': limit == '+2' ? '2' : '4'
    };
    print('Here==>$body');
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/get-penalty'), body: body);
    if (response.statusCode == 200) {
      print(response.statusCode);

      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future penaltyPratice(
    group_id,
    user_from_id,
    card_id,
  ) async {
    print(card_id.toString());
    var body = {
      "group_id": "${group_id.toString()}",
      "user_from_id": "${user_from_id.toString()}",
      "user_to_id": "1",
      "card_id": "${card_id.toString()}",
      "is_spell": '2',
      "pack_id": "1",
    };
    print(body);
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/play-game'), body: body);
    if (response.statusCode == 200) {
      print(response.statusCode);

      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future accept_request(
    user_to_id,
    user_from_id,
  ) async {
    var body = {
      "user_from_id": "${user_from_id.toString()}.",
      "user_to_id": "${user_to_id.toString()}",
      "status": "1"
    };
    print(body);
    final response = await http.post(
        Uri.parse('${URLS.BASE_URL}/api/accept-reject-friend-request'),
        body: body);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);

      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future reject_request(
    user_to_id,
    user_from_id,
  ) async {
    var body = {
      "user_from_id": "${user_from_id.toString()}.",
      "user_to_id": "${user_to_id.toString()}",
      "status": "2"
    };
    print(body);
    final response = await http.post(
        Uri.parse('${URLS.BASE_URL}/api/accept-reject-friend-request'),
        body: body);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);

      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future invite4Game(
      String gameMode, user_to_id, user_from_id, packName, packId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var full_name = prefs.getString("first_name");
    var body = {
      "title": "Game Invitation",
      "description":
          "${full_name} invited you to play for a ${gameMode} game with ${packName} pack ",
      "user_to_id": "${user_to_id.toString()}",
      "user_from_id": "${user_from_id.toString()}",
      "status": "0",
      "pack_id": packId.toString(),
      "no_of_player": '2',
      "is_over": '0'
    };
    // print("BODYINVITE ==>$body");
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/invite-to-game'), body: body);
    if (response.statusCode == 200) {
      // print("RESPONSE CODE==>${response.statusCode}");

      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future notification(
    user_id,
  ) async {
    var body = {"user_id": "${user_id}", "status": "0"};
    print(body);
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/notifications'), body: body);

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      //print(responseJson);

      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future accept_invite(
    user_to_id,
    notification_id,
    ugg_id,
    user_from_id,
  ) async {
    // print('UGG ID ==>${ugg_id}');
    var body = {
      "notification_id": notification_id.toString(),
      "user_to_id": user_to_id.toString(),
      "user_from_id": user_from_id.toString(),
      "status": "1",
      "ugg_id": ugg_id.toString()
    };
    print('Invite Accept BODY ==>${body}');
    final response = await http.post(
        Uri.parse('${URLS.BASE_URL}/api/accept-reject-game-invite'),
        body: body);
    print(response);
    if (response.statusCode == 200) {
      // print(response.statusCode);
      var responseJson = jsonDecode(response.body);
      // print('Response responseJson ==>${responseJson}');

      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future findingFriend(
    notificationID,
  ) async {
    // print(notificationID);
    final response = await http.get(
        Uri.parse('${URLS.BASE_URL}/api/check-notification/${notificationID}'));

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      print('${URLS.BASE_URL}/api/check-notification/${notificationID}');

      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future deletenotification(id) async {
    print('NOTIFICATION==>$id');

    var body = {
      "id": id.join(","),
    };

    print('BODY ==>$body');
    final response = await http.post(
        Uri.parse('${URLS.BASE_URL}/api/delete-notifications'),
        body: body);

    print("DELDATA$body");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

  static Future leaveGame(
    user_id,
    ugg_id,
  ) async {
    var body = {"user_id": "${user_id}", "ugg_id": ugg_id.toString()};
    print(body);
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/leave-game'), body: body);
    print(response);
    if (response.statusCode == 200) {
      print(response.statusCode);
      var responseJson = jsonDecode(response.body);
      print('Response responseJson ==>${responseJson}');

      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future practicegame(
    user_id,
  ) async {
    var body = {
      "user_id": user_id.toString(),
      "pack_id": "0",
      "no_of_players": "2",
      "is_over": "0"
    };
    // print('Body ==> $body');
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/practice-game'), body: body);

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future updateProfile(user_id, first_name) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://165.22.215.103:4000/api/users-update'));
    request.fields.addAll({
      'id': user_id,
      'first_name': first_name,
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
    } else {
      // print(response.reasonPhrase);
    }
  }

  static Future practice_total_card_distribution(group_id) async {
    var body = {"pack_id": "0", "game_group_id": "${group_id}"};
    print('HEREBODy==> $body');
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/card-distribution'), body: body);

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);

      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future practice_card_distribution(user_id, group_id) async {
    var body = {
      "pack_id": "0",
      "game_group_id": '${group_id}',
      "user_id": "${user_id}",
      "other_user_id": "1",
    };
    // print(body);
    final response = await http.post(
        Uri.parse('${URLS.BASE_URL}/api/seven-practice-card-distributed'),
        body: body);

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      //print(responseJson);

      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future updaterating(rating, description) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var body = {
      'user_id': prefs.getString('user_id')!,
      'star_rating': '$rating',
      'description': description,
    };
    print(body);
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/app-rating'), body: body);

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      //print(responseJson);

      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future app_review() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await http.get(Uri.parse(
        '${URLS.BASE_URL}/api/app-rating/${prefs.getString('user_id')!}'));
    if (response.statusCode == 200) {
      // print(response.body);
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future dailyLoginStreaks(user_id) async {
    final response = await http.get(
      Uri.parse('${URLS.BASE_URL}/api/login-streak/$user_id'),
    );

    // print(response.statusCode);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future addFriendAchivement(user_id) async {
    final response = await http.get(
      Uri.parse('${URLS.BASE_URL}/api/friends-achievements/$user_id'),
    );

    // print(response.statusCode);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future userTotalExp(user_id) async {
    final response = await http.get(
      Uri.parse('${URLS.BASE_URL}/api/user-exp/$user_id'),
    );

    // print(response.statusCode);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future buyPacksAchivement(user_id) async {
    final response = await http.get(
      Uri.parse('${URLS.BASE_URL}/api/packs-bought/$user_id'),
    );

    // print(response.statusCode);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future gameWonAchivement(user_id) async {
    final response = await http.get(
      Uri.parse('${URLS.BASE_URL}/api/winner-achievement/$user_id'),
    );

    // print(response.statusCode);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future gameLostAchivement(user_id) async {
    final response = await http.get(
      Uri.parse('${URLS.BASE_URL}/api/losing-achievement/$user_id'),
    );

    // print(response.statusCode);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future gameWinner(user_id, gameGroupId) async {
    final response = await http.get(
      Uri.parse(
          '${URLS.BASE_URL}/api/winner-achievement/$gameGroupId/$user_id'),
    );

    // print(response.statusCode);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future practiceGameWinner(user_id, gameGroupId) async {
    final response = await http.get(
      Uri.parse('${URLS.BASE_URL}/api/get-game-winner/$gameGroupId/$user_id'),
    );

    // print(response.statusCode);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future GameWinnerConculde(gameGroupId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var body = {
      'user_id': prefs.getString('user_id')!,
      'game_group_id': '$gameGroupId'
    };
    // print(body);
    final response = await http.post(
        Uri.parse('${URLS.BASE_URL}/api/conclude-game-winner'),
        body: body);

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      //print(responseJson);

      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future practiceGameWinnerConculde(gameGroupId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var body = {
      'user_id': prefs.getString('user_id')!,
      'game_group_id': '$gameGroupId'
    };
    // print(body);
    final response = await http.post(
        Uri.parse('${URLS.BASE_URL}/api/conclude-game-winner'),
        body: body);

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      //print(responseJson);

      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future sendChat(Map data) async {
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/send-chat'), body: data);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }
}
