import 'package:ejericio_formacion/common/datasources/api/models/Person.dart';
import 'package:ejericio_formacion/common/datasources/database/db_service.dart';
import 'package:ejericio_formacion/features/people_list/people_list_page.dart';
import 'package:flutter/material.dart';


class Body2 extends StatefulWidget {
  const Body2({
    Key key,
  }) : super(key: key);

  @override
  _Body2State createState() => _Body2State();
}

class _Body2State extends State<Body2> {
  List<PersonRepo> favouritePeople = [];
  @override
  void initState() { 
    super.initState();
    DBService.db.getPeople().then((value) => setState(() => favouritePeople = value ?? []));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[200],
      child: Padding(
        padding: const EdgeInsets.only(left:15.0,top:15,right: 15),
        child: 
        (favouritePeople.isEmpty)
          ? Center(child: Text('No hay favoritos'),)
          : ListView.builder(
              itemCount: favouritePeople.length,
              itemBuilder: (BuildContext context, int index) { 
                  return PersonCard(person: favouritePeople[index]);
              },
            ),
      ),
    );
  }
}