<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgot.aspx.cs" Inherits="Expense_Tracker.Expense_Tracker.forgot" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Expense Tracker | Forgot Password</title>
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

        .forgot-container {
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

        .password-strength {
            font-size: 14px;
            color: red;
            margin-top: 5px;
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

            .forgot-container {
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
    <!-- header section -->
    <header>
        <span class="logo">Expense Tracker</span>
    </header>

    <form id="form1" runat="server">
        <section>
            <div class="forgot-container">
                <span class="text">Forgot Password</span>

                <!-- Mobile Number Input -->
                <div>
                    <asp:TextBox ID="mno" runat="server" placeholder="Mobile Number" class="input-field"></asp:TextBox>
                    <div class="validation">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="*Mobile No. is Required" ControlToValidate="mno" 
                            Display="Dynamic" ForeColor="Red" ValidationGroup="forgotGroup"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <!-- Password Input -->
                <div>
                    <asp:TextBox ID="pwd1" runat="server" TextMode="Password" placeholder="Enter Password" class="input-field"></asp:TextBox>
                    <div class="validation">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ErrorMessage="*Password is Required" ControlToValidate="pwd1" 
                            Display="Dynamic" ForeColor="Red" ValidationGroup="forgotGroup"></asp:RequiredFieldValidator>
                    </div>
                    <div class="password-strength"></div>
                </div>

                <!-- Confirm Password Input -->
                <div>
                    <asp:TextBox ID="pwd2" runat="server" TextMode="Password" placeholder="Confirm Password" class="input-field"></asp:TextBox>
                    <div class="validation">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ErrorMessage="*Confirm password is Required" ControlToValidate="pwd2" 
                            Display="Dynamic" ForeColor="Red" ValidationGroup="forgotGroup"></asp:RequiredFieldValidator>
                    </div>
                    <div class="validation">
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ErrorMessage="*Passwords do not match" 
                            ControlToCompare="pwd1" ControlToValidate="pwd2" 
                            Display="Dynamic" ForeColor="Red" ValidationGroup="forgotGroup"></asp:CompareValidator>
                    </div>
                </div>

                <asp:Button ID="update" class="button" Text="Update Password" runat="server" OnClick="update_Click" ValidationGroup="forgotGroup" />
                
                <div class="footer">
                    <span>Remember your password? <a href="login.aspx">Sign In</a></span>
                </div>
            </div>
        </section>
    </form>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const passwordInput = document.getElementById("<%= pwd1.ClientID %>");
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
