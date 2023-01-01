## Bash Scripting
This repository presents an initial draft of a short and sweet Bash script focused on testing remote ports and service access.

The script showcases the use of different functionalities and features of Bash as well as basic Bash constructs.

### Prerequisite:
- The script uses an input file, `server.list` which contains the data it needs to act on.
- When run, a `result.csv` file gets created to store the resulting outcome.

## Intended Purpose
The idea of the script is to test whether access is possible between some source and destination servers on specific ports.

### The Input File

The input data is a list of source and destination IP addresses and ports. Each line in the source input file specifies a source server, a destination server and the list of ports between them for which connectivity needs to be tested.

Thus, the data is made of three elements: the source IP; the destination IP; and the list of ports. They are delimited in the file by an underscore _( `_` )_, while the internal list of ports is delimited by a space.

> `sourceIP`\_`destinationIP`\_`port1` `port2` `port3` 
```
x.x.x.143_x.x.x.92_22 3306 7000 9042 
```

## The Script

The following is a simple list of the main concepts the script aims to demo:
- Use of `env` to load the `bash` environment from `$PATH` # useful in the case of python but less so for bash.
- Nested loops with a `while` outer loop and a `for` inner loop.
- Use of the `IFS` variable to automatically split the `read` input line into separate variables.
- Assigning and using a non-standard file descriptor,`<&3`, for the input file `server.list`.
- Setting up the listening port on the target machine.
- Using the `-tt` SSH option to force pseudo-terminal allocation on the target machine.
- Enforcing the emulation of an interactive shell via the `set -m` option to enable job control.
- Testing the result of the SSH command to the source machine to see if the remote port is accessible from it.
- Displaying the result onto standard output as well as storing it in the result file.


### Disclaimer

The script is a barebone representation of the above concepts and is not meant to be usable / functional. Ideally using Ansible would be a preferred and recommended alternative for the intended purpose.







