import 'package:flutter/material.dart';
import 'package:laundry_concept/custom_card.dart';

List<Widget> tops(
    void Function(double) upTotal, void Function(double) downTotal) {
  return [
    CustomCard(
        upTotal: upTotal,
        downTotal: downTotal,
        imageUrl: "tshirt.png",
        item: "T-shirt",
        price: 30,
        count: 5),
    CustomCard(
        upTotal: upTotal,
        downTotal: downTotal,
        imageUrl: "shirt.png",
        item: "Shirt",
        price: 10,
        count: 5),
    CustomCard(
        upTotal: upTotal,
        downTotal: downTotal,
        imageUrl: "blouse.png",
        item: "Blouse",
        price: 30,
        count: 5),
    CustomCard(
        upTotal: upTotal,
        downTotal: downTotal,
        imageUrl: "hoodie.png",
        item: "Crop Top",
        price: 50,
        count: 5)
  ];
}

List<Widget> bottoms(
    void Function(double) upTotal, void Function(double) downTotal) {
  return [
    CustomCard(
        upTotal: upTotal,
        downTotal: downTotal,
        imageUrl: "tshirt.png",
        item: "Trouser",
        price: 30,
        count: 5),
    CustomCard(
        upTotal: upTotal,
        downTotal: downTotal,
        imageUrl: "shirt.png",
        item: "Jeans",
        price: 10,
        count: 5),
    CustomCard(
        upTotal: upTotal,
        downTotal: downTotal,
        imageUrl: "blouse.png",
        item: "SweatPants",
        price: 30,
        count: 5),
    CustomCard(
        upTotal: upTotal,
        downTotal: downTotal,
        imageUrl: "hoodie.png",
        item: "Palazo",
        price: 50,
        count: 5)
  ];
}

List<Widget> dresses(
    void Function(double) upTotal, void Function(double) downTotal) {
  return [
    CustomCard(
        upTotal: upTotal,
        downTotal: downTotal,
        imageUrl: "tshirt.png",
        item: "Sundress",
        price: 30,
        count: 5),
    CustomCard(
        upTotal: upTotal,
        downTotal: downTotal,
        imageUrl: "shirt.png",
        item: "Woven dress",
        price: 10,
        count: 5),
    CustomCard(
        upTotal: upTotal,
        downTotal: downTotal,
        imageUrl: "blouse.png",
        item: "Other",
        price: 30,
        count: 5),
  ];
}

List<Widget> coats(
    void Function(double) upTotal, void Function(double) downTotal) {
  return [
    CustomCard(
        upTotal: upTotal,
        downTotal: downTotal,
        imageUrl: "tshirt.png",
        item: "Trench coat",
        price: 30,
        count: 5),
    CustomCard(
        upTotal: upTotal,
        downTotal: downTotal,
        imageUrl: "shirt.png",
        item: "Blazer",
        price: 10,
        count: 5),
    CustomCard(
        upTotal: upTotal,
        downTotal: downTotal,
        imageUrl: "blouse.png",
        item: "Raincoat",
        price: 30,
        count: 5),
    CustomCard(
        upTotal: upTotal,
        downTotal: downTotal,
        imageUrl: "hoodie.png",
        item: "Other",
        price: 50,
        count: 5)
  ];
}

List<Widget> suits(
    void Function(double) upTotal, void Function(double) downTotal) {
  return [
    CustomCard(
        upTotal: upTotal,
        downTotal: downTotal,
        imageUrl: "tshirt.png",
        item: "Full Suit",
        price: 30,
        count: 5),
    CustomCard(
        upTotal: upTotal,
        downTotal: downTotal,
        imageUrl: "hoodie.png",
        item: "Partial Suit Top",
        price: 50,
        count: 5)
  ];
}

List<Widget> allClothes(
    void Function(double) upTotal, void Function(double) downTotal) {
  List<Widget> all = [];
  all.addAll(tops(upTotal, downTotal));
  all.addAll(bottoms(upTotal, downTotal));
  all.addAll(suits(upTotal, downTotal));
  all.addAll(dresses(upTotal, downTotal));
  all.addAll(coats(upTotal, downTotal));

  return all;
}
