import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class URLS {
  static const String BASE_URL = 'http://165.22.215.103:4000';
  static const String IMAGE_URL =
      'http://165.22.215.103/projects/7herraf/uploads';
}

class ApiService {
  static Future selectcountrydata() async {
    final response =
        await http.get(Uri.parse('${URLS.BASE_URL}/api/countries'));
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
      "user_email": "${_data.user_email}",
      "user_image": "${_data.photo}",
      "user_password": "12345678",
      "type": "${_data.type}",
    };
    final response = await http
        .post(Uri.parse('http://165.22.215.103:4000/api/login'), body: body);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future addtocart(_addtocart) async {
    var body = {
      "user_id": "${_addtocart.user_id}",
      "pack_id": "${_addtocart.pack_id}",
      "price": "${_addtocart.price}",
      "discount": "${_addtocart.discount}",
      "quantity": "${_addtocart.quantity}",
    };
    final response = await http.post(
        Uri.parse('http://165.22.215.103:4000/api/add-to-cart'),
        body: body);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future addtocartdata(id) async {
    final response =
        await http.get(Uri.parse('${URLS.BASE_URL}/api/cart/${id}'));
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      // return response.statusCode;
    }
  }

  static Future myflashcard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var body = {"user_id": "${prefs.getString('user_id')}"};
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/myflashcard'), body: body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

