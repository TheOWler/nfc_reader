// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
// // // // // import 'package:image_picker/image_picker.dart';
// // // // // import 'dart:convert';
// // // // // import 'dart:typed_data';

// // // // // void main() => runApp(MyApp());

// // // // // class MyApp extends StatelessWidget {
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return MaterialApp(
// // // // //       home: NFCReader(),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // class NFCReader extends StatefulWidget {
// // // // //   @override
// // // // //   _NFCReaderState createState() => _NFCReaderState();
// // // // // }

// // // // // class _NFCReaderState extends State<NFCReader> {
// // // // //   bool _reading = false;
// // // // //   String _nfcData = "";
// // // // //   Image? _image; // Declare this variable to hold the image data
// // // // //   ImagePicker _picker = ImagePicker();

// // // // //   Future<void> _startReading() async {
// // // // //     setState(() {
// // // // //       _nfcData = "Reading...";
// // // // //     });

// // // // //     try {
// // // // //       NFCTag tag = await FlutterNfcKit.poll(
// // // // //           timeout: Duration(seconds: 10),
// // // // //           iosMultipleTagMessage: "Multiple tags found!",
// // // // //           iosAlertMessage: "Scan your tag");

// // // // //       var tagDataJson = jsonEncode(tag);

// // // // //       if (tag.type == NFCTagType.iso7816) {
// // // // //         // Replace with actual APDU command for your tag
// // // // //         var command = "00B0950000";
// // // // //         var response = await FlutterNfcKit.transceive(command);
// // // // //         print("APDU Response: $response");
// // // // //       }

// // // // //       setState(() {
// // // // //         _nfcData = "NFC Tag Data: $tagDataJson";
// // // // //       });
// // // // //     } catch (e) {
// // // // //       print("Error reading NFC: $e");
// // // // //       setState(() {
// // // // //         _nfcData = "Error: $e";
// // // // //       });
// // // // //     }
// // // // //   }

// // // // //   Future<void> _takeSelfie() async {
// // // // //     PickedFile? pickedFile = await _picker.getImage(source: ImageSource.camera);
// // // // //     // Implement the logic to use the picked image
// // // // //     if (pickedFile != null) {
// // // // //       print("Path to selfie: ${pickedFile.path}");
// // // // //     } else {
// // // // //       print("No image selected.");
// // // // //     }
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(title: Text('NFC Reader')),
// // // // //       body: Column(
// // // // //         children: [
// // // // //           ElevatedButton(
// // // // //             onPressed: _startReading,
// // // // //             child: Text('Start NFC Reading'),
// // // // //           ),
// // // // //           if (_image != null)
// // // // //             Expanded(
// // // // //               child: Center(
// // // // //                   child: _image!), // Display the image when it's not null
// // // // //             ),
// // // // //           Expanded(
// // // // //             child: SingleChildScrollView(
// // // // //               child: Text(_nfcData),
// // // // //             ),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // import 'package:flutter/material.dart';
// // // // import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
// // // // import 'package:image_picker/image_picker.dart';
// // // // import 'dart:convert';
// // // // import 'dart:typed_data';

// // // // void main() => runApp(MyApp());

// // // // class MyApp extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       home: NFCReader(),
// // // //     );
// // // //   }
// // // // }

// // // // class NFCReader extends StatefulWidget {
// // // //   @override
// // // //   _NFCReaderState createState() => _NFCReaderState();
// // // // }

// // // // class _NFCReaderState extends State<NFCReader> {
// // // //   bool _reading = false;
// // // //   String _nfcData = "";
// // // //   ImagePicker _picker = ImagePicker();

// // // //   Future<void> _startReading() async {
// // // //     setState(() {
// // // //       _nfcData = "Reading...";
// // // //     });

// // // //     try {
// // // //       NFCTag tag = await FlutterNfcKit.poll(
// // // //           timeout: Duration(seconds: 10),
// // // //           iosMultipleTagMessage: "Multiple tags found!",
// // // //           iosAlertMessage: "Scan your tag");

// // // //       var tagDataJson = jsonEncode(tag);

// // // //       // MRZ data
// // // //       String mrz = """
// // // //       P<UTOERIKSSON<<ANNA<MARIA<<<<<<<<<<<<<<<<<<<
// // // //       L898902C36UTO7408122F1204159ZE184226B<<<<<14
// // // //       """;

// // // //       // Extract key elements (this would depend on the MRZ format and may need to be adjusted)
// // // //       String documentNumber = mrz.substring(44, 53);
// // // //       String dateOfBirth = mrz.substring(57, 63);
// // // //       String expiryDate = mrz.substring(65, 71);

// // // //       // TODO: Implement actual BAC key derivation and NFC unlocking
// // // //       // This is a placeholder and you need an actual implementation
// // // //       // BACKey bacKey = BAC.deriveKey(documentNumber, dateOfBirth, expiryDate);
// // // //       // NFCChip chip = await NFC.unlockWithBAC(bacKey);

// // // //       // Placeholder: Replace this with actual command to read specific data using the derived BAC key
// // // //       var command = "00B0950000";
// // // //       var response = await FlutterNfcKit.transceive(command);
// // // //       print("APDU Response: $response");

// // // //       setState(() {
// // // //         _nfcData = "NFC Tag Data: $tagDataJson\nMRZ Data: $mrz";
// // // //       });
// // // //     } catch (e) {
// // // //       print("Error reading NFC: $e");
// // // //       setState(() {
// // // //         _nfcData = "Error: $e";
// // // //       });
// // // //     }
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(title: Text('NFC Reader')),
// // // //       body: Column(
// // // //         children: [
// // // //           ElevatedButton(
// // // //             onPressed: _startReading,
// // // //             child: Text('Start NFC Reading'),
// // // //           ),
// // // //           Expanded(
// // // //             child: SingleChildScrollView(
// // // //               child: Text(_nfcData),
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'dart:convert';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
// // // import 'package:crypto/crypto.dart'; // Add this package for SHA-1 hash
// // // import 'dart:typed_data';

// // // void main() => runApp(MyApp());

// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       home: NFCReader(),
// // //     );
// // //   }
// // // }

// // // class NFCReader extends StatefulWidget {
// // //   @override
// // //   _NFCReaderState createState() => _NFCReaderState();
// // // }

// // // class _NFCReaderState extends State<NFCReader> {
// // //   String _nfcData = "";

// // //   Future<void> _startReading() async {
// // //     setState(() {
// // //       _nfcData = "Reading...";
// // //     });

// // //     try {
// // //       NFCTag tag = await FlutterNfcKit.poll(
// // //           timeout: Duration(seconds: 10),
// // //           iosMultipleTagMessage: "Multiple tags found!",
// // //           iosAlertMessage: "Scan your tag");

// // //       var tagDataJson = jsonEncode(tag);

// // //       // MRZ data
// // //       String mrz = """
// // //       IDDZA1002906103<<<<<<<<<<<<<<<
// // //       9811223M2603302DZA<<<<<<<<<<<4
// // //       LARBI<<AHMED<OUALI<<<<<<<<<<<<
// // //       """;

// // //       // Extract key elements
// // //       String documentNumber = mrz.substring(44, 53);
// // //       String dateOfBirth = mrz.substring(57, 63);
// // //       String expiryDate = mrz.substring(65, 71);

// // //       // Concatenating MRZ data to derive BAC keys
// // //       String bacString = documentNumber + dateOfBirth + expiryDate;
// // //       var bacKeySeed = utf8.encode(bacString);

// // //       // Deriving BAC keys using SHA-1 hash (This is conceptual, you should use the official BAC key derivation algorithm)
// // //       var bacKey = sha1.convert(bacKeySeed);

// // //       // TODO: Use derived BAC key to initiate secure communication and unlock the chip

// // //       // For now, printing the derived BAC key
// // //       print('BAC Key: $bacKey');

// // //       setState(() {
// // //         _nfcData =
// // //             "NFC Tag Data: $tagDataJson\nMRZ Data: $mrz\nDerived BAC Key: $bacKey";
// // //       });
// // //     } catch (e) {
// // //       print("Error reading NFC: $e");
// // //       setState(() {
// // //         _nfcData = "Error: $e";
// // //       });
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(title: Text('NFC Reader')),
// // //       body: Column(
// // //         children: [
// // //           ElevatedButton(
// // //             onPressed: _startReading,
// // //             child: Text('Start NFC Reading'),
// // //           ),
// // //           Expanded(
// // //             child: SingleChildScrollView(
// // //               child: Text(_nfcData),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
// // import 'package:crypto/crypto.dart'; // Added for SHA-1 hash
// // import 'dart:typed_data';

// // void main() => runApp(MyApp());

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: NFCReader(),
// //     );
// //   }
// // }

// // class NFCReader extends StatefulWidget {
// //   @override
// //   _NFCReaderState createState() => _NFCReaderState();
// // }

// // class _NFCReaderState extends State<NFCReader> {
// //   String _nfcData = "";

// //   Future<void> _startReading() async {
// //     setState(() {
// //       _nfcData = "Reading...";
// //     });

// //     try {
// //       NFCTag tag = await FlutterNfcKit.poll(
// //           timeout: Duration(seconds: 10),
// //           iosMultipleTagMessage: "Multiple tags found!",
// //           iosAlertMessage: "Scan your tag");

// //       var tagDataJson = jsonEncode(tag);

// //       // MRZ data
// //       String mrz = """
// //       IDDZA1002906103<<<<<<<<<<<<<<<
// //       9811223M2603302DZA<<<<<<<<<<<4
// //       LARBI<<AHMED<OUALI<<<<<<<<<<<<
// //       """;

// //       // Extract key elements
// //       String documentNumber = mrz.substring(44, 53);
// //       String dateOfBirth = mrz.substring(57, 63);
// //       String expiryDate = mrz.substring(65, 71);

// //       // Concatenating MRZ data to derive BAC keys
// //       String bacString = documentNumber + dateOfBirth + expiryDate;
// //       var bacKeySeed = utf8.encode(bacString);

// //       // Deriving BAC keys using SHA-1 hash
// //       var bacKey = sha1.convert(bacKeySeed);

// //       // Print the derived BAC key
// //       print('BAC Key: $bacKey');

// //       // Send a GET CHALLENGE command to the chip to receive a random challenge
// //       var getChallengeCommand = "00C4000008";
// //       var challengeResponse =
// //           await FlutterNfcKit.transceive(getChallengeCommand);

// //       // TODO: Compute the cryptographic checksum of the random challenge using the derived keys
// //       // This would involve implementing cryptographic functions for this specific step

// //       // TODO: Send MUTUAL AUTHENTICATE command with the computed checksum
// //       // Placeholder: This is a placeholder APDU for mutual authentication
// //       var mutualAuthCommand = "0082000000"; // Placeholder
// //       var mutualAuthResponse =
// //           await FlutterNfcKit.transceive(mutualAuthCommand);

// //       // TODO: Validate the mutual authentication response
// //       // Implement validation and error handling here

// //       // For simplicity, printing mutual authentication response
// //       print("Mutual Auth Response: $mutualAuthResponse");

// //       setState(() {
// //         _nfcData =
// //             "NFC Tag Data: $tagDataJson\nMRZ Data: $mrz\nDerived BAC Key: $bacKey\nMutual Auth Response: $mutualAuthResponse";
// //       });
// //     } catch (e) {
// //       print("Error reading NFC: $e");
// //       setState(() {
// //         _nfcData = "Error: $e";
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('NFC Reader')),
// //       body: Column(
// //         children: [
// //           ElevatedButton(
// //             onPressed: _startReading,
// //             child: Text('Start NFC Reading'),
// //           ),
// //           Expanded(
// //             child: SingleChildScrollView(
// //               child: Text(_nfcData),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
// import 'package:crypto/crypto.dart'; // Added for SHA-1 hash
// import 'dart:typed_data';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: NFCReader(),
//     );
//   }
// }

