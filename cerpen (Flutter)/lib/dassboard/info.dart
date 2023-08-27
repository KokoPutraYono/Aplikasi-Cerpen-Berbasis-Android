import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          title: const Text(
            'Info',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
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
                  const Text(
                    "Pengertian Cerpen",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Cerpen merupakan singkatan cerita pendek jenis karya sastra berbentuk prosa yang dikemas secara ringkas, serta menceritakan suatu kisah fiktif yang berpusat pada satu tokoh beserta dengan konflik dan penyelesaiannya. Cerita pendek berasal dari anekdot, sebuah situasi yang digambarkan singkat yang dengan cepat tiba pada tujuannya, dengan paralel pada tradisi penceritaan lisan.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Yang paling ketara perbedaan antara cerpen dan novel adalah jumlah kata. Seperti namanya, cerita yang disajikan singkat dan padat tanpa mengurangi unsur-unsurnya. Bahkan, panjang dari cerita tersebut tidak lebih dari 10.000 kata yang mana kisahnya dapat selesai dibaca hanya dengan sekali baca saja.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Aplikasi CerpenIndo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Versi 1.04",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.orangeAccent, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/buku.png',
                    height: 90,
                    width: 90,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "2019-2022 CerpenIndo Inc.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.orangeAccent, fontSize: 13),
                  ),
                ],
              )),
        ));
  }
}
