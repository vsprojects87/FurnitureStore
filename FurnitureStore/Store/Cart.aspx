<%@ Page Title="" Language="C#" MasterPageFile="~/Store/Store.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="FurnitureStore.Store.Cart" EnableViewState="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <style type="text/css">
        .rowStyle {
            margin-bottom: 10px; /* Adjust the value as needed */
        }

        .sofa-img {
            display: none;
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

    <div class="mt-5">
        <div class="container">

            <!-- Cart Items GridView-->


            <asp:GridView ID="gv_shopcart" runat="server" AutoGenerateColumns="False"
                DataKeyNames="CartId" OnRowDeleting="gv_shopcart_RowDeleting"
                ShowHeaderWhenEmpty="True"
                EmptyDataText="  Not product in shopping cart "
                EmptyDataRowStyle-ForeColor="Red" GridLines="None" CssClass="table table-borderless">
                <HeaderStyle ForeColor="MediumBlue" />
                <Columns>

                    <asp:TemplateField HeaderText="Image">
                        <%--                        <HeaderStyle BorderStyle="Groove" BorderWidth="1px" HorizontalAlign="Center" />--%>
                        <ItemStyle BorderStyle="Groove" BorderWidth="1px" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/" + Eval("ProductImage") %>' AlternateText="Product" CssClass="image-fluid w-auto" Height="70" />
                            <%--<img src='<%# ResolveUrl("~/Assets/") + Eval("ProductImage") %>' alt="Image" style="height: 50px; width: 50px;" class="img-fluid" />--%>
                        </ItemTemplate>

                    </asp:TemplateField>

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

                <RowStyle Font-Size="Large" Font-Bold="true" Height="80px" />

            </asp:GridView>

            <div style="margin-top:25px">
                <asp:Label ID="Label1" runat="server" CssClass="text-black h5 text-uppercase d-sm-inline" Text="Cart Totals : "></asp:Label>
                <asp:Label ID="lblTotalAllCart" CssClass="text-black h5" runat="server" Text="0 rs"></asp:Label>
            </div>

            <!-- Cart Items GridView Ends-->



            <!--Buttons-->
            <div class="row mt-5">
                <div class="col-md-6">
                    <div class="row mb-5">
                        <div class="col-md-5">
                            <a href="Shop.aspx" class="btn btn-outline-black btn-sm btn-block">Continue Shopping</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 pl-5">
                    <div class="row justify-content-end">
                        <div class="col-md-7">
                            <div class="row mb-5">
                                <div class="col-md-12">
                                    <asp:Button ID="Button1" CssClass="btn btn-black btn-lg py-2 btn-block" runat="server" Text="Proceed To Checkout" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>


</asp:Content>
