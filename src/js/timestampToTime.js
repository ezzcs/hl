var unix_timestamp_hex = process.argv[2];
var unix_timestamp = hexToDec(unix_timestamp_hex);

console.log("epoch:"+unix_timestamp);
var ez_time = new Date(unix_timestamp*1000);
var ez_year = ez_time.getFullYear();
var ez_month =("0"+(ez_time.getMonth()+1)).slice(-2);
var ez_date  =("0"+ez_time.getDate()).slice(-2);
var ez_hours = ("0"+ez_time.getHours()).slice(-2);
var ez_minutes = ("0"+ez_time.getMinutes()).slice(-2);
var ez_seconds = ("0"+ez_time.getSeconds()).slice(-2);
console.log(ez_year+"-"+ez_month+"-"+ez_date+" "+ez_hours+":"+ez_minutes+":"+ez_seconds);


function hexToDec(hex) {
var result = 0, digitValue;
hex = hex.toLowerCase();
for (var i = 0; i < hex.length; i++) {
digitValue = '0123456789abcdefgh'.indexOf(hex[i]);
result = result * 16 + digitValue;
}
return result;
}

