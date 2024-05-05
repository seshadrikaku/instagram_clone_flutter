import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
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
    return Container(
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
            label: Text(
          "search",
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }

//Widget for images
  Widget _buildSearchVideos() {
    return GridView.count(
      shrinkWrap: true, // Allows the grid to adapt to its children's size
      crossAxisCount: 2, // Two images per row
      children: List.generate(37, (index) {
        return Column(
          children: [
            Text("Hello Sand $index"),
            Container(
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.4)),
              child: Image.network(
                "https://images.indianexpress.com/2019/06/sai-pallavi-1.jpg?w=759&h=948&imflag=true",
                fit: BoxFit.fill,
                scale: 7,
              ),
            ),
          ],
        );
      }),
    );
  }
}
