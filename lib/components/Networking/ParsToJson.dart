
import 'dart:convert';

getjson(name,description){
  return json.encode({
    "name" :name,
    "description":description
  });
}