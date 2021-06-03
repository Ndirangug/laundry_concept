import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final int count;

  final String imageUrl;

  final double price;

  final String item;

  final void Function(double) upTotal;

  final void Function(double) downTotal;

  const CustomCard(
      {Key key,
      this.upTotal,
      this.downTotal,
      this.imageUrl,
      this.item,
      this.price,
      this.count})
      : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  int count = 0;
  double amount = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: 160,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.item,
                style: TextStyle(fontSize: 24),
              ),
              Image.asset("assets/page1/" + widget.imageUrl),
              Text("@ Kshs ${widget.price}"),
              Container(
                child: Text("Kshs $amount"),
                margin: EdgeInsets.symmetric(vertical: 5),
              ),
              Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white),
                      child: Text(
                        " - ",
                        style: TextStyle(fontSize: 28, letterSpacing: 3),
                      ),
                    ),
                    onTap: () {
                      decreament();
                    },
                  ),
                  Text("$count"),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white),
                      child: Text(
                        " + ",
                        style: TextStyle(fontSize: 28, letterSpacing: 1),
                      ),
                    ),
                    onTap: () {
                      increament();
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  increament() {
    setState(() {
      this.count++;
      calculateAmount();
    });

    widget.upTotal(widget.price);
  }

  decreament() {
    if (this.count > 0) {
      setState(() {
        this.count--;
        calculateAmount();
      });

      widget.downTotal(widget.price);
    }
  }

  calculateAmount() {
    this.amount = this.count * widget.price;
  }
}
