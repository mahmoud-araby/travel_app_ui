import 'package:travel_app_ui/model/data_with_icon.dart';
import 'package:travel_app_ui/model/title_with_icon.dart';

class TestData {
  /////////////////// category //////////////////////
  static List category = [
    TitleOnly("Hotels", "assets/icons/category/Shape (4).png"),
    TitleOnly("Flights", "assets/icons/category/Shape (3).png"),
    TitleOnly("Trains", "assets/icons/category/Shape (2).png"),
    TitleOnly("Cars", "assets/icons/category/Shape (1).png"),
    TitleOnly("Deals", "assets/icons/category/Shape.png"),
    TitleOnly("Hotels", "assets/icons/category/Shape (4).png"),
    TitleOnly("Flights", "assets/icons/category/Shape (3).png"),
    TitleOnly("Trains", "assets/icons/category/Shape (2).png"),
    TitleOnly("Cars", "assets/icons/category/Shape (1).png"),
    TitleOnly("Deals", "assets/icons/category/Shape.png"),
  ];

  /////////////////// contacts //////////////////////
  static List contacts = [
    TitleOnly("Website", "assets/icons/contacts/icons8-domain.png"),
    TitleOnly("Email", "assets/icons/contacts/icons8-email_sign.png"),
    TitleOnly(
        "Location", "assets/icons/contacts/icons8-worldwide_location.png"),
    TitleOnly("Call", "assets/icons/contacts/icons8-email_sign.png"),
  ];

  /////////////////// popular //////////////////////
  static List popular = [
    TitleOnly("Dubai Museum", "assets/icons/popular/Rectangle Copy 4.png"),
    TitleOnly("Burj Khalifa", "assets/icons/popular/Rectangle Copy 5.png"),
    TitleOnly("Marisolfort", "assets/icons/popular/Rectangle Copy 87.png"),
    TitleOnly("Marisolfort", "assets/icons/popular/Rectangle Copy 87.png"),
    TitleOnly("Marisolfort", "assets/icons/popular/Rectangle Copy 87.png"),
  ];

  /////////////////// data //////////////////////
  static List data = [
    Data("Beatrice Kim", "Invalid Date",
        "assets/icons/places/Rectangle (1).png", 4060, 216),
    Data("Christian Holmes", "Invalid Date",
        "assets/icons/places/Rectangle Copy 11.png", 4060, 216),
    Data("Etta James", "Invalid Date",
        "assets/icons/places/Rectangle Copy 11.png", 4060, 216),
    Data("Etta James", "Invalid Date",
        "assets/icons/places/Rectangle Copy 11.png", 4060, 216),
    Data("Etta James", "Invalid Date",
        "assets/icons/places/Rectangle Copy 11.png", 4060, 216),
  ];
}
