<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="NewProducts.aspx.cs" Inherits="FurnitureStore.Admin.NewProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-image: url('../Images/bg.jpg'); width: 100%; height: 700px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed">

        <div class="container pt-4 pb-4">
            <%--<div>
                <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
            </div>--%>
            <div class="btn-toolbar justify-content-between mb-3">
                <div class="btn-group">
                    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                </div>
                <div class="input-group h-25">
                    <asp:HyperLink ID="linkBack" runat="server" NavigateUrl="~/Admin/ProductList.aspx" CssClass="btn btn-secondary" Visible="false">< Back</asp:HyperLink>
                </div>
            </div>


            <div class="row mr-lg-5 ml-lg-5 mb-3">

                <div class="col-md-6 pt-3">
                    <asp:Label for="txtProductName" runat="server" Style="font-weight: 600">Product Name</asp:Label>
                    <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" placeholder="Ex. Office table, Home Chair" required></asp:TextBox>
                </div>
                <div class="col-md-6 pt-3">
                    <asp:Label for="txtProductPrice" runat="server" Style="font-weight: 600">Price</asp:Label>
                    <asp:TextBox ID="txtProductPrice" runat="server" CssClass="form-control" placeholder="Enter Price" TextMode="Number" required></asp:TextBox>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-12 pt-3">
                    <asp:Label for="txtDescription" runat="server" Style="font-weight: 600">Description</asp:Label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Enter Item Description" TextMode="MultiLine" required></asp:TextBox>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <asp:Label for="txtCategory" runat="server" Style="font-weight: 600">Category</asp:Label>
                    <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control" placeholder="Ex. Chair, Sofa, Table" required></asp:TextBox>
                </div>

                <div class="col-md-6 pt-3">
                    <asp:Label for="fuItemImage" runat="server" Style="font-weight: 600">Item Image</asp:Label>
                    <asp:FileUpload ID="fuItemImage" runat="server" CssClass="form-control" ToolTip=".jpg, .jpeg, .png" />
                </div>
            </div>


            <div class="row mr-lg-5 ml-lg-5 mb-3 pt-4">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" Text="Add" BackColor="#7200cf" OnClick="btnAdd_Click"/>
                </div>
            </div>

        </div>
    </div>


</asp:Content>
