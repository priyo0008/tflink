﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Child.aspx.cs" Inherits="TflinkTest.FamilyTree.Add_Child" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="container">
            <!-- Trigger the modal with a button -->
            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Add Child </h4>
                            <p runat="server" id="Bindmemnm"></p>
                        </div>
                        <div class="modal-body">
                            <p>
                                You are trying to link to a person whose profile is Administered by someone else.
                            </p>
                            That Administrator is:
                            <p runat="server" id="Admstrtname"></p>
                            <p>
                                Before you can link through to this person, the Administrator needs to accept this action.
                                We will send this Administrator an email asking for their approval to make this link. Once they accept, you can use the link.
                                Add a message to the Administrator if you want:
                            </p>
                            <asp:TextBox ID="txt_msg" TextMode="MultiLine" Rows="3" runat="server"></asp:TextBox>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btn_save" CssClass="btn btn-default" OnClick="btn_save_Click1" OnClientClick="return Validate();" runat="server" Text="Send" />
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>

            <div class="container">
                <h2>
                    <asp:Label ID="lblMessage" ForeColor="Green" Font-Bold="true" Text="Message has been sent successfully." runat="server" Visible="false" />
                </h2>
                <h1>Add Child</h1>
                <asp:Button ID="btnClose" CssClass="settings" runat="server" Text="Close" Visible="false" CausesValidation="false" />
            </div>
            <div id="exTab1" class="container">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#1a" data-toggle="tab">Select Your Child</a>

                    </li>
                    <li><a href="#2a" data-toggle="tab">Add New Member</a>
                    </li>
                    <li>
                        <p runat="server" id="P1"></p>
                    </li>
                </ul>

                <div class="tab-content clearfix">
                    <%--Add parents from here by choose--%>
                    <div class="tab-pane active" id="1a">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-md-12" runat="server" id="Bindnotice">
                                                Add Child 
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                You are <span style="color: Red; font-weight: bold; font-size: small">*</span> : 
                            <asp:DropDownList ID="ddl_youare" CssClass="form-control" runat="server">
                                <asp:ListItem>Select</asp:ListItem>
                                <asp:ListItem>Mother</asp:ListItem>
                                <asp:ListItem>Father</asp:ListItem>
                                <asp:ListItem>Guardian</asp:ListItem>
                                <asp:ListItem>Stepmother</asp:ListItem>
                                <asp:ListItem>Stepfather</asp:ListItem>
                            </asp:DropDownList>
                                            </div>
                                            <div class="col-md-3">
                                                Choose Spouse Id <span style="color: Red; font-weight: bold; font-size: small">*</span> : 
                                                <asp:DropDownList ID="ddl_Mothername" CssClass="form-control" AutoPostBack="true" OnTextChanged="ddl_Mothername_TextChanged" runat="server">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-3">
                                                Choose Spouse Name <span style="color: Red; font-weight: bold; font-size: small">*</span> : 
                                                <asp:TextBox ID="txt_Mothername" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                            </div>
                                            <%--  <div class="col-md-6">
                                                Email Id : 
                            <asp:TextBox ID="txt_Email" onkeyup="ValidateEmail()" onblur="validateEmail(this);" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>--%>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <p>
                                                    If the person already exists in the system, enter the name here and click on Search
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-10">
                                                <asp:TextBox ID="txt_search" AutoPostBack="true" OnTextChanged="txt_search_TextChanged" CssClass="form-control" runat="server"></asp:TextBox>
                                                <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" ServiceMethod="GetCompletionListsubcatagory" MinimumPrefixLength="1" CompletionInterval="10" EnableCaching="false" CompletionSetCount="1" FirstRowSelected="false" TargetControlID="txt_search">
                                                </cc1:AutoCompleteExtender>
                                            </div>
                                            <div class="col-md-2">
                                                <asp:Button ID="btn_serch" class="btn btn-dafault" OnClick="btn_serch_Click" runat="server" Text="Search" />
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="row">
                                            <div class="col-md-6">
                                            </div>
                                            <div class="col-md-3">
                                                <%--   <asp:Button ID="btn_Gotonextpage" runat="server" class="btn btn-dafault" Text="Click To Add New Person" OnClientClick="return ShowModalPopupParents()" />
                                <asp:LinkButton ID="lnkFake" runat="server"></asp:LinkButton>
                                <cc1:ModalPopupExtender ID="ModalPopupExtender2" BehaviorID="mpeParents" runat="server" PopupControlID="pnlPopUpparents"
                                    TargetControlID="lnkFake" BackgroundCssClass="modalBackground" CancelControlID="btn_Gotonextpage">
                                </cc1:ModalPopupExtender>--%>
                                                <%-- <p>OR if the person is not yet set up, </p>--%>
                                            </div>
                                            <div class="col-md-3">
                                                <div>
                                                    <%-- <button type="button" style="margin-left: auto; margin-right: auto; display: block;" class="btn btn-primary">+Add Parents</button>--%>
                                                    <%--<asp:Button ID="Button1" runat="server" Style="margin-left: auto; margin-right: auto; display: block;" class="btn btn-info" OnClientClick="return ShowModalPopupParents()"
                                        Text="+Add Parents" />
                                    <asp:LinkButton ID="lnkFake" runat="server"></asp:LinkButton>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" BehaviorID="mpeParents" runat="server" PopupControlID="pnlPopUpparents"
                                        TargetControlID="lnkFake" BackgroundCssClass="modalBackground" CancelControlID="btnCloseparents">
                                    </cc1:ModalPopupExtender>--%>
                                                    <%--  <a class="thickbox"
                                        title="Add Child" runat="server" id="lnkAddChild"
                                        href="popuptest.aspx?From=FamilyTree&=true&height=560&width=950&modal=true">
                                          <asp:Button ID="Button2" runat="server" Text="Add" />
                                    </a>--%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-row">
                                            <div class="col-md-12" style="overflow: scroll; height: 200px;">
                                                <asp:GridView ID="grd_bindmembers" Width="100%" CssClass="table-responsive table table-bordered" runat="server" CellPadding="4" AutoGenerateColumns="false" ForeColor="#333333" GridLines="None">
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:RadioButton ID="rdo_check" runat="server" onclick="singleRbtnSelect(this);" />
                                                                <asp:HiddenField ID="hidPlanID" runat="server" Value='<%#Eval("id")%>' />
                                                                <%--<asp:RadioButton ID="rdo_check"   onclick="RadioCheck(this);" runat="server" />--%>
                                                                <%--<asp:CheckBox ID="rdo_check" runat="server" />--%>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Member Id">
                                                            <ItemTemplate>
                                                                <asp:Label CssClass="invisibletext" ID="lbl_membid" runat="server" Text='<%#Eval("MemberId") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="First Name">
                                                            <ItemTemplate>
                                                                <asp:Label CssClass="invisibletext" ID="Label2" runat="server" Text='<%#Eval("FirstName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Last Name">
                                                            <ItemTemplate>
                                                                <asp:Label CssClass="invisibletext" ID="Label3" runat="server" Text='<%#Eval("LastName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Contact">
                                                            <ItemTemplate>
                                                                <asp:Label CssClass="invisibletext" ID="Label6" runat="server" Text='<%#Eval("Contact") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Gender">
                                                            <ItemTemplate>
                                                                <asp:Label CssClass="invisibletext" ID="Label4" runat="server" Text='<%#Eval("Gender") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Dob">
                                                            <ItemTemplate>
                                                                <asp:Label CssClass="invisibletext" ID="Label5" Text='<%# Bind("Dob","{0:dd/MM/yyyy}") %>' runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <EditRowStyle BackColor="#7C6F57" />
                                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#E3EAEB" />
                                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                                                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                                                </asp:GridView>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <%--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
                                        <%--<button type="button" class="btn btn-primary">Save</button>--%>
                                        <%--<asp:Button ID="btn_chk" OnClick="btn_chk_Click" runat="server" Text="Check" />--%>
                                        <asp:Button ID="btn_Savee" runat="server" OnClick="btn_Savee_Click" class="btn btn-info btn-lg" Text="Save" />
                                        <div id="btnmodal" runat="server" visible="false">
                                            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Continue</button>
                                        </div>
                                    </div>
                                    <div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--Add New Member--%>
                    <div class="tab-pane" id="2a">

                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="modal-body">
                                        <%--   <div class="row">
                    <div class="col-md-12">
                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddl_Spousetype">
                        <asp:ListItem>Select Type</asp:ListItem>
                        <asp:ListItem>Marriage</asp:ListItem>
                        <asp:ListItem>Common Law</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>
                    </div>
                    
                </div>--%>
                                        <div class="row">
                                            <div runat="server" id="Div1">
                                            </div>
                                        </div>
                                        <%--         <div class="row" style="visibility:hidden;">
                            <div class="col-md-6">
                                You are<span style="color: Red; font-weight: bold; font-size: small">*</span> :
                            <asp:DropDownList ID="ddl_Youare" CssClass="form-control" runat="server">
                                <asp:ListItem>Father</asp:ListItem>
                                <asp:ListItem>Mother</asp:ListItem>
                                <asp:ListItem>Guardian</asp:ListItem>
                                <asp:ListItem>Stepmother</asp:ListItem>
                                <asp:ListItem>Stepfather</asp:ListItem>
                            </asp:DropDownList>
                            </div>
                            <div class="col-md-3">
                                Spouse Id : 
                           <asp:DropDownList ID="DropDownList1" OnTextChanged="ddl_Mothername_TextChanged" AutoPostBack="true" CssClass="form-control" runat="server">
                           </asp:DropDownList>
                            </div>
                            <div class="col-md-3">
                                Spouse  : 
                                 <asp:TextBox ID="TextBox1" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>--%>
                                        <div class="row">
                                            <div class="col-md-6">
                                                Gender<span style="color: Red; font-weight: bold; font-size: small">*</span> :
                            <asp:DropDownList ID="ddl_gender" CssClass="form-control" runat="server">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        Phone : 
                            <asp:TextBox ID="txt_Phonenmb" AutoPostBack="true" OnTextChanged="txt_Phonenmb_TextChanged" onkeypress="javascript:return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>

                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                First Name :<span style="color: Red; font-weight: bold; font-size: small">*</span> : 
                            <asp:TextBox ID="txt_Fname" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6">
                                                Email Id : 
                            <asp:TextBox ID="txt_Email" onkeyup="ValidateEmail()" onblur="validateEmail(this);" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                Last Name :<span style="color: Red; font-weight: bold; font-size: small">*</span> : 
                            <asp:TextBox ID="txt_Lname" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6">
                                                Address : 
                            <asp:TextBox ID="txt_address" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                City/Town : 
                            <asp:TextBox ID="txt_City" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6">
                                                Region/State : 
                            <asp:TextBox ID="txt_State" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                Date of Birth(DOB) : 
                            <asp:TextBox ID="txt_Dob" CssClass="form-control" autocomplete="off" runat="server"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="txt_Dob" Format="yyyy/MM/dd"></cc1:CalendarExtender>
                                                <asp:CheckBox ID="chb_dobCirca" runat="server" />Circa
                                            </div>
                                            <div class="col-md-6">
                                                Country :<span style="color: Red; font-weight: bold; font-size: small">*</span> : 
                            <asp:DropDownList ID="ddl_Country" CssClass="form-control" runat="server">
                                <asp:ListItem>India</asp:ListItem>
                                <asp:ListItem>USA</asp:ListItem>
                            </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                Birth Location : 
                            <asp:TextBox ID="txt_Birthloc" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                                <div class="col-md-6">
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate> 
                                                Date of Death(DOD) : 
                           <p id="curalive" runat="server"> Currently Alive </p>
                            <asp:Button ID="btn_Edit" class="btn btn-primary" OnClick="btn_Edit_Click" runat="server" Text="Edit" />
                                                <asp:TextBox ID="txt_Dod" Visible="false"  autocomplete="off" CssClass="form-control" runat="server"></asp:TextBox>
                                                        
                                                <cc1:CalendarExtender ID="txt_frmDT_CalendarExtender" runat="server" Enabled="True" TargetControlID="txt_Dod" Format="yyyy/MM/dd"></cc1:CalendarExtender>
                                                <div runat="server" id="divcreca" visible="false">
                                                    <asp:CheckBox ID="chb_dodCirca" Visible="false" runat="server" />Circa
                                                </div> 
                                                        <div runat="server" id="Deathlocdiv" visible="false">
                                                             Death Location : 
                                                            <asp:TextBox ID="txt_deathloc"  Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
                                                        </div>
                                                        
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                Notes : 
                            <asp:TextBox ID="txt_notes" TextMode="MultiLine" Rows="3" CssClass="form-control" runat="server"></asp:TextBox>
                                                fields with <span style="color: Red; font-weight: bold; font-size: small">*</span> must be filled in, all the rest are optional.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <%--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
                                        <%--<button type="button" class="btn btn-primary">Save</button>--%>
                                        <asp:Button ID="Button1" class="btn btn-primary" OnClick="btn_save_Click" runat="server" Text="Save" />
                                    </div>
                                    <div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Bootstrap core JavaScript
    ================================================== -->
            <!-- Placed at the end of the document so the pages load faster -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        </div>
    </form>
</body>
</html>
