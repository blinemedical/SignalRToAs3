﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="ServerRoot._Default"  %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="pragma" content="no-cache"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <title>As3 SignalR bridge</title>
    <script src="AC_OETags.js" type="text/javascript"></script>
    
    <link rel="Shortcut Icon" href="favicon.ico">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    

    <style>
        html
        {
            background-color: #f1f1f1;
        }
        body
        {
            margin: 0px;
            overflow: hidden;
        }
    </style>

    <script type="text/javascript">
        <!--
        // -----------------------------------------------------------------------------
        // Globals
        // Major version of Flash required
        var requiredMajorVersion = 10;
        // Minor version of Flash required
        var requiredMinorVersion = 0;
        // Minor version of Flash required
        var requiredRevision = 0;
        // -----------------------------------------------------------------------------
        // -->
    </script>
</head>
<body scroll="no">
    <script language="JavaScript" type="text/javascript" src="history.js"></script>
    <script language="JavaScript" type="text/javascript">
<!--
        function getWindowWidth() {
            var windowWidth = 0;
            if (typeof (window.innerWidth) == 'number') {
                windowWidth = window.innerWidth;
            } else {
                if (document.documentElement && document.documentElement.clientWidth) {
                    windowWidth = document.documentElement.clientWidth;
                } else {
                    if (document.body && document.body.clientWidth) {
                        windowWidth = document.body.clientWidth;
                    }
                }
            }
            return windowWidth;
        }

        function getWindowHeight() {
            var windowHeight = 0;
            if (typeof (window.innerHeight) == 'number') {
                windowHeight = window.innerHeight;
            } else {
                if (document.documentElement && document.documentElement.clientHeight) {
                    windowHeight = document.documentElement.clientHeight;
                } else {
                    if (document.body && document.body.clientHeight) {
                        windowHeight = document.body.clientHeight;
                    }
                }
            }
            return windowHeight;
        }

        function centerRequirements() {
            var requirementsBox = document.getElementById("requirementsBox");
            requirementsBox.style.left = (getWindowWidth() - 450) / 2 + 'px';
            requirementsBox.style.top = (getWindowHeight() - 294) / 2 + 'px';
        }

        function getSWF() {
            if (navigator.appName.indexOf("Microsoft") != -1) {
                return window['TestApplication'];
            } else {
                return document['TestApplication'];
            }
        }

        function getFlashInstaller() {
            // isIE, isWin, ans isOpera set in AC-OETags.js
            var isFirefox = navigator.userAgent.match(/Firefox/) != null;
            var isWebKit = navigator.userAgent.match(/WebKit/) != null; // Chrome or Safari
            var isMac = navigator.userAgent.match(/Mac/) != null;
            var installerFileName = "";
            if (isWin && isIE) {
                installerFileName = "WIN_IE";
            }
            else if (isWin && (isOpera || isFirefox || isWebKit)) {
                installerFileName = "WIN_OTHER";
            }
            else if (isMac && (isOpera || isFirefox || isWebKit)) {
                installerFileName = "MAC_ALL";
            }
            return installerFileName;
        }

        function windowClosed(e) {
            window.onbeforeunload = null;
            var application = getSWF();
            application.windowClose();
        }

        // Version check based upon the values defined in globals
        var hasRequestedVersion = DetectFlashVer(requiredMajorVersion, requiredMinorVersion, requiredRevision);

        if (hasRequestedVersion) {
            // if we've detected an acceptable version
            // embed the Flash Content SWF when all tests are passed
            AC_FL_RunContent(
			        "src", "TestApplication",
			        "width", "100%",
			        "height", "100%",
			        "align", "middle",
			        "id", "AutoUpdateServer",
			        "quality", "high",
			        "bgcolor", "#f1f1f1",
			        "name", "TestApplication",
			        "flashvars", 'historyUrl=history.htm',
				    "allowFullScreen", "true",
			        "allowScriptAccess", "sameDomain",
			        "type", "application/x-shockwave-flash",
			        "pluginspage", "http://www.adobe.com/go/getflashplayer"
	        );
        } else {

            var alternateContent = '<map id="requirementsMap" name="requirementsMap">' +
                                   '<area shape="rect" coords="284,238,418,265" href=DownloadNewPlayer.aspx?installer=' + getFlashInstaller() + ' alt="Download Flash" />' +
                                   '</map>' +
                                   '<img id="requirementsBox" src="requirements_box.jpg" style="border: none; position: absolute;" usemap="#requirementsMap"></div>';
            document.write(alternateContent);  // insert non-flash content
            centerRequirements();

            window.onresize = centerRequirements;

        }
        // -->
    </script>

    <noscript>
        <h1>JavaScript is required to run this application.</h1>
    </noscript>
    <iframe name="_history" src="history.htm" frameborder="0" scrolling="no" width="22" height="0"></iframe>
    <script type="text/javascript" src="Preloader.aspx"></script>

    <script type="text/javascript" src="Scripts/json2.js" ></script>
    <script type="text/javascript" src="Scripts/jquery-1.7.2.min.js" ></script>
    <script type="text/javascript" src="Scripts/jquery.signalR-0.5.2.min.js" ></script>
    <script src="signalr/hubs"></script>
    <script type="text/javascript" src="Scripts/app.js" ></script>


</body>

   

</html>
