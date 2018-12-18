<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Home Page</title>


        <link href="css/style_homepage.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Mitr" rel="stylesheet">
       

   <%
            String id_customer = (String) session.getServletContext().getAttribute("id_customer");
            if (id_customer == null) {
                //ยังไม่เข้าสู่ระบบ
        %>

    <div class="topnav">
        <div class="topnav-right">
            <a href="Homepage.jsp">หน้าหลัก</a>
            <a href="Register.jsp">สมัครสมาชิก</a>
            <a href="Login.jsp">เข้าสู่ระบบ</a>
        </div>
    </div>

    <% } else { %>

    <div class="topnav">
        <div class="topnav-right">
            <a href="Homepage.jsp">หน้าหลัก</a>
            <a href="Profile.jsp"> <%= id_customer%> </a>
            <a href="LogoutServlet">ออกจากระบบ</a>
        </div>
    </div>

    <% }
    %>

    <script type="text/javascript">
        var speed = 80; // lower number for faster
        var flakes = 100; // number of flakes
        var colour = "white"; // colour of flakes
        var slush = 10; // set to '0' for no slush or otherwise set to height at which slush melts

        var flks = new Array();
        var flkx = new Array();
        var flky = new Array();
        var fldy = new Array();
        var slss = new Array();
        var slsh = new Array();
        var swide, shigh, boddie;
        window.onload = function () {
            if (document.getElementById) {
                boddie = document.createElement("div");
                boddie.style.position = "fixed";
                boddie.style.top = "0px";
                boddie.style.left = "0px";
                boddie.style.width = "1px";
                boddie.style.height = "1px";
                boddie.style.overflow = "visible";
                boddie.style.backgroundColor = "transparent";
                boddie.style.opacity = ".7";
                document.body.appendChild(boddie);
                set_width();
                for (var i = 0; i < flakes; i++) {
                    flks[i] = createDiv(3, 3, colour);
                    flkx[i] = 3 * Math.floor(Math.random() * swide / 3);
                    flky[i] = Math.floor(Math.random() * shigh);
                    fldy[i] = 2 + Math.floor(Math.random() * 4);
                    flks[i].style.left = flkx[i] + "px";
                    flks[i].style.top = flky[i] + "px";
                    boddie.appendChild(flks[i]);
                }
                setInterval("let_it_snow()", speed);
            }
        };
        function createDiv(height, width, colour) {
            var div = document.createElement("div");
            div.style.position = "absolute";
            div.style.height = height + "px";
            div.style.width = width + "px";
            div.style.overflow = "hidden";
            div.style.backgroundColor = colour;
            return (div);
        }
        window.onresize = set_width;
        function set_width() {
            var sw_min = 999999;
            var sh_min = 999999;
            if (document.documentElement && document.documentElement.clientWidth) {
                if (document.documentElement.clientWidth > 0)
                    sw_min = document.documentElement.clientWidth;
                if (document.documentElement.clientHeight > 0)
                    sh_min = document.documentElement.clientHeight;
            }
            if (typeof (self.innerWidth) != "undefined" && self.innerWidth) {
                if (self.innerWidth > 0 && self.innerWidth < sw_min)
                    sw_min = self.innerWidth;
                if (self.innerHeight > 0 && self.innerHeight < sh_min)
                    sh_min = self.innerHeight;
            }
            if (document.body.clientWidth) {
                if (document.body.clientWidth > 0 && document.body.clientWidth < sw_min)
                    sw_min = document.body.clientWidth;
                if (document.body.clientHeight > 0 && document.body.clientHeight < sh_min)
                    sh_min = document.body.clientHeight;
            }
            if (sw_min == 999999 || sh_min == 999999) {
                sw_min = 800;
                sh_min = 600;
            }
            swide = sw_min - 3;
            shigh = sh_min;
            if (slush) {
                if (swide / 3 > slss.length)
                    for (i = slss.length; i < swide / 3; i++) {
                        if (!slsh[i])
                            slsh[i] = 3;
                        slss[i] = createDiv(slsh[i], 3, colour);
                        boddie.appendChild(slss[i]);
                    }
                for (i = 0; i < swide / 3; i++) {
                    slss[i].style.height = slsh[i] + "px";
                    slss[i].style.top = shigh - slsh[i] + "px";
                    slss[i].style.left = 3 * i + "px";
                }
                if (i < slss.length && slss[i].style.left != "-3px")
                    for (; i < slss.length; i++)
                        slss[i].style.left = "-3px";
            }
        }
        function let_it_snow(c) {
            var i, x, o = 0, z = 0;
            for (i = 0; i < flakes; i++) {
                flky[i] += fldy[i];
                x = Math.floor(flkx[i] / 3);
                if (slush) {
                    o += slsh[x];
                    if (flky[i] >= shigh - slsh[x]) {
                        if (x < swide && slsh[x] > slsh[x + 1] + 3)
                            x++;
                        else if (x > 0 && slsh[x] > slsh[x - 1] + 3)
                            x--;
                        slss[x].style.top = shigh - (slsh[x] += 3) + "px";
                        slss[x].style.height = slsh[x] + "px";
                        flky[i] = shigh;
                    }
                }
                if (flky[i] >= shigh || flkx[i] > swide) {
                    flky[i] = 0;
                    fldy[i] = 2 + Math.floor(Math.random() * 4);
                    flkx[i] = 3 * Math.floor(Math.random() * swide / 3);
                    flks[i].style.left = flkx[i] + "px";
                    z++;
                }
                flks[i].style.top = flky[i] + "px";
            }
            if (o > flakes * slush)
                for (i = 0; i < slsh.length; i++)
                    if (slsh[i] > 3)
                        slsh[i]--;
            if (z || o > flakes * slush)
                set_width();
        }
