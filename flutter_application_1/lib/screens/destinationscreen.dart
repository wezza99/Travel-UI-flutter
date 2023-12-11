import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/models/activity.dart';
import 'package:flutter_travel_ui/models/destination.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class destinationscreen extends StatefulWidget {
  const destinationscreen({super.key, required this.destination});
  final Destination destination;

  @override
  State<destinationscreen> createState() => _destinationscreenState();
}

class _destinationscreenState extends State<destinationscreen> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      color: Colors.grey,
                      offset: Offset(0, 2),
                    ),
                  ]),
              child: Hero(
                tag: widget.destination.imgUrl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image(
                    image: AssetImage(widget.destination.imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.search),
                      iconSize: 30,
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              left: 20,
              bottom: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.destination.city,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
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
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        widget.destination.country,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              child: Icon(
                Icons.location_on,
                color: Colors.white70,
              ),
              right: 20,
              bottom: 20,
            )
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.destination.activities.length,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            itemBuilder: (BuildContext context, int index) {
              activity Activity = widget.destination.activities[index];
              return Stack(
                children: [
                  Container(
                    height: 170,
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(
                      40.0,
                      5.0,
                      20.0,
                      5.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(100, 20, 20, 20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 120,
                                  child: Text(
                                    Activity.name,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Column(children: [
                                  Text(
                                    "\$${Activity.price}",
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "per pax",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey),
                                  ),
                                ]),
                              ],
                            ),
                            Text(Activity.type),
                            _buildRatingStars(Activity.rating),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 70,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.cyan,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Text(Activity.startTimes[0]),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 70,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.cyan,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Text(Activity.startTimes[1]),
                                ),
                              ],
                            )
                          ]),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 15,
                    bottom: 15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(image: AssetImage(Activity.imageurl),
                      width: 110,
                      fit: BoxFit.cover,),
                    ),
                  )
                ],
              );
            },
          ),
        )
      ],
    ));
  }
}
