import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uts/models/model.dart';
import 'package:uts/views/headAdmin.dart';
import '../viewmodels/user_vm.dart';
import 'home.dart';
// import 'package:intl/intl.dart';

// ignore: must_be_immutable
class EditUserScreen extends StatefulWidget {
  const EditUserScreen({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
// ignore: no_logic_in_create_state
  State<EditUserScreen> createState() => _EditUserScreenState(user);
}

class _EditUserScreenState extends State<EditUserScreen> {
  User? user;
  _EditUserScreenState(this.user);
  late final TextEditingController _textIDController = TextEditingController();
  late final TextEditingController _textJudulController =
      TextEditingController();
  late final TextEditingController _textTokohUtamaController =
      TextEditingController();
  late final TextEditingController _textGendreController =
      TextEditingController();
  late final TextEditingController _textIsiController = TextEditingController();
  late final TextEditingController _textImageController =
      TextEditingController();

  late String judul = "", image = "", tokohUtama = "", gendre = "", isi = "";

  @override
  void initState() {
    super.initState();
    _textIDController.text = user!.id;
    _textJudulController.text = user!.judul;
    _textTokohUtamaController.text = user!.tokohUtama;
    _textGendreController.text = user!.gendre;
    _textIsiController.text = user!.isi;
    _textImageController.text = user!.image;

    judul = user!.judul;
    tokohUtama = user!.tokohUtama;
    gendre = user!.gendre;
    isi = user!.isi;
    image = user!.image;
  }

  updateUser() async {
    if ((judul == "") || (tokohUtama == "") || (gendre == "") || (isi == "")) {
      Fluttertoast.showToast(
          msg: "Semua Field harus diisi dengan data yang benar!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.yellow[300],
          textColor: Colors.red);
    } else {
      showLoaderDialog(context);
      UserViewModel()
          .editUser(user!.id, judul, tokohUtama, gendre, isi, image)
          .then((value) {
        Navigator.pop(context);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HeadAdmin()));
      });
    }
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final maxLines = 5;

    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          title: InkWell(
            onTap: () {
              Navigator.pushNamed(context, "headAdmin");
            },
            child: const Text(
              "Edit Cerpen",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.teal,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Judul",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blueGrey[50], //<-- SEE HERE
                    ),
                    style: const TextStyle(
                        fontSize: 14.0, height: 1.5, color: Colors.black),
                    controller: _textJudulController,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (e) => judul = e,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Link URL Image",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blueGrey[50], //<-- SEE HERE
                    ),
                    style: const TextStyle(
                        fontSize: 14.0, height: 1.5, color: Colors.black),
                    controller: _textImageController,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (e) => image = e,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Gendre",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blueGrey[50], //<-- SEE HERE
                    ),
                    style: const TextStyle(
                        fontSize: 14.0, height: 1.5, color: Colors.black),
                    controller: _textGendreController,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (e) => gendre = e,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Nama Tokoh Terlibat",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blueGrey[50], //<-- SEE HERE
                    ),
                    style: const TextStyle(
                        fontSize: 14.0, height: 1.5, color: Colors.black),
                    controller: _textTokohUtamaController,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (e) => tokohUtama = e,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Isi Cerpen",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: TextField(
                    maxLines: maxLines,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blueGrey[50], //<-- SEE HERE
                    ),
                    style: const TextStyle(
                        fontSize: 14.0, height: 1.5, color: Colors.black),
                    controller: _textIsiController,
                    keyboardType: TextInputType.multiline,
                    onChanged: (e) => isi = e,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                    child: ElevatedButton(
                  onPressed: () {
                    updateUser();
                  },
                  child: const Text("Update",
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    shape: const StadiumBorder(),
                    // Background color
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}
