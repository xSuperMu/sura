import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sura/themes/constants.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String label;
  final IconData icon;
  //final VoidCallback onPressed;

  const TextFormFieldCustom({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: label,
                    filled: true,
                    fillColor:white,
                     contentPadding: EdgeInsets.all(10),
                    focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: whiteBlue,
                        ),     
              
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: whiteBlue, width: 1.0)
                    ),
                    
                     suffixIcon: IconButton(
                        icon: Icon(icon),
                        color: whiteBlue,
                        //do somthing
                        onPressed: () {}),
                  
              
                    ),
                    
                  ),
                
              ),
                Container( 
                       
                    child: IconButton(
                     icon: Icon(Icons.delete ,
                    color: whiteBlue),
                     onPressed: (){}),),
            ],
          ),
          ),
        );
  }
}
