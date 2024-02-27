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

            <%--label for message--%>

            <div class="row">
                <div class="col-lg-12">
                    <div class="mb-35">
                        <asp:Label ID="lblMessage" CssClass="text-center" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>


            <%--Order area--%>




            <asp:DataList ID="dlOrder" runat="server">

                <ItemTemplate>

                    <div class="single-job-items mb-30">

                        <div class="job-items">

                            <div class="company-img">

                                <a>

                                    <%--<img width="80" src="<%# GetImageUrl( Eval("CompanyImage")) %>" alt="">--%>
                                    <img width="80" src="../<%#( Eval("ProductImage")) %>" alt="">
                                </a>

                            </div>

                            <div class="job-tittle job-tittle2">

                                <a <%--href="JobDetails.aspx?id=<%# Eval("JobId") %>"--%>>

                                    <h5><%# Eval("PersonName") %></h5>

                                </a>

                                <ul>

                                    <li><%# Eval("ProductName") %></li>

                                    <li><i class="fas fa-map-marker-alt"></i><%# Eval("BillingAddress") %>, <%# Eval("PersonPinCode") %></li>

                                    <li><%# Eval("OrderTotal") %></li>

                                </ul>

                            </div>

                        </div>

                        <div class="items-link items-link2 f-right">

                            <a><%# Eval("PaymentMode") %></a>

                            <span class="text-secondary">

                                <i class="fas fa-clock pr-1"></i>

                                <%# RelativeDate(Convert.ToDateTime(Eval("OrderDate"))) %>

                            </span>

                        </div>

                    </div>

                </ItemTemplate>

            </asp:DataList>


        </div>
    </div>





</asp:Content>
