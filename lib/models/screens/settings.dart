// import 'package:expandable/expandable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:sura/models/screens/home.dart';
// import 'package:sura/themes/constants.dart';

// class Settings extends StatefulWidget {
//   const Settings({Key? key}) : super(key: key);

//   @override
//   State<Settings> createState() => _SettingsState();
// }

// class _SettingsState extends State<Settings> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: white,
//           actions: <Widget>[
//             IconButton(
//               icon: Icon(
//                 Icons.arrow_forward,
//                 size: size.height * 0.05,
//                 color: black,
//               ),
//               onPressed: () {
//                 Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(builder: (context) => const Home()));
//               },
//             )
//           ],
//         ),
//         body: ListView(children: [
//           card('عن التطبيق',
//               'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh\nhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh'),
//         ]),
//       ),
//     );
//   }

//   Widget card(title, body) {
//     return Padding(
//       padding: EdgeInsets.all(10),
//       child: Card(
//         child: ExpandablePanel(
//           header: Text(title),
//           collapsed: Text(''),
//           expanded: Text(body),
//         ),
//       ),
//     );
//   }
// }
