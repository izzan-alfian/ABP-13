import 'package:flutter/material.dart';

class Tutorial11_2Page extends StatefulWidget {
  @override
  _Tutorial11_2PageState createState() => _Tutorial11_2PageState();
}

class _Tutorial11_2PageState extends State<Tutorial11_2Page> {
  List<Map<String, dynamic>> dataList = [];

  void _addData(String newData, DateTime selectedDate) {
    setState(() {
      dataList.add({'data': newData, 'date': selectedDate});
    });
  }

  Future<void> _showAddDataDialog(BuildContext context) async {
    String newData = '';
    DateTime selectedDate = DateTime.now();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Data'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  newData = value;
                },
                decoration: InputDecoration(labelText: 'Enter Data'),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  TextButton(
                    onPressed: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      }
                    },
                    child: Text(
                      'Select Date',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Text(selectedDate
                      .toString()
                      .split(' ')[0]), // Show selected date
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _addData(newData, selectedDate);
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Tutorial 11-2'),
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(dataList[index]['data']),
            subtitle: Text(
                '${dataList[index]['date'].day}/${dataList[index]['date'].month}/${dataList[index]['date'].year}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDataDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
