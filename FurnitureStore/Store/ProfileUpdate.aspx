<%@ Page Title="" Language="C#" MasterPageFile="~/Store/Store.Master" AutoEventWireup="true" CodeBehind="ProfileUpdate.aspx.cs" Inherits="FurnitureStore.Store.ProfileUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="untree_co-section">
        <div class="container" style="margin-top: -4rem">

            <div class="block">

                <%--Edit Profile--%>

                <div class="row justify-content-center">

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
                        <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary-hover-outline" Text="Update" OnClick="btnUpdate_Click" />
                    </div>
                </div>


            </div>

        </div>
    </div>



</asp:Content>
