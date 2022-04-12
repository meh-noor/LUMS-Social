// // ignore_for_file: import_of_legacy_library_into_null_safe

// import 'package:flutter/material.dart';
// // import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_tags/flutter_tags.dart';

// class Hashtags extends StatefulWidget {
//   const Hashtags({Key? key}) : super(key: key);

//   // Hashtags({Key? key, required this.title}) : super(key: key);
//   // final String title;
//   @override
//   State<Hashtags> createState() => _hashState();
// }

// class _hashState extends State<Hashtags> {
//   var tags = [];
//   // List tags = new List();
//   final _globalKey = GlobalKey<TagsState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Tags(
//       key: _globalKey,
//       // symmetry: true,
//       itemCount: tags.length,
//       // itemCount: 5,
//       // alignment: WrapAlignment.center,
//       columns: 6,
//       textField: TagsTextField(
//           textStyle: TextStyle(
//             fontSize: 18,
//           ),
//           onSubmitted: (string) {
//             setState(() {
//               tags.add(Item(title: string));
//             });
//           }),
//       itemBuilder: (index) {
//         final Item currentItem = tags[index];
//         return ItemTags(
//           index: index,
//           title: currentItem.title,
//           customData: currentItem.customData,
//           activeColor: const Color(0xFF050A30),
//           // alignment: MainAxisAlignment.center,
//           textStyle: TextStyle(fontSize: 18),
//           combine: ItemTagsCombine.withTextBefore,
//           onPressed: (i) => print(i),
//           onLongPressed: (i) => print(i),
//           removeButton: ItemTagsRemoveButton(onRemoved: () {
//             setState(() {
//               tags.removeAt(index);
//             });
//             return true;
//           }),
//         );
//       },
//     ));
//   }
// }
