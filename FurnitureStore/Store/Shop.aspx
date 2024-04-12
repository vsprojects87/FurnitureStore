<%@ Page Title="" Language="C#" MasterPageFile="~/Store/Store.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="FurnitureStore.Store.Shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <style>
        lb-addcart {
            cursor: pointer;
        }
    </style>


    <%--    <!-- Start Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-lg-5">
                    <div class="intro-excerpt">
                        <h1>Shop</h1>
                    </div>
                </div>
                <div class="col-lg-7">
                </div>
            </div>
        </div>
    </div>
    <!-- End Hero Section -->--%>

    <div class="untree_co-section product-section before-footer-section">
        <div class="container">
            <div class="row">

                <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="4">
                    <ItemTemplate>

                        <!-- Start Column 1 -->
                        <div class="col-12 col-md-4 col-lg-10 mb-5 align-content-lg-center">
                            <%-- changes : from col-lg-3 to col-lg-10 --%>
                            <a class="product-item" href="#" style="height: 220px">
                                <img src="../<%#(Eval("ProductImage")) %>" class="img-fluid product-thumbnail" style="height: 100px">
                                <h3 class="product-title"><%#Eval("ProductName") %></h3>
                                <strong class="product-price"><%#Eval("ProductPrice") %></strong>
                            </a>
                            <span style="margin-left: 30%; text-decoration: none">
                                <asp:LinkButton CssClass="lb-addcart link-info bordered fs-6" ID="lbAddToCart" runat="server" OnClick="lbAddToCart_Click" CommandArgument='<%#Eval("ProductId") %>'>Add to Cart</asp:LinkButton>
                            </span>
                        </div>
                        <!-- End Column 1 -->
                    </ItemTemplate>
                </asp:DataList>




            </div>
        </div>
    </div>




</asp:Content>
