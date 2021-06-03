import 'package:flutter/material.dart';
import 'package:laundry_concept/clothes.dart';
import 'package:laundry_concept/model/list.dart';
import 'package:laundry_concept/payment.dart';

class Detailes extends StatefulWidget {
  const Detailes({Key key}) : super(key: key);

  @override
  _DetailesState createState() => _DetailesState();
}

class _DetailesState extends State<Detailes> {
  List<Widget> clothes = [];
  double total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 4 / 7,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff40dedf), Color(0xff0fb2ea)],
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.7),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 20,
            child: Text(
              "Categories",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Positioned(
            top: 135,
            left: 20,
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryData.length,
                itemBuilder: (context, index) {
                  bool isSelected = false;
                  if (index == 0) {
                    isSelected = true;
                  }
                  return Row(
                    children: <Widget>[
                      GestureDetector(
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 68,
                              height: 68,
                              decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                  boxShadow: isSelected
                                      ? [
                                          BoxShadow(
                                              color: Color(0x14000000),
                                              blurRadius: 10)
                                        ]
                                      : null),
                              child: Center(
                                child:
                                    Image.asset(categoryData[index].imageUrl),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              categoryData[index].name,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                        onTap: () {
                          onCategoryClick(categoryData[index].name);
                        },
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 240,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GridView.count(
              crossAxisCount: 2,
              children: clothes,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.7),
                  Colors.blue.withOpacity(0.6)
                ],
              )),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 3),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total: Kshs $total"),
                  ElevatedButton.icon(
                      onPressed: () {
                        makePayment();
                      },
                      icon: Icon(Icons.chevron_right),
                      label: Text("Pay"))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void onCategoryClick(String name) {
    var clothes;
    switch (name) {
      case "TOPS":
        clothes = tops(this.increamentTotal, this.decreamentTotal);
        break;
      case "BOTTOMS":
        clothes = bottoms(this.increamentTotal, this.decreamentTotal);
        break;
      case "DRESSES":
        clothes = dresses(this.increamentTotal, this.decreamentTotal);
        break;
      case "COATS":
        clothes = coats(this.increamentTotal, this.decreamentTotal);
        break;
      case "SUITS":
        clothes = suits(this.increamentTotal, this.decreamentTotal);
        break;
      default:
        clothes = allClothes(this.increamentTotal, this.decreamentTotal);
    }

    setState(() {
      this.clothes = clothes;
    });
  }

  void increamentTotal(double magnitude) {
    setState(() {
      this.total += magnitude;
      print("up total ${this.total}");
    });
  }

  void decreamentTotal(double magnitude) {
    setState(() {
      this.total -= magnitude;
      print("down total ${this.total}");
    });
  }

  makePayment() {
    showDialog(
        context: context,
        builder: (context) => Payment(
              amount: this.total,
            ));
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      this.clothes = allClothes(increamentTotal, decreamentTotal);
    });
  }
}
