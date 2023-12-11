import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/screens/destinationscreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/destination.dart';

class destinationcurseol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Destinations",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              GestureDetector(
                onTap: () => print("See All"),
                child: Text(
                  "See All",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    letterSpacing: 1,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 7.0,
        ),
        Container(
          height: 300,
          color: Colors.blue,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (BuildContext context, int index) {
              Destination destination = destinations[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            destinationscreen(destination: destination))),
                child: Container(
                  width: 210,
                  margin: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        bottom: 15,
                        child: Container(
                          height: 120,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${destination.activities.length} activities",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                Text(
                                  "${destination.description}",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8,
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Stack(
                          children: [
                            Hero(
                              tag: destination.imgUrl,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                  height: 160,
                                  width: 180,
                                  image: AssetImage(destination.imgUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    destination.city,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.locationArrow,
                                        size: 10,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        destination.country,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
