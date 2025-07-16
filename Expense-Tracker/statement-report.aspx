<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="statement-report.aspx.cs" Inherits="Expense_Tracker.Expense_Tracker.statement" EnableEventValidation="False" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UFT-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Expense Tracker | Statement</title>
    <link rel="icon" type="image/png" href="#" sizes="32x32" />
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
                --second-bg-color: #101010;
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
                padding: 150px 1% 100px;
            }
            
            .heading 
            {
                display: flex;
                justify-content: space-between;
                align-items: center;
                gap: 2rem;
                font-size: 25px;
                font-weight: 600;
                background-color: #407DBD;
                height: 75px;
                width: auto;
                color: #fff;
                padding: 0 10px;
                margin-bottom: 25px;
                margin-top: 25px;
            }
            
            .heading_date 
            {
                display: flex;
                gap: 2rem;
                font-size: 30px;
                font-weight: 600;
                background-color: #407DBD;
                height: 75px;
                width: auto;
                color: #ffffff;
                padding: 0 10px;
                margin-bottom: 25px;
                align-items: center;
            }
            
            .date
            {
                font-size: 20px;
                height: 35px;
                width: 250px;
                padding: 5px;
                border-radius: 8px;
            }
            
            .income_main .income_btn 
            {
                font-size: 20px;
                height: 35px;
                width: 150px;
                padding: 5px;
                border-radius: 8px;
            }
            .ddl
            {
                font-size: 20px;
                height: 35px;
                width: 250px;
                padding: 5px;
                border-radius: 8px;
            }

            .income_btn 
            {
                color: #4689CE;
                background-color: #fff;
                font-weight: 600;
            }

            .income_btn:hover 
            {
                background-color: #407DBD;
                transition: all ease 0.5s;
            }
            .UpDeBtn 
            {
                font-size: 20px;
                font-weight: 600;
                background-color: #fff;
                height: 35px;
                width: 100px;
                color: #4689ce;
                padding: 5px;
                bordor-radius: 8px;
            }
            .text-center
            {
                font-family: 'Caveat', Cursive;
                font-size: 4rem;
                font-weight: 800;
                margin-bottom: 60px;
                color: #000;
                text-align: center;
            }

            .tran_main 
            {
                display: flex;
                justify-content: center;
                gap: 7rem;
                align-items: center;
            }

            .transaction_sub 
            {
                width: 400px;
                height: 190px;
                border-radius: 20px;
                padding: 35px 10px 10px 10px;
                background-color: #9EDFFF;
                text-align: center;
            }

            .transaction_sub span 
            {
                font-size: 40px;
                font-weight: 700;
                color: #000;
                font-family: 'Special Elite', Serif;
            }

            .transaction_sub b 
            {
                color: White;
            }
            
            .data
            {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 10px;
                font-size: 25px;
                background-color: #4689ce;
                gap: 2rem;
                height: 45px;
                width: auto;
                color: #fff;
                padding: 0 10px 0 10px;
            }
            .heading_sub1 
            {
                width: 135px;
            }
            
            .heading_sub2 
            {
                width: 100px;
            }
            .heading_sub3 
            {
                width: 100px;
            }
            
            .heading_sub4 
            {
                width: 100px;
            }
            
            .heading_sub5
            {
                width: 100px;
            }
            
            .heading_sub6
            {
                width: 100px;
            }
            .heading_sub7
            {
                width: 100px;
            }
            
            .heading_sub8
            {
                width: 100px;
            }
            .heading_sub9
            {
                width: 100px;
            }
            
            .heading_sub10
            {
                width: 100px;
            }
            .print
            {
                display: flex;
                justify-content: space-between;
                align-items: center;
                gap: 6rem;
                font-size: 30px;
                font-weight: 600;
                background-color: #407DBD;
                height: 75px;
                width: auto;
                color: #fff;
                padding: 0 10px;
                margin-top: 25px;
            }
            @media print 
            {
                .print, header
                {
                    display: none;
                }
                .heading_sub1
                {
                    width: 300px;    
                }
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
                <li><a href="Home.aspx" style="color: #000000">Home</a></li>
                <li><a href="analyze.aspx" style="color: #000000">/&nbsp;Analyze</a></li>
                <li>&nbsp;/&nbsp;Statement</li>
            </ul>
        </header>

        <!-- main section-->
        <section class="income_main">
        <div class="text-center">Statement</div>
        <asp:Repeater ID="IncomeRepeater" runat="server">
        <HeaderTemplate>
                <div class="heading">
                    <div class="heading_sub1">Date</div>
                    <div class="heading_sub2">Income</div>
                    <div class="heading_sub3">Expense</div>
                    <div class="heading_sub4">Category</div>
                    <div class="heading_sub5">Payment Type</div>
                    <div class="heading_sub6">By Whom</div>
                    <div class="heading_sub7">To Whom</div>
                    <div class="heading_sub8">Balance</div>
                    <div class="heading_sub9">Edit</div>
                    <div class="heading_sub10">Delete</div>
                </div>
                </HeaderTemplate>

                <ItemTemplate>
                <div class="data">
                    <div class="heading_sub1"><%# Convert.ToDateTime(Eval("date")).ToShortDateString() %></div>
                        <div class="heading_sub2"><%# Eval("income") == DBNull.Value ? "0" : Eval("income") %></div>
                        <div class="heading_sub3"><%# Eval("expense") == DBNull.Value ? "0" : Eval("expense") %></div>
                        <div class="heading_sub4"><%# Eval("category") %></div>
                        <div class="heading_sub5"><%# Eval("pay_type") %></div>
                        <div class="heading_sub6"><%# Eval("by_whom") == DBNull.Value ? "-" : Eval("by_whom") %></div>
                        <div class="heading_sub7"><%# Eval("to_whom") == DBNull.Value ? "-" : Eval("to_whom") %></div>
                        <div class="heading_sub8"><%# Eval("balance") == DBNull.Value ? "0" : Eval("balance")%></div>
                    <div class="heading_sub9"><asp:Button ID="EditButton" runat="server" class="UpDeBtn" Text="Edit" OnClick="EditButton_Click"></asp:Button></div>
                    <div class="heading_sub10"><asp:Button ID="DeleteButton" runat="server" class="UpDeBtn" Text="Delete" CommandArgument='<%# Eval("id") %>' OnClick="DeleteButton_Click"></asp:Button></div>
                </div>
            </ItemTemplate>
            </asp:Repeater>
                <div class="print">
                    <div><span><asp:Button ID="btnPrint" runat="server" class="income_btn" Text="print" OnClientClick="javascript:printReport()"></asp:Button></span></div>
                </div>
        </section>
    </form>
    <script>
        function printReport() {
            window.print();
        }
    </script>
</body>
</html>