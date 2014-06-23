function rawData (beers, checkins, users, breweries) {
  beers = beers;
  checkins = checkins;
  users = users;
  breweries = breweries;
  console.log(breweries);
  chartCalls(beers, checkins, users, breweries);
  beerRatingIPA(beers);
}

var width = 960,
    height = 800,
    radius = Math.min(width, height) / 1.5,
    spacing = .09;

    var color = d3.scale.linear()
    .range(["hsl(-180,50%,50%)", "hsl(180,50%,50%)"])
    .interpolate(interpolateHsl);

var arc = d3.svg.arc()
    .startAngle(0)
    .endAngle(function(d) { return d.value * 2 * Math.PI; })
    .innerRadius(function(d) { return d.index * radius; })
    .outerRadius(function(d) { return (d.index + spacing) * radius; });

    var svg = d3.select("body").append("svg")
    .attr("width", width)
    .attr("height", height)
  .append("g")
    .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

var color = d3.scale.linear()
    .range(["hsl(-180,50%,50%)", "hsl(180,50%,50%)"])
    .interpolate(interpolateHsl);

function tick() {
  field = field
      .each(function(d) { this._value = d.value; })
      .data(fields)
      .each(function(d) { d.previousValue = this._value; });

  field.select("path")
    .transition()
      .ease("elastic")
      .attrTween("d", arcTween)
      .style("fill", function(d) { return color(d.value); });

  field.select("text")
      .attr("dy", function(d) { return d.value < .5 ? "-.5em" : "1em"; })
      .text(function(d) { return d.text; })
    .transition()
      .ease("elastic")
      .attr("transform", function(d) {
        return "rotate(" + 360 * d.value + ")"
            + "translate(0," + -(d.index + spacing / 2) * radius + ")"
            + "rotate(" + (d.value < .5 ? -90 : 90) + ")"
      });

 ;
}

function arcTween(d) {
  var i = d3.interpolateNumber(d.previousValue, d.value);
  return function(t) { d.value = i(t); return arc(d); };
}

function fields(beerStyle, avg) {
  var now = new Date;
  arr = [beerStyle, avg]
  console.log(beerStyle);
  console.log(avg);
  return [
    {index: .6, text: "IPA", value: 4 / 5},
    {index: .5, text: "Stout", value: 3.9 / 5},
    {index: .4, text: "Wheat", value: 3.6 / 5},
    {index: .3, text: "Porter",   value: 4.1 / 5},
    {index: .2, text: "American Lager",    value: 3.2 / 5},
  ];
}

// Avoid shortest-path interpolation.
function interpolateHsl(a, b) {
  var i = d3.interpolateString(a, b);
  return function(t) {
    return d3.hsl(i(t));
  };
}

// function beerRatingIPA (beers) {
//   console.log(beers.length);
//   x = 1;
//   ipaSum = 0;
//   ipaCount = 0;
//   ipaAvg = 0;
//   while (x < beers.length){
//     var beerStyle = beers[beers.length-x]['beer_style'];
//     var ratingScore = beers[beers.length-x]['rating_score'];
//       if (beerStyle === "IPA") {
//         ipa = beerStyle;
//         ipaSum += ratingScore;
//         ipaCount += 1;
//       }
//     var beerScore = []; // create an empty array
//     beerScore.push({
//     key:   beerStyle,
//     value: ratingScore
//     });
//     beer = (beerScore[0].key);
//     score = (beerScore[0].value);
//     x++;
//   }
//   ipaAvg = ipaSum / ipaCount;
//   console.log(ipaAvg);
//   return ipaAvg;
// }




