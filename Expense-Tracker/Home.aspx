<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Expense_Tracker.Html.Home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Expense Tracker | Home</title>
        <link rel="icon" type="image/jpg" href="../Images/coins.jpg" sizes="32x32" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

        <!--<link rel="stylesheet" href="../Styles/Home.css" />-->
        <style>
            /* Global Styles */
            /* Root Variables for Theme */
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
    border-left: 4px solid #32a832; /* Add an accent border */
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
    background: #32a832; /* Accent color */
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
    border-left: 4px solid #32a832;
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

.card {
    background-color: var(--card-bg-color);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin-bottom: 2rem;
    padding: 2rem;
    border-radius: 8px;
}

/* Dashboard Section Styles */
#dashboard {
    background-color: #222;
    border-radius: 12px;
    padding: 2rem;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    margin-bottom: 2rem;
    color: #fff;
}

#dashboard h2 {
    font-size: 2rem;
    color: var(--second-color);
    margin-bottom: 1rem;
}

.dashboard-widgets {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 1.5rem;
}

.widget {
    background-color: #444;
    padding: 1.5rem;
    border-radius: 8px;
    text-align: center;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    transition: transform 0.2s, box-shadow 0.2s;
}

.widget:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
}

.widget h3 {
    font-size: 1.25rem;
    margin-bottom: 0.5rem;
}

.widget p {
    font-size: 1.5rem;
    font-weight: bold;
    margin: 0;
}

/* Transaction Section Styles */
.transaction {
    text-align: center;
    margin-top: 40px;
}

.section-heading {
    font-size: 40px;
    font-weight: 700;
    color: var(--main-color);
    margin-bottom: 30px;
}

/* Main Flexbox Layout */
.tran_main {
    display: flex;
    justify-content: center;
    gap: 3rem;
    align-items: center;
}

/* Transaction Option (Add Income/Expense Buttons) */
.transaction-option {
    text-align: center;
    background-color: var(--card-bg-color);
    padding: 20px;
    border-radius: 10px;
    width: 250px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
}

.transaction-option h3 {
    font-size: 24px;
    font-weight: 600;
    color: var(--main-color);
    margin-bottom: 15px;
}

/* Buttons */
.income_btn {
    background-color: var(--second-color);
    color: var(--main-color);
    font-weight: 600;
    padding: 12px 20px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    width: 100%;
    transition: background-color 0.3s, transform 0.3s;
}

.income_btn:hover {
    background-color: var(--hover-bg-color);
    transform: scale(1.05);
}

/* Pop-up Form Styles */
/* Pop-up Form Styles */
.popup-form {
    display: none;
    position: fixed;
    z-index: 9999;  /* Ensures it stays on top of other content */
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);  /* Dark semi-transparent background */
    overflow: auto;
    transition: opacity 0.3s ease-in-out;
    animation: fadeIn 0.3s ease-in-out;
}

@keyframes fadeIn {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

.popup-content {
    background-color: var(--popup-bg-color);
    margin: 5% auto;
    padding: 30px;
    border-radius: 12px;  /* Rounded corners for the form */
    width: 60%;
    max-width: 500px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    text-align: center;
    transition: transform 0.3s ease, opacity 0.3s ease;
}

.popup-content h3 {
    font-size: 26px;
    font-weight: bold;
    color: var(--main-color);
    margin-bottom: 20px;
}

.close-btn {
    color: #ccc;
    font-size: 30px;
    font-weight: bold;
    position: absolute;
    top: 15px;
    right: 15px;
    cursor: pointer;
    transition: color 0.3s ease-in-out;
}

.close-btn:hover {
    color: #f5f5f5;
}

/* Input Fields Style */
.popup-content input {
    font-size: 16px;
    padding: 14px;
    width: 100%;
    margin-bottom: 20px;  /* More space between inputs */
    border-radius: 8px;
    background-color: #f0f0f0;  /* Soft background color */
    border: 1px solid #ccc;  /* Light border for a clean look */
    color: #333;  /* Dark text color for better contrast */
    transition: all 0.3s ease;  /* Smooth transition for all interactions */
    box-sizing: border-box;  /* Ensures padding doesn't affect the width */
}

/* Input Focus Effect */
.popup-content input:focus {
    background-color: #ffffff;  /* Slightly lighter background on focus */
    border: 1px solid #007BFF;  /* Blue border to highlight active input */
    outline: none;  /* Removes the default outline */
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);  /* Soft glow around input */
}

