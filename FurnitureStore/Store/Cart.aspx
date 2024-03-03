﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Store/Store.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="FurnitureStore.Store.Cart" EnableViewState="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- Start Hero Section -->
        <div class="container-fluid p-3" style="background-color:#3b5d50">
            <div class="row justify-content-between" style="padding-left:6rem">
                <div class="col-lg-5 text-white">
<%--                    <div class="intro-excerpt">--%>
                        <h1>Cart</h1>
                    </div>
                </div>
            </div>
    </div>
    <!-- End Hero Section -->

    <div class="untree_co-section before-footer-section">
        <div class="container">

            <!--Datalist-->

            <asp:DataList ID="dlCart" Width="100%" runat="server" DataKeyField="CartId">

                <%--<HeaderTemplate>
                    <div class="container">
                        <div class="row mb-5">
                            <form class="col-md-12" method="post">
                                <table class="table text-end">
                                    <thead>
                                        <tr>
                                            <th class="product-thumbnail" style="width: 12%;">Image</th>
                                            <th class="product-name" style="width: 22%;">Product</th>
                                            <th class="product-price" style="width: 19%;">Price</th>
                                            <th class="product-quantity" style="width: 15%;">Quantity</th>
                                            <th class="product-total" style="width: 18%;">Total</th>
                                            <th class="product-remove">Remove</th>
                                        </tr>
                                    </thead>
                                </table>
                            </form>
                        </div>
                    </div>
                </HeaderTemplate>--%>

                <ItemTemplate>

                    <div class="row mb-5">
                        <form class="col-md-12" method="post">
                            <div class="site-blocks-table">
                                <table class="table text-end">

                                    <thead>
                                        <tr>
                                            <th class="product-thumbnail">Image</th>
                                            <th class="product-name">Product</th>
                                            <th class="product-price">Price</th>
                                            <th class="product-quantity">Quantity</th>
                                            <th class="product-remove">Remove</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <tr>
                                            <td class="product-thumbnail">
                                                <img src="../Assets/images/product-1.png" alt="Image" class="img-fluid">
                                            </td>
                                            <td class="product-name">
                                                <h2 class="h5 text-black"><%#Eval("ProductName") %></h2>
                                            </td>
                                            <td><%#Eval("Price") %></td>
                                            <td>
                                                <div class="input-group mb-3 d-flex align-items-center quantity-container" style="max-width: 120px;">
                                                    <div class="input-group-prepend">
                                                        <asp:Button ID="btnMinus" CssClass="btn btn-outline-black decrease" runat="server" Text="-"/>
                                                    </div>
                                                    <asp:TextBox ID="txtQuantity" CssClass="form-control text-center quantity-amount" runat="server" Text="1"></asp:TextBox>
                                                    <div class="input-group-append">
                                                        <asp:Button ID="btnPlus" CssClass="btn btn-outline-black increase" runat="server" Text="+"/>
                                                    </div>

                                                </div>

                                            </td>
                                            <td><a href="#" class="btn btn-black btn-sm">X</a></td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </form>
                    </div>
                </ItemTemplate>
            </asp:DataList>

            <!--Buttons-->
            <div class="row">
                <div class="col-md-6">
                    <div class="row mb-5">
                        <div class="col-md-6 mb-3 mb-md-0">
                            <button class="btn btn-black btn-sm btn-block">Update Cart</button>
                        </div>
                        <div class="col-md-6">
                            <button class="btn btn-outline-black btn-sm btn-block">Continue Shopping</button>
                        </div>
                    </div>

                </div>
                <div class="col-md-6 pl-5">
                    <div class="row justify-content-end">
                        <div class="col-md-7">
                            <div class="row">
                                <div class="col-md-12 text-right border-bottom mb-5">
                                    <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <span class="text-black">Subtotal</span>
                                </div>
                                <div class="col-md-6 text-right">
                                    <strong class="text-black">$230.00</strong>
                                </div>
                            </div>
                            <div class="row mb-5">
                                <div class="col-md-6">
                                    <span class="text-black">Total</span>
                                </div>
                                <div class="col-md-6 text-right">
                                    <strong class="text-black">$230.00</strong>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <asp:Button ID="Button1" CssClass="btn btn-black btn-lg py-3 btn-block" runat="server" Text="Proceed To Checkout" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>


</asp:Content>
