import 'dart:convert';

import 'package:flutterfooddelivery/src/models/food_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class FoodModel extends Model
{
  List<Food> _foods = [];

  List<Food> get foods
  {
    return List.from(_foods);
  }

  void addFood(Food food) async
  {
    //_foods.add(food);
    final Map<String, dynamic> foodData = {
      "title" : food.name,
      "description" : food.description,
      "category" : food.category,
      "price" : food.price,
      "discount" : food.discount,
    };
    final http.Response response = await http.post("https://foodie-feddb.firebaseio.com/foods.json", body: json.encode(foodData));

    final Map<String, dynamic> responseData = json.decode(response.body);

    Food foodWithID = Food(
      id: responseData["name"],
      name: food.name,
      category: food.category,
      description: food.description,
      price: food.price,
      discount: food.discount,
    );

    //print(response);

    _foods.add(foodWithID);

    print(foods[0].name);
  }

  void fetchFood()
  {
    http.get("https://foodie-feddb.firebaseio.com/foods.json")
        .then((http.Response response){
      final List fetchedData = json.decode(response.body);
      //final List<Food> fetchedFoodItems = [];
      //print(fetchedData);
      /*fetchedData.forEach((data) {
        Food food = Food(
          id: data["id"],
          category: data["category_id"],
          name: data["title"],
          price: double.parse(data["price"]),
          discount: double.parse(data["discount"]),
          imagePath: data["image_path"],
          //ratings: double.parse(data["ratings"]),
        );

        fetchedFoodItems.add(food);
      });

      _foods = fetchedFoodItems;
      print(_foods[0]);*/
    });
  }
}