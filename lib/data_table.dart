
import 'package:charts_project/chart_page.dart';
import 'package:flutter/material.dart';
List<Students> students = [
  Students(name: "Andrey", age: 22, score: 10),
  Students(name: "Sasha", age: 21, score: 8),
  Students(name: "Pasha", age: 19, score: 6),
  Students(name: "Igor", age: 23, score: 4),
  Students(name: "Jena", age: 22, score: 5),
  Students(name: "Jon", age: 20, score: 2),
];

class DataTables extends StatelessWidget {
  DataTables({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Info Students"),
      ),
      body: Column(
        children: [
          DataTable(
            headingRowColor: MaterialStateProperty.all(Colors.grey),
            columns: const <DataColumn>[
              DataColumn(
                  label: Expanded(
                child: Text(
                  "Name",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              )),
              DataColumn(
                  label: Expanded(
                child: Text(
                  "age",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              )),
              DataColumn(
                  label: Expanded(
                child: Text(
                  "score",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              )),
            ],
            rows: List.generate(
                students.length,
                (index) => DataRow(
                    cells: <DataCell>[
                      DataCell(Text(students[index].name)),
                      DataCell(Text(students[index].age.toString())),
                      DataCell(Text(students[index].score.toString())),
                    ])),

          ),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (newContext) =>  ChartPage(students: students,)));
          }, child: const Text("Statistic charts"))
        ],
      ),
    );
  }
}






class Students {
  Students({
    required this.name,
    required this.age,
    required this.score,
  });

  final String name;
  final int age;
  final double score;
}
