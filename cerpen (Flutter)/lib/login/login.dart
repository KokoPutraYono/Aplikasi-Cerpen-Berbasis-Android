import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uts/views/headAdmin.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "";
  String password = "";
  bool _rememberMe = false;
  var _timer;
  var cekEmail = "";
  var cekPassword = "";

  void saveDataLogin(bool _isLogin, String dataLogin) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('isLogin', _isLogin);
    pref.setString("email", dataLogin);
  }

  void loginToSystem() async {
    if ((email == "") || (password == "")) {
      Fluttertoast.showToast(
          msg: "email dan password tidak boleh kosong",
          gravity: ToastGravity.CENTER,
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.cyan,
          textColor: Colors.white);
      return;
    }
    showLoaderDialog(context, 30);
    final response = await http.post(
        Uri.parse("http://10.0.2.2/mobileProgramming/cerpen/listRegister.php"),
        body: jsonEncode({"email": email, "password": password}));
    int statCode = response.statusCode;

    if (statCode == 200) {
      Navigator.pop(context);
      bool _isLogin = true;
      if (_rememberMe) saveDataLogin(_isLogin, email);
      String dataLogin = response.body;
      final data = jsonDecode(dataLogin);
      // String resStatus = data["email"];
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                "Login Berhasil",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.orangeAccent,
                ),
              ),
              content: const Text(
                "Selamat datang Sebagai Admin di CerpenIndo",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.blueGrey[900],
              // backgroundColor: Colors.red[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              actions: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 100,
                    child: TextButton(
                      child: const Text("OK"),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.cyan,
                        onSurface: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HeadAdmin()));
                      },
                    ),
                  ),
                ),
              ],
            );
          });
    } else {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                "Login gagal",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.blueGrey[900],
              content: const Text(
                "Username atau Password salah.\r\nSilahkan coba lagi!",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              actions: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 100,
                    child: TextButton(
                      child: const Text("OK"),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.red[400],
                        onSurface: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ],
            );
          });
    }
  }

  showLoaderDialog(BuildContext context, int _period) {
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
        _timer = Timer(Duration(seconds: _period), () {
          Navigator.of(context).pop();
        });
        return alert;
      },
    ).then((value) => {
          if (_timer.isActive) {_timer.cancel()}
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: const Align(
          //   alignment: Alignment.centerLeft,
          //   child: Text(
          //     "Login Cerpen",
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
              'assets/images/pengawas.png',
              height: 220,
              width: 220,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Login',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                  fontSize: 28),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              // <-- SEE HERE
              width: 250,
              height: 50,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                onChanged: (e) => email = e,
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
                  onChanged: (e) => password = e,
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
            const SizedBox(height: 15),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 75, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 20.0,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: <Widget>[
                        Theme(
                          data: ThemeData(unselectedWidgetColor: Colors.white),
                          child: Checkbox(
                            value: _rememberMe,
                            checkColor: Colors.cyan,
                            activeColor: Colors.cyan[900],
                            //  shape: Border.all(1),
                            onChanged: (value) {
                              // null;
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // null;
                            setState(() {
                              _rememberMe = !_rememberMe;
                            });
                          },
                          child: Text(
                            'Remember me',
                            style: TextStyle(
                              color: Colors.cyan[900],
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // _buildForgotPasswordBtn(),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 0),
              child: ElevatedButton(
                onPressed: () {
                  loginToSystem();
                },
                child: const Padding(
                    padding: EdgeInsets.fromLTRB(7, 5, 7, 5),
                    child: Text('Login', style: TextStyle(fontSize: 15))),
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
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "register");
              },
              child: Text(
                'Belum Mempunyai akun? Daftar disini',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan[900],
                    fontSize: 12),
              ),
            ),
          ],
        ));
  }
}
