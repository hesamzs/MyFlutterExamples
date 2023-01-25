import 'package:flutter/material.dart';
import 'package:myflutterproject/Teaching-Examples/Contact-Project/contact-list.dart';
import 'package:myflutterproject/Teaching-Examples/diffrent-column-row.dart';

class CustomPageBuilder extends StatelessWidget {
  const CustomPageBuilder(
  {
    super.key,
    required this.title,
    required this.desc,
    required this.id,
  });

  final String title;
  final String desc;
  final int id;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: itemWidth,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 6,
                  offset: Offset(4, 4), // Shadow position
                ),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:8,top: 8),
                          child: Opacity(
                            opacity: 0.8,
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            desc,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    alignment: AlignmentDirectional.centerEnd,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PageNavigator(title: title,id: id,)),
                        );
                        },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PageNavigator extends StatelessWidget {
  const PageNavigator({super.key,required this.title,required this.id});

  final String title;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title.toString()),
      ),
      body: id == 1 ?
        const DiffrentColumnAndRow() : ContactBuilder()
    );
  }
}


class FrontPage extends StatefulWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  List<Map<String,dynamic>> list = [
    {
      "id" : 1,
      'title' : "Diffrent Column & Row" ,
      'desc' : "Small Project Of Diffrent Column & Row",
    },
    {
      "id" : 2,
      'title' : "Contact Lists" ,
      'desc' : "Project To Show Contacts",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App'),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return CustomPageBuilder(id: list[index]['id'],title: list[index]['title'].toString(), desc:list[index]['desc'].toString());
          }
      )
    );

  }
}

