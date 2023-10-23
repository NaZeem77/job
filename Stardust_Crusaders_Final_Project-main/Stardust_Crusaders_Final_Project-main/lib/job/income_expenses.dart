import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:csv/csv.dart';
import 'package:url_launcher/url_launcher.dart';

class IncomeExpensesPage extends StatefulWidget {
  const IncomeExpensesPage({super.key});

  @override
  State<IncomeExpensesPage> createState() => IncomeExpensesPageState();
}



class IncomeExpensesPageState extends State<IncomeExpensesPage> {

  // Uma musume
  List<String> test = [
    'silence suzuka',
    'nice nature',
    "agnes tachyon",
  ];

  late List<List<dynamic>> data;
  List<String> cities = [];

  List<dynamic> cityData = [];
  List<dynamic> cityData2 = [];
  List<dynamic> cityData3= [];
  List<dynamic> relocationData = [];

  String dropdownValueSalary = '';
  String dropdownValueRelocation = '';
  String dropdownValueOther1 = '';
  String dropdownValueOther2 = '';
  String dropdownValueOther3 = '';


  @override
  void initState() {
    loadAsset();
    super.initState();
  }

  // Turns .csv file into a List containing lists
  // e.g.
  //    index 1 = [0	Columbus, OH	117552	108500	51260	13430	192000	Columbus, OH	984.8	1421.5	2856.5	9335.4]
  //    index 2 = [1	Seattle-Tacoma-Bellevue, WA	117323	131167	65400	65760	491600	Seattle, WA	1250.7	2528.2	4091.5	8971.3]

  loadAsset() async {
    final myData = await rootBundle.loadString("assets/data/SofwareDeveloperIncomeExpensesperUSACity.csv");

    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);


