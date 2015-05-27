VIEW = getprop("/sim/current-view/view-number");
if (VIEW == 0 or VIEW == 9) 
    setprop("/sim/rendering/rembrandt/bloom","false");
    else setprop("/sim/rendering/rembrandt/bloom","false");    
if (VIEW == 0 or VIEW == 9) 
setprop("/sim/rendering/rembrandt/ambient-occlusion-strength",0.1);

_setlistener("/sim/current-view/view-number", func{
VIEW = getprop("/sim/current-view/view-number");
    if (VIEW == 0 or VIEW == 9) 
    setprop("/sim/rendering/rembrandt/bloom","false");
    else setprop("/sim/rendering/rembrandt/bloom","false");    
    
if (VIEW == 0 or VIEW == 9) 
setprop("/sim/rendering/rembrandt/ambient-occlusion-strength",0.1);
}
)
