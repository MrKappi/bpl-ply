/* Fibonacci */

int Fibonacci(int n)
{
	if(n <= 1)
		return n;
	else
		return Fibonacci(n - 1) + Fibonacci(n - 2);
}

void main(void)
{
	int n;

	while(1) {
		n = read();
		if(n < 0)
			return;
		write("F("); write(n); write(") = "); write(Fibonacci(n));
		writeln();
	}
}
