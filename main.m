
#include <GLUT/glut.h>

// Screen Size
#define width 1024
#define height 768
#define size width*height

// This function is implemented an a seperate file: fast.nasm
void update(GLubyte *,GLubyte *,GLubyte *) __attribute__ ((regparm (3)));

// Frame Buffer
static GLubyte bitmap[size];

// Temp Frame Buffer
static GLubyte vbitmap[size];

// Final Frame Buffer
static GLubyte drawbitmap[size];

// Used for mouse tracking
static int ox,oy;

void display(void) {
    glDrawPixels(width,height,GL_GREEN,GL_UNSIGNED_BYTE,(GLvoid*)drawbitmap);
    glutSwapBuffers();
}

void tick() {
	update(bitmap,vbitmap,drawbitmap);
	glutPostRedisplay();
}

void reshape (int w, int h) {
    glViewport (0, 0, (GLsizei)w, (GLsizei)h);
    glMatrixMode (GL_PROJECTION);
    glLoadIdentity ();
    gluOrtho2D(0,(float)w,0,(float)h);
    glMatrixMode (GL_MODELVIEW);
}

void mouse(int button, int state, int x, int y) {
	int i;
	int j;
	if (button == GLUT_LEFT_BUTTON && state == GLUT_DOWN) {
		ox = x;
		oy = y;
	} else if (button == GLUT_LEFT_BUTTON && state == GLUT_UP) {
		oy = height - oy;
		y = height - y;
		for (i = y ; i <= oy ; i++) {
			for (j = ox ; j <= x ; j++) {
				bitmap[j+(i<<10)] = 1;
			}
		}
	}
}

int main (int argc, char **argv) {
	int i;
     // Used for pseudo-random initial spread of cells.
    for (i = 0 ; i < size ; i++) bitmap[i] = vbitmap[i] = 1*(i > 10000);
    glutInit (&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE);
    glutInitWindowSize (width, height);
    glutInitWindowPosition (0, 0);
    glutCreateWindow ("Life");
    glutDisplayFunc (display);
    glutReshapeFunc (reshape);
	glutIdleFunc(tick);
	glutMouseFunc(mouse);
    glutMainLoop();
    return 0;
}

