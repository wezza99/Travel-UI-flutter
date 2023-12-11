import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/widgets/Destination_cursoel.dart';
import 'package:flutter_travel_ui/widgets/hotel_curseol.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class homescreen extends StatefulWidget {
  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int selectedIndex = 0;
  int _currentTab = 0;

  List<IconData> icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.biking,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.arrowRight,
    FontAwesomeIcons.camera,
  ];

  Widget buildIcon(int index) {
    return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
            print(selectedIndex);
          });
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(
            icons[index],
            size: 30,
            color: selectedIndex == index
                ? Theme.of(context).primaryColor
                : Color(0xFFE7EBEE),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(vertical: 30),
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: 120,
              left: 20,
            ),
            child: Text(
              "What would you like to find?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildIcon(0),
              buildIcon(1),
              buildIcon(2),
              buildIcon(3),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          destinationcurseol(),
          SizedBox(
            height: 20,
          ),
          hotelcurseol(),
        ],
      ),),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value; 
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.search,
              size: 30.0,
              
            ),
            
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.local_pizza,
              size: 30.0,
            ),
            
          ),
          BottomNavigationBarItem(
            label: "",
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
            ),
          )
        ],
      ),
    );
  }
}
