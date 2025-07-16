 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="analyze.aspx.cs" Inherits="Expense_Tracker.Expense_Tracker.analyze" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UFT-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Expense Tracker | Analyze</title>
    <link rel="icon" type="image/png" href="#" sizes="32x32" />
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <style>


                    :root {
            --main-color: #ffffff; /* White */
            --second-color: #3b8f00; /* Green */
            --bg-color: #2d2d2d; /* Dark Grey */
            --card-bg-color: #333; /* Dark Background for Cards */
            --border-color: #5f5f5f; /* Grey Border */
            --hover-bg-color: #32a832; /* Green Hover Background */
            --balance-text-color: #f5f5f5; /* Light Balance Text */
            --popup-bg-color: #111111; /* Black Popup Background */
            --popup-border-color: #ccc; /* Grey Popup Border */
        }

        /* Global Body Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #1c1c1c; /* Dark background for black theme */
            color: #e1e1e1; /* Light text for contrast */
            margin: 0;
            padding: 0;
        }



        /* Sidebar Styles */
.sidebar {
    background-color: #121212;
    padding: 1rem;
    width: 100%;
    max-width: 250px;
    height: 100vh;
    position: fixed;
    top: 0;
    left: 0;
    overflow-y: auto;
}

.sidebar ul {
    list-style-type: none;
    padding: 0;
}

.sidebar ul li {
    margin-bottom: 1.5rem;
}

.sidebar ul li a {
    color: #e1e1e1;
    text-decoration: none;
}

.sidebar ul li a:hover {
    text-decoration: underline;
}
.user-profile {
    text-align: center;
    margin-bottom: 2rem;
}

.profile-pic {
    border-radius: 50%;
    border: 2px solid #e1e1e1;
    margin-bottom: 1rem;
}


/* Sidebar container */
.sidebar {
    background-color: #121212;
    padding: 1rem;
    width: 100%;
    max-width: 250px;
    height: 100vh;
    position: fixed;
    top: 0;
    left: 0;
    overflow-y: auto;
    box-shadow: 2px 0 10px rgba(0, 0, 0, 0.7);
    font-family: 'Roboto', sans-serif;
    transition: max-width 0.3s ease, background-color 0.3s ease;
}

.sidebar:hover {
    max-width: 300px; /* Sidebar expands on hover */
    background-color: #1a1a1a; /* Slightly lighter color */
}

/* Sidebar header */
.sidebar-header {
    text-align: center;
    margin-bottom: 2rem;
    color: #e1e1e1;
    font-size: 1.5rem;
    font-weight: bold;
    text-transform: uppercase;
    letter-spacing: 2px;
}

/* List styling */
.sidebar ul {
    list-style-type: none;
    padding: 0;
    margin: 0;
}

.sidebar ul li {
    margin-bottom: 1.5rem;
    transition: transform 0.3s ease, background-color 0.3s ease, border 0.3s ease;
}

.sidebar ul li:hover {
    transform: translateX(10px); /* Slide right */
    background-color: #222222; /* Highlight background */
    border-left: 4px solid #0078d7; /* Add an accent border */
    border-radius: 8px;
}

/* Link styling */
.sidebar ul li a {
    color: #e1e1e1;
    text-decoration: none;
    display: flex;
    align-items: center;
    padding: 0.5rem 1rem;
    border-radius: 8px;
    position: relative;
    overflow: hidden;
    transition: color 0.3s ease, background-color 0.3s ease, box-shadow 0.3s ease;
}

.sidebar ul li a:hover {
    color: #ffffff;
    background-color: #444444;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.4); /* Add depth */
}

/* Add a glowing underline */
.sidebar ul li a::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 0;
    height: 2px;
    transition: width 0.3s ease;
}

.sidebar ul li a:hover::after {
    width: 100%; /* Expand underline */
}

/* Icon styling */
.icon {
    width: 24px;
    height: 24px;
    margin-right: 10px;
    vertical-align: middle;
    filter: invert(75%);
    transition: transform 0.3s ease, filter 0.3s ease;
}

