//
//  Fractals.m
//  Fractals
//
//  Created by Alex on 16.09.2018.
//  Copyright © 2018 Alex. All rights reserved.
//

#import "Fractals.h"
#include <math.h>
#include <OpenGL/gl.h>
//the points for the initial equilateral triangle
const float ox1 = 0, ox2 = 1.0, ox3 = 0.5, oy1 = 0, oy2 = 0, oy3 = 0.866025404;

void drawSubTriangle(float x1, float x2, float x3, float y1, float y2, float y3)
{
    //set the colors
    //0, 0 , 0 is black
    glColor3f(0, 0, 0);
    //draw triangles with midpoints of the original triangle
    glBegin(GL_TRIANGLES);
    
    {
        
        glVertex3f( (x1+x3)/2, (y1+y3)/2, 0.0);
        
        glVertex3f( (x2+x3)/2, (y2+y3)/2, 0.0);
        
        glVertex3f( (x2+x1)/2, (y2+y1)/2, 0.0);
        
    }
    
    glEnd();
}

void drawFractals(float x1, float x2, float x3, float y1, float y2, float y3)
{
    drawSubTriangle(x1, x2, x3, y1, y2, y3);
    //ensure that the size of the triangles is not too small
    //distance formula is in the if condition
    if(pow((pow((x2-x1),2) + pow((y2-y1),2)),0.5) > 0.0625)
    {
        drawFractals((x1+x3)/2, (x3+x2)/2, x3, (y1+y3)/2, (y3+y1)/2, y3); //top triangle
        drawFractals(x1, (x1+x2)/2, (x1+x3)/2, y1, (y1+y2)/2, (y1+y3)/2); //left triangle
        drawFractals((x1+x3)/2, x2, (x3+x2)/2, (y1+y3)/2, y2, (y3+y2)/2); //right triangle
    }
}

