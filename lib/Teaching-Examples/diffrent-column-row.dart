import 'package:flutter/material.dart';


class DiffrentColumnAndRow extends StatefulWidget {
  const DiffrentColumnAndRow({Key? key}) : super(key: key);
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

    return Padding(
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
                        color: Colors.white70,
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
                            setState(() {
                              columns = columns - 1;
                            });
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
                              columns = columns + 1;
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
                              color: Colors.white70,
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
                              setState(() {
                                rows = rows - 1;
                              });
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
                                rows = rows + 1;
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
      );
  }
}