// ]]>
    </script>



</head>

<body>


    <header>
        <div class="container">
            <div class="header-content">
                <div class="header-content-inner">
                    <h1>Welcome <br> To <br> Translator Market Place</h1>
                    <p>เว็บไซต์ที่เป็นเครื่องมือช่วยคุณในการแปลเอกสาร การันตีคุณภาพผลงานจากนักแปลมือดี</p>
                </div>
            </div>
        </div>
    </header>

    <div style ="background-color:#24305e"width:600px:high:300px:">

        <br>
        <br>
        <br>
        <br>
        <br>
        <center> <h2>About This Site </h2> </center>


        <div class="containers">
            <div class="box first">
               

                <span class="icon-cont">
                      <i> <img src="https://www.img.in.th/images/3ff09a432550034c065b2d801777b8de.png" width="80px" ></i>
                   
                </span>

                <h3>Register</h3>
                    <h7> สมัครสมาชิก <br><br> เพื่อเริ่มใช้งาน </h7>
            </div>

            <div class="box second">
                <span class="icon-cont">
                   <i> <img src="https://sv1.picz.in.th/images/2018/12/18/9kxczR.png" width="80px" ></i>

                </span> 
                
                <h3>Create Order</h3>
                
                <h7>สร้างรายการจ้างแปล</h7>
                
            </div>

            <div class="box third">
                <span class="icon-cont">
                    <i> <img src="https://sv1.picz.in.th/images/2018/12/17/9fK3Mz.png" width="80px" ></i>
                </span> 
                
                <h3>Choose</h3>
                <h7>เลือกนักแปล <br><br> ที่ต้องการ</h7>
            </div>

            <div class="box fouth">
                <span class="icon-cont">
                    <i> <img src="https://www.img.in.th/images/028b93f0b1f6fb1cd1c7d3fc22f17656.png" width="80px" ></i>
                </span>
                <h3>Wait</h3>
                <h7> รองาน </h7>
            </div>

            <div class="box fifth">
                <span class="icon-cont">
                  <i> <img src="https://sv1.picz.in.th/images/2018/12/18/9kEiw9.png" width="80px" ></i>
                </span>

                <h3>Check</h3>

                <h7> ตรวจสอบ <br><br> ความถูกต้อง</h7>

            </div>
            
            <div class="box sixth">
                <span class="icon-cont">
                    <i> <img src="https://sv1.picz.in.th/images/2018/12/18/9k5VGf.png" width="80px" ></i>
                </span>

                <h3>Pay</h3>

                <h7> ชำระเงิน</h7>

            </div>
            
            <div class="box seventh">
                <span class="icon-cont">
                    <i> <img src="https://www.img.in.th/images/a98cf3547bb15cb44b1d4387bab6abbd.png" width="80px" ></i>
                </span>

                <h3>Get</h3>

                <h7> รับไฟล์งาน </h7>

            </div>

            <div class="box eighth">
                <span class="icon-cont">
                    <i> <img src="https://sv1.picz.in.th/images/2018/12/16/9BIQF8.png" width="80px" ></i>
                </span>

                <h3>Apply For</h3>

                <h7> ร่วมเป็นส่วนนึง <br><br> กับพวกเรา <br><br>เพียงสมัครเข้ามา</h7>

            </div>


        </div>

        <br>
        <br>
        <div style ="background-color:black"width:50px:high:50px:">
             <p align = "right"><font size = "2"> By Pech-Pech.co.th</font></p><br>

        </div>
</body>

</html>
