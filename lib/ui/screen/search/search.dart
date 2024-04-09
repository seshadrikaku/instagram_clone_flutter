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
      body: Column(
        children: [
          _buildSearchTextField(),
          Expanded(
            child: _buildSearchVideos(),
          ),
        ],
      ),
    );
  }

  //Widget for search textfield
  Widget _buildSearchTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 45, left: 10, right: 10),
      child: Container(
        padding: const EdgeInsets.all(8),
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
              style: TextStyle(fontWeight: FontWeight.w200, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

//Widget for images
  Widget _buildSearchVideos() {
    return GridView.count(
      shrinkWrap: true, // Allows the grid to adapt to its children's size
      crossAxisCount: 3, // Two images per row
      children: List.generate(37, (index) {
        return Container(
          margin: const EdgeInsets.all(2),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey, width: 0.4)),
          child: Image.network(
            "https://images.indianexpress.com/2019/06/sai-pallavi-1.jpg?w=759&h=948&imflag=true",
            fit: BoxFit.fill,
          ),
        );
      }),
    );
  }
}
