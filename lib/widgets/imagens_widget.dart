import 'package:flutter/material.dart';

class ImagensWidget extends FormField<List> {
  ImagensWidget({
    FormFieldSetter<List> onSaved,
    FormFieldValidator<List> validator,
    List initialValue,
    AutovalidateMode autovalidateMode,
  }) : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidateMode: AutovalidateMode.disabled,
            builder: (state) {
              return Column(children: <Widget>[
                Container(
                  height: 130,
                  padding: EdgeInsets.only(top: 18, bottom: 8),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: state.value.map((e){
                      return Container()
                    }).toList(),
                  ),
                ),
              ]);
            });
}
