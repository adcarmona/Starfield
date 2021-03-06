Particle [] Particles;
boolean warp = false;
boolean mouseControl = false;
void setup()
{
	size(800,800);
	background(0);
	Particles = new Particle[1000];
	Particles[0] = new OddballParticle();
	Particles[1] = new JumboParticle();
	for(int i=2; i<Particles.length; i++)
 	{
 		Particles[i] = new NormalParticle();
 	}
}
void draw()
{
	if (key == 'm')
	{
		mouseControl = true;
	}
	if (key == 'n')
	{
		mouseControl = false;
	}
	if (mouseButton == LEFT)
	{
		warp = true;
	}
	if (mouseButton == RIGHT)
	{
		warp = false;
	}
	if (warp == true)
	{
		//no background
	}
	else if (warp == false)
	{
		//background(0);
		fill(0,0,0,50);
		rect(0,0,800,800);
	}
	for (int i=0; i<Particles.length; i++)
 	{
 		Particles[i].show();
 		Particles[i].move();
 	}
}
class NormalParticle implements Particle
{
	int pColor, pSize;
	double pX, pY, pAngle, pSpeed;
	NormalParticle()
	{
		pColor = ((int)(Math.random()*255));
		pSpeed = Math.random()*5;
		pAngle = Math.PI*2*Math.random();
		pSize = 5;
		pX = 400;
		pY = 400;
	}
	public void move()
	{
		pX = pX + Math.cos(pAngle) * pSpeed;
		pY = pY + Math.sin(pAngle) * pSpeed;
		if(pX > 810 || pX < -10 || pY > 810 || pY < -10)
		{
			if (mouseControl == false)
			{
				pX = 400;
				pY = 400;
			}	
			else 
			{
				pX = mouseX;
				pY = mouseY;
			}
			pAngle = Math.PI*2*Math.random();
			pSpeed = Math.random()*5;
			pColor = ((int)(Math.random()*255));
		}
	}
	public void show()
	{
		noStroke();
		fill(pColor);
		ellipse((float)pX,(float)pY,pSize,pSize);
	}
}
interface Particle
{
	public void show();
	public void move();
}
class OddballParticle implements Particle
{
	int oColor;
	double oX, oY, oAngle, oSpeed;
	OddballParticle()
	{
		oColor = 255;
		oSpeed = Math.random()*5;
		oAngle = Math.PI*2*Math.random();
		oX = 400;
		oY = 400;
	}
	public void move()
	{
		oAngle = Math.PI*2*Math.random();
		oX = oX + Math.cos(oAngle) * oSpeed;
		oY = oY + Math.sin(oAngle) * oSpeed;
		if(oX > 810 || oX < -10 || oY > 810 || oY < -10)
		{
			oX = 400;
			oY = 400;
			oSpeed = Math.random()*5;
			oColor = ((int)(Math.random()*255));
		}
	}
	public void show()
	{
		noStroke();
		fill(255,240,240);
		ellipse((float)oX,(float)oY,5,5);
	}
}
class JumboParticle extends NormalParticle
{
	JumboParticle()
	{
		pSize = 20;
	}
}

