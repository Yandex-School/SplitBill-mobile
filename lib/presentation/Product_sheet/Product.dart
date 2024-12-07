import 'package:skillUpFlutter/Model/sqlite_all_jsondata.dart';
import 'package:skillUpFlutter/views/codeView/code_view_screen.dart';
import 'package:skillUpFlutter/views/widgets/appbar_tool.dart';
import 'package:get/get.dart';
import 'package:skillUpFlutter/Helper/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:skillUpFlutter/Service/dart_syntax.dart';
import 'package:skillUpFlutter/utils/style_screen.dart';
import 'package:skillUpFlutter/utils/screen_size.dart';

class SQLiteDatabase extends StatefulWidget {
  @override
  _SQLiteDatabaseState createState() => _SQLiteDatabaseState();
}

class _SQLiteDatabaseState extends State<SQLiteDatabase> {
  Future<List<Student>>? _student;
  String? name; int? userId;
  double? price;
  TextEditingController _name = new TextEditingController();
  TextEditingController _priceController = new TextEditingController();
  String? checkname="";
  bool _namevalid = true;
  bool? _updated;
  _namevalidation(String val){
    _namevalid = RegExp("^[a-zA-Z]{3,}").hasMatch(val);
  }
  // TextField Controller Value to clean Method
  _clearvalue(){
    _name.clear();
    _priceController.clear();
  }
  var dbHelper;
  @override
  void initState() {
    super.initState();
    dbHelper = Helper();
    _updated = false;
    refreshList();
  }
  @override
  void dispose(){
    super.dispose();
    dbHelper.close();
  }
  // Get All Data In Student Table
  refreshList(){
    setState(() {
      _student = dbHelper.getStudent();
    });
  }
  // Form Data Validation And Insert Or Update Button
  validate(){
    if(_updated!){
      print(userId); print(name);
      name = _name.text;
      price = double.tryParse(_priceController.text);
      Student s = Student(userId,name);
      dbHelper.update(s);
      setState(() {
        _updated = false;
        refreshList();
      });
    }else{
      _name.text.trimLeft().isEmpty ? _namevalid = false : _name.text.length >= 3 ? _namevalid = true : _namevalid = false;
      if(_namevalid == true){
        name =  _name.text;
        price = double.tryParse(_priceController.text);
        Student s = Student(null,name);
        dbHelper.save(s);
      }
      setState(() {
        refreshList();
      });
    }
  }
  // Student Table All The Data Display In Body.
  SingleChildScrollView dataTable(List<Student> student){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text("ID"),
            ),
            DataColumn(
              label: Text("Название"),
            ),
            DataColumn(
              label: Text("Цена"),
            ),
            DataColumn(
              label: Text("Изменить"),
            ),
            DataColumn(
              label: Text("Удалить"),
            ),
          ],
          rows: student.map((stud)=>DataRow(
              cells: [
                DataCell(
                    Text(stud.id!.toString())
                ),
                DataCell(
                    Text(stud.name!.toString())
                ),
                DataCell(
                    Text(stud.price!.toString()?? "-"),
                ),
                DataCell(
                  IconButton(
                    icon: Icon(CupertinoIcons.create),
                    onPressed: (){
                      setState(() {
                        _name.text = stud.name!;
                        userId = stud.id;
                        _priceController.text =
                        _updated = true;
                      });
                    },
                  ),
                ),
                DataCell(
                  IconButton(
                    icon: Icon(CupertinoIcons.delete),
                    onPressed: (){
                      setState(() {
                        dbHelper.delete(stud.id);
                        refreshList();
                      });
                    },
                  ),
                ),
              ]
          )).toList(),
        ),
      ),
    );
  }
  FetchData(){
    return Expanded(
      child: FutureBuilder(
        future: _student,
        builder: (context, dynamic? snapshot){
          if(snapshot.hasData){
            return dataTable(snapshot!.data);
          }
          if(snapshot.data == null || snapshot.data!.length == 0){
            return Text("Данные не найдены");
          }
          return Center(child: LoadingRotating.square(size: 40,borderSize: 2.5,borderColor: Colors.yellow,),);
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTool(
          title: "Лист продуктов",
          left: (){
            setState(() {
              Get.back();
            });
          },
          right: () {
            setState(() {
              String code = ;
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CodeViewScreen("Лист продуктов",code)));
            });
          }
      ),
      backgroundColor: Get.isDarkMode ? TextUtils.darkColor : TextUtils.primaryColor,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextFormField(
              onSaved: (val){
                name = val;
              },
              onChanged: (String value){
                setState(() {
                  _namevalidation(value);
                  checkname=value;
                });
              },
              controller: _name,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: "Название",
                  labelStyle: TextStyle(color: Colors.yellow,fontSize: 12),
                  errorText: _namevalid!=true ? "Пожалуйста, введите действительное имя" : "",
                  border: UnderlineInputBorder(),
                  errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: TextUtils.black,width: 1.5,style: BorderStyle.solid)
                  ),
                  focusedErrorBorder: _namevalid!=true ?
                  UnderlineInputBorder(borderSide: BorderSide(color: TextUtils.red,width: 1.5,style: BorderStyle.solid)):
                  UnderlineInputBorder(borderSide: BorderSide(color: TextUtils.black,width: 1.5,style: BorderStyle.solid))
              ),
              style: TextStyle(
                  color: _namevalid!=true ? TextUtils.red :TextUtils.black,
                  fontSize: 15,fontWeight: FontWeight.w700
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  onPressed: validate,
                  child: Text(_updated! ? "Изменить" : "Добавить"),
                ),
                MaterialButton(
                  onPressed: (){
                    setState(() {
                      _clearvalue();
                    });
                  },
                  child: Text("Отмена"),
                ),
              ],
            ),
            FetchData(),
          ],
        ),
      ),
    );
  }
}