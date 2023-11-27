function auth(cred) {
    var info = cred.username + ":" + cred.password;
    print("Info: ", info);
    var base64 = Java.type('java.util.Base64');
    try {
        var encodedStr = base64.getEncoder().encodeToString(info.toString().getBytes());
        print("Encoded String: ", encodedStr);
        return 'Basic ' + encodedStr;
    } catch (e) {
        print("Base64 Encoding Error: ", e);
        throw e;
    }
}
