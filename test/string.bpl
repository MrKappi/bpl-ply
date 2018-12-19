/*/ A few string
 examples/ 
/*/
/*////*/
/****/
/* holiwi /* */

string number[10];

string
say(int n)
{
	return number[n];
}

void
main(void)
{
	int n;
	

	/* Fill table */
	number[0] = "zero";
	number[1] = "one";
	number[2] = "two";
	number[3] = "three";
	number[4] = "four";
	number[5] = "five";
	number[6] = "six";
	number[7] = "seven";
	number[8] = "eight";
	number[9] = "nine";

	while(1) {
		write("Enter a number: ");
		n = read();
		if (n == 0) {
			write("That's all, folks!");
			writeln();
			return;
		}
		if (n <= 9999) {
			write(say(n / 1000)); n = n % 1000;
			write(say(n / 100));  n = n % 100;
			write(say(n / 10));   n = n % 10;
			write(say(n));
		}
		else {
			write("Number is too large");
			writeln();
		}
	}	
}
	