    setState(() {
      data = csvTable;
    });
    loadCities();
  }

  // initialize a list of cities that is used for the DropdownMenuItem widget (dropdown selection items)
  // sets the default value of the dropdown box to 'City'
  void loadCities() async {
    for (var i = 0; i < data.length; i++) {
      cities.add(data[i].elementAt(7));
     print(data.length);
    }

    dropdownValueSalary = cities.first;
    dropdownValueRelocation = cities.first;
    dropdownValueOther2 = cities.first;
    dropdownValueOther3 = cities.first;

    //print(cities);
    //print(data.length);
  }

  // if the index data (a list of  city information) contains the value (specific city), return the data.
  List<dynamic>? getCityData(value) {
    for (var i = 0; i < data.length; i++) {
      if (data[i].contains(value)) {
        return data[i];
      }
    }
    //print(data);
    return null;
  }


  // -- Widgets that display information once all requirements are met -- \\
  Widget displaySalaryWidget() =>
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            children: [
              if (cityData.length > 2 && dropdownValueSalary != 'City')
                Text(
                  'SALARY INFORMATION',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

              if (cityData.length > 2 && dropdownValueSalary != 'City')
                Text('MSDS (adjusted): ' + cityData[2].toString()),
              if (cityData.length > 2 && dropdownValueSalary != 'City')
                Text('MSDS (unadjusted): ' + cityData[3].toString()),
              if (cityData.length > 2 && dropdownValueSalary != 'City')
                Text('Number of Jobs: ' + cityData[5].toString()),
            ]
        ),
      );

  Widget displayRelocationWidget() =>
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            children: [
              if (cityData.length > 2 && dropdownValueSalary != 'City')
                Text(
                  'RELOCATION COST INFORMATION',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

              if (cityData.length > 2 && dropdownValueSalary != 'City')
                Text('Median Home Price: ' + cityData[6].toString()),
              if (cityData.length > 2 && dropdownValueSalary != 'City')
                Text('Average Cost of Living: ' + cityData[8].toString()),
              if (cityData.length > 2 && dropdownValueSalary != 'City')
                Text('Average Rent Cost: ' + cityData[9].toString()),
              if (cityData.length > 2 && dropdownValueSalary != 'City')
                Text('Cost of Living + Rent: ' + cityData[10].toString()),
              if (cityData.length > 2 && dropdownValueSalary != 'City')
                Text('Average Local Purchasing Power: ' + cityData[11].toString()),
            ]
        ),
      );

  Widget cityWidget1 () =>
    Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (cityData2.length > 2 && dropdownValueOther2 != 'City')
          Text(
            dropdownValueOther2 + ' Information',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

        if (cityData2.length > 2 && dropdownValueOther2 != 'City')
          Text('MSDS (adjusted): ' + cityData2[2].toString(),
            style: TextStyle(fontSize: 12),),
        if (cityData2.length > 2 && dropdownValueOther2 != 'City')
          Text('MSDS (unadjusted): ' + cityData2[3].toString(),
            style: TextStyle(fontSize: 12),),
        if (cityData2.length > 2 && dropdownValueOther2 != 'City')
          Text('Number of Jobs: ' + cityData2[5].toString(),
            style: TextStyle(fontSize: 12),),
        if (cityData2.length > 2 && dropdownValueOther2 != 'City')
          Text('Median Home Price: ' + cityData2[6].toString(),
            style: TextStyle(fontSize: 12),),
        if (cityData2.length > 2 && dropdownValueOther2 != 'City')
          Text('Average Living Costs: ' + cityData2[8].toString(),
            style: TextStyle(fontSize: 12),),
        if (cityData2.length > 2 && dropdownValueOther2 != 'City')
          Text('Average Rent: ' + cityData2[9].toString(),
            style: TextStyle(fontSize: 12),),
        if (cityData2.length > 2 && dropdownValueOther2 != 'City')
          Text('Living Costs + Rent: ' + cityData2[10].toString(),
            style: TextStyle(fontSize: 12),),
        if (cityData2.length > 2 && dropdownValueOther2 != 'City')
          Text('Local Purchasing Power: ' + cityData2[11].toString(),
            style: TextStyle(fontSize: 12),),
      ]
    );

  Widget cityWidget2 () =>
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (cityData3.length > 2 && dropdownValueOther3 != 'City')
          Text(
            dropdownValueOther3 + ' Information',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

        if (cityData3.length > 2 && dropdownValueOther3 != 'City')
          Text('MSDS (adjusted): ' + cityData3[2].toString(),
          style: TextStyle(fontSize: 12),),
        if (cityData3.length > 2 && dropdownValueOther3 != 'City')
          Text('MSDS (unadjusted): ' + cityData3[3].toString(),
            style: TextStyle(fontSize: 12),
          ),
        if (cityData3.length > 2 && dropdownValueOther3 != 'City')
          Text('Number of Jobs: ' + cityData3[5].toString(),
            style: TextStyle(fontSize: 12),),
        if (cityData2.length > 2 && dropdownValueOther3 != 'City')
          Text('Median Home Price: ' + cityData3[6].toString(),
            style: TextStyle(fontSize: 12),),
        if (cityData2.length > 2 && dropdownValueOther3 != 'City')
          Text('Average Living Costs: ' + cityData3[8].toString(),
            style: TextStyle(fontSize: 12),),
        if (cityData2.length > 2 && dropdownValueOther3 != 'City')
          Text('Average Rent: ' + cityData3[9].toString(),
            style: TextStyle(fontSize: 12),),
        if (cityData2.length > 2 && dropdownValueOther3 != 'City')
          Text('Living Costs + Rent: ' + cityData3[10].toString(),
            style: TextStyle(fontSize: 12),),
        if (cityData2.length > 2 && dropdownValueOther3 != 'City')
          Text('Local Purchasing Power: ' + cityData3[11].toString(),
            style: TextStyle(fontSize: 12),),
      ]
    );

  Widget compareWidget () =>
    Padding(
      padding: const EdgeInsets.all(10.0),
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if ((cityData2.length > 2 && dropdownValueOther2 != 'City') &&
              (cityData3.length > 2 && dropdownValueOther3 != 'City'))
              Container(
                alignment: Alignment.topCenter,
                child:
                  Text(
                    'SALARY COMPARISON',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
              ),

          if ((cityData2.length > 2 && dropdownValueOther2 != 'City') &&
              (cityData3.length > 2 && dropdownValueOther3 != 'City'))
            Container(
              alignment: Alignment.center,
              child:
                Text('Difference in MSDW (adjusted): ' + (cityData2[2] - cityData3[2]).toString() )
            ),
          if ((cityData2.length > 2 && dropdownValueOther2 != 'City') &&
              (cityData3.length > 2 && dropdownValueOther3 != 'City'))
              Container(
                alignment: Alignment.center,
                child:
                  Text('Difference in MSDW (unadjusted): ' + (cityData2[3] - cityData3[3]).toString())
              ),
          if ((cityData2.length > 2 && dropdownValueOther2 != 'City') &&
              (cityData3.length > 2 && dropdownValueOther3 != 'City'))
              Container(
                alignment: Alignment.center,
                child:
                  Text('Difference in Number of Jobs: ' + (cityData2[5] - cityData3[5]).toString() )
              ),
        ]
      ),
    );

  Widget compareLiving () =>
      Padding(
        padding: const EdgeInsets.all(10.0),
        child:
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if ((cityData2.length > 2 && dropdownValueOther2 != 'City') &&
                  (cityData3.length > 2 && dropdownValueOther3 != 'City'))
                Container(
                  alignment: Alignment.topCenter,
                  child:
                  Text(
                    'Relocation Estimates from City 1 to City 2\n(Negative numbers means worse )',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold,),
                  ),
                ),

              if ((cityData2.length > 2 && dropdownValueOther2 != 'City') &&
                  (cityData3.length > 2 && dropdownValueOther3 != 'City'))
                Container(
                    alignment: Alignment.center,
                    child:
                    Text('Median Home Price Difference: ' + (cityData2[6] - cityData3[6]).toString() )
                ),
              if ((cityData2.length > 2 && dropdownValueOther2 != 'City') &&
                  (cityData3.length > 2 && dropdownValueOther3 != 'City'))
                Container(
                    alignment: Alignment.center,
                    child:
                    Text('Cost of Living + Rent Difference: ' + (cityData2[10].round() - cityData3[10].round()).toString())
                ),
              if ((cityData2.length > 2 && dropdownValueOther2 != 'City') &&
                  (cityData3.length > 2 && dropdownValueOther3 != 'City'))
                Container(
                    alignment: Alignment.center,
                    child:
                    Text('Total Relocation Estimate: ' +
                        ((cityData2[10] - cityData3[10])
                        + (cityData2[6] - cityData3[6])).toString() )
                ),
            ]
        ),
      );

  Widget compareCompensation () =>
      Padding(
        padding: const EdgeInsets.all(10.0),
        child:
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if ((cityData2.length > 2 && dropdownValueOther2 != 'City') &&
                  (cityData3.length > 2 && dropdownValueOther3 != 'City'))
                Container(
                  alignment: Alignment.topCenter,
                  child:
                  Text(
                    'Estimated Compensation Package Comparison\nfrom City 1 to City 2',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

              if ((cityData2.length > 2 && dropdownValueOther2 != 'City') &&
                  (cityData3.length > 2 && dropdownValueOther3 != 'City'))
                Container(
                    alignment: Alignment.center,
                    child:
                    Text('(Lower numbers are worse): ' +
                        ((cityData2[10] - cityData3[10])
                            + (cityData2[6] - cityData3[6])
                            + (cityData2[2] - cityData3[2])).toString() )
                ),
            ]
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Income and Expenses'),
        actions: [
          IconButton(
              onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Information and Credits'),
                        content:
                              IntrinsicHeight(
                                child:
                                Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text('MSDS = Mean Software Developer Salary (in dollars).'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text('Cost of Relocation = (Cost of Living - Rent) + (Median Home Prices)'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text('Compensation Package = (Cost of Living - Rent) + (Median Home Prices) + (Adjusted MSDS)'),
                                  ),

                                  SizedBox(height: 50),

                                  Text('Data Credits',
                                    style: TextStyle(decoration: TextDecoration.underline),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () => launchUrl(Uri.parse('https://zenodo.org/record/7412091#.ZE6zBezMK3K')),
                                      child: Text(
                                        'Zenodo',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue),
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Text('Song Credits',
                                      style: TextStyle(decoration: TextDecoration.underline,),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () => launchUrl(Uri.parse('https://www.youtube.com/watch?v=GMyP1WrXO30')),
                                      child: Text(
                                        "Tokai Teio Ballin but full version",
                                        style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () => launchUrl(Uri.parse('https://www.youtube.com/watch?v=RrDKoXWKMmY')),
                                      child: Text(
                                        "Don't Stop Me Now",
                                        style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () => launchUrl(Uri.parse('https://www.youtube.com/watch?v=ARhk9K_mviE')),
                                      child: Text(
                                        "The Struts - Could Have Been Me",
                                        style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () => launchUrl(Uri.parse('https://www.youtube.com/watch?v=J91ti_MpdHA')),
                                      child: Text(
                                        "Alicia Keys - Girl on Fire",
                                        style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue),
                                      ),
                                    ),
                                  ),



                                  ],
                                ),
                              ),
                        actions: [
                            TextButton(
                              child: Text('OK'),
                              onPressed: () => Navigator.pop(context),
                            ),
                        ],
                      ),
                    );
              },
              icon: Icon(Icons.info_outlined),
          )
        ],
      ),
      body:

      // -- search for a city in the .csv/list -- \\
      Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0.0,top: 40.0,right: 0.0, bottom: 0.0),
              child: Text(
                  "Select a City below to view its salary & livings costs.",
                  style: TextStyle( decoration: TextDecoration.underline, fontSize: 16),
              ),
            ),
            DropdownButton<String>(
              value: dropdownValueSalary,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                setState(() {
                  dropdownValueSalary = value!;
                  cityData = getCityData(dropdownValueSalary)!;

                  //print(cityData);
                });
              },
              items: cities.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            // -- display # of jobs and mean salary (multiple) -- \\
            displaySalaryWidget(),
            displayRelocationWidget(),


            // -- select two cities to compare information to -- \\
            Padding(
              padding: const EdgeInsets.only(left: 0.0,top: 40.0,right: 0.0, bottom: 10.0),
              child: Text(
                  'Select two cities below to view & compare salaries.',
                style: TextStyle( decoration: TextDecoration.underline, fontSize: 16),
              )
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // City 1 dropdown box
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text(
                          'City 1',
                        ),
                        DropdownButton<String>(
                          value: dropdownValueOther2,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValueOther2 = value!;
                              cityData2 = getCityData(dropdownValueOther2)!;
                            });
                          },
                          items: cities.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        cityWidget1(),
                      ],
                    ),
                  ),

                  // City 2 dropdown box
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text(
                          'City 2',
                        ),
                        DropdownButton<String>(
                          value: dropdownValueOther3,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValueOther3 = value!;
                              cityData3 = getCityData(dropdownValueOther3)!;
                            });
                          },
                          items: cities.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        cityWidget2(),
                      ],
                    ),
                  ),
                ],
              ),


            // -- display calculated information -- \\
            compareWidget(),
            compareCompensation(),
            compareLiving(),

          ],
        ),
      ),
    );
  }
}


