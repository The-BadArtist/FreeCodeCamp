function orbitalPeriod(arr) {
  const GM = 398600.4418;
  const earthRadius = 6367.4447;
  return arr.map(function(element) {element.orbitalPeriod = Math.round(2 * Math.PI * Math.sqrt(Math.pow(earthRadius + element.avgAlt, 3) / GM));
  delete element.avgAlt;
  return element;
  });
  
}

let x = orbitalPeriod([{name : "sputnik", avgAlt : 35873.5553}]);
console.log(x);