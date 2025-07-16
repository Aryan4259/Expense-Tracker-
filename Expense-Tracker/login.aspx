 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Expense_Tracker.Expense_Tracker.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Expense Tracker | Login</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" type="image/png" href="#" sizes="32x32" />
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            list-style: none;
            text-decoration: none;
            scroll-behavior: smooth;
            border: none;
            outline: none;
        }

        :root {
            --bg-color: #121212;
            --main-color: #f7f7f7;
            --input-bg: #333;
            --input-border: #555;
            --button-bg: #4caf50;
            --button-hover-bg: #45a049;
            --button-text-color: #fff;
            --shadow-color: rgba(0, 0, 0, 0.1);
        }

        body {
            color: var(--main-color);
            background-color: var(--bg-color);
            font-size: 16px;
        }

        header {
            position: fixed;
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #1e1e1e;
            padding: 20px;
            box-shadow: 0 4px 6px var(--shadow-color);
            z-index: 1000;
        }

        .logo {
            color: var(--main-color);
            font-size: 32px;
            font-weight: bold;
        }

        section {
            padding: 120px 5% 50px;
            display: flex;
            justify-content: center;
        }

        .login-container {
            width: 100%;
            max-width: 380px;
            padding: 30px;
            background: #1f1f1f;
            border-radius: 12px;
            box-shadow: 0 10px 20px var(--shadow-color);
            text-align: center;
        }

        .text {
            font-size: 1.8rem;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .input-field {
            width: 100%;
            padding: 15px;
            font-size: 16px;
            background-color: var(--input-bg);
            border: 1px solid var(--input-border);
            border-radius: 8px;
            margin-bottom: 15px;
            transition: border 0.3s ease;
            color: #fff;
        }

        .input-field:focus {
            border-color: var(--button-bg);
            box-shadow: 0 0 8px var(--button-bg);
        }

        .button {
            background-color: var(--button-bg);
            color: var(--button-text-color);
            padding: 15px;
            width: 100%;
            font-size: 16px;
            border-radius: 8px;
            margin-top: 15px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: var(--button-hover-bg);
        }

        .validation {
            font-size: 13px;
            color: #ff3b30;
            text-align: left;
            margin-top: -10px;
            margin-bottom: 15px;
        }

        .footer {
            font-size: 14px;
            color: #888;
            margin-top: 20px;
        }

        .footer a {
            text-decoration: none;
            color: var(--button-bg);
        }

        .password-strength {
            font-size: 14px;
            color: #ffcc00;
            margin-top: 5px;
        }

        .password-container {
            position: relative;
        }

        .password-container .toggle-password {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
        }

        @media (max-width: 768px) {
            header {
                padding: 15px;
            }

            .logo {
                font-size: 26px;
            }

            .text {
                font-size: 1.5rem;
            }

            .login-container {
                padding: 20px;
            }

            .input-field {
                font-size: 14px;
                padding: 12px;
            }

            .button {
                font-size: 14px;
                padding: 12px;
            }
        }

        @media (max-width: 480px) {
            .logo {
                font-size: 22px;
            }

            .input-field {
                padding: 10px;
            }

            .button {
                font-size: 14px;
                padding: 12px;
            }
        }

    </style>
</head>
<body>
    <!-- header section-->
    <header>
        <span class="logo">Expense Tracker</span>
    </header>
    <form id="form1" runat="server">
        <section>
            <div class="login-container">
                <span class="text">Sign In</span>
                <div>
                    <asp:TextBox ID="txtMobileNumber" placeholder="Mobile Number" runat="server" class="input-field"></asp:TextBox>
                    <div class="validation">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="*Mobile No. is Required" ControlToValidate="txtMobileNumber" 
                            Display="Dynamic" ForeColor="Red" ValidationGroup="signInGroup"></asp:RequiredFieldValidator>
                    </div>
                    <div class="password-container">
                        <asp:TextBox ID="txtPassword" TextMode="Password" placeholder="Enter Password" runat="server" class="input-field"></asp:TextBox>
                        <span class="toggle-password" onclick="togglePasswordVisibility()">👁️</span>
                    </div>
                    <div class="password-strength" id="passwordStrength"></div>
                    <div class="validation">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ErrorMessage="*Password is Required" ControlToValidate="txtPassword" 
                            Display="Dynamic" ForeColor="Red" ValidationGroup="signInGroup"></asp:RequiredFieldValidator>
                    </div>
                    <asp:Button ID="btnSignIn" Text="Sign In" CssClass="button" runat="server" OnClick="btnSignIn_Click" ValidationGroup="signInGroup"></asp:Button><br />
                    <asp:Button ID="btnSignUp" Text="Sign Up" CssClass="button" runat="server" onclick="btnSignUp_Click"></asp:Button><br />
                    <asp:Button ID="btnForgot" Text="Forgot" CssClass="button" runat="server" onclick="btnForgot_Click"></asp:Button>

                    <div class="footer">
                        <span>Don't have an account? <a href="#">Sign Up</a></span><br>
                        <span></span><a href="adminlogin.aspx">Admin</a></span>
                    </div>
                </div>
            </div>
        </section>
    </form>

    <script>
        // Toggle password visibility
        function togglePasswordVisibility() {
            var passwordField = document.getElementById('txtPassword');
            var type = passwordField.type === 'password' ? 'text' : 'password';
            passwordField.type = type;
        }

        // Password strength indicator
        document.getElementById('txtPassword').addEventListener('input', function () {
            var password = this.value;
            var strengthMessage = '';
            if (password.length < 6) {
                strengthMessage = 'Weak password';
            } else if (password.length < 10) {
                strengthMessage = 'Medium password';
            } else {
                strengthMessage = 'Strong password';
            }
            document.getElementById('passwordStrength').textContent = strengthMessage;
        });
    </script>
</body>
</html>