.icon:hover {
    transform: rotate(360deg); /* Rotation animation */
    filter: invert(100%); /* Brighten icon on hover */
}

/* Active link styling */
.sidebar ul li.active {
    background-color: #333333;
    border-left: 4px solid #0078d7;
}

.sidebar ul li.active a {
    color: #ffffff;
    font-weight: bold;
}

/* Tooltip for expanded items */
.sidebar ul li a span.tooltip {
    visibility: hidden;
    opacity: 0;
    position: absolute;
    left: 110%;
    top: 50%;
    transform: translateY(-50%);
    background-color: #222222;
    color: #ffffff;
    padding: 0.3rem 0.6rem;
    border-radius: 4px;
    white-space: nowrap;
    transition: opacity 0.3s ease, visibility 0.3s ease;
}

.sidebar ul li a:hover span.tooltip {
    visibility: visible;
    opacity: 1;
}

/* User profile styling */
.user-profile {
    text-align: center;
    margin-bottom: 2rem;
    animation: fadeIn 0.8s ease;
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: scale(0.9);
    }
    to {
        opacity: 1;
        transform: scale(1);
    }
}

.profile-pic {
    border-radius: 50%;
    border: 3px solid #e1e1e1;
    margin-bottom: 1rem;
    width: 100px;
    height: 100px;
    object-fit: cover;
    transition: transform 0.3s ease, border-color 0.3s ease;
}

.profile-pic:hover {
    transform: scale(1.1); /* Zoom in on hover */
    border-color: #0078d7; /* Change border color */
}

.user-name {
    color: #e1e1e1;
    font-size: 1.2rem;
    font-weight: bold;
    margin-bottom: 0.5rem;
}

.user-role {
    color: #b3b3b3;
    font-size: 0.9rem;
}

/* Scrollbar styling */
.sidebar::-webkit-scrollbar {
    width: 8px;
}

.sidebar::-webkit-scrollbar-thumb {
    background-color: #333333;
    border-radius: 10px;
}

.sidebar::-webkit-scrollbar-thumb:hover {
    background-color: #555555;
}


            .content {
                margin-left: 270px;
                padding: 2rem;
                min-width: 300px;
                overflow-x: hidden;
            }

            .text-center {
                text-align: center;
                font-size: 2rem;
                margin-bottom: 2rem;
                color: #3b8f00; /* Green text for title */
            }

            .tran_main {
                display: flex;
                flex-wrap: wrap;
                gap: 1rem;
                justify-content: center;
            }

            .transaction_ {
                background-color: #333; /* Dark background for cards */
                border: 2px solid #5f5f5f; /* Grey Border */
                border-radius: 8px;
                padding: 1.5rem;
                width: 300px;
                display: flex;
                flex-direction: column;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin-bottom: 2rem;
                transition: all 0.3s ease;
            }

            .transaction_ span {
                color: #f5f5f5;
                font-weight: bold;
            }

            .transaction_ .transaction_sub1 {
                display: flex;
                justify-content: space-between;
                margin-bottom: 1rem;
            }

            .transaction_ .transaction_sub2 {
                font-size: 0.9rem;
                margin-bottom: 1rem;
                color: #e1e1e1;
            }

            .transaction_ b {
                color: #3b8f00; /* Green color for underline/border */
            }

            .income_btn {
                background-color: #3b8f00; /* Green button */
                color: #fff;
                padding: 0.5rem 1rem;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .income_btn:hover {
                background-color: #32a832; /* Lighter green on hover */
            }

            .transaction_ a {
                text-decoration: none;
            }

            .transaction_:hover {
                background-color: #444; /* Slightly lighter background on hover */
                transform: translateY(-5px); /* Lift the card on hover */
            }

            .transaction_ .transaction_sub1 b {
                flex-grow: 1;
                border-bottom: 1px solid #555;
                margin-left: 1rem;
                margin-right: 1rem;
            }







           /* Modal styles */
/* Modal styles */
.modal {
    display: none; /* Hidden by default */
    position: fixed;
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    background-color: rgba(0, 0, 0, 0.8); /* Dark semi-transparent background */
    padding-top: 60px; /* 60px from the top */
}

/* Modal content */
.modal-content {
    background-color: #333; /* Dark background */
    margin: 5% auto; /* Center the modal */
    padding: 20px;
    border: 1px solid #444; /* Subtle border */
    width: 80%; /* Set the width of the modal */
    max-width: 1200px; /* Maximum width */
    border-radius: 10px;
    color: #fff; /* White text for contrast */
}

/* Modal header */
.modal-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px;
    border-bottom: 1px solid #555; /* Subtle divider */
}

