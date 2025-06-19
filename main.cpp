#include <iostream>
#include <readline/readline.h>
#include <readline/history.h>

int main() {
    bool run {true};
    while (run) {
        char* line = readline("> ");
        std::string input(line);
        if (!line) break;  

        if (*line) 
        {
            add_history(line);  
            std::cout << "You typed: " << line << std::endl;
        }

        if (input=="quit")
        {
          run = false;
        }

        free(line);  
    }

    std::cout << "Exiting shell." << std::endl;
    return 0;
}

