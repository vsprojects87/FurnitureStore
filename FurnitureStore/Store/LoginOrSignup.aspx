<%@ Page Title="" Language="C#" MasterPageFile="~/Store/Store.Master" AutoEventWireup="true" CodeBehind="LoginOrSignup.aspx.cs" Inherits="FurnitureStore.Store.LoginOrSignup1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <style>
        body{
            background-color:rgb(27 27 27);
        }
        .font-light{
            color:white;
        }
    </style>


        <div class="untree_co-section">
            <div class="container" style="margin-top: -4rem">

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
                                    <label class="font-light" for="txtEmailOrMobile">Email/ Mobile</label>
                                    <asp:TextBox ID="txtEmailOrMobile" class="form-control" runat="server" required></asp:TextBox>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="font-light" for="txtPassword">Password</label>
                                    <asp:TextBox ID="txtPassword" class="form-control" runat="server" required></asp:TextBox>
                                </div>

                                <asp:Button ID="btnLogIn" runat="server" CssClass="btn btn-primary-hover-outline" Text="Sign In" OnClick="btnLogIn_Click" />
                                
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
                                            <label class="font-light" for="txtName">Name</label>
                                            <asp:TextBox ID="txtName" class="form-control" runat="server" required></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label class="font-light" for="txtEmail">Email</label>
                                            <asp:TextBox ID="txtEmail" class="form-control" runat="server" required></asp:TextBox>
                                        </div>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="font-light" for="txtAddress">Address</label>
                                    <asp:TextBox ID="txtAddress" class="form-control" runat="server" TextMode="MultiLine" Rows="2" required></asp:TextBox>
                                </div>


                                <div class="row">
                                    <div class="col-6">

                                        <div class="form-group">
                                            <label class="font-light" for="txtMobile">Mobile</label>
                                            <asp:TextBox ID="txtMobile" class="form-control" runat="server" required></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-6">

                                        <div class="form-group">
                                            <label class="font-light" for="txtPinCode">Pin Code</label>
                                            <asp:TextBox ID="txtPinCode" class="form-control" runat="server" required></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-6">

                                        <div class="form-group">
                                            <label class="font-light" for="txtPassword">Password</label>
                                            <asp:TextBox ID="txtPassword2" class="form-control" runat="server" required></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-6">

                                        <div class="form-group">
                                            <label class="font-light" for="txtConformPassword">Confirm Password</label>
                                            <asp:TextBox ID="txtConformPassword" class="form-control" runat="server" required></asp:TextBox>
                                        </div>

                                    </div>
                                </div>
                                <asp:Button ID="btnSignUp" runat="server" CssClass="btn btn-primary-hover-outline" Text="Sign Up" OnClick="btnSignUp_Click" />

                            </div>
                        </asp:Panel>
                    </div>


                </div>

            </div>
        </div>



</asp:Content>
