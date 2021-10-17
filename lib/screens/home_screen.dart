import 'package:flutter/material.dart';
import 'package:quran_app/screens/view_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _surahNoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _surahNoController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Surah Number";
                      }
                      final vNo = int.tryParse(val);
                      if (vNo == null) {
                        return "Only type Surah Number";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Enter surah number",
                      hintText: "1-114",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final vNo = int.parse(_surahNoController.text);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ViewScreen(
                              surahNumber: vNo,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text("Open Surah"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
