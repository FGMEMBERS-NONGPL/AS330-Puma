
var min_carrier_alt = 2;
var gear_z_position_ft = getprop("/fdm/jsbsim/gear/unit[1]/z-position")*0.08333;


terrain_survol = func {

var lat = getprop("/position/latitude-deg");
var lon = getprop("/position/longitude-deg");
if (lat and lon != nil){
var info = geodinfo(lat, lon);




 if (info != nil) {
    if (info[0] != nil){
       setprop("/fdm/jsbsim/environment/terrain-hight",info[0]);
    }
    if (info[1] != nil){
      if (info[1].solid !=nil){
        setprop("/fdm/jsbsim/environment/terrain-undefined",0);
        setprop("/fdm/jsbsim/environment/terrain-solid",info[1].solid);
    }
      if (info[1].light_coverage !=nil)
       setprop("/fdm/jsbsim/environment/terrain-light-coverage",info[1].light_coverage);
      if (info[1].load_resistance !=nil)
       setprop("/fdm/jsbsim/environment/terrain-load-resistance",info[1].load_resistance);
      if (info[1].friction_factor !=nil)
       setprop("/fdm/jsbsim/environment/terrain-friction-factor",info[1].friction_factor);
      if (info[1].bumpiness !=nil)
       setprop("/fdm/jsbsim/environment/terrain-bumpiness",info[1].bumpiness);
      if (info[1].rolling_friction !=nil)
       setprop("/fdm/jsbsim/environment/terrain-rolling-friction",info[1].rolling_friction);
      if (info[1].names !=nil)
       setprop("/fdm/jsbsim/environment/terrain-names",info[1].names[0]);

#unfortunately when on carrier the info[1]  is nil,  only info[0] is valid
#var terrain_name = info[1].names[0];

    }else{
	setprop("/fdm/jsbsim/environment/terrain-undefined",1);

	      #debug.dump(geodinfo(lat, lon));

}
  }else {
    if (getprop("/sim/carrier/start-on-carrier") != nil) {
#nothing but real carrier value
    }else{	#default
	setprop("/fdm/jsbsim/environment/terrain-hight",0);
	setprop("/fdm/jsbsim/environment/terrain-solid",1);
	setprop("/fdm/jsbsim/environment/terrain-solid_platform",0);
	setprop("/fdm/jsbsim/environment/terrain-light-coverage",1);
	setprop("/fdm/jsbsim/environment/terrain-load-resistance",1e+30);
	setprop("/fdm/jsbsim/environment/terrain-friction-factor",1);
	setprop("/fdm/jsbsim/environment/terrain-bumpiness",0);
	setprop("/fdm/jsbsim/environment/terrain-rolling-friction",0.02);
	setprop("/fdm/jsbsim/environment/terrain-names","unknown");
   }
}

}
settimer (terrain_survol, 0.1);

}

terrain_survol();

