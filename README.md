# Docker image Lumen in alpine

## How to use?
1. Open your terminal and execute this command
```bash
mkdir lumen
cd lumen
docker run -d -v $(pwd):/app -p 80:80 ekocahyo27/baseimage-lumen
```
2. Enter address http://localhost in your browser and **Happy Coding!**

## how to develop it?
1. Clone / download this repo
```bash
https://github.com/ekocahyo/baseiamge-lumen.git
```
2. Copy existing lumen project to directory baseimage-lumen
3. Build your image with command
```bash
cd baseimage-lumen
docker build -t image-name:latest .
```

## Version of package
- Lumen => latest
- PHP => 7.4
- Alpine => 3.14

## Module PHP Installed
- Core
- ctype
- curl
- date
- dom
- fileinfo
- filter
- ftp
- hash
- iconv
- json
- libxml
- mbstring
- mysqlnd
- openssl
- pcre
- PDO
- pdo_sqlite
- Phar
- posix
- readline
- Reflection
- session
- SimpleXML
- sodium
- SPL
- sqlite3
- standard
- tokenizer
- xml
- xmlreader
- xmlwriter
- zlib