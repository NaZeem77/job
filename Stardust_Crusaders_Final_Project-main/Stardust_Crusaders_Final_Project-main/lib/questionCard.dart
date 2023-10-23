import 'package:stardust_crusaders_final_project/Question.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class QuestionCard extends StatelessWidget {
  final Question question;

  QuestionCard(this.question);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(" ${question.Type}"),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text(question.Entry!, style: Theme.of(context).textTheme.headline6,)),
                  //Spacer(),
                  Text("${DateFormat('MM/dd/yyyy').format(question.Date!).toString()}"),
                ],
              )
            ],
          )
        )
      )
    );
  }
}