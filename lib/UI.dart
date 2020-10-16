import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'engine.dart';
import 'filterData.dart';

class Ui extends StatefulWidget {
  @override
  _UiState createState() => _UiState();
}

class _UiState extends State<Ui> {
  WeatherDetail weatherDetail; // TODO change to full form
  WeatherClient weatherClient = WeatherClient();
  bool isLoading = false;
  bool isError = false;

  void updateWeatherDetail(String cityName) {
    print("********** Update Call *********");
    isLoading = true;
    isError = false;
    if (cityName != null) {
      weatherClient.setCity(cityName);
    }
    weatherClient.getRequest().then((value) {
      weatherDetail = value;
      isLoading = false;
      isError = false;
      setState(() {});
    }).catchError((error) {
      isError = true;
      isLoading = false;
      setState(() {});
    });
    setState(() {});
  }

  void initState() {
    super.initState();
    updateWeatherDetail(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      drawer: slideMenu(),
      backgroundColor: Colors.black,
      body: check(),
    );
  }

  check() {
    if (isLoading == true) {
      return Center(child: CircularProgressIndicator());
    } else if (isError == true && isLoading == false) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: internetCheck(),
        ),
      );
    } else if (isLoading == false && isError == false) {
      return SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      richText("Latitude ", " ${weatherDetail.coordsLat}"),
                      spaceBetweenText(),
                      richText("Longitude ", " ${weatherDetail.coordsLat}"),
                      spaceBetweenText(),
                      richText("CityName ", " ${weatherDetail.cityName}"),
                      spaceBetweenText(),
                      richText("Temparature ", " ${weatherDetail.temparature}"),
                      spaceBetweenText(),
                      richText("Country ", " ${weatherDetail.country}"),
                      spaceBetweenText(),
                      richText("WeatherType ", " ${weatherDetail.weatherType}"),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Center(
                  child: refreshButton(),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  richText(String Name, String value) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: '$Name :',
              style: GoogleFonts.righteous(fontSize: 35, color: Colors.white)),
          TextSpan(
            text: value,
            style: GoogleFonts.righteous(fontSize: 25, color: Colors.white),
          ),
        ],
      ),
    );
  }

  appbar() {
    return AppBar(
      centerTitle: true,
      title: Text("TodayWeatherInfo",
          style: GoogleFonts.righteous(
              fontSize: 24, color: Colors.white, letterSpacing: 2)),
      backgroundColor: Colors.black,
    );
  }

  refreshButton() {
    return MaterialButton(
      child: Text("Refresh Weather page",
          style: GoogleFonts.righteous(
              fontSize: 20,
              color: Colors.black,
              letterSpacing: 2,
              fontWeight: FontWeight.w400)),
      color: Colors.white,
      textColor: Colors.black,
      onPressed: () {
        updateWeatherDetail("Chennai");
      },
      splashColor: Colors.lightBlue,
    );
  }

  internetCheck() {
    return MaterialButton(
      child: Text("Check Your Internet",
          style: GoogleFonts.righteous(
              fontSize: 20,
              color: Colors.black,
              letterSpacing: 2,
              fontWeight: FontWeight.w400)),
      color: Colors.white,
      textColor: Colors.black,
      onPressed: () {
        updateWeatherDetail("Chennai");
      },
      splashColor: Colors.lightBlue,
    );
  }

  cityButton(String name) {
    return MaterialButton(
      child: Text("$name",
          style: GoogleFonts.mavenPro(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700)),
      color: Colors.white,
      // textColor: Colors.black,
      onPressed: () {
        updateWeatherDetail(name);
        Navigator.pop(context);
      },
    );
  }

  spaceBetweenText() {
    return SizedBox(
      height: 18,
    );
  }

  slideMenu() {
    return Drawer(
        child: Container(
      color: Colors.white,
      child: ListView(
        children: [
          cityButton("Chennai"),
          cityButton("Mumbai"),
          cityButton("Bangalore"),
          cityButton("Hyderabad"),
          cityButton("Ahmedabad"),
          cityButton("Kolkata"),
          cityButton("Surat"),
          cityButton("Pune"),
          cityButton("Jaipur"),
          cityButton("Kanpur"),
          cityButton("Nagpur"),
          cityButton("Lucknow"),
          cityButton("Visakhapatnam"),
          cityButton("Bhopal"),
          cityButton("Indore"),
          cityButton("Patna"),
          cityButton("Vadodara"),
          cityButton("Ghaziabad"),
          cityButton("Ludhiana"),
          cityButton("Agra"),
          cityButton("Nashik"),
          cityButton("Faridabad"),
          cityButton("Rajkot"),
          cityButton("Srinagar"),
          cityButton("Ranchi"),
          cityButton("Raipur"),
          cityButton("Chandigarh"),
          cityButton("Bhubaneswar"),
          cityButton("Dehradun"),
          cityButton("Thiruvananthapuram"),
          cityButton("Agartala"),
          cityButton("Aizawl"),
          cityButton("Imphal"),
          cityButton("Pondicherry"),
          cityButton("Gandhinagar"),
          cityButton("Shimla"),
          cityButton("Amaravati"),
          cityButton("Gangtok"),
        ],
      ),
    ));
  }
}
