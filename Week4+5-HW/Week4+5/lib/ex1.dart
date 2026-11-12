// import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     const MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text(
//             'Hello my name is Ronan !',
//             style: TextStyle(
//               color: Colors.orange,
//               fontSize: 50,
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: [
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.purple,
                    ),
                  ),
                  Container(
                    width: 70,
                    color: Colors.yellow,
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 70,
                    color: Colors.yellow,
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.lightBlue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.pink,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            color: Colors.white,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            color: Colors.white,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              color: Colors.brown,
            ),
          ],
        ),
      ),
    ),
  );
}