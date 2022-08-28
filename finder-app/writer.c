#include <stdio.h>
#include <syslog.h>
#include <unistd.h>

int main(int argc, char **argv)
{
	openlog(NULL,0, LOG_USER);
	
	if(argc < 3)
	{
        	syslog(LOG_ERR, "Invalid number of args, expecting two, but received : %d", argc);
		return 1;
	}	

	FILE *fptr = fopen(argv[1],"w+");
	if(fptr == NULL)
	{
		syslog(LOG_ERR, "Not able to open the specified file %s",
				argv[1]);
		return 1;
	}
	if(fprintf(fptr,"%s", argv[2]) < 0)
	{
		syslog(LOG_ERR, "Error while writing data to file \"%s\"",
				argv[1]);
		fclose(fptr);
		return 1;
	}
	syslog(LOG_DEBUG, "Writing \" %s \" to file \"%s\"",argv[2],argv[1]);


	fclose(fptr);
	closelog();
	return 0;
}