.modal-header h2 {
    margin: 0;
    font-size: 24px;
    color: #00FF7F; /* Green header text */
}

/* Close button */
.close {
    color: #aaa;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
}

.close:hover,
.close:focus {
    color: #fff;
    text-decoration: none;
}

/* Modal body */
.modal-body {
    padding: 20px;
    overflow-y: auto;
    max-height: 400px; /* Limit the height */
    background-color: #222; /* Slightly darker body */
    border-radius: 5px;
}

/* Data table layout */
.heading {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
    gap: 10px;
    margin-bottom: 10px;
}

.heading div {
    font-weight: bold;
    text-align: center;
    color: #00FF7F; /* Green column headers */
}

/* Data rows */
.data {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
    gap: 10px;
    padding: 10px 0;
    border-bottom: 1px solid #444; /* Subtle divider */
    color: #ddd; /* Light gray text */
}

.data div {
    text-align: center;
}



/* Print button container */
.print {
    display: flex;
    justify-content: flex-end;
    margin-top: 20px;
}

.income_btn {
    background-color: #00FF7F; /* Green */
    color: #333; /* Dark text */
    padding: 8px 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
}

.income_btn:hover {
    background-color: #00cc66; /* Darker green on hover */
}

/* Responsive layout */
@media (max-width: 768px) {
    .modal-content {
        width: 90%;
        margin-top: 20px;
    }

    .heading,
    .data {
        grid-template-columns: 1fr 1fr;
    }
}




/*bydate*/
.heading_date {
    display: flex;
    align-items: center;
    gap: 10px;
    background-color: #2C3E50; /* Dark theme background */
    padding: 10px;
    border-radius: 8px;
    justify-content: center;
}

.heading_date div {
    display: flex;
    align-items: center;
}

.date {
    padding: 8px 12px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
    background-color: #fff;
    color: #333;
    width: 140px;
}

.date:focus {
    border-color: #2980B9;
    outline: none;
    box-shadow: 0px 0px 5px rgba(41, 128, 185, 0.5);
}

.income_btn {
    background-color: #00FF7F;
    color: white;
    padding: 8px 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
    transition: 0.3s;
}



.fa-right-left {
    font-size: 18px;
    margin: 0 5px;
}

.validation {
    margin-left: 5px;
    font-size: 12px;
    font-weight: bold;
}

        </style>
