// brings in all api data in json form to the javascript page
function rawData (beers, checkins, users, breweries) {
  beers = beers;
  checkins = checkins;
  users = users;
  breweries = breweries;
  console.log(breweries);
  chartCalls(beers, checkins, users, breweries);
}
// d3.json("http://guarded-reaches-3146.herokuapp.com/beers.json", function(json) {
//     console.log(json + "jsondata");  //Log output to console
// });

// calls the function of all charts to be displayed. This will allow us to quickly see all charts we have enabled in one place
function chartCalls (beers, checkins, users, breweries) {
  basicBarGraphTwo(beers, checkins, users);
  // beerRatingName(beers);
  // beerRatingNameChart ();
}


// each function contains a different chart with a specific set of data to be combined

function basicBarGraphTwo (beers, checkins, users) {
  var data = [3, 13, 32, 10, 21];
  var width = 420,
      barHeight = 20;

  var x = d3.scale.linear()
      .domain([0, d3.max(data)])
      .range([0, width]);

  var chart = d3.select(".chart")
      .attr("width", width)
      .attr("height", barHeight * data.length);

  var bar = chart.selectAll("g")
      .data(data)
    .enter().append("g")
      .attr("transform", function(d, i) { return "translate(0," + i * barHeight + ")"; });

  bar.append("rect")
      .attr("width", x)
      .attr("height", barHeight - 1);

  bar.append("text")
      .attr("x", function(d) { return x(d) - 3; })
      .attr("y", barHeight / 2)
      .attr("dy", ".35em")
      .text(function(d) { return d; });
}
// function basicBarGraph(beers, checkins, users) {
//     var ratingScore = beers[beers.length-1]['rating_score'];
//     console.log(beers[beers.length-1]['rating_score'])
//     var ratingCount = beers[beers.length-1]['rating_count'];
//     var ratingUserScore = checkins[checkins.length-1]['rating_score'];
//     var checkinMonth = checkins[checkins.length-1]['created_at'].slice(5,7);
//     var userBirthday = users[users.length-1]['user_birthday'].slice(0,4);
//     var beerStyle = beers[0]['beer_style'];
//     var d = new Date();
//     var userAge = d.getFullYear() - userBirthday;
//     var ipa = 0;
//     var light = 0;
//     var porter = 0;
//     var wheat = 0;
//     var stout = 0;

//     for (i=0; i < beers.length; i++) {
//       if (beers[i]['beer_style'] === "IPA") {
//         ipa++;
//       }
//       else if (beers[i]['beer_style'] === "American Light") {
//         light++;
//       }
//       else if (beers[i]['beer_style'] === "Porter") {
//         porter++;
//       }
//       else if (beers[i]['beer_style'] === "Wheat") {
//         wheat++;
//       }
//       else if (beers[i]['beer_style'] === "Stout") {
//         stout++;
//       }
//     }
//   console.log(beers[beers.length-1]['rating_count']);
//   console.log(beerStyle);

//     d3.select("body")
//         .style("color", "black")
//         .style("background-color", "rgba(25, 80, 10, .5)"); 
//     var ratingScore = beers[beers.length-1]['rating_score'];
//       var data = [ipa, light, porter, wheat, stout];
//   var x = d3.scale.linear()
//       .domain([0, d3.max(data)])
//       .range([0, 600]);

//   d3.select(".chart")
//     .selectAll("div")
//       .data(data)

//     .enter().append("div")
//       .transition()
//       .duration(2000)
//       .style("width", function(d) { return x(d) + "px"; })
//       .text(function(d) { return d; });
// }

// data conversion functions. Allow for ease of adding to new charts

function beerRatingName (beers) {
  x = 1;
  while (x < beers.length){
    var beerName = beers[beers.length-x]['beer_name'];
    var ratingScore = beers[beers.length-x]['rating_score'];
    console.log(beerName);
    console.log(ratingScore);
    x++;
  }
}

// function beerRatingNameChart () {
//   console.log(beerRatingName(beers));
// }





