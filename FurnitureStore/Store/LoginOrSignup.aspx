<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginOrSignup.aspx.cs" Inherits="FurnitureStore.Store.LoginOrSignup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="author" content="Untree.co" />
    <link rel="shortcut icon" href="../Assets/favicon.png" />

    <meta name="description" content="" />
    <meta name="keywords" content="bootstrap, bootstrap4" />

    <!-- Bootstrap CSS -->
    <link href="../Assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <link href="../Assets/css/tiny-slider.css" rel="stylesheet" />
    <link href="../Assets/css/style.css" rel="stylesheet" />
    <title>Furni Free Bootstrap 5 Template for Furniture and Interior Design Websites by Untree.co </title>

</head>
<body style="background-color:rgba(255, 255, 255,0.6); ">
    <form id="form1" runat="server">


        <div class="untree_co-section">
            <div class="container" style="margin-top:-4rem">

                <div class="block">
                    <div class="row justify-content-center text-center mb-3">
                        <div class="col-md-6 col-lg-6 pb-2">
                            <asp:LinkButton ID="lbsignin" CssClass="btn btn-outline-dark" runat="server" OnClick="lbsignin_Click">Sign In</asp:LinkButton>
                            <asp:LinkButton ID="lbsignup" CssClass="btn btn-outline-dark" runat="server" OnClick="lbsignup_Click">Sign Up</asp:LinkButton>
                        </div>
                    </div>

                    <div class="row justify-content-center">

                        <asp:Panel ID="PanelSignIn" runat="server">
                            <%--sign in--%>
                            <div class="col-md-3 col-sm-6 col-lg-3 mx-auto">

                                <div class="form-group">
                                    <label class="text-black" for="txtEmailorMobile">Email/ Mobile</label>
                                    <asp:TextBox ID="txtEmailorMobile" class="form-control" runat="server" required></asp:TextBox>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="text-black" for="txtPassword">Password</label>
                                    <asp:TextBox ID="txtPassword" class="form-control" runat="server" required></asp:TextBox>
                                </div>

                                <asp:Button ID="btnLogIn" runat="server" CssClass="btn btn-primary-hover-outline" Text="Sign In" OnClick="btnLogIn_Click"/>

                                <asp:Label runat="server" CssClass="ml-5" Visible="false" Text="" ID="lblMessage"></asp:Label>
                            </div>
                        </asp:Panel>
                    </div>

                    <%--sign up--%>

                    <div class="row justify-content-center">

                        <asp:Panel ID="PanelSignUp" runat="server">
                            <div class="col-md-6 col-lg-6 pb-0 mx-auto">

                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label class="text-black" for="txtName">Name</label>
                                            <asp:TextBox ID="txtName" class="form-control" runat="server" required></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label class="text-black" for="txtEmail">Email</label>
                                            <asp:TextBox ID="txtEmail" class="form-control" runat="server" required></asp:TextBox>
                                        </div>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="text-black" for="txtAddress">Address</label>
                                    <asp:TextBox ID="txtAddress" class="form-control" runat="server" TextMode="MultiLine" Rows="2" required></asp:TextBox>
                                </div>


                                <div class="row">
                                    <div class="col-6">

                                        <div class="form-group">
                                            <label class="text-black" for="txtMobile">Mobile</label>
                                            <asp:TextBox ID="txtMobile" class="form-control" runat="server" required></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-6">

                                        <div class="form-group">
                                            <label class="text-black" for="txtPinCode">Pin Code</label>
                                            <asp:TextBox ID="txtPinCode" class="form-control" runat="server" required></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-6">

                                        <div class="form-group">
                                            <label class="text-black" for="txtPassword">Password</label>
                                            <asp:TextBox ID="txtPassword2" class="form-control" runat="server" required></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-6">

                                        <div class="form-group">
                                            <label class="text-black" for="txtConformPassword">Confirm Password</label>
                                            <asp:TextBox ID="txtConformPassword" class="form-control" runat="server" required></asp:TextBox>
                                        </div>

                                    </div>
                                </div>
                                <asp:Button ID="btnSignUp" runat="server" CssClass="btn btn-primary-hover-outline" Text="Sign Up" OnClick="btnSignUp_Click"/>

                            </div>
                        </asp:Panel>
                    </div>


                </div>

            </div>
        </div>
    </form>

    <script src="../Assets/js/bootstrap.bundle.min.js"></script>
    <script src="../Assets/js/tiny-slider.js"></script>
    <script src="../Assets/js/custom.js"></script>


</body>
</html>
