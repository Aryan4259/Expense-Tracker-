<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adashbord.aspx.cs" Inherits="Expense_Tracker.Expense_Tracker.adashbord" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #121212;
            color: white;
            display: flex;
            height: 100vh;
        }

        .main-container {
            display: flex;
            width: 100%;
            height: 100vh;
        }

        .sidebar {
            width: 250px;
            background-color: #1E1E1E;
            height: 100vh;
            padding: 20px;
            box-shadow: 2px 0px 10px rgba(0, 0, 0, 0.5);
            flex-shrink: 0;
        }

        .sidebar h2 {
            color: #4CAF50;
            text-align: center;
        }

        .sidebar a {
            display: block;
            color: white;
            text-decoration: none;
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background-color: #4CAF50;
        }

        .content {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            padding: 20px;
        }

        .container {
            background-color: #1E1E1E;
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
            width: 100%;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #333;
            color: white;
        }

        th, td {
            padding: 10px;
            border: 1px solid #444;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-container"> <!-- Main Flex Container -->
            <div class="sidebar">
                <h2>Admin Panel</h2>
                <a href="adashbord.aspx">Dashboard</a>
                <a href="umanagement.aspx">User Management</a>
                <a href="ExpenseManagement.aspx">Expense Management</a>
                <a href="Report.aspx">Reports</a>
                <a href="Settings.aspx">Settings</a>
                <a href="Logout.aspx">Logout</a>
            </div>

            <div class="content">
                <h1>Welcome to Admin Panel</h1>
                <p>Select a module from the sidebar to manage the application.</p>

                <div class="container">
                    <h2>User Statistics</h2>
                    <p>Total Users: <asp:Label ID="lblTotalUsers" runat="server"></asp:Label></p>
                    <p>Active Users: <asp:Label ID="lblActiveUsers" runat="server"></asp:Label></p>
                    <p>Inactive Users: <asp:Label ID="lblInactiveUsers" runat="server"></asp:Label></p>
                </div>

                <div class="container">
                    <h2>User List</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Mobile Number</th>
                                <th>Email</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptUsers" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("fnm") %></td>
                                        <td><%# Eval("lnm") %></td>
                                        <td><%# Eval("mno") %></td>
                                        <td><%# Eval("gmail") %></td>
                                       
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
