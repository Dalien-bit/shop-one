// import 'dart:async';
// import 'dart:math';
// import 'item.dart';

// class BackendService {
//   static Future<List<Map<String, String>>> getSuggestions(String query) async {
//     await Future.delayed(Duration(seconds: 1));

//     return List.generate(3, (index) {
//       return {
//         'name': query + index.toString(),
//         'price': Random().nextInt(100).toString()
//       };
//     });
//   }
// }

// class CitiesService {
//   //ListOfItems.lst;
  
  
    
//   List<String> cities = [];

//   List<String> getSuggestions(String query) {
//     List<String> matches = <String>[];
//     matches.addAll(cities);

//     matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
//     return matches;
//   }
// }
