// PoVRay 3.7 Scene File "Car_01_demo.pov"
// author: Friedrich A. Lohmueller, Nov-2006/Aug-2009/Jan-2011
// email: Friedrich.Lohmueller_at_t-online.de
// homepage: http://www.f-lohmueller.de
//--------------------------------------------------------------------------
#version 3.6; // 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//___________________________________________________________________________________ 
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------
#declare Camera_0 = camera {/*ultra_wide_angle*/ angle 100      // frente
                            location  < 0, 10 ,-30>
                            right     x*image_width/image_height
                            look_at   <0 , 8 , 0>}                                
//___________________________________________________________________________________                            
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 120   // cima
                            location   < 0, 500,0>
                            right     x*image_width/image_height
                            look_at   <0, 0, 20>}  
//___________________________________________________________________________________                             
#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 130 // mar
                            location   < 0, 500,0>
                            right     x*image_width/image_height
                            look_at   <0, 5, 0>}
//___________________________________________________________________________________ 
#declare Camera_3 = camera {/*ultra_wide_angle*/ angle 20   //praia vista de topo
                            location   < 0, 70000,0>
                            right     x*image_width/image_height
                            look_at   <0, 0, 2500>} 
//___________________________________________________________________________________ 
#declare Camera_4 = camera {/*ultra_wide_angle*/ angle 150   //praia vista de frente
                            location   < 0, 500,500>
                            right     x*image_width/image_height
                            look_at   <0, 20, 0>} 
//___________________________________________________________________________________ 
#declare Camera_5 = camera {/*ultra_wide_angle*/ angle 150   //praia vista no sentido que o carro anda
                            location  <30 , 40 ,0>
                            right     x*image_width/image_height
                            look_at   <-1000, 10, 1000>} 
//___________________________________________________________________________________ 
#declare Camera_6 = camera {/*ultra_wide_angle*/ angle 100   //posição gerar imagens amanhecer
                            location   <20, 20,60>
                            right     x*image_width/image_height
                            look_at   <-300, 6, 700>}      
//___________________________________________________________________________________ 
#declare MoveA = 60*clock;
#declare Camera_7 = camera {/*ultra_wide_angle*/ angle 50+MoveA   //praia vista de frente
                            location   < -1030, 15,30>
                            right     x*image_width/image_height
                            look_at   <-1035,5, -20>}                                                                                    
//___________________________________________________________________________________

//CAMERA DA CENA                                                                              
camera{Camera_7}

//___________________________________________________________________________________ 
//___________________________________________________________________________________ 
//___________________________________________________________________________________ 
// sun ---------------------------------------------------------------------
light_source{< 2500,2500,-2500> color White*0.3 shadowless }  

// sky --------------------------------------------------------------------- 
//_____________________________________________________________________________________
//___________________________LUZ DO SOL, ANIMAR AMANHECER__________________________  
//_____________________________________________________________________________________

light_source{ <-1000, 19000, 250000> 
              color Yellow
                       //___________________ANIMAÇÃO_______________________   
                        
                    //   rotate -15*y*clock //AMANHECER
                          rotate <-2,0,0> //POSIÇÃO NAS CENAS  
                       
                       //__________________ANIMAÇÃO_FIM______________________ 
              looks_like{ sphere{ <0,0,0>, 14000

 pigment { image_map
                                      { jpeg "sol.jpg"
                                        map_type 1 }
                                      }
                                finish {brilliance 1
                                        specular 0
                                        ambient 1}
                                        }


} }  

//_____________________________________________________________________________________
//___________________________LUZ DO SOL, ANIMAR AMANHECER__________________________  
//_______________________________________FIM___________________________________________   
            
            

//--------------------------------------------------------------------------

// sky ---------------------------------------------------------------------
#local SkyTransform  = transform{ rotate <0,0,0> translate  <-3,0,-3> } 
//--------------------------------------------------------------------------
sky_sphere{ pigment{ gradient <0,1,0>
                     color_map{
                                [ 0.0 color rgb <0.24, 0.32, 1.0>*0.3 ]
                                [ 0.23 color rgb <0.16, 0.32, 0.9>*0.9 ]
                                [ 0.37 color rgb<1,0.1,0> ]
                                [ 0.52 color rgb<1,0.2,0> ]
                                [ 0.70 color rgb <0.36, 0.32, 1.0>*0.7 ]
                                [ 0.80 color rgb <0.14, 0.32, 1.0>*0.5 ]
                                [ 1.00 color rgb <0.24, 0.32, 1.0>*0.3 ]
                              } // end color_map
                     scale 2
                     rotate<-8,0,0>     
                        //___________________ANIMAÇÃO_______________________   
                        
                     //  rotate 10*x*clock //COLORAÇÂO CÈU  
                       
                       //__________________ANIMAÇÃO_FIM______________________ 
                     translate <0,0.7,0>
                   } // end pigment
            } // end of sky_sphere ------------------------------------------
