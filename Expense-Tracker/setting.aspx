<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="setting.aspx.cs" Inherits="Expense_Tracker.Expense_Tracker.setting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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


/* Dark Green & Black Theme */
.author {
    width: 400px;
    margin: 50px auto;
    text-align: center;
    background: #121212;  /* Dark black background */
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 15px rgba(0, 255, 0, 0.3);
}

/* Profile Picture */
.profile-pic {
    width: 150px;  
    height: 150px;
    border-radius: 50%;
    border: 4px solid #4CAF50;  /* Green border */
    object-fit: cover;
    margin-bottom: 15px;
}

/* File Upload */
.upload-btn {
    display: block;
    margin: 10px auto;
    padding: 8px;
    border: none;
    background: none;
    cursor: pointer;
    font-size: 16px;
    color: #4CAF50;
}

.upload-btn::-webkit-file-upload-button {
    background: #4CAF50;
    color: white;
    padding: 8px 12px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
}

.upload-btn::-webkit-file-upload-button:hover {
    background: #388E3C;
}

/* Buttons */
.btn {
    background: #4CAF50;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    margin-top: 10px;
    transition: background 0.3s ease;
}

.btn:hover {
    background: #388E3C;
}

/* Labels */
.user-label {
    font-size: 18px;
    color: #ffffff;  /* White text */
    font-weight: bold;
    display: block;
    margin-top: 10px;
}

/* Text Fields */
.input-field {
    width: 90%;
    padding: 10px;
    border: 2px solid #4CAF50;
    border-radius: 5px;
    margin-top: 10px;
    font-size: 16px;
    background: #222;  /* Dark input field */
    color: white;
}

.input-field:focus {
    border-color: #00ff00;
    outline: none;
    box-shadow: 0px 0px 10px rgba(0, 255, 0, 0.5);
}


</style>
</head>
<body>
    <form id="form1" runat="server">
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
    <div class="author">  <!-- Updated class name -->
        <asp:Image ID="imgProfile" runat="server" CssClass="profile-pic" Width="100px" Height="100px" />
        <asp:FileUpload ID="fileUploadProfile" runat="server" CssClass="upload-btn" />
        <asp:Button ID="btnUpload" runat="server" Text="Upload Image" OnClick="btnUpload_Click" CssClass="btn" />

        <br /><br />

        <asp:Label ID="lblFullName" runat="server" CssClass="user-label"></asp:Label>
        <br />

        <asp:Label ID="lblMobile" runat="server" CssClass="user-label"></asp:Label>
        <br />

        <asp:TextBox ID="txtGmail" runat="server" CssClass="input-field" placeholder="Enter Gmail"></asp:TextBox>
        <asp:Button ID="btnSaveGmail" runat="server" Text="Save Gmail" OnClick="btnSaveGmail_Click" CssClass="btn" />
    </div>
</section>

</main>
        
    </form>
</body>
</html>
