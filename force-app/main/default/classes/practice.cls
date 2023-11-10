public class practice {
    public void ListMethod(){
        List<String>  strList= new List<String>();
        strList.add('India');
        strList.add('USA');
        strList.add(1,'Bhutan');
        strList.add('Canada');
        List<String> strList2 = new List<String>();
        strList2.addAll(strList);
        system.debug('StrList2 --> ' +strList2);
    }
}