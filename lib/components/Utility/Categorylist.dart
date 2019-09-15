import 'package:art_man/components/Networking/FetchCategories.dart';
import 'package:art_man/components/Texts/Strings.dart';


getCategories()async{
Strings strings=new Strings();
  Categories categys= await fetchCategories("${strings.baseurl}/admin/getCategories");


    for(int i=0;i<32;i++){
      if(i!=18) {
        Group equipmente = new Group();
        equipmente.fa = categys.equipment[i].fa;
        equipmente.en = categys.equipment[i].en;
        equipmente.id = categys.equipment[i].id;
        tools.add(equipmente);
      }
    }
    for(int i=0;i<3;i++){
      Group musclee=new Group();
      musclee.fa=categys.exercise[i].fa;
      musclee.en=categys.exercise[i].en;
      musclee.id=categys.exercise[i].id;
      feilds.add(musclee);
    }
    for(int i=0;i<14;i++){
      Group musclee=new Group();
      musclee.fa=categys.muscles[i].fa;
      musclee.en=categys.muscles[i].en;
      musclee.id=categys.muscles[i].id;
      muscles.add(musclee);

    }

complateloadcategory=true;
}



List<Group> feilds= new List();

List<Group> muscles=new List();

List<Group> tools=new List();

String fieldid,muscleid,toolid,state="fields";
bool complateloadcategory=false;
class Group{
  String fa;
  String en;
  int id;
}