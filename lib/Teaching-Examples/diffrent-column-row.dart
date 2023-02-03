 import 'package:flutter/material.dart';


class DiffrentColumnAndRow extends StatefulWidget {
  const DiffrentColumnAndRow({Key? key,required this.title}) : super(key: key);
  final String title;
  @override
  State<DiffrentColumnAndRow> createState() => _DiffrentColumnAndRow();
}

class _DiffrentColumnAndRow extends State<DiffrentColumnAndRow> {
  @override
  void initState() {
    super.initState();
  }

  //Variables of Rows/Columns Count
  var columns = 1;
  var rows = 1;

  @override
  Widget build(BuildContext context) {
    //Get Screen Width Size
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
          padding: const EdgeInsets.all(22),
          child: SizedBox(
            height: 700,
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 8, bottom: 8)),
                SizedBox(
                  child: Text('Total Items (${columns.toString()})'),
                ),
                const Padding(padding: EdgeInsets.only(top: 8)),
                Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: columns,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(top: 4),
                          width: itemWidth,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white70,
                          ),
                          child: Center(
                            child: Text('Item ${(index + 1).toString()}'),
                          ),
                        );
                      },
                    )),
                const Padding(padding: EdgeInsets.only(top: 8)),
                SizedBox(
                  height: 45,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.grey,
                          child: IconButton(
                            icon: const Icon(Icons.exposure_minus_1),
                            onPressed: () {
                              if (columns > 0){
                                setState(() {
                                  columns -= 1;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.grey,
                          child: IconButton(
                            icon: const Icon(Icons.plus_one),
                            onPressed: () {
                              setState(() {
                                columns += 1;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 8)),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  child: Text('Total Items (${rows.toString()})'),
                ),
                const Padding(padding: EdgeInsets.only(top: 8)),
                SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: rows,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(left: 4),
                                width: itemWidth / 2.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white70,
                                ),
                                child: Center(
                                  child: Text('Item ${(index + 1).toString()}'),
                                ),
                              );
                            },
                          ))
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 8)),
                SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.grey,
                            child: IconButton(
                              icon: const Icon(Icons.exposure_minus_1),
                              onPressed: () {
                                if (rows > 0){
                                  setState(() {
                                    rows -= 1;
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.grey,
                            child: IconButton(
                              icon: const Icon(Icons.plus_one),
                              onPressed: () {
                                setState(() {
                                  rows += 1;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
    );
  }
}
