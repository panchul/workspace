# JSON

[http://www.json.org/](http://www.json.org/)

See Also:

  - [APIs](APIs.md)
  - [XML](XML.md)
  - [YAML](YAML.md)
  - [Scala implementation](JSON.md#Scala-implementation)
  - [C++ implementation](JSON.md#C++-implementation)

---

**Contents**

- [Miscellaneous](JSON.md#miscellaneous)

---

## Miscellaneous

---

For JSON pretty-printing, `jsonpp` works fine, can fetch with `brew`.

    $ brew install jsonpp
    $ curl -s 'http://twitter.com/users/coderwall.json' | jsonpp

Another utility:

    $ echo '{"foo": "lorem", "bar": "ipsum"}' | python -m json.tool
    $ curl http://some_api_url/ | python -m json.tool
   
This last one might get crapped up with the `curl`'s progress bar, to keep it silent:
    
    $ curl -s http://some_api_url/ | python -m json.tool

or, if the JSON is in a file, you can do:

    $ python -m json.tool my_json.json

Make it an alias:

    alias prettyjson='python -m json.tool'

---

## Scala implementation

Quick and dirty json formatting, from here:
http://stackoverflow.com/questions/29203069/format-nullable-seq-or-list-of-objects-with-play-json-and-salat

    import play.api.libs.functional.syntax._
    import play.api.libs.json._
    
    case class Tag( id: Int, tag_type:String, name:String,display_name:String)
    case class User( var id: Int, var locations: Seq[Tag] = Seq.empty )
    
    
    object Main extends App  {
    
    implicit val formatTag: Format[Tag] = Json.format[Tag]
    
    implicit val formatUser: Format[User] = (
      (__ \ 'id).format[Int] and
       (__ \ 'locations).formatNullable[Seq[Tag]].inmap[Seq[Tag]](
        o => o.getOrElse(Seq.empty[Tag]),
    // This is for either using empty list ([]), or nothing at all   
    //    s => if (s.isEmpty) None else Some(s)
         s => if (s.isEmpty) Some(Seq.empty) else Some(s)
       )
      )(User.apply, unlift(User.unapply))
    
    println("hi")
    println(s"this is json of User(1) ${Json.toJson(User(1))}")
    println(s"this is json of fancier User: ${Json.toJson(User(1,Seq(Tag(12,"lalal","name","displaynamee"))))}")
    
    println("boom. done.")
    }

---

JSON validation using Scala-base lib on PLAY.
play-json-schema-validator - https://github.com/eclipsesource/play-json-schema-validator
 
Java-based Schema validation, Jackson library 
json-schema-validator - https://github.com/daveclayton/json-schema-validator

---

## C++ implementation

---

My fork of "JSON for Modern C++ https://nlohmann.github.io/json/":
https://github.com/panchul/json

```
#include <iostream>
#include <iomanip>
#include <nlohmann/json.hpp>

using json = nlohmann::json;

int main()
{
    // create a JSON object
    json j =
    {
        {"pi", 3.141},
        {"happy", true},
        {"name", "Niels"},
        {"nothing", nullptr},
        {
            "answer", {
                {"everything", 42}
            }
        },
        {"list", {1, 0, 2}},
        {
            "object", {
                {"currency", "USD"},
                {"value", 42.99}
            }
        }
    };

    json j_documentR = R"({
        "a": "b",
        "c": {
            "d": "e",
            "f": "g"
            }
    })"_json;

    json j_document = "{\
        \"a\": 123,\
        \"c\": {\
            \"d\": \"e\",\
            \"f\": \"g\"\
        },\
        \"list\": [1, 0, 2] \
    }"_json;


    // add new values
    j["new"]["key"]["value"] = { "another", "list" };

    // count elements
    auto s = j.size();
    j["size"] = s;

    // pretty print with indent of 4 spaces
    std::cout << std::setw(4) << j << '\n';

    int number = j["answer"]["everything"].get<int>();

    std::cout << "j[\"answer\"][\"everything\"].get<int>() is " << number << "\n";

    std::string mydump = j.dump(4);

    std::cout << "mydump: " << mydump << "\n";
}
```

---

To properly define json object from a string:

    std::string mystring="{\"myarray_of_strings\":[\"a\",\"b\"]};
    json myjson;
    std::vector<std::string> myvector;
    std::stringstream(mystring) >> myjson;
    myjson["myarray_of_strings"].get_to(myvector);

---

---

C# Json library (One of many, it is better to use the standard, System.Text.Json)

https://docs.microsoft.com/en-us/dotnet/standard/serialization/system-text-json-how-to?pivots=dotnet-6-0

Part from it, basic serialization:

```
using System.Text.Json;

namespace SerializeBasic
{
    public class WeatherForecast
    {
        public DateTimeOffset Date { get; set; }
        public int TemperatureCelsius { get; set; }
        public string? Summary { get; set; }
    }

    public class Program
    {
        public static void Main()
        {
            var weatherForecast = new WeatherForecast
            {
                Date = DateTime.Parse("2019-08-01"),
                TemperatureCelsius = 25,
                Summary = "Hot"
            };

            string jsonString = JsonSerializer.Serialize(weatherForecast);

            Console.WriteLine(jsonString);
        }
    }
}
// output:
//{"Date":"2019-08-01T00:00:00-07:00","TemperatureCelsius":25,"Summary":"Hot"}
```

---