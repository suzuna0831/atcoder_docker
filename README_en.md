# atcoder_docker

** Translated from Japanese using ChatGPT4o **

Docker for AtCoder.  
You can use `atcoder-library` `atcoder-cli(acc)`, `online-judge-tools (oj)`, and `cpp-dump (dump)`.
- atcoder-library: https://github.com/atcoder/ac-library
- acc: https://github.com/Tatamo/atcoder-cli
- oj: https://github.com/online-judge-tools/oj
- dump: https://github.com/philip82148/cpp-dump

## Prerequisites

Ensure Docker is available and ready to use.

## Usage

Refer to the respective references for how to use `acc` and `oj`.

### 1. Setting Up the Environment

~~~sh
$ docker compose up -d
$ docker compose exec atcoder bash # or any way you like (e.g., vscode)
~~~

### 2. Logging In

Log in to AtCoder using `acc` and `oj`.

~~~sh
$ acc login
$ oj login https://atcoder.jp/
~~~

### 3. Solving Problems

#### Downloading Problems

~~~sh
$ acc new <contest-id> --template <template-dir-name>
$ acc new abc321 --template cpp # example
~~~

#### Solving Problems

You can use the `dump` function in the `main.cpp` file to easily output the contents of variables. (For details, refer to https://github.com/philip82148/cpp-dump)

~~~cpp
...
int main() {
    int N; cin >> N;
    vector<int> A(N); for(int i=0; i<N; i++) cin>>A[i];
    dump(A); // Outputs the contents of A
}
...
~~~

#### Compiling

Use the `gd` command to compile, which will include output from `dump`.

~~~sh
$ gd <filename>
$ gd main.cpp # example
~~~

Using the `g` command will bypass `dump` outputs.

~~~sh
$ g <filename>
$ g main.cpp # example
~~~

`gd` and `g` are aliases set in the `Dockerfile`.

~~~Dockerfile
RUN echo 'alias g="g++ -std=c++20 -Wall -Wextra -Wshadow -Wfloat-equal -ftrapv -fsanitize=undefined,address -fno-omit-frame-pointer -fno-sanitize-recover -g -I /work/ac-library"' >> /home/${USERNAME}/.bashrc
RUN echo 'alias gd="g++ -DDEBUG -std=c++20 -Wall -Wextra -Wshadow -Wfloat-equal -ftrapv -fsanitize=undefined,address -fno-omit-frame-pointer -fno-sanitize-recover -g -I /work/ac-library"' >> /home/${USERNAME}/.bashrc
~~~

#### Testing

~~~sh
$ oj t # == oj test
$ gd main.cpp && oj t # Compile and then test
~~~

### Submitting

~~~sh
$ acc s # == acc submit
~~~

## References

### atcoder-library
- AtCoder. atcoder-library. https://github.com/atcoder-library

### atcoder-cli
- Tatamo. atcoder-cli. https://github.com/Tatamo/atcoder-cli.

### online-judge-tools
- koba-e964. oj. https://github.com/online-judge-tools/oj.

### cpp-dump
- sassan. Creating a dump function to print any C++ variable. https://zenn.dev/sassan/articles/19db660e4da0a4.
- philip82184. cpp-dump. https://github.com/philip82148/cpp-dump.
