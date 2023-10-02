<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cuentas.aspx.cs" Inherits="TP3HugoEmanuelOviedo.Cuentas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            height: 175px;
            width: 960px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 186px; float: none;">
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="Listado" DataTextField="descripcion" DataValueField="id" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:SqlDataSource ID="Listado" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT [id], [descripcion] FROM [Cuentas]"></asp:SqlDataSource>
            <br />
&nbsp;</div>
        <div style="height: 293px; width: 460px; float: none; margin-left: 0px;">
            <asp:Label ID="Label1" runat="server" Text="Descripcion:"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Agregar" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Eliminar" OnClick="Button2_Click" />
            <asp:Button ID="Button3" runat="server" Text="Modificar" OnClick="Button3_Click" />
            <br />
            <br />
            <asp:Label ID="info" runat="server"></asp:Label>
            <asp:SqlDataSource ID="Crud" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [Cuentas] WHERE [id] = @id" InsertCommand="INSERT INTO [Cuentas] ([descripcion]) VALUES (@descripcion)" SelectCommand="SELECT [id], [descripcion] FROM [Cuentas]" UpdateCommand="UPDATE [Cuentas] SET [descripcion] = @descripcion WHERE [id] = @id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="descripcion" PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="descripcion" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT [id], [descripcion] FROM [Cuentas]"></asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