// class NFCReader extends StatefulWidget {
//   @override
//   _NFCReaderState createState() => _NFCReaderState();
// }

// class _NFCReaderState extends State<NFCReader> {
//   String _nfcData = "";

//   Future<void> _startReading() async {
//     setState(() {
//       _nfcData = "Reading...";
//     });

//     try {
//       NFCTag tag = await FlutterNfcKit.poll(
//           timeout: Duration(seconds: 10),
//           iosMultipleTagMessage: "Multiple tags found!",
//           iosAlertMessage: "Scan your tag");

//       var tagDataJson = jsonEncode(tag);

//       // MRZ data
//       String mrz = """
//       IDDZA1002906103<<<<<<<<<<<<<<<
//       9811223M2603302DZA<<<<<<<<<<<4
//       LARBI<<AHMED<OUALI<<<<<<<<<<<<
//       """;

//       // Extract key elements
//       String documentNumber = mrz.substring(44, 53);
//       String dateOfBirth = mrz.substring(57, 63);
//       String expiryDate = mrz.substring(65, 71);

//       // Concatenating MRZ data to derive BAC keys
//       String bacString = documentNumber + dateOfBirth + expiryDate;
//       var bacKeySeed = utf8.encode(bacString);

//       // Deriving BAC keys using SHA-1 hash
//       var bacKey = sha1.convert(bacKeySeed);

