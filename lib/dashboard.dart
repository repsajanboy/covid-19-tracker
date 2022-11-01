import 'package:flutter/material.dart';

import 'countryscreen.dart';
import 'networking.dart';

class Dashboard extends StatefulWidget {
  final country;
  final global;
  Dashboard({this.country, this.global});
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late String countrydata;
  late int cases;
  late int recovered;
  late int death;
  late int todaycases;
  late int todaydeath;

  late int globalcases;
  late int globalrecovered;
  late int globaldeath;
  late int globaltodaycases;
  late int globaltodaydeath;

  @override
  void initState() {
    super.initState();
    updateUI(widget.country);
    updateUIGlobal(widget.global);
    updateUICountry(widget.country);
  }

  void updateUI(dynamic countryData) {
    countrydata = countryData['country'];
    cases = countryData['cases'];
    recovered = countryData['recovered'];
    death = countryData['deaths'];
    todaycases = countryData['todayCases'];
    todaydeath = countryData['todayDeaths'];
  }

  void updateUICountry(dynamic countryData) {
    setState(() {
      countrydata = countryData['country'];
      cases = countryData['cases'];
      recovered = countryData['recovered'];
      death = countryData['deaths'];
      todaycases = countryData['todayCases'];
      todaydeath = countryData['todayDeaths'];
    });
  }

  void updateUIGlobal(dynamic countryData) {
    globalcases = countryData['cases'];
    globalrecovered = countryData['recovered'];
    globaldeath = countryData['deaths'];
    globaltodaycases = countryData['todayCases'];
    globaltodaydeath = countryData['todayDeaths'];
  }

  void getCountryData(String country) async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://disease.sh/v2/countries/$country');

    var countryData = await networkHelper.getCountryData();

    updateUICountry(countryData);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = 150;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .35,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/page_bg.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Covid-19 Tracker',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      FlatButton(
                        onPressed: () async {
                          var typedCountry = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CountryScreen(),
                              ));
                              getCountryData(typedCountry);
                        },
                        child: Text(
                          '$countrydata',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Last Updated 1 hour ago',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Grid(
                            title: 'Cases',
                            no: '$cases',
                            colour: 0xff2AA847,
                            icon: Icons.arrow_upward,
                            today: '$todaycases',
                          ),
                          Grid(
                            title: 'Recovered',
                            no: '$recovered',
                            colour: 0xff077eff,
                            icon: Icons.arrow_upward,
                            today: '',
                          ),
                          Grid(
                            title: 'Deaths',
                            no: '$death',
                            colour: 0xffFe083b,
                            icon: Icons.arrow_downward,
                            today: '$todaydeath',
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                                spreadRadius: 0.1,
                                offset: Offset(2, 2))
                          ],
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Global Outbreak',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Grid(
                            title: 'Cases',
                            no: '$globalcases',
                            colour: 0xff2AA847,
                            icon: Icons.arrow_upward,
                            today: '$globaltodaycases',
                          ),
                          Grid(
                            title: 'Recovered',
                            no: '$globalrecovered',
                            colour: 0xff077eff,
                            icon: Icons.arrow_upward,
                            today: '',
                          ),
                          Grid(
                            title: 'Deaths',
                            no: '$globaldeath',
                            colour: 0xffFe083b,
                            icon: Icons.arrow_downward,
                            today: '$globaltodaydeath',
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                                spreadRadius: 0.1,
                                offset: Offset(2, 2))
                          ],
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Preventions',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: itemWidth / itemHeight,
                      children: <Widget>[
                        Prevention(
                          image: 'assets/prevention/cough.png',
                          title: 'Cover your cough',
                        ),
                        Prevention(
                          image: 'assets/prevention/distance.png',
                          title: 'Keep safe distance',
                        ),
                        Prevention(
                          image: 'assets/prevention/hands.png',
                          title: 'Wash hand often',
                        ),
                        Prevention(
                          image: 'assets/prevention/home.png',
                          title: 'Stay at home',
                        ),
                        Prevention(
                          image: 'assets/prevention/mask.png',
                          title: 'Wear facemask',
                        ),
                        Prevention(
                          image: 'assets/prevention/spray.png',
                          title: 'Clean and Disinfect',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Prevention extends StatelessWidget {
  final String title;
  final String image;

  Prevention({ Key? key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.asset(image),
          Text(
            title,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}

class Grid extends StatelessWidget {
  final String title;
  final String no;
  final int colour;
  final IconData icon;
  final String today;

  Grid({Key? key, required this.title, required this.no, required this.colour, required this.icon, required this.today});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(title,
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(no,
                style: TextStyle(color: Color(colour), fontSize: 24.0)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Icon(
                  icon,
                  size: 15.0,
                  color: Color(colour),
                ),
                Text(
                  today,
                  style: TextStyle(
                      color: Color(colour), fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