/* Placeholder Styling */
.popup-content input::placeholder {
    color: #888;  /* Lighter color for placeholder text */
    font-style: italic;  /* Italic style for placeholders */
}

/* Hover Effect */
.popup-content input:hover {
    border-color: #007BFF;  /* Blue border on hover for visual feedback */
}

/* Responsive Design for Pop-up Form */
@media (max-width: 768px) {
    .popup-content {
        width: 80%;
        padding: 20px;
    }

    .popup-content h3 {
        font-size: 22px;
    }

    .popup-content input {
        font-size: 14px;
        padding: 10px;
    }

    .popup-content button {
        font-size: 16px;
        padding: 10px 20px;
    }
}





#budget {
    background: #064420; /* Dark Green Background */
    color: white;
    padding: 20px;
    border-radius: 8px;
    margin-top: 20px;
    overflow: auto; /* Enables scrolling if needed */
    max-height: 400px; /* Adjust the height as needed */
}

#budget h2 {
    color: #A4D0A4; /* Light Green for contrast */
    text-align: center;
}

#budget table {
    width: 100%;
    border-collapse: collapse;
    background: #082911; /* Slightly darker green */
}

#budget th, #budget td {
    padding: 12px;
    border: 1px solid #2E7D32; /* Border with a green shade */
    text-align: left;
}

#budget th {
    background: #146356; /* Medium Green for table headers */
    color: white;
}

#budget tr:nth-child(even) {
    background: #0B3D2E; /* Alternating row color */
}

#budget tr:nth-child(odd) {
    background: #064420;
}

#budget tr[style*="color: red;"] {
    background: #4A0000 !important; /* Dark Red for over-budget rows */
    color: #FFD700 !important; /* Gold text for warning */
}

#budget td {
    text-align: center;
}

#budget::-webkit-scrollbar {
    width: 10px;
}

#budget::-webkit-scrollbar-thumb {
    background: #2E7D32; /* Green scrollbar */
    border-radius: 10px;
}

