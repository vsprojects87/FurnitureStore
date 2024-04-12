<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="FurnitureStore.Admin.DashBoard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container">
        <div>
            <h1>Hello Admin !</h1>
        </div>
        <div class="row m-5">
            <div class="col-md-4">


                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <h4 class="card-title">Total Products</h4>
                        <h1 class="p-4">
                            <asp:Label ID="lblProducts" runat="server" Text="0"></asp:Label></h1>
                        <a href="NewProducts.aspx" class="card-link">Add Product</a>
                        <a href="ProductList.aspx" class="card-link">View Products</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">

                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <h4 class="card-title">Total Orders</h4>
                        <h1 class="p-4">
                            <asp:Label ID="lblOrders" runat="server" Text="0"></asp:Label>
                        </h1>
                        <a href="Orders.aspx" class="card-link">View Orders</a>
                        <a href="UserList.aspx" class="card-link">View Users</a>
                    </div>
                </div>
            </div>
        </div>
    </div>





</asp:Content>
