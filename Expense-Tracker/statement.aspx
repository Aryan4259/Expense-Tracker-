<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="statement.aspx.cs" Inherits="Expense_Tracker.Expense_Tracker.statement" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="UFT-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Expense Tracker | Incomes</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link rel="icon" type="image/png" href="#" sizes="32x32" />
        <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@500&family=Special+Elite&family=Spectral+SC:wght@500&display=swap" rel="stylesheet" />
        <style>
            * 
            {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
                font-family: 'Inter', Sans-Serif;
                list-style: none;
                text-decoration: none;
                scroll-behavior: smooth;
                border: none;
                outline: none;
            }
            :root 
            {
                --bg-color: #191919;
                --secont-bg-color: #101010;
                --main-color: #fff;
                --text-color: #000;
                --second-color: #000;
                --other-color: #808080;
                --h1-font:7rem;
                --h2-font: 7rem;
                --p-font: 1.2rem;
            }

            body 
            {
                color: #000;
            }

            header 
            {
                position: fixed;
                top: 0;
                right: 0;
                z-index: 1000;
                width: 100%;
                display: flex;
                align-items: center;
                justify-content: space-between;
                background: white;
                opacity: 0.8;
                padding: 28px 11%;
                border-bottom: 1px solid transparent;
                transition: all ease .50s;   
            }

            .logo 
            {
               color: #000;
               font-size: 40px;
               font-weight: bold;    
            }

            .navlist 
            {
                display: flex;    
            }

            #menu-icon 
            {
                font-size: 42px;
                color: var(--text-color);
                z-index: 10001;
                cursor: pointer;
                display: none;
            }

            .nevlist a, li 
            {
                color: var(--second-color);
                font-size: 25px;
                font-weight: 600;
                transition: all ease .40s;
                font-family: 'Special Elite', Serif;
            }

            .nevlist a:hover 
            {
                color: black;
                font-size: 30px;
                transition; all ease .30s;
                border-bottom: #000 2px solid;
            }

            section 
            {
                padding: 150px 5% 100px;
            }
            
            .heading 
            {
                display: flex;
                justify-content: space-between;
                gap: 4rem;
                align-items: center;
                font-size: 30px;
                font-weight: 600;
                background-color: #407DBD;
                height: 75px;
                width: auto;
                color: #fff;
                padding: 0 20px;
                margin-bottom: 25px;
            }
            
            .data 
            {
                display: flex;
                align-items: center;
                margin-top: 10px;
                font-size: 25px;
                background-color: #4689CE;
                height: 35px;
                width: auto;
                color: #fff;
                padding: 0 0 0 30px;
            }
            
            .heading_sub1 
            {
                width: 10px;
                padding: 0px;
            }
            
            .heading_sub2 
            {
                width: 10px;
                margin-left: 165px;
                padding: 0px;
            }
            .heading_sub3 
            {
                width: 100px;
                margin-left: 175px;
                padding: 30px;
            }
            
            .heading_sub4 
            {
                width: 100px;
                margin-left: 97px;
                padding: 0px;
            }
            
            .heading_sub5
            {
                width: 150px;
                margin-left: 93px;
                padding: 0px;
            }
            
            .heading_sub6
            {
                width: 100px;
                margin-left: 55px;
                padding: 0px;
            }
            .heading_sub7
            {
                width: 100px;
                margin-left: 55px;
                margin-right: 33px;
                padding: 0px;
            }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- header section -->
        <header class="sticky">
            <span class="logo">Expense Tracker</span>
            <div class="fa-solid fa-bars" id="menu-icon"></div>
            <ul class="navlist">
                <li><a href="Home.aspx">Home</a></li>
                <li><a href="analyze.aspx">/&nbsp;Analyze</a></li>
                <li>&nbsp;/&nbsp;Expense</li>
            </ul>
        </header>

        <!-- main section-->
        <section class="income_main">
            <div class="heading">
                <div class="heading_sub1">Income</div>
                <div class="heading_sub2">Expense</div>
                <div class="heading_sub3">Category</div>
                <div class="heading_sub4">Payment Type</div>
                <div class="heading_sub5">By Whom</div>
                <div class="heading_sub6">Date</div>
                <div class="heading_sub7">Balance</div>
            </div>
            <div class="data">
                <div class="heading_sub1">Income</div>
                <div class="heading_sub2">Expense</div>
                <div class="heading_sub3">Category</div>
                <div class="heading_sub4">Payment Type</div>
                <div class="heading_sub5">by Whom</div>
                <div class="heading_sub6">Date</div>
                <div class="heading_sub7">Balance</div>
            </div>
        </section>
    </form>
</body>
</html>