// white clouds:
plane{<0,1,0>,1 hollow
       texture{ pigment{ bozo turbulence 0.92
                         color_map { [0.00 rgbt<1,1,1,1>] // <0.24, 0.32, 1.0>*0.7]
                                     [0.50 rgbt<1,1,1,1>] // <0.24, 0.32, 1.0>*0.7]
                                     [0.60 rgb <1,1,1>]
                                     [0.85 rgb <0.25,0.25,0.25>]
                                     [1.00 rgbt<0.5,0.5,0.5, 0.65>]}
                        scale<1,1,1.5>*3.5  translate< 0.5,0,0>     
                        
                        //___________________ANIMAÇÃO_______________________ 
                        
                          
                       rotate -40*x 
                       rotate -2.33*x*clock //VENTO NAS NÚVENS  
                       
                       //__________________ANIMAÇÃO_FIM______________________  
                       
                       }
                finish {ambient 1 diffuse 0 }
                }      
       rotate<0, 0,0> transform SkyTransform
       scale 10000
       }
// red orange clouds:
plane{<0,1,0>,1 hollow 
       texture{ pigment{ bozo turbulence 0.92
                         color_map { [0.00 rgbt<1,1,1,1>] // <0.24, 0.32, 1.0>*0.7]
                                     [0.45 rgbt<1,1,1,1>] // <0.24, 0.32, 1.0>*0.7]
                                     [0.75 rgbt <1.00,0.15,0.00,0.50>]
                                     [0.85 rgbt <0.75,0.55,0.00,0.30>]
                                     [1.00 rgbt <0.50,0.35,0.15, 0.75>]}
                        scale<1,1,1.5>*3.5  translate< 0.5,0,1.5>// +move it in z 
                        
                        //___________________ANIMAÇÃO_______________________ 
                          
                       rotate -46*x 
                       rotate -2.33*x*clock //VENTO NAS NÚVENS  
                       
                       //__________________ANIMAÇÃO_FIM______________________ 
                       
                       }
                finish {ambient 1 diffuse 0 }
                }      
       rotate<0, 0,0>  transform SkyTransform
       scale 9900}
//-------------------------------------------------------// end sky + clouds
//--------------------------------------------------------------------------




// fog ---------------------------------------------------------------------
fog{fog_type   2
    distance 200
    color      White
    fog_offset 0.1
    fog_alt    3.6
    turbulence 0.3}
    
 
//________________________________________________________________________________________                                                                                                
//________________________________________________________________________________________
//________________________________________PRAIA___________________________________________
//________________________________________________________________________________________
//________________________________________________________________________________________                                                                                                

//=========================================================================================                                               
//---------------------------------------ÁGUA-------------------------------------------
//=========================================================================================              
plane{y,0
        texture{ Polished_Chrome }
        finish { ambient 0.9}
        normal{bozo 1.10
         scale <2.0,1,0.3>*0.20
         rotate<0,10,0>
         turbulence 0.9
         translate<0,0,-2>
          translate clock}
        finish{reflection{0,1}}}  
        
        
//=========================================================================================                                               
//---------------------------------------AREIA---------------------------------------------
//=========================================================================================

//AREIA TORUS 
difference { 

torus{ 9000,1010
scale <1,1,1>
texture{ pigment{ color rgb <0.825,0.57,0.35>}
                normal { bumps 0.75 scale 0.025  }
                finish { phong 0.1 } 
              } // end of texture
       rotate<0,0,0> translate<0,0,8000>
     } 

box {<20000,0.01,20000>,<-20000,4000,-20000>
texture{ pigment{ color rgb <0.825,0.57,0.35>}
                normal { bumps 0.75 scale 0.025  }
                finish { phong 0.1 } 
              } // end of texture} 
    }           
    
box {<10000,-2,10000>,<-10000,2,20000> }

            }   

//=========================================================================================                                               
//---------------------------------------GRAMA---------------------------------------------
//=========================================================================================

