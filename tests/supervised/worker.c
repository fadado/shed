// Simulates a service than randomly dies or exits
//
// Exit values:
// 	0	Exit success
// 	1	Exit failure
// 	2	Exit failure
// 	3	Catched SIGQUIT
// 	130	Catched and re-raised SIGINT

#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

#define msg(s)	fprintf(stderr, "W:\t%s\n", s)

void sigusr1(int sig)
{
	signal(SIGUSR1, sigusr1);
	msg("trapped USR1 and continue");
	// do something...
}

void sigusr2(int sig)
{
	signal(SIGUSR2, sigusr2);
	msg("trapped USR2 and continue");
	// do something...
}

void sighup(int sig)
{
	signal(SIGHUP, sighup);
	msg("trapped HUP and continue");
	// reload config...
}

void sigterm(int sig)
{
	msg("trapped TERM and exit");
	exit(EXIT_SUCCESS);
}

void sigint(int sig)
{
	msg("trapped INT and kill itself again");
	signal(SIGINT, SIG_DFL);
	raise(SIGINT);
}

void sigquit(int sig)
{
	msg("trapped SIGQUIT and exit abnormally");
	exit(3);
}

int main(int argc, char **argv)
{
	// Randomize
	srand((unsigned int)time(NULL));

	// Install handlers
	signal(SIGUSR1, sigusr1);
	signal(SIGUSR2, sigusr2);
	signal(SIGHUP, sighup);
	signal(SIGTERM, sigterm);
	signal(SIGINT, sigint);
	signal(SIGQUIT, sigquit);

	// Print PID
	char buf[16];
	sprintf(buf, "PID %d", getpid());
	msg(buf);

	// Simulate a server doing some work for a while
	unsigned int n = (argc > 1 ? atoi(argv[1]) : 7);
	msg("start work...");
	while (1) {
		n = sleep(n);
		if (n == 0) break;
		msg("more work to do...");
	}

	// Exit randomly
	const  int chance = 6;
	if (rand() % chance != 0 ) {
		msg("exit abnormally");
		exit(EXIT_FAILURE + rand() % 2);	// 1..2
	} else {
		msg("exit normally");
		exit(EXIT_SUCCESS);
	}
}
