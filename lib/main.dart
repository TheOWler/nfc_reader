import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:typed_data';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NFCReader(),
    );
  }
}

class NFCReader extends StatefulWidget {
  @override
  _NFCReaderState createState() => _NFCReaderState();
}

class _NFCReaderState extends State<NFCReader> {
  bool _reading = false;
  String _nfcData = "";
  Image? _image; // Declare this variable to hold the image data
  ImagePicker _picker = ImagePicker();

  Future<void> _startReading() async {
    setState(() {
      _nfcData = "Reading...";
    });

    try {
      NFCTag tag = await FlutterNfcKit.poll(
          timeout: Duration(seconds: 10),
          iosMultipleTagMessage: "Multiple tags found!",
          iosAlertMessage: "Scan your tag");

      var tagDataJson = jsonEncode(tag); // Get JSON string of the tag data

      if (tag.type == NFCTagType.iso7816) {
        var result = await FlutterNfcKit.transceive("00B0950000");
        print(
            result); // Temporarily print this data to the console for inspection
        // You can add this data to tagDataJson or handle it separately
      }

      // Update the state with the JSON string of the tag data
      setState(() {
        _nfcData = "NFC Tag Data: $tagDataJson";
      });

      if (tag.ndefAvailable ?? false) {
        for (var record in await FlutterNfcKit.readNDEFRecords(cached: false)) {
          print(record
              .toString()); // Temporarily print records to the console for inspection
          // You can append this data to _nfcData or handle it separately
        }
      }
    } catch (e) {
      print("Error reading NFC: $e");
      setState(() {
        _nfcData = "Error: $e";
      });
    }
  }

  Future<void> _takeSelfie() async {
    PickedFile? pickedFile = await _picker.getImage(source: ImageSource.camera);
    // Implement the logic to use the picked image
    if (pickedFile != null) {
      print("Path to selfie: ${pickedFile.path}");
    } else {
      print("No image selected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NFC Reader')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _startReading,
            child: Text('Start NFC Reading'),
          ),
          if (_image != null)
            Expanded(
              child: Center(
                  child: _image!), // Display the image when it's not null
            ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(_nfcData),
            ),
          ),
        ],
      ),
    );
  }
}
