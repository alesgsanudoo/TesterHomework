# Tester Script - CS240 Class
I decided to create this script to test my assigments of CS240 (Purdue University).
> **Note**: This works only in (Purdue ssh servers).

To know:
- It will sleep every 30 runs during 1 second to avoid seg fault. (Seg fault could happend)
- Modes: Debug/Normal. Save delete test files or delete test files.


### Test for Seg fault:
I decided to test the script it in order to see, If I get any unexpected errors. The code run 150.000 times succesfully in 2h.

### Installation in terminal (Purdue SSH):
- Use '~' directory. (Move the file to ~ directory with mv filename ~)
- Create a `.sh` file, then paste the code, or just clone the repository ``https://github.com/alesgsanudoo/TesterHomework.git``.
- You are done! ^.^

### How to use it?
> bash tester.sh [-d] [-s] (score) <test_num> <runs_test>
- -d -> Debug mode [Save test files] (Optional)
- -s (score_test) -> Set maximum score (optional, default=100)
- <test_num> -> The homework number. [HW(Number)]
- <runs_test> -> Number runs to be made. [15000]

#### Examples:
- `tester -d 5 15000`: It will run homework 5 test cases 15000 times. Also it will save **test_data_files** directory (Debug mode).
- `tester 5 15000`: It will run homework 5 test cases 15000 times. However, it won't save **test_data_files** directory ( No Debug mode).
- `tester -d -s 62 5 15000`: It will run homework 5 test cases 15000 times. It will save **test_data_files** directory (Debug mode). Also, it will change the grade of the tester, then it will allow you to test one fuction multiple times. (Without setting -s, the score by defualt is 100).

> **Note!** I am using tester as I did Optional (Alias) section, otherwise, you should use bash **~/tester.sh** instead of tester.

> If you are in another directory in order to run the `sh` file just use bash **~/tester.sh** 

### Optional (Alias)
It sounds awkward to put `bash tester.sh` with the directory every time, isn't? I will give you a solution ^.^. 
> **tester [-d] <test_num> <runs_test>**
- Open  `~/.bashrc`
- You will see Aliases section: 
- Add => `alias tester="bash ~/tester.sh"`

```
# Aliases
# alias alias_name="command_to_run"

# Example
alias command="ls -la"
alias tester="bash ~/tester.sh"
```

- Lastly, execute `source ~/.bashrc` on your terminal.

Woah! You will be able to run the command in every directory.
> `tester` [-d] <test_num> <runs_test>

#
**Thanks!!!** Love Alex ??? 



