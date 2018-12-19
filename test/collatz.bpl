/*¨Count steps in Collatz' conjecture */

void main(void)
{
	int n;
	int orig;
	int steps;

	while (1) {
		write("Enter a number: ");
		n = orig = read();
		if (n < 0)
			return;

		steps = 0;
		while (n != 1) {
			if (n % 2 == 1)
				n = 3 * n + 1;
			else
				n = n / 2;
			steps = steps + 1;
		}
		write("For "); write(orig); write(" it is ");
		write(steps); write(" steps");
		writeln();
	}	
}
