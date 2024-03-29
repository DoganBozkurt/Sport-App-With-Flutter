
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  static const String sayfaName = "/ProfilePage";

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var st=AuthService.map;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const AltMenu(),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [
                Color.fromRGBO(19, 20, 41, 1),
                Color.fromRGBO(19, 20, 41, 1),
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              //profil

              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     CircleAvatar(
                      radius: 50,
                      backgroundImage: st["cinsiyet"].toString()=="erkek" ? 
                      const AssetImage("lib/assets/images/avatar.jpg")
                      :const AssetImage("lib/assets/images/avatarKadin.jpg"),
                    ),
                    const SizedBox(height: 3,),
                    Container(
                      child:  Text("${st["adiVeSoyadi"].toString().toUpperCase()}",style: TextStyle(color:Colors.white)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 3.5,
              ),
              //kilo boy
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: st["cinsiyet"].toString()=="kadın"?Colors.blue:const Color.fromRGBO(95, 0, 108, 1),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            children: [
                              const Icon(
                                FontAwesomeIcons.mars,
                                color: Colors.white,
                                size: 35,
                              ),
                              const Text("KADIN",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12))
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 2.5,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:  st["cinsiyet"].toString()=="erkek"?Colors.blue:const Color.fromRGBO(95, 0, 108, 1),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            children: [
                              const Icon(
                                FontAwesomeIcons.venus,
                                color: Colors.white,
                                size: 35,
                              ),
                              const Text(
                                "ERKEK",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 2.5,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(95, 0, 108, 1),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 1.5,
                            ),
                            const Icon(
                              FontAwesomeIcons.weight,
                              color: Colors.white,
                              size: 35,
                            ),
                            const SizedBox(
                              height: 1.5,
                            ),
                            Text("KİLONUZ: ${st['kilo'].toString()}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 2.5,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(95, 0, 108, 1),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 1.5,
                            ),
                            const Icon(
                              FontAwesomeIcons.restroom,
                              color: Colors.white,
                              size: 35,
                            ),
                            const SizedBox(
                              height: 1.5,
                            ),
                            Text("BOYUNUZ: ${st['boy'].toString()}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              const Text("BAŞARILARIN",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              //hedef Kilo
              Expanded(
                  flex: 1,
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 6.0, right: 6.0),
                        height: 100,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomLeft,
                                colors: [
                              Color.fromRGBO(95, 0, 108, 1),
                              Color.fromRGBO(132, 40, 223, 1),
                            ])),
                      ),
                      Positioned(
                        bottom: 1.0,
                        left: 50.0,
                        child: Image.asset(
                          "lib/assets/images/Dumbbell1.jpg",
                          width: 80,
                          height: 80,
                        ),
                      ),
                       Positioned(
                        top: 45.0,
                        left: 140.0,
                        child: Text(
                          "${st['kilo'].toString()}",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                      const Positioned(
                        top: 52.0,
                        left: 175.0,
                        child: Text(
                          "KG",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                      Positioned(
                        top: 0.01,
                        bottom: 0.01,
                        right: 0.0000000000000000001,
                        child: Image.asset(
                          "lib/assets/images/basarilarResim.jpg",
                          width: 180,
                          height: 180,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 3.5,
              ),

              //aylık eğitim
              Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 6.0, right: 6.0),
                        height: 100,
                        color: const Color.fromRGBO(95, 0, 108, 1),
                      ),
                      const Positioned(
                        top: 33.0,
                        left: 58.0,
                        child: Text(
                          "Aylık Eğitim Planı",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      const Positioned(
                        top: 50.0,
                        left: 100.0,
                        child: Text(
                          "10",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                      const Positioned(
                        top: 60.0,
                        left: 130.0,
                        child: Text(
                          "/5",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                      //Çizgiler
                      Positioned(
                          top: 38.0,
                          right: 100.0,
                          child: Container(
                            height: 12,
                            width: 50,
                            color: Colors.pink,
                          )),
                      Positioned(
                          top: 38.0,
                          right: 55.0,
                          child: Container(
                            height: 12,
                            width: 50,
                            color: Colors.blue,
                          )),
                    ],
                  )),

//Senin Programın
            ],
          ),
        ),
      ),
    );
    }
}
