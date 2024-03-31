import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(53, 48, 48, 0.996),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: const Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.search,
                  size: 18,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Search",
                  style: TextStyle(
                      fontWeight: FontWeight.w200, color: Colors.grey),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
