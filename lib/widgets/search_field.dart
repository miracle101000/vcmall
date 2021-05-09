import 'package:flutter/material.dart';
import 'package:vc_mall/config/size_config.dart';

class DataSearch extends SearchDelegate<String> {
  final cities = ['Abuja', 'Niger', 'America', 'Lagos'];

  final recentCities = ['Abuja', 'Lagos'];

  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = " ";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the appbar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for anything
    var toList = [];
    for (int i = 0; i < cities.length; i++) {
      toList.add(cities[i].toLowerCase().trim());
    }
    final suggestionList = query.isEmpty
        ? recentCities
        : toList
            .where((element) => element.startsWith(query.toLowerCase().trim()))
            .toList();
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey))
            ])),
      ),
      itemCount: suggestionList.length,
    );
  }
}
