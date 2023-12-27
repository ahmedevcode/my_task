import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:tasks3/home/webview/widget/web_view_body.dart';

class WebUrlInputScreen extends StatefulWidget {
  @override
  _WebUrlInputScreenState createState() => _WebUrlInputScreenState();
}

class _WebUrlInputScreenState extends State<WebUrlInputScreen> {
  TextEditingController _urlController = TextEditingController();
  final _webViewKey = GlobalKey<WebViewContainerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web URL Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _urlController,
              decoration: InputDecoration(
                labelText: 'Enter Web URL',
                hintText: 'https://www.google.com',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to WebViewPage with the provided URL
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebViewPage(url: _urlController.text),
                  ),
                );
              },
              child: Text('Open Web View'),
            ),
          ],
        ),
      ),
    );
  }
}class NetworkDevicesDropdown extends StatefulWidget {
  @override
  _NetworkDevicesDropdownState createState() => _NetworkDevicesDropdownState();
}

class _NetworkDevicesDropdownState extends State<NetworkDevicesDropdown> {
  final FlutterBlue flutterBlue = FlutterBlue.instance;

  List<String> bluetoothDevices = [];
  String selectedBluetoothDevice = '';

  @override
  void initState() {
    super.initState();
    fetchBluetoothDevices();
  }

  Future<void> fetchBluetoothDevices() async {
    try {
      await flutterBlue.startScan(timeout: Duration(seconds: 4));
      flutterBlue.scanResults.listen((results) {
        for (ScanResult r in results) {
          if (!bluetoothDevices.contains(r.device.name)) {
            setState(() {
              bluetoothDevices.add(r.device.name);
            });
          }
        }
      });
    } catch (e) {
      print('Bluetooth scan error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Bluetooth Devices:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          DropdownButton<String>(
            value: selectedBluetoothDevice,
            onChanged: (String? newValue) {
              setState(() {
                selectedBluetoothDevice = newValue!;
              });

            },
            items: bluetoothDevices
                .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ),
            )
                .toList(),
          ),
        ],
      ),
    );
  }
}