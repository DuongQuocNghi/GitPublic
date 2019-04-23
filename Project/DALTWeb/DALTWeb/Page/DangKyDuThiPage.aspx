<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangKyDuThiPage.aspx.cs" Inherits="DALTWeb.Page.DangKyDuThiPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" style="padding: 20px 60px 20px 60px;">
        <div style="border: 1px solid #EC1C2F;">
            <div style="padding: 20px; background-color: #EC1C2F; text-align: center;">
                <div>

                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Resource/Image/logo.png" />

                </div>
                <h2 style="color: #FFFFFF">ĐĂNG KÝ TRỰC TUYẾN</h2>
                <div>
                    <a>

                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Resource/Image/thele.png" />

                    </a>
                </div>
            </div>

            <div style="padding: 20px">
                <div>
                    <label style="font-size: 20px">Họ & Tên:</label>
                </div>
                <div>
                    <div style="border: 1px solid #C1C1C1;">
                        <input placeholder="Họ &amp; Tên" style="padding: 5px 0px 5px 15px; border-style: none; width: 100%; font-size:medium; " />
                    </div>
                </div>
            </div>
            
            <div style="padding: 20px">
                <div>
                    <label style="font-size: 20px">Ngày Sinh: </label>
                </div>
                <div>
                    <div style="border: 1px solid #C1C1C1;">
                        <input placeholder="ngày / tháng / năm" style="padding: 5px 0px 5px 15px; border-style: none; width: 100%; font-size:medium; " />
                    </div>
                </div>
            </div>
               
            <div style="padding: 20px">
                <div>
                    <label style="font-size: 20px">Tỉnh hành:</label>
                </div>
                <div>
                    <div style="border: 1px solid #C1C1C1;">
                        <input placeholder="Tỉnh hành" style="padding: 5px 0px 5px 15px; border-style: none; width: 100%; font-size:medium; " />
                    </div>
                </div>
            </div>
               
            <div style="padding: 20px">
                <div>
                    <label style="font-size: 20px">Liên hệ:</label>
                </div>
                <div>
                    <div style="border: 1px solid #C1C1C1; margin: 15px 0px 0px 0px;">
                        <input placeholder="Email" style="padding: 5px 0px 5px 15px; border-style: none; width: 100%; font-size:medium; " />
                    </div>
                    
                    <div style="border: 1px solid #C1C1C1; margin: 15px 0px 0px 0px;">
                        <input placeholder="Điện Thoại: (xxx) - xxx xxxx" style="padding: 5px 0px 5px 15px; border-style: none; width: 100%; font-size:medium; " />
                    </div>
                </div>
            </div>
               
            <div style="padding: 20px">
                <div>
                    <label style="font-size: 20px">Clip Dự Thi:</label>
                </div>
                <div>
                    <div style="border: 1px solid #C1C1C1;">
                        <input placeholder="Gửi link Youtube bài dự thi tại đây" style="padding: 5px 0px 5px 15px; border-style: none; width: 100%; font-size:medium; " />
                    </div>
                </div>
            </div>
               
            <div style="padding: 20px">
                <div>
                    <label style="font-size: 20px">Tên Ca Khúc:</label>
                </div>
                <div>
                    <div style="border: 1px solid #C1C1C1;">
                        <input placeholder="Tên Ca Khúc" style="padding: 5px 0px 5px 15px; border-style: none; width: 100%; font-size:medium; " />
                    </div>
                </div>
            </div>
               
            <div style="padding: 20px">
                <div>
                    <label style="font-size: 20px">Mong Ước Bản Thân:</label>
                </div>
                <div>
                    <textarea placeholder="Ghi Chú" rows="3" style="border: 1px solid #C1C1C1; padding: 5px 0px 5px 15px; width: 100%; font-size:large"></textarea>
                </div>
            </div>
               
            <button style="color:white; padding:10px; margin-left: 20px; margin-bottom: 20px; background-color: #3576BD">Đăng Ký</button>

        </div>
    </form>
</body>
</html>
