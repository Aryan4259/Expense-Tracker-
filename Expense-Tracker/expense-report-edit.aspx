<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="expense-report-edit.aspx.cs" Inherits="Expense_Tracker.Expense_Tracker.expense_report_edit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="UFT-8" />
        <meta name="viewport" content="width=divice-width, initial-scale=1.0" />
        <title>Expense Tracker | Edit Items</title>
        <link rel="icon" type="image/png" href="#" sizes="32x32" />
       
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
    background: #0078d7; /* Accent color */
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


/* Content Section Styles */
.content {
    margin-left: 270px;
    padding: 2rem;
    min-width: 300px;
    overflow-x: hidden;
}

/* 🌙 Dark Mode Styling */
.content {
    background: #1e1e1e; /* Dark Grey Background */
    color: #e0e0e0; /* Light Grey Text */
    padding: 2rem;
    border-radius: 8px;
    margin-left: 270px;
    min-width: 300px;
    overflow-x: hidden;
}

/* 📌 Title Styling */
.content .text-center {
    font-size: 1.8rem;
    font-weight: bold;
    color: #4CAF50; /* Professional Green Accent */
    margin-bottom: 15px;
}

/* 🔳 Form Container */
.transaction_sub {
    background: #2a2a2a; /* Slightly Lighter Dark */
    padding: 1.5rem;
    border-radius: 10px;
    width: 100%;
    max-width: 450px;
    margin: auto;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
}

/* 📝 Form Labels */
.transaction_sub .text {
    font-size: 1.4rem;
    font-weight: 600;
    color: #4CAF50;
    display: block;
    margin-bottom: 10px;
}

/* 🎯 Input Fields */
.income_main input[type="text"],
.income_main input[type="date"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #444;
    border-radius: 6px;
    background: #333;
    color: #e0e0e0;
    font-size: 1rem;
    outline: none;
    transition: 0.2s;
}

/* ✨ Input Focus */
.income_main input:focus {
    border-color: #4CAF50;
    background: #3b3b3b;
}

/* ⚠️ Validation Messages */
.validation span {
    font-size: 0.9rem;
    color: #ff5555;
    display: block;
    margin-top: 5px;
}

/* 🔘 Submit Button */
.income_btn {
    background: #4CAF50;
    color: white;
    border: none;
    padding: 12px;
    font-size: 1rem;
    border-radius: 6px;
    cursor: pointer;
    font-weight: 600;
    transition: 0.2s;
    width: 100%;
    margin-top: 15px;
}

/* 🎯 Button Hover */
.income_btn:hover {
    background: #45a049;
}

/* 📱 Responsive */
@media (max-width: 600px) {
    .transaction_sub {
        width: 90%;
    }
}




        </style>
    </head>
    <body>
    <form id="Form1" runat="server">
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
                   <div class="text-center">Edit Items</div>
                        <div class="tran_main">
                                 <div class="transaction_sub">
                                     <span class="text">Edit Items</span>
                                     <b>__________________________________</b>
                                     <div class="income_main">
                                         <asp:TextBox ID="txtExpense" runat="server" placeholder="Add Amount &#8377;"></asp:TextBox>
                                         <div class="validation"><asp:RequiredFieldValidator ID="RequiredFieldValidator6" 
                                                 runat="server" ErrorMessage="*Expense is Required" ControlToValidate="txtExpense" 
                                                 Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></div>
                                         <br />
                                         <asp:TextBox ID="txtCategory" runat="server" placeholder="Category"></asp:TextBox>
                                         <div class="validation"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                                                 runat="server" ErrorMessage="*Category is Required" 
                                                 ControlToValidate="txtCategory" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></div>
                                         <br />
                                         <asp:TextBox ID="txtPayType" runat="server" placeholder="Payment Type"></asp:TextBox>
                                         <div class="validation"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                                                 runat="server" ErrorMessage="*Payment type is Required" 
                                                 ControlToValidate="txtPayType" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></div>
                                         <br />
                                         <asp:TextBox ID="txtToWhom" runat="server" placeholder="To Whom"></asp:TextBox>
                                         <div class="validation"><asp:RequiredFieldValidator ID="RequiredFieldValidator7" 
                                                 runat="server" ErrorMessage="*To whom is Required" 
                                                 ControlToValidate="txtToWhom" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></div>
                                         <br />
                                         <asp:TextBox ID="txtDate" runat="server" type="date"></asp:TextBox>
                                         <div class="validation"><asp:RequiredFieldValidator ID="RequiredFieldValidator5" 
                                                 runat="server" ErrorMessage="*Date is Required" ControlToValidate="txtDate" 
                                                 Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></div>
                                         <br />
                                         <span>
                                             <asp:Button ID="btnAddExpense" runat="server" Text="ADD" value="Add Expence" 
                                                 class="income_btn" onclick="btnAddExpense_Click"></asp:Button>
                                         </span>
                                     </div>
                                 </div>
                        </div>
                </section>
            </main>
        </form>
    </body>
</html>
