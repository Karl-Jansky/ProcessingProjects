
PShape moon;
float delta = 0;
float[] starSizes = new float[100];
float[]starX= new float[100];
float[] starY= new float[100];
int planetR = 120;
int planetG = 120;
int planetB = 120;

// RENDER ITEMS
ArrayList<PShape>itemsToRender = new ArrayList<PShape>();
ArrayList<Boolean> shouldRender = new ArrayList<Boolean>();
ArrayList<PShape> moons = new ArrayList<PShape>();'

void setup() {
  size(400, 400);
  for (int i = 0; i < 100; i++) {
    starSizes[i] = random(40)/10;
    starX[i] = random(400);
    starY[i] = random(400);
  }
}



void draw() {
  delta += 0.1;
  background(0);
  for (int i = 0; i < 100; i++) {
    fill(255, 255, 224);
    ellipse(starX[i], starY[i], starSizes[i], starSizes[i]);
  }
  
  // One moon process
  //createMoon(15, 60,0.2, 255,255,255);
  
  // MultiMoon proccess
  shouldRender.add(createMoonRender(15, 60,0.2, 255,255,255,200));
  shouldRender.add(createMoonRender(20, 100, 0.35, 200,200,255,190));
  shouldRender.add(createMoonRender(10, 120, 0.4, 120,200,255,200));
  
  // Check if should be rendered now (behind planet)
  for (int x = 0; x < shouldRender.size(); x++)
  {
    if(shouldRender.get(x)){
      shape(moons.get(x));
    }
  }
  // render planet
  drawPlanet();
  
  // draw rest of planets
  for (int x = 0; x < shouldRender.size(); x++)
  {
    if(!shouldRender.get(x)){
      shape(moons.get(x));
    }
  }
  
  //clear lists
  moons.clear();
  shouldRender.clear();
  
  
}


boolean createMoonRender(float size, float orbitSize, float orbitSpeed, int r, int g, int b, float yVal)
{
  boolean inFront = true;
  
  fill(r, g, b);
  float xValue = sin(delta* orbitSpeed)*orbitSize;
  float moonSize = (cos(delta * orbitSpeed)+ 2 ) * size;
  if (size < 0)
  {
    size *= -1;
  }
  moons.add(createShape(ELLIPSE, 200+ xValue, yVal, moonSize, moonSize));
  if (cos(delta * orbitSpeed) >= 0) {
    inFront = false;
  } else {
    inFront = true;
  }
  
  return inFront;
  
}


void createMoon(float size, float orbitSize, float orbitSpeed, int r, int g, int b)
{
  boolean inFront = true;
  // create render stack
  
   drawPlanet();
  fill(r, g, b);
  float xValue = sin(delta* orbitSpeed)*orbitSize;
  float moonSize = (cos(delta * orbitSpeed)+ 2 ) * size;
  if (size < 0)
  {
    size *= -1;
  }
  moon = createShape(ELLIPSE, 200+ xValue, 200, moonSize, moonSize );
  shape(moon);
  if (cos(delta * orbitSpeed) >= 0) {
    inFront = false;
  } else {
    inFront = true;
  }
  if (inFront) {
   drawPlanet();
  }
}


void drawPlanet(){
   fill(planetR, planetG, planetB);
    ellipse(200, 200, 80, 80);
}
