import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uts/login/login.dart';
import 'package:uts/viewmodels/user_vm.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String email = "", password = "", name = "", reTypePassword = "";
  register() async {
    if ((email == "") || (password == "") || (name == "")) {
      Fluttertoast.showToast(
          msg: "Semua Field harus diisi dengan data yang benar!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.yellow[300],
          textColor: Colors.red);
    } else {
      if (password != reTypePassword) {
        Fluttertoast.showToast(
            msg: "Password yang anda masukkan tidak sama!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.yellow[300],
            textColor: Colors.red);
      } else {
        showLoaderDialog(context);
        UserViewModel().createRegister(name, email, password).then((value) {
          Navigator.pop(context);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Login()));
        });
      }
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
    return Scaffold(
        appBar: AppBar(
          // title: const Align(
          //   alignment: Alignment.centerLeft,
          //   child: Text(
          //     "Register Cerpen",
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 20,
          //         fontWeight: FontWeight.bold),
          //   ),
          // ),
          backgroundColor: Colors.teal,
        ),
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/register.png',
              height: 150,
              width: 150,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Register',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[700],
                  fontSize: 28),
            ),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              // <-- SEE HERE
              width: 250,
              height: 50,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                // controller: inputEmail,
                autocorrect: false,
                //name
                onChanged: (e) => name = e,
                //
                decoration: InputDecoration(
                    labelText: 'User Name',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    filled: true,
                    hintText: "User Name",
                    fillColor: Colors.grey[200]),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              // <-- SEE HERE
              width: 250,
              height: 50,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                // controller: inputEmail,
                autocorrect: false,
                //email
                onChanged: (e) => email = e,
                //
                decoration: InputDecoration(
                    labelText: 'Email',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    filled: true,
                    hintText: "Email",
                    fillColor: Colors.grey[200]),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              // <-- SEE HERE
              width: 250,
              height: 50,
              child: TextField(
                  obscureText: true,
                  // controller: inputPassword,
                  //password
                  onChanged: (e) => password = e,
                  //
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      filled: true,
                      hintText: "Password",
                      fillColor: Colors.grey[200])),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              // <-- SEE HERE
              width: 250,
              height: 50,
              child: TextField(
                  obscureText: true,
                  // controller: inputPassword,
                  //verifikasi password
                  onChanged: (e) => reTypePassword = e,
                  //
                  decoration: InputDecoration(
                      labelText: 'verifikasi Password',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      filled: true,
                      hintText: "verifikasi Password",
                      fillColor: Colors.grey[200])),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 0),
              child: ElevatedButton(
                onPressed: () {
                  register();
                },
                child: const Padding(
                    padding: EdgeInsets.fromLTRB(7, 5, 7, 5),
                    child: Text('Register', style: TextStyle(fontSize: 15))),
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  shape: const StadiumBorder(),
                  // Background color
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ));
  }
}