//       // Print the derived BAC key
//       print('BAC Key: $bacKey');

//       // Send a GET CHALLENGE command to the chip to receive a random challenge
//       var getChallengeCommand = "00C4000008";
//       var challengeResponse =
//           await FlutterNfcKit.transceive(getChallengeCommand);

//       // TODO: Compute the cryptographic checksum of the random challenge using the derived keys
//       // This would involve implementing cryptographic functions for this specific step

//       // TODO: Send MUTUAL AUTHENTICATE command with the computed checksum
//       var mutualAuthCommand = "0082000000"; // Placeholder
//       var mutualAuthResponse =
//           await FlutterNfcKit.transceive(mutualAuthCommand);

//       // Print the mutual authentication response
//       print("Mutual Auth Response: $mutualAuthResponse");

//       // TODO: Implement the logic to establish secure messaging using the session keys derived from BAC
//       var secureMessagingEstablished = true; // Placeholder

//       if (secureMessagingEstablished) {
//         // Placeholder: APDU command to read data from the chip using secure messaging
//         var readDataCommand = "00B0950000"; // Placeholder
//         var chipDataResponse = await FlutterNfcKit.transceive(readDataCommand);

//         // Print the data read from the chip
//         print("Chip Data: $chipDataResponse");

//         _nfcData += "\nChip Data: $chipDataResponse";
//       } else {
//         _nfcData += "\nFailed to establish secure messaging.";
//       }

