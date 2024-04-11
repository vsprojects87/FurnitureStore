<%@ Page Title="" Language="C#" MasterPageFile="~/Store/Store.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="FurnitureStore.Store.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .sofa-img {
            display: none;
        }
    </style>



    <div class="container pt-5 pb-5">
        <div class="main-body">


            <asp:DataList runat="server" ID="dlProfile" Width="100%" OnItemCommand="dlProfile_ItemCommand">
                <ItemTemplate>
                    <div class="row gutters-sm">
                        <div class="col-md-4 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex flex-column align-items-center text-center">
                                        <img src="../Images/xxx.jpg" alt="UserPic" class="rounded-circle" width="150" />
                                        <div class="mt-3">
                                            <h4 class="text-capitalize"><%#Eval("Name") %></h4>
                                            <p class="text-secondary mb-1">@<%#Eval("Name")%></p>
                                            <p class="text-muted font-size-sm text-capitalize">
                                                <i class="fas da-map-marker-alt"></i><%#Eval("Address") %>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-8">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Full Name</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary text-capitalize">
                                            <%#Eval("Name") %>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Email</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary text-capitalize">
                                            <%#Eval("Email") %>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Mobile</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary text-capitalize">
                                            <%#Eval("Mobile") %>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Address</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary text-capitalize">
                                            <%#Eval("Address") %>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <asp:Button ID="btnEditProfile" runat="server" Text="Edit" CssClass="button button-contactForm boxed-btn" CommandName="EditUserProfile" CommandArgument=' <%#Eval("UserId") %> ' />
                                        </div>
                                        <div class="col-sm-4">
                                            <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="button button-contactForm boxed-btn" CommandName="LogOut" CommandArgument=' <%#Eval("UserId") %> ' />
                                        </div>
                                        <div class="col-sm-4">
                                            <asp:Button ID="btnDeleteProfile" runat="server" Text="Delete Account" CssClass="button button-contactForm boxed-btn" OnClick="btnDeleteProfile_Click" />
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>

                    </div>
                </ItemTemplate>
            </asp:DataList>


        </div>

        <hr style="margin-top: 2em" />
    </div>


    <%--label for message--%>

    <div class="row">
        <div class="col-lg-12">
            <div class="mb-35">
                <asp:Label ID="lblMessage" CssClass="text-center" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>

    <div class="container" style="margin-bottom: 2em">
        <div class="row">
            <div class="col-lg-12">
                <h3>Orders</h3>
            </div>
        </div>
    </div>
    <%--Order area--%>


    <asp:DataList ID="dlOrder" runat="server" OnItemDataBound="dlOrder_ItemDataBound">
        <ItemTemplate>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="card order-list ms-5">
                            <div class="card-header">
                                <div class="d-flex justify-content-between">
                                    <span class="text-muted">#OrderID:
                            <asp:Label ID="lblOrderID" runat="server" Text='<%# Eval("OrderId") %>'></asp:Label></span>
                                    <span class="text-muted">
                                        <asp:Label ID="lblOrderDate" runat="server" Text='<%# Eval("OrderDate") %>'></asp:Label></span>
                                </div>
                            </div>
                            <asp:DataList ID="dlSingleOrder" runat="server">
                                <ItemTemplate>

                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <img class="img-fluid img-responsive rounded" src="../<%#( Eval("ProductImage")) %>" width="100" height="100">
                                            </div>
                                            <div class="col-md-9">
                                                <h5 class="card-title">
                                                    <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label></h5>
                                                <p class="card-text">
                                                    Price:
                                        <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("ProductPrice") %>'></asp:Label>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                            <div class="card-footer">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <p class="text-muted">
                                            Total Price:
                                <asp:Label ID="lblTotalPrice" runat="server" Text='<%# Eval("MaxOrderTotal") %>'></asp:Label>
                                        </p>
                                        <p class="text-muted">
                                            Payment Mode:
                                <asp:Label ID="lblPaymentMode" runat="server" Text='<%# Eval("PaymentMode") %>'></asp:Label>
                                        </p>
                                    </div>
                                    <div>
                                        <p class="text-muted">
                                            <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("BillingAddress") %>'></asp:Label>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
        </ItemTemplate>
    </asp:DataList>



    <br />
    <br />

    <style>
        .order-list {
            -webkit-box-shadow: 0px 0px 7px 0px rgba(0,0,0,0.37);
            -moz-box-shadow: 0px 0px 7px 0px rgba(0,0,0,0.37);
            box-shadow: 0px 0px 7px 0px rgba(0,0,0,0.37);
        }

            .order-list:hover {
                transition: transform ease 1s;
                transform: scale(1.03);
            }
    </style>

</asp:Content>