#budget::-webkit-scrollbar-track {
    background: #064420;
}


        </style>
    </head>

    <body>
        <form id="form1" runat="server">
            <!-- Main Content -->
            <main class="main-container">
                <!-- Sidebar -->
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


                <!-- Content Section -->
                <section class="content">
                    <!-- Dashboard Section -->
                    <div id="dashboard" class="card">
                        <h2>Dashboard</h2>
                        <p>Overview of the current financial status and activities.</p>
                        <div class="dashboard-widgets">
                            <div class="widget">
                                <h3>Total Expenses</h3>
                                 <p><asp:Label ID="Label3" runat="server"></asp:Label></p>
                            </div>
                            <div class="widget">
                                <h3>Total Income</h3>
                                 <p><asp:Label ID="Label2" runat="server"></asp:Label></p>
                            </div>
                            <div class="widget" id="widget" runat="server">
                                <h3>Balance</h3>
                                <p><asp:Label ID="Label1" runat="server"></asp:Label></p>
                            </div>
                        </div>

                        
                    </div>


                    <div id="budget" class="card">
                        <h2>Budget Overview</h2>
                        <p>Compare your expenses with your set budget.</p>

                        <!-- Scrollable Container -->
                        <div class="budget-table-container">
                            <asp:Repeater ID="rptBudget" runat="server">
                                <HeaderTemplate>
                                    <table>
                                        <tr>
                                            <th>Category</th>
                                            <th>Total Expense</th>
                                            <th>Budget</th>
                                            <th>Status</th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr style='<%# Convert.ToDecimal(Eval("TotalExpense")) > Convert.ToDecimal(Eval("Budget")) ? "color: red;" : "" %>'>
                                        <td><%# Eval("Category") %></td>
                                        <td>&#8377; <%# Eval("TotalExpense") %></td>
                                        <td>&#8377; <%# Eval("Budget") %></td>
                                        <td>
                                            <%# Convert.ToDecimal(Eval("TotalExpense")) > Convert.ToDecimal(Eval("Budget")) 
                                                ? "Over Budget" 
                                                : "Within Budget" %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <!-- Transaction Section -->
                    <section class="transaction" id="transaction">
                        <div class="text-center section-heading">Transaction</div>
                        <div class="tran_main">
                            <!-- Add Income Section -->
                            <div class="transaction-option">
                                <h3>Add Income</h3>
                                <button class="income_btn" type="button" onclick="openIncomePopup()">Add Income</button>
                            </div>

                            <!-- Add Expense Section -->
                            <div class="transaction-option">
                                <h3>Add Expense</h3>
                                <button class="income_btn" type="button" onclick="openExpensePopup()">Add Expense</button>
                            </div>
                        </div>

                        <!-- Income Pop-up Form (Initially Hidden) -->
                        <div id="incomePopup" class="popup-form">
                            <div class="popup-content">
                                <span class="close-btn" onclick="closeIncomePopup()">&times;</span>
                                <h3>Add Income Details</h3>
                                <div class="income_main">
                                    <span><asp:TextBox ID="txtIncome" runat="server" placeholder="Add Amount &#8377;"></asp:TextBox><br /></span>
                                    <span><asp:TextBox ID="txtCategory" runat="server" placeholder="Category"></asp:TextBox><br /></span>
                                    <span><asp:TextBox ID="txtPayType" runat="server" placeholder="Payment Type"></asp:TextBox><br /></span>
                                    <span><asp:TextBox ID="txtByWhom" runat="server" placeholder="By Whom"></asp:TextBox><br /></span>
                                    <span><asp:TextBox ID="txtDate" runat="server" type="date"></asp:TextBox><br /></span>
                                    <asp:Button ID="btnAddIncome" runat="server" Text="Add Income" value="Add Income" class="income_btn" onclick="btnAddIncome_Click" UseSubmitBehavior="false"></asp:Button>
                                </div>
                            </div>
                        </div>

                        <!-- Expense Pop-up Form (Initially Hidden) -->
                        <div id="expensePopup" class="popup-form">
                            <div class="popup-content">
                                <span class="close-btn" onclick="closeExpensePopup()">&times;</span>
                                <h3>Add Expense Details</h3>
                                <div class="income_main">
                                    <span><asp:TextBox ID="txtExpenseAmount" runat="server" placeholder="Add Amount &#8377;"></asp:TextBox><br /></span>
                                    <span><asp:TextBox ID="txtExpenseCategory" runat="server" placeholder="Category"></asp:TextBox><br /></span>
                                    <span><asp:TextBox ID="txtExpensePayType" runat="server" placeholder="Payment Type"></asp:TextBox><br /></span>
                                    <span><asp:TextBox ID="txtExpenseToWhom" runat="server" placeholder="To Whom"></asp:TextBox><br /></span>
                                    <span><asp:TextBox ID="txtExpenseDate" runat="server" type="date"></asp:TextBox><br /></span>
                                    <asp:Button ID="btnAddExpense" runat="server" Text="Add Expense" value="Add Expense" class="income_btn" onclick="btnAddExpense_Click" UseSubmitBehavior="false"></asp:Button>
                                </div>
                            </div>
                        </div>
                    </section>
                </section>
            </main>
        </form>
        <script>
            // Open Income Pop-up
            function openIncomePopup() {
                document.getElementById("incomePopup").style.display = "block";
            }

            // Close Income Pop-up
            function closeIncomePopup() {
                document.getElementById("incomePopup").style.display = "none";
            }

            // Open Expense Pop-up
            function openExpensePopup() {
                document.getElementById("expensePopup").style.display = "block";
            }

            // Close Expense Pop-up
            function closeExpensePopup() {
                document.getElementById("expensePopup").style.display = "none";
            }
        </script>
    </body>
</html>
