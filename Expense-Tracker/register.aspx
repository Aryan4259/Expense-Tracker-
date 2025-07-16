<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Expense_Tracker.Expense_Tracker.register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" type="image/png" href="favicon.png" sizes="32x32" />
    <title>Expense Tracker | Register</title>
    <style>
        /* General Reset and Variables */
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        :root {
            --bg-color: #121212;
            --main-color: #f7f7f7;
            --input-bg: #333;
            --input-border: #555;
            --button-bg: #4caf50;
            --button-hover-bg: #45a049;
            --error-color: #ff3b30;
        }

        body {
            color: var(--main-color);
            background-color: var(--bg-color);
        }

        header {
            position: fixed;
            width: 100%;
            display: flex;
            justify-content: center;
            background: #1e1e1e;
            padding: 20px;
        }

        .logo {
            font-size: 32px;
            font-weight: bold;
        }

        section {
            padding: 120px 5% 50px;
            display: flex;
            justify-content: center;
        }

        .register-container {
            width: 100%;
            max-width: 380px;
            padding: 30px;
            background: #1f1f1f;
            border-radius: 12px;
            text-align: center;
        }

        .input-field {
            width: 100%;
            padding: 15px;
            margin-bottom: 15px;
            background-color: var(--input-bg);
            border: 1px solid var(--input-border);
            border-radius: 8px;
            color: #fff;
        }

        .input-field:focus {
            border-color: var(--button-bg);
        }

        .password-container {
            position: relative;
        }

        .toggle-password-btn {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            background: transparent;
            color: #fff;
            cursor: pointer;
        }

        .button {
            background-color: var(--button-bg);
            color: #fff;
            padding: 15px;
            width: 100%;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
        }

        .button:hover {
            background-color: var(--button-hover-bg);
        }

        .password-strength {
            font-size: 14px;
            margin-top: 5px;
        }

        .validation {
            color: var(--error-color);
            font-size: 13px;
            margin-top: -10px;
        }

        .footer {
            margin-top: 20px;
            font-size: 14px;
            color: #888;
        }

        .footer a {
            color: var(--button-bg);
            text-decoration: none;
        }
    </style>
</head>
<body>
    <header>
        <span class="logo">Expense Tracker</span>
    </header>

    <form id="form1" runat="server">
        <section>
            <div class="register-container">
                <span class="text">Sign Up</span>

                <asp:TextBox ID="f_nm" placeholder="First Name" runat="server" class="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*First Name is required." ControlToValidate="f_nm" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                <asp:TextBox ID="l_nm" placeholder="Last Name" runat="server" class="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Last Name is required." ControlToValidate="l_nm" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                <asp:TextBox ID="m_no" placeholder="Mobile Number" runat="server" class="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Mobile Number is required." ControlToValidate="m_no" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                <div class="password-container">
                    <asp:TextBox ID="pwd" TextMode="Password" placeholder="Enter Password" runat="server" class="input-field"></asp:TextBox>
                    <button type="button" class="toggle-password-btn" onclick="togglePasswordVisibility('<%= pwd.ClientID %>')">Show</button>
                </div>
                <div class="password-strength"></div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Password is required." ControlToValidate="pwd" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                <asp:TextBox ID="c_pwd" TextMode="Password" placeholder="Confirm Password" runat="server" class="input-field" OnTextChanged="c_pwd_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Confirm Password is required." ControlToValidate="c_pwd" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="*Passwords do not match." ControlToValidate="c_pwd" ControlToCompare="pwd" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>

                <asp:Button ID="btnSignUp" Text="Sign Up" CssClass="button" runat="server" OnClick="btnSignUp_Click"></asp:Button>

                <div class="footer">
                    <span>Already have an account? <a href="login.aspx">Login Here</a></span>
                </div>
            </div>
        </section>
    </form>

    <script>
        function togglePasswordVisibility(passwordFieldID) {
            const passwordField = document.getElementById(passwordFieldID);
            const toggleButton = event.target;
            const type = passwordField.type === 'password' ? 'text' : 'password';
            passwordField.type = type;
            toggleButton.textContent = type === 'password' ? 'Show' : 'Hide';
        }

        document.addEventListener("DOMContentLoaded", function () {
            const passwordInput = document.getElementById("<%= pwd.ClientID %>");
            const strengthIndicator = document.querySelector(".password-strength");

            passwordInput.addEventListener("input", function () {
                const password = passwordInput.value;
                let strength = "";

                if (password.length < 6) {
                    strength = "Weak";
                    strengthIndicator.style.color = "red";
                } else if (password.length >= 6 && /[A-Z]/.test(password) && /[0-9]/.test(password)) {
                    strength = "Medium";
                    strengthIndicator.style.color = "orange";
                } else if (password.length >= 8 && /[@$!%*?&#]/.test(password)) {
                    strength = "Strong";
                    strengthIndicator.style.color = "green";
                }

                strengthIndicator.textContent = strength;
            });
        });
    </script>
</body>
</html>