  static Future postqrdata(user_id, qr_value) async {
    var body = {"qr_value": "${qr_value}", "id": "$user_id"};
    final response = await http
        .post(Uri.parse('http://165.22.215.103:4000/api/qrscan'), body: body);
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
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future deletedata(id) async {
    var body = {"ids": id.join(",")};

    final response = await http.post(
        Uri.parse('http://165.22.215.103:4000/api/cart/delete'),
        body: body);
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
      "user_id": "${postAddress.user_id}",
      "phone_no": "${postAddress.phone_no}",
      "country": "${postAddress.country}",
      "address": "${postAddress.address}",
      "city": "${postAddress.city}",
      "state": "${postAddress.state}",
      "zipcode": "${postAddress.zipcode}",
    };
    print('PostAddress==>$body');
    final response = await http
        .post(Uri.parse('http://165.22.215.103:4000/api/checkout'), body: body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

  static Future casdeliveryhdata(_cashAddress, addressID) async {
    var body = {
      "user_id": "${_cashAddress.user_id}",
      "sub_total": "${_cashAddress.amount}",
      "total": "${_cashAddress.total}",
      "amount": "${_cashAddress.amount}",
      "status": "${_cashAddress.status}",
      "discount_price": "${_cashAddress.discount_price}",
      "payment_method": "${_cashAddress.payment_method}",
      "address_id": "$addressID"
    };
    print('BODY==>$body');

    final response = await http
        .post(Uri.parse('http://165.22.215.103:4000/api/order'), body: body);
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
    final response = await http.post(
        Uri.parse('http://165.22.215.103:4000/api/sound-update'),
        body: body);
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
    final response = await http.post(
        Uri.parse('http://165.22.215.103:4000/api/orders/update'),
        body: body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

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
      if (response.statusCode == 200) {
        Map<String, dynamic> responseJson = jsonDecode(response.body);
        return responseJson;
      } else {
        return response.statusCode;
      }
    } catch (e) {
      throw e;
    }
  }

  static Future catalogdata() async {
    final response = await http.get(Uri.parse('${URLS.BASE_URL}/api/packs'));
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
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future selectpack() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.get(
      Uri.parse(
          '${URLS.BASE_URL}/api/playing-packs/${prefs.getString('user_id')}'),
    );
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future allUser() async {
    final response = await http.get(Uri.parse('${URLS.BASE_URL}/api/users'));
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
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/game-group'), body: body);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future card_distribution(pack_id, group_id) async {
    var body = {"pack_id": "${pack_id}", "game_group_id": "${group_id}"};
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
      "other_user_id": partnerID.toString()
    };
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
    var body = {
      "group_id": '$group_id',
      "user_from_id": '$user_from_id',
      "user_to_id": '$user_to_id',
      "card_id": '$card_id',
      "is_spell": '0',
      "pack_id": '$pack_id',
      'card_type': '$card_type'
    };
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
    final response = await http.get(Uri.parse(
        '${URLS.BASE_URL}/api/flash-card-acronyms-answers/${card_id}'));
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
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/search-users'), body: body);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future searchFriend(name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var body = {
      "name": "${name}",
      "id": prefs.getString('user_id'),
    };
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/search-friend'), body: body);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
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
    print('BODY==>$body');
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/check-card-acronym'), body: body);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future friendlist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var body = {"user_id": prefs.getString('user_id')!, "status": '1'};
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/friend-list'), body: body);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
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
      "status": '0'
    };
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
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/get-penalty'), body: body);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future penaltyCPU(group_id, limit) async {
    var body = {
      'user_id': '1',
      'game_group_id': '$group_id',
      'limit': limit == '+2' ? '2' : '4'
    };
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/get-penalty'), body: body);
    if (response.statusCode == 200) {
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
    var body = {
      "group_id": "${group_id.toString()}",
      "user_from_id": "${user_from_id.toString()}",
      "user_to_id": "1",
      "card_id": "${card_id.toString()}",
      "is_spell": '2',
      "pack_id": "1",
    };
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/play-game'), body: body);
    if (response.statusCode == 200) {
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
      "user_from_id": "${user_from_id.toString()}",
      "user_to_id": "${user_to_id.toString()}",
      "status": "2"
    };
    print('BODY==> $body');
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

  static Future invite4Game(gameMode, user_to_id, packName, packId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var body = {
      "title": "Game Invitation",
      "description":
          "${prefs.getString("first_name")} invited you to play for a ${gameMode} game with ${packName} pack ",
      "user_to_id": "${user_to_id.toString()}",
      "user_from_id": prefs.getString("user_id"),
      "status": "0",
      "pack_id": packId.toString(),
      "no_of_player": '2',
      "is_over": '0'
    };
    print('body==>$body');
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/invite-to-game'), body: body);
    if (response.statusCode == 200) {
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
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/notifications'), body: body);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
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
    var body = {
      "notification_id": notification_id.toString(),
      "user_to_id": user_to_id.toString(),
      "user_from_id": user_from_id.toString(),
      "status": "1",
      "ugg_id": ugg_id.toString()
    };
    final response = await http.post(
        Uri.parse('${URLS.BASE_URL}/api/accept-reject-game-invite'),
        body: body);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future findingFriend(
    notificationID,
  ) async {
    print('NI==>$notificationID');

    final response = await http.get(
        Uri.parse('${URLS.BASE_URL}/api/check-notification/${notificationID}'));
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future deletenotification(id) async {
    var body = {
      "id": id.join(","),
    };
    final response = await http.post(
        Uri.parse('${URLS.BASE_URL}/api/delete-notifications'),
        body: body);
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
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/leave-game'), body: body);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
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
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/practice-game'), body: body);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  // static Future updateProfile(first_name) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   var request = http.MultipartRequest(
  //       'POST', Uri.parse('http://165.22.215.103:4000/api/users-update'));
  //   request.fields.addAll({
  //     'id': '${prefs.getString('user_id')}',
  //     'first_name': first_name,
  //   });
  //   http.StreamedResponse response = await request.send();
  //   if (response.statusCode == 200) {
  //   } else {}
  // }
  // static Future updateImage(newProfileImage) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var request = http.MultipartRequest(
  //       'POST', Uri.parse('http://165.22.215.103:4000/api/users-update'));
  //   request.fields.addAll({'id': '${prefs.getString('user_id')}'});
  //   request.files.add(
  //       await http.MultipartFile.fromPath('user_image', '$newProfileImage'));

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     var decodedResponse = jsonDecode(await response.stream.bytesToString());
  //     return decodedResponse;
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }

  // static Future updateName(name) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var body = {
  //     "id": prefs.getString('user_id'),
  //     "first_name": "$name"
  //   };
  //   print(body);
  //   final response = await http
  //       .post(Uri.parse('${URLS.BASE_URL}/api/users-update'), body: body);
  //   if (response.statusCode == 200) {
  //     var responseJson = jsonDecode(response.body);
  //     return responseJson;
  //   } else {
  //     return response.statusCode;
  //   }
  // }
  static Future updateName(name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var headers = {
      'Cookie':
          'connect.sid=s%3AIMGjWgkL4U5nunhlXLlNb80xSFq-m4lY.RptnpxMov2arbicLbwwVIZUOtS4CCnzxUGxK%2BIvwKG8'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://165.22.215.103:4000/api/users-update'));
    request.fields
        .addAll({'id': '${prefs.getString('user_id')}', 'first_name': '$name'});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(await response.stream.bytesToString());
      return decodedResponse;
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future practice_total_card_distribution(group_id) async {
    var body = {"pack_id": "0", "game_group_id": "${group_id}"};
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
    final response = await http.post(
        Uri.parse('${URLS.BASE_URL}/api/seven-practice-card-distributed'),
        body: body);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
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
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/app-rating'), body: body);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
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
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future gameWinner(user_id, gameGroupId) async {
    final response = await http.get(
      Uri.parse('${URLS.BASE_URL}/api/get-game-winner/$gameGroupId/$user_id'),
    );
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
    final response = await http.post(
        Uri.parse('${URLS.BASE_URL}/api/conclude-game-winner'),
        body: body);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future opponentWon(gameGroupId, opponentsID) async {
    var body = {
      'user_id': opponentsID.toString(),
      'game_group_id': '$gameGroupId'
    };
    print('here==>$body');
    final response = await http.post(
        Uri.parse('${URLS.BASE_URL}/api/conclude-game-winner'),
        body: body);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
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
    final response = await http.post(
        Uri.parse('${URLS.BASE_URL}/api/conclude-game-winner'),
        body: body);
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
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

  static Future turnUpdate(Map data) async {
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/update-turn'), body: data);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

  static Future quitGame(Map data) async {
    print('here==>$data');
    final response =
        await http.post(Uri.parse('${URLS.BASE_URL}/api/end-game'), body: data);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

  static Future allDeckCard(Map data) async {
    print('here==>$data');
    final response = await http
        .post(Uri.parse('${URLS.BASE_URL}/api/getDeck-card'), body: data);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

  static Future userDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await http.get(
        Uri.parse('${URLS.BASE_URL}/api/users/${prefs.getString('user_id')!}'));
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }
}
