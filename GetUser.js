var xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function() {  
	if (this.readyState == 4 && this.status == 200) {

		var payload = JSON.stringify(
            { 'logonName':'i:0#.f|membership|koskila@simedev.onmicrosoft.com'}
        );
		
		var postData = {
			body: payload
		};
        // var endPoint = "https://woonbedrijf.sharepoint.com/sites/intranet-hrm/_api/web/ensureuser";
        var endPoint = "https://simedev.sharepoint.com/sites/tea-point/_api/web/ensureuser";

		var response = JSON.parse(this.responseText);
		console.log(response);
		var digstring = response.formDigestValue;
		
		var xhttp2 = new XMLHttpRequest();
		xhttp2.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
            //   console.log(this.responseText);
              var response = JSON.parse(this.responseText);
              console.log(response);
              console.log(response.d.Title);
			}
		};
		
		console.log(digstring);
		//var digest = digstring.substr(0,digstring.indexOf(','));
		//console.log(digest);
		digest = digstring;
		 
		xhttp2.open("POST", endPoint, true);
		//xhttp2.setRequestHeader("Accept","application/json;odata=nometadata");
		xhttp2.setRequestHeader("X-RequestDigest", digest);
		xhttp2.setRequestHeader("Accept", "application/json;odata=verbose;charset=utf-8");
        xhttp2.setRequestHeader("Content-Type", "application/json;odata=verbose;charset=utf-8");
		xhttp2.send(payload);
	}
};

xhttp.open("GET", "https://simedev.sharepoint.com/sites/tea-point/_api/web/PageContextCore");
// xhttp.open("GET", "https://woonbedrijf.sharepoint.com/sites/intranet-hrm/_api/web/PageContextCore");
xhttp.setRequestHeader("Accept","application/json;odata=nometadata");
xhttp.send();