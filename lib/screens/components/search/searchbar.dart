import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  String _selectedItem = 'Courses'; // Default value

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 10), // Adjust the width as needed

          DropdownButtonHideUnderline(
              child: DropdownButton<String>(
            underline: Container(),
            value: _selectedItem,
            // Replace String with your dropdown item type
            items: const <String>[
              'Courses',
              'Tutors',
              'Books',
              // Add more dropdown items as needed
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedItem = newValue!;
                // Implement your dropdown onChanged logic here
              });
            },
            style: const TextStyle(color: Colors.black), // Dropdown text color
            // Remove underline
          )),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement your search logic here
            },
          ),
        ],
      ),
    );
  }
}
