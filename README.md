# Tester Script - CS240 Class
I decided to create this script to test my assigments of CS240 (Purdue University).
> **Note**: This works in mac or any linux systems, I haven't test it in windows device.

To know:
- It will sleep every 30 runs during 1 second to avoid seg fault. (Seg fault could happend)
- Modes: Debug/Normal. Save delete test files or delete test files.

### Installation in Mac terminal (Purdue SSH):
- Use '~' directory.
- Create a `.sh` file, then paste the code, or just clone the repository ``https://github.com/alesgsanudoo/TesterHomework.git``.
- You are done! ^.^

### How to use it?
> bash tester.sh [-d] <test_num> <runs_test>
- -d -> Debug mode [Save test files]
- <test_num> -> The homework number. [HW(Number)]
- <runs_test> -> Number runs to be made. [15000]

> If you are in another directory in order to run the `sh` file just use bash bash **~/tester.sh** 

### Optional (Alias)
It sounds awkward to put `bash tester.sh` with the directory every time, isn't? I will give you a solution ^.^. 
> **tester [-d] <test_num> <runs>**
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

Woah! You will be able to run the command in every directory.


**Thanks!!!** Love Alex ♥ 



