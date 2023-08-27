import 'package:flutter/material.dart';
import 'package:uts/models/model.dart';

// ignore: must_be_immutable
class DetailAdmin extends StatefulWidget {
  const DetailAdmin({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
// ignore: no_logic_in_create_state
  State<DetailAdmin> createState() => _DetailAdminState(user);
}

class _DetailAdminState extends State<DetailAdmin> {
  User? user;
  _DetailAdminState(this.user);

  late String judul = "",
      image = "",
      tokohUtama = "",
      gendre = "",
      isi = "",
      date = "";

  @override
  void initState() {
    super.initState();
    judul = user!.judul;
    image = user!.image;
    tokohUtama = user!.tokohUtama;
    gendre = user!.gendre;
    isi = user!.isi;
    date = user!.date.toString();
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
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          title: InkWell(
            onTap: () {
              Navigator.pushNamed(context, "headAdmin");
            },
            child: const Text(
              'Baca Cerpen Lain',
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
              padding: const EdgeInsets.only(left: 9.0, right: 9.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 28,
                  ),
                  Image.network(
                    "${image}",
                    height: 200.0,
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  const Text(
                    "Judul",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      decorationThickness: 2,
                    ),
                  ),
                  Text(
                    "${judul}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  const Text(
                    "Nama Tokoh",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      decorationThickness: 2,
                    ),
                  ),
                  Text(
                    "${tokohUtama}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  const Text(
                    "Gendre",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      decorationThickness: 2,
                    ),
                  ),
                  Text(
                    "${gendre}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  const Text(
                    "Tanggal Upload",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      decorationThickness: 2,
                    ),
                  ),
                  Text(
                    "${date}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  const Text(
                    "ISI",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      decorationThickness: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "${isi}",
                    textAlign: TextAlign.justify,
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )),
        ));
  }
}