difference { 

torus{ 9000,1010
scale <1,1,1>
texture{ pigment{ color rgb <0.825,0.57,0.35>}
                normal { bumps 0.75 scale 0.025  }
                finish { phong 0.1 } 
              } // end of texture
       rotate<0,0,0> translate<0,0,8000>
     } 

box {<20000,0.02,20000>,<-20000,4000,-20000>
        texture{ pigment{ color rgb<0.35,0.65,0.0>*0.72 }
	         normal { bumps 0.75 scale 0.015 }
                 finish { phong 0.1 }
               } // end of texture
    }           
    
box {<10000,-2,10000>,<-10000,2,20000> }
            }  
            
             
union {

//______________________________________________________________________________________________
 //_____________________________________________________________________________________________
//_______________________________________PAISAGEM____________________________________________
//_____________________________________________________________________________________________   
//______________________________________________________________________________________________

#declare montanhas = union { 
 
//=========================================================================================      
//------------------------------------PEDRAS--------------------------------------------------
//=========================================================================================

//---------------------------------------------------------------------


height_field{ png "Mount2.png" smooth double_illuminate
              // file types: 
              // gif | tga | pot | png | pgm | ppm | jpeg | tiff | sys
              // [water_level N] // truncate/clip below N (0.0 ... 1.0)
              translate<-0.5,-0.0,-0.5>
              scale<9, 1.8, 9>*2 
       texture{ T_Stone28   
                //normal { agate 0.25 scale 0.15 rotate<0,0,0> }
                finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              } // end of texture 

              rotate<0,-220,0>
              translate<-10,-1,-5>   
              scale 120
            } // end of height_field ----------------------------------
//---------------------------------------------------------------------    



//=========================================================================================
//----------------------------------------MONTANHAS----------------------------------------
//=========================================================================================     
      
                                                      
//---------------------------------------------------------------------
height_field{ png "Mount1.png" smooth double_illuminate
              // file types: 
              // gif | tga | pot | png | pgm | ppm | jpeg | tiff | sys
              // [water_level N] // truncate/clip below N (0.0 ... 1.0)
              translate<-0.5,-0.0,-0.5>
              scale<100,12,50>*1 
        texture{ pigment{ color rgb<0.35,0.65,0.0>*0.72 }
	         normal { bumps 0.75 scale 0.015 }
                 finish { phong 0.1 }
               } // end of texture


              rotate<0,0,0>
              translate<15,-0.01,-23> 
              scale 30
            } // end of height_field ----------------------------------
//---------------------------------------------------------------------  


//=========================================================================================                                               
//--------------------------------------MONTANHAS-------------------------------------------
//=========================================================================================

//---------------------------------------------------------------------
height_field{ png "Mount1.png" smooth double_illuminate
              // file types: 
              // gif | tga | pot | png | pgm | ppm | jpeg | tiff | sys
              // [water_level N] // truncate/clip below N (0.0 ... 1.0)
              translate<-0.5,-0.0,-0.5>
              scale<50,12,50>*1 
        texture{ pigment{ color rgb<0.35,0.65,0.0>*0.72 }
	         normal { bumps 0.75 scale 0.015 }
                 finish { phong 0.1 }
               } // end of texture


              rotate<0,280,0>
              translate<60,-0.01,-20> 
              scale 33
            } // end of height_field ----------------------------------
//--------------------------------------------------------------------- 

//=========================================================================================                                               
//--------------------------------------MONTANHAS-------------------------------------------
//=========================================================================================

//---------------------------------------------------------------------
height_field{ png "Mount2.png" smooth double_illuminate
              // file types: 
              // gif | tga | pot | png | pgm | ppm | jpeg | tiff | sys
              // [water_level N] // truncate/clip below N (0.0 ... 1.0)
              translate<-0.5,-0.0,-0.5>
              scale<20,5,30>*1 
        texture{ pigment{ color rgb<0.35,0.65,0.0>*0.72 }
	         normal { bumps 0.75 scale 0.015 }
                 finish { phong 0.1 }
               } // end of texture


              rotate<0,0,0>
              translate<-40,-0.01,-10> 
              scale 55
            } // end of height_field ----------------------------------
//---------------------------------------------------------------------      

//=========================================================================================
//----------------------------------------MONTANHAS----------------------------------------
//=========================================================================================     
      
                                                      
//---------------------------------------------------------------------
height_field{ png "Mount1.png" smooth double_illuminate
              // file types: 
              // gif | tga | pot | png | pgm | ppm | jpeg | tiff | sys
              // [water_level N] // truncate/clip below N (0.0 ... 1.0)
              translate<-0.5,-0.0,-0.5>
              scale<100,8,50>*1 
        texture{ pigment{ color rgb<0.35,0.65,0.0>*0.72 }
	         normal { bumps 0.75 scale 0.015 }
                 finish { phong 0.1 }
               } // end of texture


              rotate<0,0,0>
              translate<-30,-0.01,-23> 
              scale 30
            } // end of height_field ----------------------------------
//---------------------------------------------------------------------  

//=========================================================================================      
//------------------------------------PEDRAS--------------------------------------------------
//=========================================================================================

//---------------------------------------------------------------------


height_field{ png "Mount2.png" smooth double_illuminate
              // file types: 
              // gif | tga | pot | png | pgm | ppm | jpeg | tiff | sys
              // [water_level N] // truncate/clip below N (0.0 ... 1.0)
              translate<-0.5,-0.0,-0.5>
              scale<9, 2.7, 9>*2 
       texture{ T_Stone28   
                //normal { agate 0.25 scale 0.15 rotate<0,0,0> }
                finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              } // end of texture 

              rotate<0,-230,0>
              translate<20,-1,-5>   
              scale 90
            } // end of height_field ----------------------------------
//--------------------------------------------------------------------- 
} 


        } //end of union 

