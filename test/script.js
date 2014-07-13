var shout = function() {
  console.log("Hello World!");
};

shout();(function() {
  var name = "Rawand";
  var age = 21;
  
  var Person = function() {
    this.name = "";
    this.age = 0;
  
    this.setName = function(name) {
      this.name = name;
    };
    
    this.setAge = function(age) {
      this.age = age;
    }
  };
  
  var p = new Person();
  p.setName(name);
  p.setAge(age);
  
})();