import 'package:flutter/material.dart';
import 'package:uts/dassboard/detail.dart';
import 'package:uts/models/model.dart';
import 'package:uts/views/detailAdmin.dart';
import 'package:uts/views/edit.dart';
import '../viewmodels/user_vm.dart';
import 'create.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List dataUser = [];
  void getDataUser() async {
    UserViewModel().getUsers().then((value) {
      setState(() {
        dataUser = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  Widget userDetail(User data) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.blueGrey[50],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Image.network(
                "${data.image}",
                width: 350.0,
                height: 180.0,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "${data.judul}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blueGrey[900],
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                "${data.gendre}",
                style: TextStyle(color: Colors.blueGrey[900], fontSize: 15),
              ),
              const SizedBox(height: 6),
              Text(
                "${data.tokohUtama}",
                style: TextStyle(color: Colors.blueGrey[900], fontSize: 15),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  hapusUser(String id) {
    UserViewModel().deleteUser(id).then((value) => getDataUser());
  }

  updateUser(User user) {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => EditUserScreen(
              user: user,
            )));
  }

  detailUser(User user) {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => DetailAdmin(
              user: user,
            )));
  }

  showDetailDialog(User data) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: Colors.blueGrey[800],
            title: const Text(
              "Info Cerpen",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.orange,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Judul",
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text("${data.judul}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18)),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Gendre",
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text("${data.gendre}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18)),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Nama Tokoh",
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text("${data.tokohUtama}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18)),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Tanggal Upload",
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text("${data.date}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18)),
                    const SizedBox(
                      height: 28,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              hapusUser(data.id);
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red, // background
                              onPrimary: Colors.white, // foreground
                            ),
                            child: const Text("Hapus")),
                        ElevatedButton(
                            onPressed: () {
                              detailUser(data);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.teal, // background
                              onPrimary: Colors.white, // foreground
                            ),
                            child: const Text("Lihat Detail")),
                        ElevatedButton(
                            onPressed: () {
                              updateUser(data);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange, // background
                              onPrimary: Colors.white, // foreground
                            ),
                            child: const Text("Edit"))
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: const Text(
          "Cerpen List",
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, i) {
            return GestureDetector(
                onTap: () {
                  showDetailDialog(dataUser[i]);
                },
                child: userDetail(dataUser[i]));
          },
// ignore: unnecessary_null_comparison
          itemCount: dataUser == null ? 0 : dataUser.length,
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => {
      //     Navigator.of(context).push(
      //         MaterialPageRoute(builder: (context) => const CreateUserScreen()))
      //   },
      //   heroTag: 'createNew',
      //   backgroundColor: Colors.teal,
      //   child: const Icon(Icons.add, color: Colors.white),
      // ),
    );
  }
}