object {montanhas} //centro de coordenadas


object {montanhas
        rotate<0,-37,0>
        translate <4500,0,1300>
        } 
        
object {montanhas
        rotate<0,-70,0>
        translate <7400,0,4900>
        } 
        
            
object {montanhas
        rotate<0,-93,0>
        translate <7800,0,8900>
        }
        
object {montanhas
        rotate<0,33,0>
        translate <-4600,0,1300>
        } 
        
object {montanhas
        rotate<0,33,0>
        translate <-4900,0,1300>
        } 
        
object {montanhas
        rotate<0,67,0>
        translate <-7300,0,4500>
        } 

object {montanhas
        rotate<0,96,0>
        translate <-7800,0,9000>
        }        
             
                                                                                                
                                                                                                
//______________________________________________________________________________________________      
//_____________________________________________________________________________________________
//_______________________________________AEROGERADORES_________________________________________
//___________________________________________ÁGUA_____________________________________________
//______________________________________________________________________________________________


#declare Number_of_Blades = 3;
#declare Blade_Radius  = 6;


 #declare Blades_Texture1 = 
                 texture { pigment { color White }
 finish {ambient 0.55 } }
       
        
declare Helio =   union{
  
     cone { <0, -10, 0.5>, 0.5, <0, 0,0.5>, 0.2 
 texture { pigment { color White } }
       finish {ambient 0.55 }  } 
         
   cylinder  { <0,0,-0.01>,<0,0,1.00>,0.25 
    texture { pigment { color White }  finish {ambient 0.55 }}}  // propeller axis  
   
   difference{                                 // propeller nose
               sphere{<0,0,0>, 1}  
               box {<-1,-1,-0.1>,<1,1,1>}
                texture { pigment { color White } finish {ambient 0.55 } }
               scale <1,1,2.5>*0.3
               translate<0,0,0.2>
             }  
              
   union{ 
     #declare Nr = 0;
     #declare End = Number_of_Blades;
     #while (  Nr < End)
        sphere { < 0, 0, 0>,0.5
                texture { pigment { color White } finish {ambient 0.55 } }
                 translate <0.5,0,0>
                 scale <1,0.15,0.04> rotate <10,0,0>
                 scale Blade_Radius
                 texture {Blades_Texture1}
                 rotate< 0,0, 360/End * Nr >  
                 rotate z*-360*clock*1.33 //GIRAR TURBINAS
               }
     #declare Nr = Nr + 1;
     #end 
   }
   texture{Blades_Texture1}
   translate <0,10.2,0>     
}   

 
//----------------------------------------------------------------------
                         
                         
 #declare Helio2 = object {Helio
                         rotate <0,190,0>}

object {Helio2
        translate <-1030,-0.1,10>    }
object {Helio2
        translate <-1015,-0.1,0>    }
object {Helio2
        translate <-1000,-0.1,-10>    } 
object {Helio2
        translate <-985,-0.1,-20>    } 
object {Helio2
        translate <-970,-0.1,-30>    }
        
object {Helio2
        translate <-1080,-0.1,10>    }
object {Helio2
        translate <-1065,-0.1,0>    }
object {Helio2
        translate <-1050,-0.1,-10>    } 
object {Helio2
        translate <-1035,-0.1,-20>    } 
object {Helio2
        translate <-1010,-0.1,-30>    }                                    