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
                    <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="input-group h-25">
                    <asp:HyperLink ID="linkBack" runat="server" NavigateUrl="~/Admin/JobList.aspx" CssClass="btn btn-secondary" Visible="false">< Back</asp:HyperLink>
                </div>
            </div>


            <div class="row mr-lg-5 ml-lg-5 mb-3">

                <div class="col-md-6 pt-3">
                    <asp:Label for="txtJobTitle" runat="server" Style="font-weight: 600">Job Title</asp:Label>
                    <asp:TextBox ID="txtJobTitle" runat="server" CssClass="form-control" placeholder="Ex. Web Developer, App Developer" required></asp:TextBox>
                </div>
                <div class="col-md-6 pt-3">
                    <asp:Label for="txtNoOfPost" runat="server" Style="font-weight: 600">Number Of Positions</asp:Label>
                    <asp:TextBox ID="txtNoOfPost" runat="server" CssClass="form-control" placeholder="Enter Number of Positions" TextMode="Number" required></asp:TextBox>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-12 pt-3">
                    <asp:Label for="txtDescription" runat="server" Style="font-weight: 600">Description</asp:Label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Enter Job Description" TextMode="MultiLine" required></asp:TextBox>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <asp:Label for="txtQualification" runat="server" Style="font-weight: 600">Qualification/Education Required</asp:Label>
                    <asp:TextBox ID="txtQualification" runat="server" CssClass="form-control" placeholder="Ex. MCA, B.Tech, MBA" required></asp:TextBox>
                </div>

                <div class="col-md-6 pt-3">
                    <asp:Label for="fuCompanyLogo" runat="server" Style="font-weight: 600">Company/Organisation Logo</asp:Label>
                    <asp:FileUpload ID="fuComponyLogo" runat="server" CssClass="form-control" ToolTip=".jpg, .jpeg, .png" />
                </div>
            </div>


            <div class="row mr-lg-5 ml-lg-5 mb-3 pt-4">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" Text="Add" BackColor="#7200cf"/>
                </div>
            </div>

        </div>
    </div>


</asp:Content>
