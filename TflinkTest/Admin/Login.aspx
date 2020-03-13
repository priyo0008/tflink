﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TflinkTest.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>AdminLTE 3 | Log in</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Font Awesome -->
    <%--<link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css"/>--%>
    <link href="../css/all.min.css" rel="stylesheet" />

    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />

    <!-- icheck bootstrap -->
    <%--<link rel="stylesheet" href="../plugins/icheck-bootstrap/icheck-bootstrap.min.css"/>--%>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <!-- Theme style -->
    <%--<link rel="stylesheet" href="../dist/css/adminlte.min.css"/>--%>
    <link href="../css/adminlte.min.css" rel="stylesheet" />

    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet" />
</head>
<body class="hold-transition login-page" style="background-color: cadetblue;">
    <form id="form1" runat="server">
        <div class="login-box">
            <div class="login-logo">
                <%-- <a href="../../index2.html"><b>Admin</b>LTE</a>--%>
            </div>
            <!-- /.login-logo -->
            <div class="col-md-12" style="margin-top: 120px;">
                <div class="row">
                    <div class="col-md-4">
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body login-card-body">
                                <p class="login-box-msg">Login</p>
                                <asp:Panel runat="server" DefaultButton="btn_submit">
                                <div>
                                    <div class="input-group mb-3">
                                        <%--<input type="email" class="form-control" placeholder="Email"/>--%>
                                        <asp:TextBox ID="txt_Userid" runat="server" class="form-control" placeholder="User Id"></asp:TextBox>
                                        <div class="input-group-append">
                                            <div class="input-group-text">
                                                <span class="fas fa-envelope"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="input-group mb-3">
                                        <%--<input type="password" class="form-control" placeholder="Password" />--%>
                                        <asp:TextBox ID="txt_password" class="form-control" type="password" placeholder="Password" runat="server"></asp:TextBox>
                                        <div class="input-group-append">
                                            <div class="input-group-text">
                                                <span class="fas fa-lock"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-8">
                                            <div class="icheck-primary">
                                                <input type="checkbox" id="remember" />
                                                <label for="remember">
                                                    Remember Me 
                                                </label>
                                            </div>
                                        </div>
                                        <!-- /.col -->
                                        <div class="col-4">
                                            <%--<button type="submit" class="btn btn-primary btn-block">Sign In</button>--%>
                                            <asp:Button ID="btn_submit" OnClick="btn_submit_Click" class="btn btn-primary btn-block" runat="server" Text="Login" />
                                        </div>
                                        <!-- /.col -->
                                    </div>
                                </div>
                                    </asp:Panel>

                                <%--  <div class="social-auth-links text-center mb-3">
        <p>- OR -</p>
        <a href="#" class="btn btn-block btn-primary">
          <i class="fab fa-facebook mr-2"></i> Sign in using Facebook
        </a>
        <a href="#" class="btn btn-block btn-danger">
          <i class="fab fa-google-plus mr-2"></i> Sign in using Google+
        </a>
      </div>--%>
                                <!-- /.social-auth-links -->

                                <%--    <p class="mb-1">
        <a href="forgot-password.html">I forgot my password</a>
      </p>
      <p class="mb-0">
        <a href="register.html" class="text-center">Register a new membership</a>
      </p>--%>
                            </div>
                            <!-- /.login-card-body -->
                        </div>
                    </div>
                    <div class="col-md-4">
                    </div>
                </div>
            </div>

        </div>
        <!-- /.login-box -->

        <!-- jQuery -->
        <script src="../../plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="../../dist/js/adminlte.min.js"></script>
    </form>
</body>
</html>
