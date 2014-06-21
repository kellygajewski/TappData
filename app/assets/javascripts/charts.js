function drawChart(beers, checkins, users) {
    var ratingScore = beers[beers.length-1]['rating_score'];
    var ratingCount = beers[beers.length-1]['rating_count'];
    var ratingUserScore = checkins[checkins.length-1]['rating_score'];
    var checkinMonth = checkins[checkins.length-1]['created_at'].slice(5,7);
    var userBirthday = users[users.length-1]['user_birthday'].slice(0,4);
    var beerStyle = beers[0]['beer_style'];
    var d = new Date();
    var userAge = d.getFullYear() - userBirthday;
    var ipa = 0;
    var light = 0;
    var porter = 0;
    var wheat = 0;
    var stout = 0;
    for (i=0; i < beers.length; i++) {
      if (beers[i]['beer_style'] === "IPA") {
        ipa++;
      }
      else if (beers[i]['beer_style'] === "American Light") {
        light++;
      }
      else if (beers[i]['beer_style'] === "Porter") {
        porter++;
      }
      else if (beers[i]['beer_style'] === "Wheat") {
        wheat++;
      }
      else if (beers[i]['beer_style'] === "Stout") {
        stout++;
      }
    }
  console.log(beers[beers.length-1]['rating_count']);
  console.log(beerStyle);

    var div = document.createElement("div");
    div.innerHTML = "Hello, world!";
    document.body.appendChild(div);

    var body = d3.select("body");
    var div = body.append("div");
    div.html("Hello, world!");

    d3.select("body")
        .style("color", "black")
        .style("background-color", "rgba(25, 80, 10, .5)"); 
    var ratingScore = beers[beers.length-1]['rating_score'];
      var data = [ipa, light, porter, wheat, stout];
  var x = d3.scale.linear()
      .domain([0, d3.max(data)])
      .range([0, 600]);

  d3.select(".chart")
    .selectAll("div")
      .data(data)
    .enter().append("div")
      .style("width", function(d) { return x(d) + "px"; })
      .text(function(e) { return e; });
}