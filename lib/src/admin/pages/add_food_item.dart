import 'package:flutter/material.dart';
import 'package:flutterfooddelivery/src/models/food_model.dart';
import 'package:flutterfooddelivery/src/scoped_model/main_model.dart';
import 'package:flutterfooddelivery/src/widgets/button.dart';
import 'package:scoped_model/scoped_model.dart';

class AddFoodItem extends StatefulWidget {
  @override
  _AddFoodItemState createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {

  String title;
  String category;
  String description;
  String price;
  String discount;

  GlobalKey<FormState> _foodItemFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 16.0),
          /*width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,*/
          child: Form(
            key: _foodItemFormKey,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 170.0,
                  margin: EdgeInsets.only(bottom: 15.0),
                  decoration: BoxDecoration(
                    //color: Colors.red,
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage("assets/images/noimage.png"),
                    )
                  ),
                ),
                _buildTextFormField("Food Title"),
                _buildTextFormField("Category"),
                _buildTextFormField("Description", maxLines: 5),
                _buildTextFormField("Price"),
                _buildTextFormField("Discount"),
                SizedBox(height: 35,),
                ScopedModelDescendant(
                  builder: (BuildContext context, Widget child, MainModel model){
                    return GestureDetector(
                        onTap: (){
                          if(_foodItemFormKey.currentState.validate()){
                            _foodItemFormKey.currentState.save();

                            final Food food = Food(
                              name: title,
                              category: category,
                              description: description,
                              price: double.parse(price),
                              discount: double.parse(discount),
                            );
                            model.addFood(food);
                          }
                        },
                        child: Button(btnText: "Add Food Item",)
                    );
                  } ,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String hint, {int maxLines = 1})
  {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "$hint",
      ),
      maxLines: maxLines,
      keyboardType: hint=="Price" || hint=="Discount" ? TextInputType.number : TextInputType.text,
      // ignore: missing_return
      validator: (String value){
        //var errorMsg = "";

        if(value.isEmpty && hint=="Food Title"){
          return"The food title is required";
        }
        if(value.isEmpty && hint=="Description"){
          return "The description is required";
        }
        if(value.isEmpty && hint=="Category"){
          return "The category is required";
        }
        if(value.isEmpty && hint=="Price"){
          return "The price is required";
        }

        //return errorMsg;
      },
      onChanged: (String value){
        if(hint == "Food Title")
        {
          title = value;
        }
        if(hint == "Category")
        {
          category = value;
        }
        if(hint == "Description")
        {
          description = value;
        }
        if(hint == "Price")
        {
          price = value;
        }
        if(hint == "Discount")
        {
          discount = value;
        }
      },
    );
  }

}
