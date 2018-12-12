//
// used it to generate Kafka workload for console producer
//

#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <sstream>

using namespace std;

string generate_message(int message_id, int message_size, const string& scenario) {

        stringstream str;

        str << message_id << " " << scenario << " ";

        time_t current_time = time(NULL);
        struct tm *t;
        t = localtime(&current_time);
        str << //printf(" current time is %4.4d-%2.2d-%2.2d %2.2d:%2.2d:%2.2d\n",
                    t->tm_year +1900 << "-" << t->tm_mon+1 << "-" << t->tm_mday
                    << " " << t->tm_hour << ":" << t->tm_min << ":" << t->tm_sec << " ";

        for(int i=0; str.str().length() < message_size; ++i) {
                str << char('a'+i%25);
        }
        str << "\n";

        return str.str();
}

int main(int argc, char *argv[]) {

        if(argc < 4) {
                cout << "ERROR: Too few parameters(need <scenario> <message size> <number of messages>\n";
                return 1;
        }

        string scenario(argv[1]);

        for(int i=0; i<atoi(argv[3]); ++i)
        cout << generate_message(i, atoi(argv[2]), scenario);

        return 0;
}
