<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Home Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/style.css">

    <div class="topnav">
        <div class="topnav-right">
            <a href="Register.jsp">สมัครสมาชิก</a>
            <a href="Login.html">เข้าสู่ระบบ</a>
        </div>
    </div>
    <div class="container">
        <div class="logo">  
            <img src="css/TRANSLATOR.png" alt="logo"  height="156" width="300">
        </div>

    </div>


    <style>


        .containers {
            width: 960px;
            margin: 50px auto;
            padding: 5px;
            padding-left: 20px;
            psdding-right: 0;
        }

        .box {
            width: 24%;
            height: 250px;
            margin: 0.2%;
            padding: 15px;
            box-sizing: border-box;
            display: inline-block;
            background: #036C81;
            position: relative;
            overflow: hidden;
            box-shadow: 0 0 5px rgba(0,0,0,0.4);
            cursor: pointer;
        }
        .box .icon-cont {
            border: 6px solid rgba(255,255,255,0.3);
            border-radius: 50%;
            width: 75px;
            height: 75px;
            margin: 20px auto;
            display: block; 
            text-align: center;

            position: absolute;
            top: 10px;
            left: 0;
            right: 0;
            z-index: 5;

            box-shadow: 0 0 0 0px rgba(255,255,255,0.5), 0 0 0 0px rgba(3, 108, 129, 0.5);
        }
        .box .icon-cont i {
            vertical-align: middle;
            position: absolute;
            top: -3px;
            left: -3px;
        }
        .box:hover .icon-cont {
            animation: shady 4s linear infinite;
        }

        @keyframes shady {
            0% {box-shadow: 0 0 0 0px rgba(255,255,255,0.5), 0 0 0 0px rgba(3, 108, 129, 0.5);}
            20% {box-shadow: 0 0 0 100px rgba(255,255,255,0), 0 0 0 0px rgba(3, 108, 129, 0);}
            20.1% {box-shadow: 0 0 0 0px rgba(255,255,255,0.5), 0 0 0 0px rgba(3, 108, 129, 0.5);}
            50% {box-shadow: 0 0 0 0px rgba(255,255,255,0.5), 0 0 0 0px rgba(3, 108, 129, 0.5);}
            70% {box-shadow: 0 0 0 100px rgba(255,255,255,0), 0 0 0 0px rgba(3, 108, 129, 0);}
            70.1% {box-shadow: 0 0 0 0px rgba(255,255,255,0.5), 0 0 0 0px rgba(3, 108, 129, 0.5);}
            100% {box-shadow: 0 0 0 0px rgba(255,255,255,0.5), 0 0 0 0px rgba(3, 108, 129, 0.5);}
        }

        .box h3 {
            color: #fff;
            font-family: 'Open Sans', Arial, sans-serif;
            font-weight: 300;
            font-size: 18px;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 2px;
            padding: 15px;
            border-bottom: 1px solid rgba(255,255,255,0);

            position: absolute;
            top: 100px;
            width: 70%;
            left: 15%;
            z-index: 4;
        }

        .box h3 {
            color: #fff;
            font-family: 'Open Sans', Arial, sans-serif;
            font-weight: 300;
            font-size: 18px;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 2px;
            padding: 15px;
            border-bottom: 1px solid rgba(255,255,255,0);

            position: absolute;
            top: 100px;
            width: 70%;
            left: 15%;
            z-index: 4;
        }.box h7 {
            color: #fff;
            font-family: 'Open Sans', Arial, sans-serif;
            font-weight: 300;
            font-size: 1ภpx;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 2px;
            padding: 15px;
            border-bottom: 1px solid rgba(255,255,255,0);

            position: absolute;
            top: 145px;
            width: 70%;
            left: 15%;
            z-index: 4;
        }

        .box a.expand {
            width: 35px;
            height: 35px;
            background: #fff;
            font-weight: 600;
            color: #036C81;
            display: block;
            margin: 15px auto 25px;
            text-align: center;
            line-height: 35px;
            cursor: pointer;

            position: absolute;
            left: 0;
            right: 0;
            bottom: 10px;

        }
        .box a.expand span.minus {
            opacity: 0;
        }
        .box a.expand span.plus {
            opacity: 1;
            padding-left: 5px;
        }
        .box.selected a.expand {
            display: block;
            position: absolute;
            left: 180px;
            right: -29px;
            bottom: -39px;
            width: 80px;
            height: 50px;
            background: #eee;
            color: #036C81;
            transform: rotate(-45deg);
        }
        .box.selected a.expand span {
            display: block;
            position: absolute;
            top: -4px;
            left: 38px;
            transform: rotate(45deg);
            font-size: 24px;
        }


        .box.selected:hover .icon-cont {
            animation: none;
        }


        .span-2 {
            grid-column-end: span 2;
            grid-row-end: span 2;
        }

        .span-3 {
            grid-column-end: span 3;
            grid-row-end: span 4;
        }



        .carousel-fade {





            .carousel-inner {
                .item {
                    position: relative;
                    overflow: hidden;
                    width: 100%;
                }

                .item,
                .active.left,
                .active.right {
                    opacity: 0;
                }

                .active,
                .next.left,
                .prev.right {
                    opacity: 0;
                }


                .carousel-control {
                    z-index: 2;
                }
            }




            .carousel, 
            .carousel-inner, 
            .carousel-inner .item {
                height: 100%;
                left: 40px;
            }



            $('.carousel').carousel({
                interval: 2000
            })



        </style>

    </head>

    <center><h1>Welcome To Translator Market Place</h1></center>

    <body background="https://sv1.picz.in.th/images/2018/12/16/9BW8Rt.jpg">
        <div class="container">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->

                <center><div class="carousel-inner">
                        <div class="item active">
                            <img src="https://sv1.picz.in.th/images/2018/12/17/9fEvDb.png" alt="9fEvDb.png" border="0" />

                        </div>

                        <div class="item">
                            <img src="https://sv1.picz.in.th/images/2018/12/17/9fEvDb.png" alt="9fEvDb.png" border="0" />
                        </div>

                        <div class="item">
                            <img src="https://sv1.picz.in.th/images/2018/12/17/9fEvDb.png" alt="9fEvDb.png" border="0" />
                        </div>
                    </div></center>


            </div>
            <br>
            <br>
            <br>
            <br>

            <div>
                <center><h1>About This Site</h1></center>
                <center>________________________________________________</center>
            </div>

            <div class="containers">
                <div class="box first">


                    <span class="icon-cont">
                        <i> <img src="https://sv1.picz.in.th/images/2018/12/17/9fK3Mz.png" width="70px" ></i>
                    </span>

                    <h3>Hire</h3>


                    <h7>คุณสามารถเลือก <br><br> นักแปลที่คุณ <br><br> ต้องการได้</h7>



                </div>

                <div class="box second">
                    <span class="icon-cont">
                        <i> <img src="https://sv1.picz.in.th/images/2018/12/17/9fkYr8.png" width="70px" ></i>
                    </span> 

                    <h3>Wait</h3>

                    <h7>ใช้เวลาไม่นาน<br><br></h7>


                </div>

                <div class="box third">
                    <span class="icon-cont">
                        <i> <img src="https://sv1.picz.in.th/images/2018/12/16/9BITTy.png" width="70px" ></i>
                    </span> 

                    <h3>Get</h3>

                    <h7> ได้งานจริง <br><br> รับประกันคุณภาพ <br><br></h7>


                </div>

                <div class="box fouth">
                    <span class="icon-cont">
                        <i> <img src="https://sv1.picz.in.th/images/2018/12/16/9BIQF8.png" width="70px" ></i>
                    </span>

                    <h3>Apply For</h3>

                    <h7> ร่วมเป็นส่วนนึง <br><br> กับพวกเรา <br><br>เพียงสมัครเข้ามา</h7>

                </div>


                </body>
                </html>
