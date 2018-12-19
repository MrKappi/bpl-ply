/* This outputs 23 */

void f(int  *x) {
	*x = 23;
}

void main(void) {
	int  a;
	int  *b;
	b = &a;
	a = 4;
	f(b);
	write(a);
	writeln();
}
