import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/model.dart';

class UserViewModel {
  Future getUsers() async {
    try {
      http.Response hasil = await http.get(
          Uri.parse("http://10.0.2.2/mobileProgramming/cerpen/list.php"),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        final data = userFromJson(hasil.body);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future deleteUser(String id) async {
    Map data = {"id": id};
    try {
      http.Response hasil = await http.post(
          Uri.parse("http://10.0.2.2/mobileProgramming/cerpen/delete.php"),
          headers: {"Accept": "application/json"},
          body: json.encode(data));
      if (hasil.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future createUser(String judul, String tokohUtama, String gendre, String isi,
      String image) async {
    Map data = {
      "judul": judul,
      "tokohUtama": tokohUtama,
      "gendre": gendre,
      "isi": isi,
      "image": image,
    };
    try {
      http.Response hasil = await http.post(
          Uri.parse("http://10.0.2.2/mobileProgramming/cerpen/create.php"),
          headers: {"Accept": "application/json"},
          body: json.encode(data));
      if (hasil.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future editUser(String id, String judul, String tokohUtama, String gendre,
      String isi, String image) async {
    Map data = {
      "id": id,
      "judul": judul,
      "tokohUtama": tokohUtama,
      "gendre": gendre,
      "isi": isi,
      "image": image
    };
    try {
      http.Response hasil = await http.post(
          Uri.parse("http://10.0.2.2/mobileProgramming/cerpen/update.php"),
          headers: {"Accept": "application/json"},
          body: json.encode(data));
      if (hasil.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  //UNTUK LOGIN DAN REGISTER

  // Create Register
  Future createRegister(String name, String email, String password) async {
    Map data = {"name": name, "email": email, "password": password};
    try {
      http.Response hasil = await http.post(
          Uri.parse(
              "http://10.0.2.2/mobileProgramming/cerpen/createRegister.php"),
          headers: {"Accept": "application/json"},
          body: json.encode(data));
      if (hasil.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
