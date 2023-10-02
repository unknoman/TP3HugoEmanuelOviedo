<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrosContables.aspx.cs" Inherits="TP3HugoEmanuelOviedo.RegistrosContables" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 422px; width: 347px">
            <asp:Label ID="info" runat="server"></asp:Label>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Cuenta:"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="descripcion" DataValueField="id">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT [id], [descripcion] FROM [Cuentas]"></asp:SqlDataSource>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Monto:"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Tipo:"></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar" />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Eliminar" />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Editar" />
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Registro Contable ID:"></asp:Label>
            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="ListadoRegistros" DataTextField="id" DataValueField="id">
            </asp:DropDownList>
            <asp:SqlDataSource ID="ListadoRegistros" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT [id], [idCuenta], [monto], [tipo] FROM [RegistrosContables]"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="Listado">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
                    <asp:BoundField DataField="monto" HeaderText="monto" SortExpression="monto" />
                    <asp:CheckBoxField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="Listado" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT RegistrosContables.monto, RegistrosContables.tipo, Cuentas.descripcion, RegistrosContables.id FROM RegistrosContables INNER JOIN Cuentas ON RegistrosContables.idCuenta = Cuentas.id"></asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="Crud" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [RegistrosContables] WHERE [id] = @id" InsertCommand="INSERT INTO [RegistrosContables] ([idCuenta], [monto], [tipo]) VALUES (@idCuenta, @monto, @tipo)" SelectCommand="SELECT * FROM [RegistrosContables]" UpdateCommand="UPDATE [RegistrosContables] SET [idCuenta] = @idCuenta, [monto] = @monto, [tipo] = @tipo WHERE [id] = @id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="DropDownList3" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="idCuenta" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TextBox1" Name="monto" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="DropDownList2" Name="tipo" PropertyName="SelectedValue" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="idCuenta" Type="Int32" />
                    <asp:Parameter Name="monto" Type="Int32" />
                    <asp:Parameter Name="tipo" Type="Boolean" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
