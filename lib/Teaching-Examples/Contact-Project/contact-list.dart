import 'package:flutter/material.dart';

class CustomContactBuilder extends StatelessWidget {
  const CustomContactBuilder({
    super.key,
    required this.title,
    required this.number,
  });

  final String title;
  final String number;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width;
    // final double itemHeight = size.height;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
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
                SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.network('https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/person-profile-icon.png'),
                    )
                ),
                Expanded(
                  child: SizedBox(
                    width: 210,
                    child:
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
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
                          Text(
                            number,
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
                      // child: IconButton(
                      //   icon: const Icon(Icons.edit),
                      //   onPressed: () {  },
                      //
                      // ),
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
