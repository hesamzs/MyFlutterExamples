import 'package:flutter/material.dart';
import 'package:myflutterproject/Teaching-Examples/Contact-Project/contact-list.dart';

class CustomPageBuilder extends StatelessWidget {
  const CustomPageBuilder(
  {
    super.key,
    required this.title,
    required this.desc,
  });

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class FrontPage extends StatefulWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  List<String> images = [
    "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/person-profile-icon.png",
    "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/person-profile-icon.png",
    "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/person-profile-icon.png",
    "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/person-profile-icon.png",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App'),
      ),
      body: CustomContactBuilder(title: "Title",number: "1111",),);
      // GridView.builder(
      //   itemCount: images.length,
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 1,
      //   ),
      //   itemBuilder: (BuildContext context, int index){
      //     return Padding(
      //       padding: EdgeInsets.all(8),
      //       child: Container(
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(4),
      //           color: Colors.red
      //         ),
      //       ),
      //     );
      //   },
      // ));

  }
}

