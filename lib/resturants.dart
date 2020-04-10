import 'package:flutter/cupertino.dart';

class resturant{
  String imageUrl;
  String title;
  String catagories;
  String address;
  String description;
  int contact;
resturant(
  {
    this.imageUrl,
    this.title,
    this.catagories,
    this.address,
    this.description,
    this.contact

}
    );
int recontact(){
  return (this.contact);
}

}
final List<resturant>  resturants=[
  resturant(
    imageUrl: "images/img.jpg",
    title: "Adarsha Resturant",
    address: "BuddhaNagar New Baneswor Kathmandu",
    catagories: "Lunch",
    description: "nffffffffjsjnvjsbjvvvvvvvvvbsdhshbshisjdskjcjnsc"
        "cddddddddddddddddddddddddddddddddddddddddddddddddcccccccc",
    contact: 9862675219

  ),
  resturant(
      imageUrl: "images/img1.jpg",
      title: "Dami Resturant",
      catagories: "Breakfast",
      address: "BuddhaNagar New Baneswor Kathmandu",
      description: "nffffffffjsjnvjsbjvvvvvvvvvbsdhshbshisjdskjcjn"
          "dccccccccccccccccccccccccccccccccccccccccsc",
    contact: 9823321123

  ),
  resturant(
      imageUrl: "images/img2.jpg",
      title: "Gachha Resturant",
      catagories: "Dinner",
      address: "MaitiGhar Kathmandu",
      description: "nffffffffjsjnvjsbjvvvvvvvvvbsdhs"
          "cdddddddddddddddddddddddddddddddhbshisjdskjcjnsc",
    contact: 9842622896
  )


];
final List<String> labels = [
  'Discover',
  'Categories',
  'Specials',
  'New',
];
final List<String> myList = [
  'images/img3.jpg',
  'images/img4.jpg',
  'images/img7.jpg'

];

final List<String> popular = [
  'images/img5.jpg',
  'images/img6.jpg',
  'images/img8.jpg'
];
