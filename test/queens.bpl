/* Solve 8 queens problem by backtracking */

int queen[8];   /* Row for queen on column c */
int rfree[8];   /* Is row r free? */
int du[15];     /* Is diagonal i = c + 7 - r free? */
int dd[15];     /* Is diagonal i = c + r free? */

int solutions;

void solve(int c)
{
	if (c == 8) {
		solutions = solutions + 1;
	}
	else {
		r = 0;
		while (r < 8) {
			if(rfree[r] * dd[c + r] * du[c + 7 - r]) {
				queen[c] = r;
				rfree[r] = dd[c + r] = du[c + 7 - r] = 0;
				solve(c + 1);
				rfree[r] = dd[c + r] = du[c + 7 - r] = 1;
                        }
			r = r + 1;
		}
	}
}

void main(void)
{
	int i;

	/* Initialize */
	solutions = 0;

	i = 0;
	while (i < 8) {
		queen[i] = -1; /* No row */
		rfree[i] = 1;
		i = i + 1;
	}

	i = 0;
	while (i < 15) {
		du[i] = dd[i] = 1;
		i = i + 1;
	}

	/* Now do it */
	solve(0);

	write("There are "); write(solutions); write(" solutions");
	writeln();
}