</head>
<body>
            <form id="form1" runat="server">
                <main class="main-container">
            <aside class="sidebar">
            <!-- User Profile Section -->
            <div class="user-profile">
                <asp:Image ID="ProfilePic" runat="server" CssClass="profile-pic" Width="100px" Height="100px" />
                <h2 class="user-name"><asp:Label ID="UserNameLabel" runat="server"></asp:Label></h2>
            </div>

            <ul>
                <li><a href="Home.aspx">Dashboard</a></li>
                <li><a href="expense-report.aspx">Manage Expenses</a></li>
                <li><a href="income-report.aspx">Manage Income</a></li>
                <li><a href="budget-management.aspx">Budget Management</a></li>
                <li><a href="analyze.aspx">Reports & Analytics</a></li>
                <li><a href="setting.aspx">Settings</a></li>
                <li><a href="logout.aspx">Logout</a></li>
            </ul>


            </aside>
            <section class="content">
                <div class="text-center">Analyze</div>
                <div class="tran_main">

                   <!-- Income -->
                    <div class="transaction_">
                        <div class="transaction_sub1">
                            <span>Income</span>
                        </div>
                        <div class="transaction_sub2">
                            <span>Here We Have Arranged All Your Income by Date and Your Given Description Which You Can Analyze.</span>
                        </div>
                        <a href="javascript:void(0);"><span><asp:Button ID="ch1" class="income_btn" 
                            runat="server" Text="CHECK" OnClientClick="openModal('incomeModal'); return false;"></asp:Button></span></a>
                    </div>

                    <!-- Expense-->
                    <div class="transaction_">
                        <div class="transaction_sub1">
                            <span>Expense</span>
                        </div>
                        <div class="transaction_sub2">
                            <span>Track and analyze your spending in different categories.</span>
                        </div>
                        <a href="javascript:void(0);"><span><asp:Button ID="ch2" class="income_btn" 
                            runat="server" Text="CHECK" OnClientClick="openModal('expenseModal'); return false;"></asp:Button></span></a>
                    </div>



                    <!-- Statement -->
                    <div class="transaction_">
                        <div class="transaction_sub1">
                            <span>Statement</span>
                            
                        </div>
                        <div class="transaction_sub2">
                            <span>Examine your All financial positions, Income, Expenses And measure your Stability of balance.</span>
                        </div>
                        
                        <a href="javascript:void(0);"><span><asp:Button ID="ch3" class="income_btn" 
                            runat="server" Text="CHECK" OnClientClick="openModal('statementModal'); return false;"></asp:Button></span></a>
                    </div>

                    <!-- By Date -->
                    <div class="transaction_">
                        <div class="transaction_sub1">
                            <span>By Date</span>
                            
                        </div>
                        <div class="transaction_sub2">
                            <span>Analyze your transactions by date, view your incomes and expenses on a specific date.</span>
                        </div>
                       
                        <a href="javascript:void(0);"><span><asp:Button ID="Button7" class="income_btn" 
                        runat="server" Text="CHECK" OnClientClick="openModal('byDateModal'); return false;"></asp:Button></span></a>
                    </div>

                    <!-- Payment Type -->
                    <div class="transaction_">
                        <div class="transaction_sub1">
                            <span>Payment Type</span>
                           
                        </div>
                        <div class="transaction_sub2">
                            <span>View your transactions by payment type, such as cash, credit card or online transfer.</span>
                        </div>
                        
                        <a href="javascript:void(0);"><span><asp:Button ID="Button1" class="income_btn" 
                        runat="server" Text="CHECK" OnClientClick="openModal('paymentTypeModal'); return false;"></asp:Button></span></a>
                    </div>
        
                    <!-- Number Range -->
                    <div class="transaction_">
                        <div class="transaction_sub1">
                            <span>Number Range</span>
                          
                        </div>
                        <div class="transaction_sub2">
                            <span>Analyze your transactions within a specific number range, such as transactions abopve or below a certain amount.</span>
                        </div>
                        
                        <a href="javascript:void(0);"><span><asp:Button ID="Button2" class="income_btn" 
                        runat="server" Text="CHECK" OnClientClick="openModal('numberRangeModal'); return false;"></asp:Button></span></a>
                    </div>
        
                    <!-- By Whom -->
                    <div class="transaction_">
                        <div class="transaction_sub1">
                            <span>By Whom</span>
                           
                        </div>
                        <div class="transaction_sub2">
                            <span>View your transactions by the person who made the transaction, such as yourself or another family member.</span>
                        </div>
                        
                        <a href="javascript:void(0);"><span><asp:Button ID="Button3" class="income_btn" 
                        runat="server" Text="CHECK" OnClientClick="openModal('byWhomModal'); return false;"></asp:Button></span></a>
                    </div>
        
                    <!-- To Whom -->
                    <div class="transaction_">
                        <div class="transaction_sub1">
                            <span>To Whom</span>
                     
                        </div>
                        <div class="transaction_sub2">
                            <span>View your transactions by the person or organization that received the payment.</span>
                        </div>
             
                        <a href="javascript:void(0);"><span><asp:Button ID="Button4" class="income_btn" 
                        runat="server" Text="CHECK" OnClientClick="openModal('toWhomModal'); return false;"></asp:Button></span></a>
                    </div>
        
                    <!-- Category -->
                    <div class="transaction_">
                        <div class="transaction_sub1">
                            <span>Category</span>
                 
                        </div>
                        <div class="transaction_sub2">
                            <span>View your transactions by category, such as food, entertainment or transaction.</span>
                        </div>
     
                        <a href="javascript:void(0);"><span><asp:Button ID="Button5" class="income_btn" 
                        runat="server" Text="CHECK" OnClientClick="openModal('categoryModal'); return false;"></asp:Button></span></a>
                    </div>
        
                    <!-- Over All -->
                    <div class="transaction_">
                        <div class="transaction_sub1">
                            <span>Over All</span>

                        </div>
                        <div class="transaction_sub2">
                            <span>View a consolidated report of your incomes, expense, balance statement, transactions by daty and by range.</span>
                        </div>
                        <a href="javascript:void(0);"><span><asp:Button ID="Button6" class="income_btn" 
                        runat="server" Text="CHECK" OnClientClick="openModal('overallModal'); return false;"></asp:Button></span></a>
                    </div>
                </div>
            </section>



        
        </main>
          <div id="incomeModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="close" onclick="closeModal('incomeModal')">&times;</span>
                    <h2>Income Report</h2>
                </div>
                <div class="modal-body">
                    <asp:Repeater ID="IncomeRepeater" runat="server">
                    <HeaderTemplate>
                            <div class="heading">
                                <div class="heading_sub1">Date</div>
                                <div class="heading_sub2">Income</div>
                                <div class="heading_sub3">Category</div>
                                <div class="heading_sub4">Payment Type</div>
                                <div class="heading_sub5">By Whom</div>
                                <div class="heading_sub6">Balance</div>
                       
                            </div>
                            </HeaderTemplate>

                            <ItemTemplate>
                            <div class="data">
                                    <div class="heading_sub1"><%# Convert.ToDateTime(Eval("date")).ToShortDateString() %></div>
                                    <div class="heading_sub2"><%# Eval("income") == DBNull.Value ? "0" : Eval("income") %></div>
                                    <div class="heading_sub4"><%# Eval("category") %></div>
                                    <div class="heading_sub5"><%# Eval("pay_type") %></div>
                                    <div class="heading_sub6"><%# Eval("by_whom") == DBNull.Value ? "-" : Eval("by_whom") %></div>
                                    <div class="heading_sub8"><%# Eval("balance") == DBNull.Value ? "0" : Eval("balance")%></div>
                            </div>
                        </ItemTemplate>
                        </asp:Repeater>
                        <div class="print">
                                <div><span><asp:Button ID="btnPrint1" runat="server" class="income_btn" Text="Print" OnClientClick="printReport('incomeModal'); return false;" /></span></div>
                        </div>
                </div>
            </div>
        </div>

        <!-- Modal for Expense -->
        <div id="expenseModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="close" onclick="closeModal('expenseModal')">&times;</span>
                    <h2>Expense Report</h2>
                </div>
                <div class="modal-body">
                    <asp:Repeater ID="ExpenseRepeater" runat="server">
            <HeaderTemplate>
                    <div class="heading">
                        <div class="heading_sub1">Date</div>
                        <div class="heading_sub2">Expense</div>
                        <div class="heading_sub3">Category</div>
                        <div class="heading_sub4">Payment Type</div>
                        <div class="heading_sub5">To Whom</div>
                        <div class="heading_sub6">Balance</div>
                    </div>
                    </HeaderTemplate>

                    <ItemTemplate>
                    <div class="data">
                            <div class="heading_sub1"><%# Convert.ToDateTime(Eval("date")).ToShortDateString() %></div>
                            <div class="heading_sub3"><%# Eval("expense") == DBNull.Value ? "0" : Eval("expense") %></div>
                            <div class="heading_sub4"><%# Eval("category") %></div>
                            <div class="heading_sub5"><%# Eval("pay_type") %></div>
                            <div class="heading_sub7"><%# Eval("to_whom") == DBNull.Value ? "-" : Eval("to_whom") %></div>
                            <div class="heading_sub8"><%# Eval("balance") == DBNull.Value ? "0" : Eval("balance")%></div>
                    </div>
                </ItemTemplate>
                </asp:Repeater>
                <div class="print">
                        <div><span><asp:Button ID="btnPrint2" runat="server" class="income_btn" Text="Print" OnClientClick="printReport('expenseModal'); return false;" /></span></div>
                    </div>
                </div>
            </div>
        </div>
        
                
        <!-- Modal for Statement -->
                <div id="statementModal" class="modal">
                    <div class="modal-content">
                        <div class="modal-header">
                            <span class="close" onclick="closeModal('statementModal')">&times;</span>
                            <h2>statement Report</h2>
                        </div>
                        <div class="modal-body">
                            <asp:Repeater ID="statementRepeater" runat="server">
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
                                      </div>
                                    </ItemTemplate>
                                    </asp:Repeater>
                                        <div class="print">
                                            <div><span><asp:Button ID="btnPrint3" runat="server" class="income_btn" Text="Print" OnClientClick="printReport('statementModal'); return false;" /></span></div>
                                        </div>
                        </div>
                    </div>
                </div>



                <div id="byDateModal" class="modal">
                    <div class="modal-content">
                        <div class="modal-header">
                            <span class="close" onclick="closeModal('byDateModal')">&times;</span>
                            <h2>By Date Report</h2>
                        </div>
                        <div class="heading_date">
                            <div><span><asp:TextBox ID="txtStartDate" runat="server" placeholder="Date" type="date" class="date"></asp:TextBox></span></div>
                            <div><i class="fa-solid fa-right-left" style="color: #ffffff;"></i></div>
                            <div><span><asp:TextBox ID="txtEndDate" runat="server" placeholder="Date" type="date" class="date"></asp:TextBox></span></div>
                            <div><span><asp:Button ID="btnAddIncome" class="income_btn" runat="server" Text="CHECK" OnClick="btnAddIncome_Click"></asp:Button></span></div>
                            <div class="validation">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                                runat="server" ErrorMessage="*Start Date is Required" 
                                ControlToValidate="txtStartDate" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></div>
                            <div class="validation">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                                runat="server" ErrorMessage="*End Date is Required" 
                                ControlToValidate="txtEndDate" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></div>
                        </div>
                        <div class="modal-body">
                            <asp:Repeater ID="ByDateRepeater" runat="server">
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
                                        <div class="heading_sub8"><%# Eval("balance") == DBNull.Value ? "0" : Eval("balance") %></div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <div class="print">
                                <div><span><asp:Button ID="btnPrintByDate" runat="server" class="income_btn" Text="Print" OnClientClick="printReport('byDateModal'); return false;"/></span></div>
                            </div>
                        </div>
                    </div>
                </div>

                

               <!--

                <div id="byWhomModal" class="modal">
                    <div class="modal-content">
                        <div class="modal-header">
                            <span class="close" onclick="closeModal('byWhomModal')">&times;</span>
                            <h2>By Whom Report</h2>
                        </div>
                        <div class="modal-body" id="modal-body">
                            <asp:Repeater ID="ByWhomRepeater" runat="server">
                                <HeaderTemplate>
                                    <div class="heading"></div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div class="data"></div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <div class="print">
                                <div><span><asp:Button ID="btnPrintByWhom" runat="server" class="income_btn" Text="Print" OnClientClick="printReport('byWhomModal'); return false;"/></span></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="toWhomModal" class="modal">
                    <div class="modal-content">
                        <div class="modal-header">
                            <span class="close" onclick="closeModal('toWhomModal')">&times;</span>
                            <h2>To Whom Report</h2>
                        </div>
                        <div class="modal-body" id="modal-body">
                            <asp:Repeater ID="ToWhomRepeater" runat="server">
                                <HeaderTemplate>
                                    <div class="heading"></div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div class="data"></div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <div class="print">
                                <div><span><asp:Button ID="btnPrintToWhom" runat="server" class="income_btn" Text="Print" OnClientClick="printReport('toWhomModal'); return false;"/></span></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="categoryModal" class="modal">
                    <div class="modal-content">
                        <div class="modal-header">
                            <span class="close" onclick="closeModal('categoryModal')">&times;</span>
                            <h2>Category Report</h2>
                        </div>
                        <div class="modal-body" id="modal-body">
                            <asp:Repeater ID="CategoryRepeater" runat="server">
                                <HeaderTemplate>
                                    <div class="heading"></div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div class="data"></div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <div class="print">
                                <div><span><asp:Button ID="btnPrintCategory" runat="server" class="income_btn" Text="Print" OnClientClick="printReport('categoryModal'); return false;"/></span></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="overallModal" class="modal">
                    <div class="modal-content">
                        <div class="modal-header">
                            <span class="close" onclick="closeModal('overallModal')">&times;</span>
                            <h2>Overall Report</h2>
                        </div>
                        <div class="modal-body" id="modal-body">
                            <asp:Repeater ID="OverallRepeater" runat="server">
                                <HeaderTemplate>
                                    <div class="heading"></div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div class="data"></div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <div class="print">
                                <div><span><asp:Button ID="btnPrintOverall" runat="server" class="income_btn" Text="Print" OnClientClick="printReport('overallModal'); return false;"/></span></div>
                            </div>
                        </div>
                    </div>
                </div>-->
               
    </form>

     <script>
         // Function to open the modal
         function openModal(modalId) {
             document.getElementById(modalId).style.display = "block";
             sessionStorage.setItem("modalOpen", modalId); // Store modal state
         }

         // Function to close the modal
         function closeModal(modalId) {
             document.getElementById(modalId).style.display = "none";
             sessionStorage.removeItem("modalOpen"); // Remove modal state
         }

         // Restore modal state after postback
         window.onload = function () {
             var modalId = sessionStorage.getItem("modalOpen");
             if (modalId) {
                 openModal(modalId);
             }
         };
         function printReport(modalId) {
             // Get the modal content
             var modalContent = document.querySelector(`#${modalId} .modal-body`).innerHTML;

             // Backup the current document body
             var originalContent = document.body.innerHTML;

             // Replace the body content with the modal content for printing
             document.body.innerHTML = `
            <html>
            <head>
                <title>Print Report</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        margin: 20px;
                        color: #333;
                    }
                    .heading {
                        font-weight: bold;
                        border-bottom: 2px solid #ddd;
                        padding: 10px 0;
                        font-size: 1.2em;
                    }
                    .data {
                        padding: 5px 0;
                        border-bottom: 1px solid #f0f0f0;
                        display: flex;
                        justify-content: space-between;
                    }
                    .data div {
                        flex: 1;
                        text-align: left;
                        padding: 5px;
                    }
                </style>
            </head>
            <body>
                ${modalContent}
            </body>
            </html>
        `;

             // Trigger the print dialog
             window.print();

             // Restore the original document body
             document.body.innerHTML = originalContent;

             // Reload scripts to restore functionality (optional, depending on your framework)
             location.reload();
         }
     </script>
</body>
</html>
