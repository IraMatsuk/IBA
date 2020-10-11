document.getElementById("res").innerHTML =  Math.min(
    Math.round(Math.pow((48/(3*Math.PI) + 308/(4*Math.E)),2) - 203*Math.sin(5) + Math.pow((10*Math.PI-3*Math.E),3)),
    Math.round(Math.cos(20) - Math.cos(3) + Math.pow(Math.tan(4),0.5) - 203 / Math.sin(2)),
    Math.round(Math.pow( (22*Math.PI/22*Math.E - Math.sin(3)*Math.tan(4) - 34),10))
);  