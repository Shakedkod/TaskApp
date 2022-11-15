// ignore_for_file: file_names, non_constant_identifier_names

import 'package:mongo_dart/mongo_dart.dart';

const String url = "mongodb+srv://taskApp:<password>@cluster0.hwgznmk.mongodb.net/?retryWrites=true&w=majority";

List<Map> GetData()
{
    final Db db = Db(url);
    final List<Map> data = [];
    db.open().then((_)
    {
        final DbCollection collection = db.collection("tasks");
        collection.find().forEach((Map task) 
        {
            data.add(task);
        });
    });

    print(data);

    return data;
} 

//void SetData(List<Map> data)
//{
//    final Db db = Db(url);
//
//    
//
//    db.open().then((_)
//    {
//        final DbCollection collection = db.collection("tasks");
//        collection.drop();
//        collection.insertAll(data);
//    });
//}