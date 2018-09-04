var fs = require('fs');
var path = require('path');
var chalk = require('chalk');

var src = __dirname + '/template/';
var dest = __dirname + '/sites/' ;
var choices = listDir();
display();

function copyFile() {
    var files = fs.readdirSync(src).filter(function (file) {
        return fs.statSync(path.join(src,file)).isFile();
    });
    files.forEach(function (f) {
        fs.copyFileSync(src+f,dest+f);
    });
}

function listDir() {
    return fs.readdirSync(src).filter(function (file) {
        return fs.statSync(path.join(src, file)).isDirectory();
    });
}

function display() {
    process.stdout.write(chalk.cyan.bold("Select a template:                                   ")+choices[0]);
    var pos = 0;
    process.stdin.setRawMode(true);
    process.stdin.resume();
    process.stdin.setEncoding('utf8');
    process.stdin.on('data', function(key) {
        if ( key == '\u0003' ) {
            process.stdout.write("\n");
            process.exit();
        } else if(key == '\u000D') {
            process.stdout.write("\n");
            src = src + choices[pos] + '/';
            copyFile();
            process.exit(0);
        } else if( key == '\u001B\u005B\u0041') {
            process.stdout.clearLine();
            process.stdout.cursorTo(0);
            if (pos != 0) {
                pos = pos - 1;
            }
            process.stdout.write(chalk.cyan.bold("Select a template:                                   ")+choices[pos]);
        } else if(key == '\u001B\u005B\u0042') {
            process.stdout.clearLine();
            process.stdout.cursorTo(0);
            if (pos != (choices.length-1)) {
                pos = pos + 1;
            }
            process.stdout.write(chalk.cyan.bold("Select a template:                                   ")+choices[pos]);
        }
    });
}