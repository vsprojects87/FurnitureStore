<%@ Page Title="" Language="C#" MasterPageFile="~/Store/Store.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="FurnitureStore.Store.Cart" EnableViewState="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <style type="text/css">
        .rowStyle {
            margin-bottom: 10px; /* Adjust the value as needed */
        }
    </style>

    <!-- Start Hero Section -->
    <div class="container-fluid p-3" style="background-color: #3b5d50">
        <div class="row justify-content-between" style="padding-left: 6rem">
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

            <!-- Cart Items GridView-->


            <asp:GridView ID="gv_shopcart" runat="server" AutoGenerateColumns="False"
                DataKeyNames="CartId" ShowFooter="True" OnRowDeleting="gv_shopcart_RowDeleting"
                ShowHeaderWhenEmpty="True"
                EmptyDataText="  Not product in shopping cart "
                EmptyDataRowStyle-ForeColor="Red" GridLines="None" CssClass="table table-borderless">
                <HeaderStyle ForeColor="MediumBlue" />
                <Columns>

                    <asp:TemplateField HeaderText="Image">
                        <%--                        <HeaderStyle BorderStyle="Groove" BorderWidth="1px" HorizontalAlign="Center" />--%>
                        <ItemStyle BorderStyle="Groove" BorderWidth="1px" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <img src='../Assets/images/sofa.png' alt="Image" style="height: 50px; width: 50px;" />
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:BoundField DataField="ProductImage" HeaderText="Product" ReadOnly="True">
                        <%--                        <HeaderStyle BorderStyle="Groove" BorderWidth="1px" HorizontalAlign="Center" />--%>
                        <ItemStyle BorderStyle="Groove" BorderWidth="1px" HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="ProductName" HeaderText="ProductName">
                        <%--                        <HeaderStyle BorderStyle="Groove" BorderWidth="1px" HorizontalAlign="Center" />--%>
                        <ItemStyle BorderStyle="Groove" BorderWidth="1px" HorizontalAlign="Left" />
                    </asp:BoundField>

                    <asp:BoundField DataField="price" HeaderText="Price" ReadOnly="True">
                        <%--                        <HeaderStyle BorderStyle="Groove" BorderWidth="1px" HorizontalAlign="Center" />--%>
                        <ItemStyle BorderStyle="Groove" BorderWidth="1px" HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:CommandField HeaderText="Option" DeleteText="X" ControlStyle-CssClass="btn"
                        ShowDeleteButton="True">
                        <%--                        <HeaderStyle BorderStyle="Groove" BorderWidth="1px" HorizontalAlign="Center" />--%>
                        <ItemStyle BorderStyle="Groove" BorderWidth="1px" HorizontalAlign="Center" />
                    </asp:CommandField>
                </Columns>
                <RowStyle Font-Size="Large" Font-Bold="true" Height="80px"/>

            </asp:GridView>


            <!-- Cart Items GridView Ends-->



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
