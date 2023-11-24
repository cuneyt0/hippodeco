import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Center(
            child: Image.asset(
              "assets/images/hippodeco_logo.png",
              opacity: const AlwaysStoppedAnimation(.5),
            ),
          ),
          const Text(
            """Hippodeco markasının resmi uygulamasıdır.\n\nYenilikçilik ve paylaşım ruhunu ortaya koyarak, yaptığımız işlerde ticari anlayıştan daha çok hizmet anlayışını ön planda tutmaktır.\n\nILETİŞİM BİLGİLERİMİZ
             \n\nI.O.S.B. Mutsan Sanayii Sitesi M10 Blok No:5 Başakşehir /İSTANBUL  \n\n
Email: info@hippodeco.com  \n\n
Telefon: +90 5467756577
            """,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
