import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

/// View model for the dialog
class DialogViewModel extends ChangeNotifier {
  // Default message
  String message = "I'm having an emergency at @loc, send help! ";
  // Default recipients
  List<String> recipients = ["911", "112"];

  /// Set the message
  void setMessage(String newMessage) async {
    if (newMessage.contains("@loc")) {
      LocationData? locationData = await getLocation();
      if (locationData != null) {
        newMessage = newMessage.replaceAll("@loc", "Latitude: ${locationData.latitude}, Longitude: ${locationData.longitude}");
      } else {
        newMessage = newMessage.replaceAll("@loc", "Location not available");
      }
    }
    message = newMessage;
    notifyListeners();
  }

  /// Getter for the location
  Future<LocationData?> getLocation() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();
    return _locationData;
  }

  /// Getter for the message
  String getMessage() {
    return message;
  }

  void addRecipient(String recipient) {
    recipients.add(recipient);
    notifyListeners();
  }

  void removeRecipient(String recipient) {
    recipients.remove(recipient);
    notifyListeners();
  }

  /// Getter for the recipients
  List<String> getRecipients() {
    return recipients;
  }
}