//       setState(() {
//         _nfcData += "\nComplete.";
//       });
//     } catch (e) {
//       print("Error reading NFC: $e");
//       setState(() {
//         _nfcData = "Error: $e";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('NFC Reader')),
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: _startReading,
//             child: Text('Start NFC Reading'),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Text(_nfcData),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:crypto/crypto.dart'; // Added for SHA-1 hash
import 'dart:typed_data';
import 'package:pointycastle/pointycastle.dart'; // Make sure it's imported like this
import 'package:convert/convert.dart';
import 'dart:math';
import 'package:dart_des/dart_des.dart';
// import 'tripledes.dart';

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
  String _nfcData = "";

  Future<void> _startReading() async {
    setState(() {
      _nfcData = "Reading...";
    });

    try {
      NFCTag tag = await FlutterNfcKit.poll(
          timeout: Duration(seconds: 10),
          iosMultipleTagMessage: "Multiple tags found!",
          iosAlertMessage: "Scan your tag");

      var tagDataJson = jsonEncode(tag);
      // _nfcData += "\n tagDataJson: $tagDataJson";

      // MRZ data
      String mrz =
          "IDDZA1002906103<<<<<<<<<<<<<<<9811223M2603302DZA<<<<<<<<<<<4LARBI<<AHMED<OUALI<<<<<<<<<<<<";

      // Extract key elements
      String documentNumber = mrz.substring(5, 14);
      String documentNumber_check_digit = mrz.substring(14, 15);
      String dateOfBirth = mrz.substring(30, 36);
      String dateOfBirth_check_digit = mrz.substring(36, 37);
      String gender = mrz.substring(37, 38);
      String expiryDate = mrz.substring(38, 44);
      String expiryDate_check_digit = mrz.substring(44, 45);
      // _nfcData += "\n documentNumber: $documentNumber";
      // _nfcData += "\n documentNumber_check_digit: $documentNumber_check_digit";
      // _nfcData += "\n dateOfBirth: $dateOfBirth";
      // _nfcData += "\n dateOfBirth_check_digit: $dateOfBirth_check_digit";
      // _nfcData += "\n expiryDate: $expiryDate";
      // _nfcData += "\n expiryDate_check_digit: $expiryDate_check_digit";
      String MRZ_information = documentNumber +
          documentNumber_check_digit +
          dateOfBirth +
          dateOfBirth_check_digit +
          expiryDate +
          expiryDate_check_digit;
      // MRZ_information = "L898902C<369080619406236";
      // Concatenating MRZ data to derive BAC keys
      // _nfcData += "\n MRZ_information: $MRZ_information";

      List<int> kseedFull = sha1
          .convert(utf8.encode(MRZ_information))
          .bytes; // Getting full SHA-1 hash of MRZ information
      List<int> kseed =
          kseedFull.sublist(0, 16); // Taking the most significant 16 bytes

      // _nfcData += "\nFull Kseed: ${hex.encode(kseedFull)}";
      // _nfcData += "\nTruncated Kseed (16 bytes): ${hex.encode(kseed)}";

// For KENC
      List<int> dEncryption = []
        ..addAll(kseed)
        ..addAll([0, 0, 0, 1]); // Concatenating Kseed and C0
      List<int> hEncryption =
          sha1.convert(dEncryption).bytes; // Getting SHA-1 hash
      List<int> kenc =
          hEncryption.sublist(0, 16); // Taking the most significant 16 bytes

      _nfcData += "\nKENC: ${hex.encode(kenc)}";

// For KMAC
      List<int> dMac = []
        ..addAll(kseed)
        ..addAll([0, 0, 0, 2]); // Concatenating Kseed and C1
      List<int> hMac = sha1.convert(dMac).bytes; // Getting SHA-1 hash
      List<int> kmac =
          hMac.sublist(0, 16); // Taking the most significant 16 bytes

      _nfcData += "\nKMAC: ${hex.encode(kmac)}";

//       // Counter c for Encryption and MAC
//       List<int> cEncryption = [0, 0, 0, 1];
//       List<int> cMac = [0, 0, 0, 2];

//       // Deriving Encryption Key (KENC)
//       List<int> dEncryption = []
//         ..addAll(kseed)
//         ..addAll(cEncryption); // Concatenation of Kseed and c
//       List<int> hEncryption = sha1.convert(dEncryption).bytes; // SHA-1 Hash

//       // TODO: Adjust parity bits
//       _nfcData += "\nKseed: ${hex.encode(kseed)}";

//       // Print Ka and Kb for Encryption
//       print('Ka for Encryption: ${hex.encode(kaEncryption)}');
//       print('Kb for Encryption: ${hex.encode(kbEncryption)}');
      List<int> kaEncryption = hEncryption.sublist(0, 8); // Bytes 1-8
      List<int> kbEncryption = hEncryption.sublist(8, 16); // Bytes 9-16

      // _nfcData += "\nKa for Encryption: ${hex.encode(kaEncryption)}";
      // _nfcData += "\nKb for Encryption: ${hex.encode(kbEncryption)}";
      kaEncryption = adjustParity(kaEncryption);
      kbEncryption = adjustParity(kbEncryption);
      // _nfcData +=
      //     "\nKa for Encryption after adjust parity: ${hex.encode(kaEncryption)}";
      // _nfcData +=
      //     "\nKb for Encryption after adjust parity: ${hex.encode(kbEncryption)}";
//       List<int> dMac = []
//         ..addAll(kseed)
//         ..addAll(cMac); // Concatenation of Kseed and c
//       List<int> hMac = sha1.convert(dMac).bytes; // SHA-1 Hash
//       List<int> kaMac = hMac.sublist(0, 8); // Bytes 1-8
//       List<int> kbMac = hMac.sublist(8, 16); // Bytes 9-16
      List<int> kaMac = hMac.sublist(0, 8); // Bytes 1-8
      List<int> kbMac = hMac.sublist(8, 16); // Bytes 9-16
      // _nfcData += "\nKa for MAC: ${hex.encode(kaMac)}";
      // _nfcData += "\nKb for MAC: ${hex.encode(kbMac)}";
      kaMac = adjustParity(kaMac);
      kbMac = adjustParity(kbMac);
      // _nfcData += "\nKa for MAC after adjust parity: ${hex.encode(kaMac)}";
      // _nfcData += "\nKb for MAC after adjust parity: ${hex.encode(kbMac)}";
      //finall kenc and kmac
      List<int> kaENC = kaEncryption + kbEncryption;
      List<int> kaMAC = kaMac + kbMac;
      // _nfcData += "\n ------------ kaENC: ${hex.encode(kaENC)}";
      // _nfcData += "\n ------------ kaMac: ${hex.encode(kaMAC)}";
// // Append adjusted Ka and Kb for MAC to _nfcData
//       _nfcData += "\nAdjusted Ka for MAC: ${hex.encode(kaMac)}";
//       _nfcData += "\nAdjusted Kb for MAC: ${hex.encode(kbMac)}";
//
//
//
//
//
//
      var getChallengeCommand = "0084000008";
      var challengeResponse =
          await FlutterNfcKit.transceive(getChallengeCommand);

      // print('challengeResponse: ${challengeResponse}');

      String RND_ICC = challengeResponse.substring(0, 16);
      // _nfcData += "\n +++++++++ : ${challengeResponse}";
      // _nfcData += "\n aaa : ${RND_ICC}";

      var random = Random();
      var RND_IFDdBytes = List<int>.generate(8, (i) => random.nextInt(256));
      var RND_IFD = hex.encode(RND_IFDdBytes);
      var KIFDBytes = List<int>.generate(16, (i) => random.nextInt(256));
      var KIFD = hex.encode(KIFDBytes);
      // String RND_IFD
      // _nfcData += "\n RND_IF : ${RND_IFD}";
      // _nfcData += "\n KIFDHex : ${KIFD}";
      var S = RND_IFD + RND_ICC + KIFD;
      // _nfcData += "\n S : ${S}";
//

//

//

//

//

//
// 72c29c2371cc9bdb65b779b8e8d37b29ecc154aa56a8799fae2f498f76ed92f2e95fe9508b4612f2
// 72C29C2371CC9BDB65B779B8E8D37B29ECC154AA56A8799FAE2F498F76ED92F
// 72c29c2371cc9bdb65b779b8e8d37b29ecc154aa56a8799fae2f498f76ed92f2e95fe9508b4612f2

      // String key = 'AB94FDECF2674FDFB9B391F85D7F76F2'; // 8-byte
      // String message =
      //     '781723860C06C2264608F919887022120B795240CB7049B01C19B33E32804F0B';
      // List<int> encrypted;
      // List<int> decrypted;
      // List<int> iv = [0, 0, 0, 0, 0, 0, 0, 0];
      // // List<int> iv = [1, 2, 3, 4, 5, 6, 7, 8];

      // print('key: $key');
      // print('message: $message');

      // var K_ENC =
      //     'AB94FDECF2674FDFB9B391F85D7F76F2'; // Taking first 24 bytes kenc
      var key = kaENC;
      var message = hex.decode(S);
      // hex.decode(
      //     '781723860C06C2264608F919887022120B795240CB7049B01C19B33E32804F0B'); //s
      var iv = Uint8List(8); // initializing with 8 bytes of 0x00

      DES3 des3 = DES3(key: key, mode: DESMode.CBC, iv: iv);
      var encrypted = des3.encrypt(message);
      var encryptedHex = hex.encode(encrypted);
      var withoutLastBlock =
          encryptedHex.substring(0, encryptedHex.length - 16);

      // print('with enc Encrypted: ${hex.encode(encrypted)}');
      // print('encryptedHex: ${encryptedHex}');
      // print('with enc Encrypted: ${withoutLastBlock}');
      var E_IFD = withoutLastBlock;

      // var K_MAC =
      //     '7962D9ECE03D1ACD4C76089DCE131543'; // Taking first 24 bytes KMAC

      // Calculate MAC
      String mac = calculateMAC(E_IFD, hex.encode(kaMAC));

      // Print the calculated MAC
      print('MACccccccccc: $mac');
      print('E_IFD: $E_IFD');
      print('mac: $mac');

      var cmd_data = E_IFD + mac;
      print('cmd_data: $cmd_data');
      var mutualAuthCommand = "0082000028" + cmd_data + "28";
      print("Mutual Auth COMMAND: $mutualAuthCommand");
      ////after this it gives 6axx or similar like the doc
      ///https://studylib.net/doc/25524005/pki-for-mrtd-icc-read-only-1.1
      var mutualAuthResponse =
          await FlutterNfcKit.transceive(mutualAuthCommand);
      print("Mutual Auth Response: $mutualAuthResponse");

      var readDg1Command = "00B00101"; // APDU command to read DG1
      var dg1Response = await FlutterNfcKit.transceive(readDg1Command);
      print("DG1 Response: $dg1Response");

      var bytes =
          utf8.encode(MRZ_information); // Convert the String data to bytes
      var MRZ_information_sha1 =
          sha1.convert(bytes); // Calculate the SHA-1 digest as a hex string

      // 1_nfcData += "\n MRZ_information_sha1: $MRZ_information_sha1";

      String bacString = documentNumber + dateOfBirth + expiryDate;
      var bacKeySeed = utf8.encode(bacString);

      // Deriving BAC keys using SHA-1 hash
      var bacKey = sha1.convert(bacKeySeed);

      // Print the derived BAC key
      print('BAC Key: $bacKey');
      // 1_nfcData += "\nBAC Key: $bacKey";

      // Send a GET CHALLENGE command to the chip to receive a random challenge
      // 1var getChallengeCommand = "0084000008";
      // // var challengeResponse =
      // //     await FlutterNfcKit.transceive(getChallengeCommand);
      // // _nfcData += "challenge response: $challengeResponse";
      // // _nfcData += "\n";
      // // var hmac = Hmac(sha1, bacKey.bytes); // Using crypto's Hmac
      // // var checksum = hmac.convert(challengeResponse);

      // // print('Checksum: $checksum');
      // var challengeResponseBytes =
      //     await FlutterNfcKit.transceive(getChallengeCommand);
      // var challengeResponse =
      //     hex.encode(challengeResponseBytes); // Converted to hex string

      // // Computing cryptographic checksum using HMAC
      // var hmac = Hmac(sha1, bacKey.bytes); // Using crypto's Hmac
      // var checksum =
      //     hmac.convert(challengeResponseBytes); // Passing List<int> type

      // print('Checksum: $checksum');
      // 1var challengeResponse =await FlutterNfcKit.transceive(getChallengeCommand);

      // TODO: Compute the cryptographic checksum using HMAC and the derived BAC keys
      // var hmac = Hmac(sha1, bacKey.bytes);
      // var checksum = hmac.convert(challengeResponse);
      // TODO: Compute the cryptographic checksum of the random challenge using the derived keys
      // This would involve implementing cryptographic functions for this specific step

      // TODO: Send MUTUAL AUTHENTICATE command with the computed checksum
      // var mutualAuthCommand = "0084000028"; // Placeholder
      // var mutualAuthResponse =
      //     await FlutterNfcKit.transceive(mutualAuthCommand);
      // 1_nfcData += "\challenge response: $challengeResponse";

      // TODO: Compute the cryptographic checksum using HMAC and the derived BAC keys
      // This is a placeholder, replace with your actual HMAC computation method
      // You will use the derived BAC keys, the challenge response, and the MRZ information
      // var checksum = "placeholder-checksum-based-on-challenge-and-bac-keys";
      // var encryptedChallenge = encryptChallenge(challengeResponse, bacKey);
      // RANI HNA khessni njib hadik data li fi wesst mutual auth command
      // var mutualAuthCommand = "008200000028" + encryptedChallenge + "28";
      // var mutualAuthCommand = "0084000008";

      // var mutualAuthResponse =
      //     await FlutterNfcKit.transceive(mutualAuthCommand);
      // Send MUTUAL AUTHENTICATE command with the computed checksum
      // Concatenating the checksum with the command, replace this with your actual implementation
      // var mutualAuthCommand = "0084000008";
      // var mutualAuthResponse =
      //     await FlutterNfcKit.transceive(mutualAuthCommand);
      // 1_nfcData += "\n cccccccccccccccc: $mutualAuthResponse";

      // Print the mutual authentication response
      // print("Mutual Auth Response: $mutualAuthResponse");

      // TODO: Implement the logic to establish secure messaging using the session keys derived from BAC
      var secureMessagingEstablished = true; // Placeholder

      if (secureMessagingEstablished) {
        // Read specific Data Groups (DG) under secure messaging
        List<String> dataGroups = ["01", "02", "07", "11", "12", "15"];

        for (var dg in dataGroups) {
          // Placeholder: APDU command to read specific data group using secure messaging
          var readDGCommand =
              "00B0${dg}0000"; // Placeholder, adapt this APDU command
          // "00B08F0000"; // Placeholder, adapt this APDU command

          // _nfcData += "\nDG${dg} Data: $readDGCommand";

          var dgDataResponse = await FlutterNfcKit.transceive(readDGCommand);

          // Print the data read from the specific data group
          print("DG${dg} Data: $dgDataResponse");

          // _nfcData += "\nDG${dg} Data: $dgDataResponse";
        }
      } else {
        _nfcData += "\nFailed to establish secure messaging.";
      }

      setState(() {
        _nfcData += "\nComplete.";
      });
    } catch (e) {
      print("Error reading NFC: $e");
      setState(() {
        _nfcData = "Error: $e";
      });
    }
  }

  String calculateMAC(String eIfd, String kMacHex) {
    // Decode the KMAC and E_IFD from hex to bytes
    var kMac = Uint8List.fromList(hex.decode(kMacHex));
    var eIfdBytes = Uint8List.fromList(hex.decode(eIfd));

    // Split the 16 byte MAC key into two keys
    var key1 = kMac.sublist(0, 8);
    var key2 = kMac.sublist(8, 16);

    // Pad the data with Padding Method 2 (Bit Padding)
    var out = BytesBuilder();
    out.add(eIfdBytes);
    out.add([0x80]);
    while (out.length % 8 != 0) {
      out.add([0x00]);
    }
    var eIfdPadded = Uint8List.fromList(out.toBytes());

    // Create DES cipher with the keys
    var des1 = DES(key: key1, mode: DESMode.CBC, iv: Uint8List(8));
    var des2 = DES(key: key2, mode: DESMode.CBC, iv: Uint8List(8));

    // MAC Algorithm 3
    // Initial Transformation 1
    var h1 = des1.encrypt(eIfdPadded.sublist(0, 8));

    // Iteration on the rest of blocks
    var int2 = Uint8List(8);
    for (var i = 0; i < 8; i++) {
      int2[i] = h1[i] ^ eIfdPadded.sublist(8, 16)[i];
    }
    var h2 = des1.encrypt(int2);

    var int3 = Uint8List(8);
    for (var i = 0; i < 8; i++) {
      int3[i] = h2[i] ^ eIfdPadded.sublist(16, 24)[i];
    }
    var h3 = des1.encrypt(int3);

    var int4 = Uint8List(8);
    for (var i = 0; i < 8; i++) {
      int4[i] = h3[i] ^ eIfdPadded.sublist(24, 32)[i];
    }
    var h4 = des1.encrypt(int4);

    var int5 = Uint8List(8);
    for (var i = 0; i < 8; i++) {
      int5[i] = h4[i] ^ eIfdPadded.sublist(32, 40)[i];
    }
    var h5 = des1.encrypt(int5);

    // Output Transformation 3
    var h5Decrypt = des2.decrypt(h5);
    var macFull = des1.encrypt(h5Decrypt);

    // Take only the first 8 bytes of the MAC
    var mac = macFull.sublist(0, 8);

    // Convert the MAC to hex
    var macHex = hex.encode(mac).toUpperCase();

    return macHex;
  }

  List<int> adjustParity(List<int> key) {
    for (int i = 0; i < key.length; i++) {
      int b = key[i];
      bool needsParity = (((b >> 7) ^
                  (b >> 6) ^
                  (b >> 5) ^
                  (b >> 4) ^
                  (b >> 3) ^
                  (b >> 2) ^
                  (b >> 1)) &
              0x01) ==
          0;
      key[i] = needsParity ? (b | 0x01) : (b & 0xFE);
    }
    return key;
  }

  String encrypt3DES(String plaintext, String key) {
    // Convert key and plaintext into List<int>
    var keyBytes =
        utf8.encode(key); // Or use HEX decoding if your key is in HEX format
    var plaintextBytes = utf8.encode(plaintext);

    // Create a 3DES (Triple DES) cipher object with the key and specific mode of operation
    var des3 = DES3(
        key: keyBytes,
        mode: DESMode.ECB); // ECB mode; you can use CBC as well if required

    // Encrypt the bytes. The result is stored in encryptedBytes
    var encryptedBytes = des3.encrypt(plaintextBytes);

    // Convert encrypted bytes to Base64 or HEX string as required
    var encryptedString = base64.encode(encryptedBytes); // or use HEX encoding

    return encryptedString;
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
