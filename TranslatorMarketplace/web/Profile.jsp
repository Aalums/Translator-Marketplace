<%-- 
    Document   : newjsp
    Created on : Oct 10, 2018, 1:59:34 PM
    Author     : windypelo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >

    <head>
        <meta charset="UTF-8">
        <title>สร้างรายการจ้างแปล</title>
        <link href="https://fonts.googleapis.com/css?family=Inknut+Antiqua:400,700,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Mitr" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">


        <link rel="stylesheet" href="css/style.css">




    </head>

    <body>

        <div class="logo">  
            <img src="css/TRANSLATOR.png" alt="logo"  height="156" width="300">
        </div>

    <center>
        <div id='cssmenu'>
            <ul>
                <li><a href='#'>หน้าหลัก</a></li>
                <li><a href='#'>สร้างรายการ</a></li>
                <li><a href='#'>ออเดอร์</a></li>       
                <li><a href='#'>สถานะ</a></li>
                <li class='active'><a href='#'>โปรไฟล์</a></li>
            </ul>
        </div>
    </center>

    <body>
        
       <aside class="profile-card">

            <header>

                <!-- here’s the avatar -->
                <a href=#>
                    <img src="https://preview.ibb.co/fH4K5f/eye.jpg" alt="eye"></a>
                </a>

                <!-- the username -->
                <h1>นันทพร ชูสวัสดิ์</h1>

                <!-- and role or location -->
                <h2>นักแปล</h2>

            </header>

            <!-- bit of a bio; who are you? -->
            <div class="profile-bio">
                <p> E-mail: eyelovekmitl@gmail.com </p><br><br>
                <p>เบอร์โทร: 066-6787654</p><br><br>
                <p>ได้หมดถ้าสดชื่น เพราะการเรียนมันง่ายไป</p>

            </div>
            
            
        
            <center>
<!--                <form action="Translator.html">
    <button type="submit" value="" /> 
    <div class = "button-text">
                        สมัครเป็นนักแปล
                    </div>
              </form>
            -->
                 <form action="Order_Translator.jsp"><button type="submit" value="" />
                    <div class = "button-text">
                       ออเดอร์นักแปล
                    </div>
             </form>
            </center>



        </aside>


    </body>
    
    <br><br>
    
    


</html>