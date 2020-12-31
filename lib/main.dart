import 'package:corona_virus_rest_api_flutter_coarse/app/services/api.dart';
import 'package:corona_virus_rest_api_flutter_coarse/app/services/api_service.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _accessToken = '';
  int _cases;
  int _deaths;
  int _todayCases;
  int _active;
  int _recovered;
  int _todayDeaths;
  int _casesPerOneMillion;
  int _critical;

  void _updateAccessToken() async {
    final apiService = APIService(API.sandbox());
    final accessToken = await apiService.getAccessToken();
    final cases = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.cases);
    final deaths = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.deaths);
    final todayCases = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.todayCases);
    final active = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.active);
    final recovered = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.recovered);
    final todayDeaths = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.todayDeaths);
    final casesPerOneMillion = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.casesPerOneMillion);
    final critical = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.critical);

    setState(() {
      _accessToken = accessToken;
      _cases = cases;
      _deaths = deaths;
      _todayCases = todayCases;
      _active = active;
      _recovered = recovered;
      _todayDeaths = todayDeaths;
      _casesPerOneMillion = casesPerOneMillion;
      _critical = critical;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'CoronaVirus Tracker',
              style: TextStyle(
                color: Colors.red.shade300,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15.0),
            Text(
              'Access Token:   $_accessToken',
              style: TextStyle(
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 15.0),
            if (_cases != null)
              Text(
                'Cases: $_cases',
                style: TextStyle(
                  color: Colors.teal,
                ),
              ),
            SizedBox(height: 15.0),
            if (_deaths != null)
              Text(
                'Deaths: $_deaths',
                style: TextStyle(
                  color: Colors.teal,
                ),
              ),
            SizedBox(height: 15.0),
            if (_todayCases != null)
              Text(
                'Today Cases: $_todayCases',
                style: TextStyle(
                  color: Colors.teal,
                ),
              ),
            SizedBox(height: 15.0),
            if (_active != null)
              Text(
                'Active Cases: $_active',
                style: TextStyle(
                  color: Colors.teal,
                ),
              ),
            SizedBox(height: 15.0),
            if (_recovered != null)
              Text(
                'Recovered: $_recovered',
                style: TextStyle(
                  color: Colors.teal,
                ),
              ),
            SizedBox(height: 15.0),
            if (_todayDeaths != null)
              Text(
                'Today Deaths: $_todayDeaths',
                style: TextStyle(
                  color: Colors.teal,
                ),
              ),
            SizedBox(height: 15.0),
            if (_casesPerOneMillion != null)
              Text(
                'Cases Per One Million: $_casesPerOneMillion',
                style: TextStyle(
                  color: Colors.teal,
                ),
              ),
            SizedBox(height: 15.0),
            if (_critical != null)
              Text(
                'Critical: $_critical',
                style: TextStyle(
                  color: Colors.teal,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateAccessToken,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
