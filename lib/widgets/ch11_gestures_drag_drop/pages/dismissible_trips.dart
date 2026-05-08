import 'package:flutter/material.dart';
import '../classes/trip.dart';

class DismissibleTripsPage extends StatefulWidget {
  const DismissibleTripsPage({super.key});

  @override
  _DismissibleTripsPageState createState() => _DismissibleTripsPageState();
}

class _DismissibleTripsPageState extends State<DismissibleTripsPage> {
  List<Trip> _trips = [];

  @override
  void initState() {
    super.initState();
    _trips = [
      Trip(id: '0', tripName: 'Rome', tripLocation: 'Italy'),
      Trip(id: '1', tripName: 'Paris', tripLocation: 'France'),
      Trip(id: '2', tripName: 'New York', tripLocation: 'USA - New York'),
      Trip(id: '3', tripName: 'Cancun', tripLocation: 'Mexico'),
      Trip(id: '4', tripName: 'London', tripLocation: 'England'),
      Trip(id: '5', tripName: 'Sydney', tripLocation: 'Australia'),
      Trip(id: '6', tripName: 'Miami', tripLocation: 'USA - Florida'),
      Trip(id: '7', tripName: 'Rio de Janeiro', tripLocation: 'Brazil'),
      Trip(id: '8', tripName: 'Cusco', tripLocation: 'Peru'),
      Trip(id: '9', tripName: 'New Delhi', tripLocation: 'India'),
      Trip(id: '10', tripName: 'Tokyo', tripLocation: 'Japan'),
    ];
  }

  void _markTripCompleted() => print('Trip completed');
  void _deleteTrip() => print('Trip deleted');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Swipe to Dismiss Trips')),
      body: ListView.builder(
        itemCount: _trips.length,
        itemBuilder: (context, index) {
          final trip = _trips[index];
          return Dismissible(
            key: Key(trip.id),
            background: Container(
              color: Colors.green,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20),
              child: Icon(Icons.done, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                _markTripCompleted();
              } else {
                _deleteTrip();
              }
              setState(() {
                _trips.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${trip.tripName} dismissed')),
              );
            },
            child: ListTile(
              leading: Icon(Icons.flight),
              title: Text(trip.tripName),
              subtitle: Text(trip.tripLocation),
              trailing: Icon(Icons.fastfood),
            ),
          );
        },
      ),
    );
  }
}
