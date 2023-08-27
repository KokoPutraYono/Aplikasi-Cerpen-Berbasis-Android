import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uts/views/headAdmin.dart';
import 'package:uts/views/home.dart';

import '../viewmodels/user_vm.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({Key? key}) : super(key: key);
  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  late String judul = "", image = "", tokohUtama = "", gendre = "", isi = "";

  late DateTime tanggalLahir;
  register() async {
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
          .createUser(judul, tokohUtama, gendre, isi, image)
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
              'Buat Cerpen Baru',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
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
                    register();
                  },
                  child: const Text("Simpan",
                      style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
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
