<%-- 
     Document   : translator
     Created on : Oct 11, 2018, 11:32:48 AM
     Author     : porpiraya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>นักแปล</title>
        <link href="https://fonts.googleapis.com/css?family=Inknut+Antiqua:400,700,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Mitr" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="style.css">
        <style>
            h2 {
                font-weight: normal;
                font-size: 1.5em;
                font-weight: 200;
                line-height: 1.2em;
                margin-top: 20px;
            }
            h3 {
                font-variant: small-caps;
                font-size: 0.9em;
                letter-spacing: 0.5px;
                font-weight: 200;
                line-height: 0em;
                margin-bottom: 30px;
                letter-spacing: 1px;
            }
            .column{
                padding: 5%;
                -moz-column-count:3; /* Firefox */
                -webkit-column-count:3; /* Safari and Chrome */
                column-count:3;
            }
            .profile-form {
                max-width: 400px;
                min-width: 290px;
                width: 100%;
                position: relative;
                padding: 10px;
                padding-right: 20px;
                transform: translate(0%,0);
                border-radius: 5px;
                background: #fff;
                border: 2px solid #003489;
                box-shadow: 8px 8px 0px 0px #003489;
                margin-bottom: 100px;
            }
            .profile-form .img {
                border-radius: 50%;
                position: relative;
                top: 20px;
                left: 30%;
                z-index: 1;
                max-width: 90px;
                opacity: 1;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            }
        </style>
    </head>

    <body>
        <br><br>
        <div class="header">
            <center><h1>นักแปล</h1></center>
        </div>

        <div class="column">
            <div class="profile-form">
                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/profile-sample4.jpg" alt="profile1" class="img"/><br><br><br><br><br><br>
                <h2>ชื่อนักแปล</h2><br><br><br><br> 
                <h3>SKILL : </h3>
                <h3>LANGUAGE : </h3>
                <center><button>
                        <div class = "button-text">จ้าง</div>
                    </button></center>
            </div>
            <div class="profile-form">
                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/profile-sample1.jpg" alt="profile4" class="img"/><br><br><br><br><br><br>
                <h2>ชื่อนักแปล</h2><br><br><br><br> 
                <h3>SKILL : </h3>
                <h3>LANGUAGE : </h3>
                <center><button>
                        <div class = "button-text">จ้าง</div>
                    </button></center>
            </div>
            <div class="profile-form">
                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/profile-sample2.jpg" alt="profile2" class="img"/><br><br><br><br><br><br>
                <h2>ชื่อนักแปล</h2><br><br><br><br> 
                <h3>SKILL : </h3>
                <h3>LANGUAGE : </h3>
                <center><button>
                        <div class = "button-text">จ้าง</div>
                    </button></center>
            </div>
            <div class="profile-form">
                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/profile-sample7.jpg" alt="profile5" class="img"/><br><br><br><br><br><br>
                <h2>ชื่อนักแปล</h2><br><br><br><br> 
                <h3>SKILL : </h3>
                <h3>LANGUAGE : </h3>
                <center><button>
                        <div class = "button-text">จ้าง</div>
                    </button></center>
            </div>
            <div class="profile-form">
                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/profile-sample5.jpg" alt="profile3" class="img" /><br><br><br><br><br><br>
                <h2>ชื่อนักแปล</h2><br><br><br><br> 
                <h3>SKILL : </h3>
                <h3>LANGUAGE : </h3>
                <center><button>
                        <div class = "button-text">จ้าง</div>
                    </button></center>
            </div>
            <div class="profile-form">
                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/profile-sample6.jpg" alt="profile6" class="img" /><br><br><br><br><br><br>
                <h2>ชื่อนักแปล</h2><br><br><br><br> 
                <h3>SKILL : </h3>
                <h3>LANGUAGE : </h3>
                <center><button>
                        <div class = "button-text">จ้าง</div>
                    </button></center>
            </div>
        </div>
    </body>
</html>