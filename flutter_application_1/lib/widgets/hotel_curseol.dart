import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/models/hotelmodel.dart';

class hotelcurseol extends StatelessWidget {
  const hotelcurseol({super.key});

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
                "Exclusive Hotels",
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
            itemCount: hotels.length,
            itemBuilder: (BuildContext context, int index) {
              Hotel hotel = hotels[index];
              return Container(
                width: 240,
                margin: EdgeInsets.all(10),
                color: Colors.white,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      bottom: 15,
                      child: Container(
                        height: 120,
                        width: 240,
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
                                hotel.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "${hotel.address}",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "\$${hotel.price} /night",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          height: 160,
                          width: 220,
                          image: AssetImage(hotel.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
