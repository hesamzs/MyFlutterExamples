import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact-sql.dart';

class ContactList {
  List contactList = [
    ["Person 1", "+989908824302"],
    ["Person 2", "+989944445964"],
  ];
}

class CustomContactBuilder extends StatefulWidget {
  CustomContactBuilder({super.key, required this.title});

  final String title;

  @override
  State<CustomContactBuilder> createState() => _CustomContactBuilderState();
}

class _CustomContactBuilderState extends State<CustomContactBuilder> {
  var SetError = "";
  final TextEditingController NumberController = TextEditingController();
  final TextEditingController NameController = TextEditingController();
  var Contacts = ContactSql();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width;
    // final double itemHeight = size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              for (var object in ContactList().contactList)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
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
                        SizedBox(
                            child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Image.network(
                              'https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/person-profile-icon.png'),
                        )),
                        Expanded(
                          child: SizedBox(
                            width: 210,
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Opacity(
                                      opacity: 0.8,
                                      child: Text(
                                        object[0],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    object[1],
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              alignment: AlignmentDirectional.centerEnd,
                              child: IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return StatefulBuilder(builder:
                                              (context,
                                                  StateSetter setInnerState) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Edit Contact ${object[0]}'),
                                              content: SizedBox(
                                                height: 200,
                                                width: 350,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(8, 2, 8, 2),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey)),
                                                      child: TextField(
                                                        decoration:
                                                            const InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          labelText:
                                                              "Contact Name",
                                                        ),
                                                        controller:
                                                            NameController,
                                                      ),
                                                    ),
                                                    const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 8)),
                                                    Container(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(8, 2, 8, 2),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey)),
                                                      child: TextField(
                                                        decoration:
                                                            const InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          labelText:
                                                              "Contact Number",
                                                        ),
                                                        controller:
                                                            NumberController,
                                                      ),
                                                    ),
                                                    const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 8)),
                                                    Text(
                                                      SetError,
                                                      style: const TextStyle(
                                                          color: Colors.red),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context, 'Cancel');
                                                  },
                                                  child: const Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    if (NameController
                                                            .text.isEmpty ||
                                                        NumberController
                                                            .text.isEmpty) {
                                                      setInnerState(() {
                                                        SetError =
                                                            "Contact Name Or Number is Empty ! ";
                                                      });
                                                    } else {
                                                      setInnerState(() {
                                                        SetError = "";
                                                      });
                                                      setState(() {
                                                        object[0] =
                                                            NameController.text;
                                                        object[1] =
                                                            NumberController
                                                                .text;
                                                        NameController.text =
                                                            "";
                                                        NumberController.text =
                                                            "";
                                                      });
                                                      Navigator.pop(
                                                          context, 'OK');
                                                    }
                                                  },
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            );
                                          });
                                        });
                                  }),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ],
          ),
        ));
  }
}
