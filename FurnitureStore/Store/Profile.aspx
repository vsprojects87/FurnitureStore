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


    <asp:DataList ID="dlOrder" runat="server">
        <ItemTemplate>
            <div class="container mt-5 mb-5">
                <div class="d-flex justify-content-center row">
                    <div class="col-md-10">
                        <div class="row p-2 bg-white border rounded mt-2 order-list" style="border-radius:1.5rem !important">
                            <div class="col-md-3 mt-1">
                                <img class="img-fluid img-responsive rounded product-image" src="../<%#( Eval("ProductImage")) %>">
                            </div>
                            <div class="col-md-5 mt-3">
                                <h3><%# Eval("PersonName") %></h3>
                                <br />
                                <div class="mt-1 mb-1 spec-1">
                                    <h4><%# Eval("ProductName") %></h4>
                                </div>
                                <div class="mt-1 mb-1 spec-1">
                                    <span class="dot">
                                        <h5>Order Id #&nbsp<%# Eval("OrderId") %></h5>
                                    </span>
                                    <br>
                                </div>

                                <p class="text-justify text-truncate para mb-0" style="font-size: large">
                                    <span><i class="fas fa-map-marker-alt"></i>&nbsp<%# Eval("BillingAddress") %>, <%# Eval("PersonPinCode") %></span><br>
                                    <br>
                                </p>
                            </div>
                            <div class="align-items-center align-content-center col-md-4 border-left mt-3">
                                <div class="d-flex flex-row align-items-center">
                                    <h6 class="mr-1"><%#Eval("OrderDate") %></h6>
                                </div>
                                <h6 class="text-success"><%# RelativeDate(Convert.ToDateTime(Eval("OrderDate"))) %></h6>
                                <div class="d-flex flex-column mt-4">
                                    <button class="btn btn-primary btn-sm" type="button" style="font-size: 1.5em">RS.&nbsp&nbsp<%# Eval("OrderTotal") %></button>
                                    <button class="btn btn-outline-primary btn-sm mt-2" type="button" style="font-size: 1.3em"><%# Eval("PaymentMode") %></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>

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
            .product-image{
                max-height:50vw !important;
            }
    </style>

</asp:Content>
