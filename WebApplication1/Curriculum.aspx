<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Curriculum.aspx.cs" Inherits="WebApplication1.Properties.Curriculum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            padding: 0px;
        }

        .years_table {
            border-collapse: collapse;
            text-align: center;
        }

        .years_table {
            width: 100%;
            position:absolute;
            top:0px;
        }
        .years_table th{
            font-size: 22px;
            padding: 0px;
            border-top: 2px solid black;
            border-bottom: 2px solid black;
        }

            .years_table td {
                font-size: 18px;
                padding: 0px;
            }

        .years {
            width: 18%;
            height: 100%;
            font-size: medium;
            padding: 0px;
            position:relative;
        }

        .content {
            height: 100vh;
            padding: 0px;
        }
        .auto-style4 {
            height: 27px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="years" style="background-color: #00FFFF">
                <table class="years_table">
                    <tr>
                        <th>FY</th>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                            <asp:HyperLink ID="sem1" runat="server" ForeColor="Red" NavigateUrl="~/Curriculum.aspx?page=SemI">SEM I</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:HyperLink ID="sem2" runat="server" NavigateUrl="~/Curriculum.aspx?page=SemII">SEM II</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <th>SY</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:HyperLink ID="sem3" runat="server" NavigateUrl="~/Curriculum.aspx?page=SemIII">SEM III</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:HyperLink ID="sem4" runat="server" NavigateUrl="~/Curriculum.aspx?page=SemIV">SEM IV</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <th>TY</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:HyperLink ID="sem5" runat="server" NavigateUrl="~/Curriculum.aspx?page=SemV">SEM V</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                            <asp:HyperLink ID="sem6" runat="server" NavigateUrl="~/Curriculum.aspx?page=SemVI">SEM VI</asp:HyperLink>
                            <br />
                            <asp:HyperLink ID="add_content" runat="server" NavigateUrl="~/AdminView.aspx">add_content</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="content"><div id="d1" runat="server"><div class="mxgraph" style="" data-mxgraph="{&quot;highlight&quot;:&quot;#0000ff&quot;,&quot;nav&quot;:true,&quot;zoom&quot;:0.75,&quot;xml&quot;:&quot;&lt;mxfile host=\&quot;www.draw.io\&quot; modified=\&quot;2020-01-19T09:15:35.090Z\&quot; agent=\&quot;Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36 OPR/66.0.3515.27\&quot; etag=\&quot;oi77vg4_RKn-qnyZY_WX\&quot; version=\&quot;12.5.5\&quot; type=\&quot;device\&quot;&gt;&lt;diagram name=\&quot;Page-1\&quot; id=\&quot;64c3da0e-402f-94eb-ee01-a36477274f13\&quot;&gt;7V3ZdqO4Fv0av9y1kgUS42Pmrr6VqtzlrK5bjwQrNlUY3Bhn6K9vCYQNEkPsyBI29kNiZAbpbG3O4WxJjODV/O0u8Raz+3iCwhHQJm8jeD0CABiuif+Rkndaort2XjJNgklepm8KxsE/iBZqtHQVTNCysmMax2EaLKqFfhxFyE8rZV6SxK/V3Z7jsHrVhTdFXMHY90K+9EcwSWe0VLfczQ9/oGA6o5d2AG3fk+f/nibxKqLXGwH4nH3yn+decS7a0OXMm8SvpSJ4M4JXSRyn+bf52xUKiXELs+XH3Tb8uq53gqK05oD46RcxF9BC7wljlu1weT72z3HRl/PHc3p46Plohm2Gkqodi8uAdU3XNVim74XxXmdBisYLfA68/Yp7yAheZiZB5HAdb61bTTaegzC8isM4yY6GumZD94bslCbxb1T8EsURIjvHUVra+Tb70PIxrYJebOfdCtp4m7cLbdILSlL0ViqizbpD8RylyTvehf7qOhQz2ql1SLdfNz0EGrRsVuocFi3zqDGn61NvgMFfqCmLTQpVPc6QVt4LV9To45t7giHtVduAwdj/FrhQb7R/FbntwQC6GDCgWQXDMNxzt/RxOGh0QdBwWBhNWAwGDBv0BgyzAYy/BgOG7mi9QcNqpMZg4HDc3qBhN6Hx11DA0Nd2VI+G03SnGgwYBuwNGLrJk+PLfIESLw1eEC5/SOJp4s3nQTT9PD5584Tho1Xx0QXFuwbDFdPi413dcHlAbFMEIDw/roNpkHpkr5sQh8ZJHAX+cqhoWIZUNFwOje85OwgftPH7MkXzwWKxjn+lYFFcvMKMpZ+glNyo7r10huYYmOFSYx0Ay4FD5+C4iufzFb45YRTiiNDjNzbrcOFwpMLBO3LO8GgyRYURUPgUv95sCi6zAvzDLE6Cf7B1sMMpw6LxxtWyDzk0mlyQ5OMGE1xyG5DKZsflsBUJRYcDEp8LQMMwr8mRb0H6f3LcuUm3flJoyffrN3rKbOOdbjSCt4xXiU8bT1NHqZdMUbFXEf0Qw7RCXIZQq4nF1oUJCvPQqVyNOmDpNR7iIEpL6R2bjT3Mc630AdUT5u2j5yinR9nTmtUI0zSrPpW5ClPt3GTcVTDk3ntptwXZYdncNoPJlpiwkqLFX/Izbvr7GoAPUoAPnU4U6KSAM0wKONVIxlDCAMvsqDMT+5p1tRTHHz7YPUj+NHKh0vGL+KU3HZ/rHYB5wP9wV2cCEddhAow9dWdL19rrxXRn29lrd7b554WD7M5S3UHRdXrDin25A5YjmgoHYGtiQ6CbX9D9uvjxx3+fbl4Wl4+/nmbpn2eYdxwRHn9yVNj6qezqStMs6/NPZTS7anLZ1/rnr5pu3ZxqtUCb14dQq+tL5a4Narq2iMRrA1L8Q9ztMJAy63PgvQWqRsUYBlC65hwUUoaoKIBYLfBVxQARNkYpCCCbPwvHTzY2YUC2VcQBu8cOTADQGUwAPpho80bqAgpdh845kwDRmT5t27tFFTog5zZKJ6pcBndzCUGGDpgoo2BXY63ZzCWAHQfo7AGGjDjGACcq94vKtmoqM0+UQKsSTLN25DHU2pwccGqdnGge69vyWNuax8zDFTCl8JgfxXnisVIeO0fKY7c1VpVFY5ZkWhcrnVbe74uVotSTEytbWdn+5F8mK1TLSosZTwsdMaQ0YBspDUsGKU125DY7v4S1BTdkTwolRQkyJ0ruQkmTp6TqZ1fo1Pfb7fPfzHnq1VHRrtBuqH5TLdfZm3U1ZdCuCEZOtOsL7VTHp4DJTlezR9BtdVkffuhkH98axoWLJqXJkqyDlDqwVThDkx9veIis3IFduzJZKCsdnpWKsz9sHMnkdHE3FsJK9vENuozLFfacuKVz1AE3F7T9ADbNa9hSeAuOgreH6k1reGsp9qaaK8GburoSZ6qxl+0iMZvkleRMjyMF+zlnahlwKyqTrQeUBNj6KNkHV2tyQIZarjrtga8DRFDVaaCAaHLaWwa6DhvnQiCDmvy6CrtR8wCHLW7IWSHmxuUKjXRrh8O7aglntA5YM/VWJ/bh5A9DBNveD+G4AcJAhm+z+OGO34vlfzAlcI/APDjUmc2fGrvFZrGlzmxuAItfKuM+8JN4kcQ+Wi6xlYB2kfgEDz9dJWioUEmd9twAFT849Qd6OjEps7rMmdAN8PD67bfVHIerfrZ0gBeRm944xc5pmUfs5DkQ6sRA9yidxZNDmqgrFDyp86YbwOOVvrsEITKJ+iqeL1bpgLkldR51PTynqUQfia27BxpZivVTp3VYn1n/67bRtd36zCxnrrXDpKFEz7VuoIkoiWboNFGcoVVCExUTsjmadEzIZjNI+52Q3UAycBwkE0oYxVmbDsLsOkjHZgS+fU3kZmnQNZGbpcF+J3I30ECUgjF0X6N4bI0cX8MSScpsb5ZWcmZ728eiHxRagL6dFqCcUIqHxXAxjSAKtQoTjiFj1Dbnp6ToCTaf93x4T2fZCncDTH26Lhszq0/P1KyZ6qXeiOQ7k1WmGwwmucnC0wPhwOaTm3lSEyW49BtKX+Pk92AB6oF04PDpTcKfJ2+Zr6waeVM0R9md+PBWvBUKVg+kAodPsl0sFmGQidqHuQquWIjUywXOkaRoVIfStuJQ2m1dM1JQYO20joaVIxe47JL3UuQC55TCEUMTxSkcJTRRIRdwNOmQC9h34KiQC5wjSQeJJIyjeE3LDsLsKhe4zIT9fckFLA265AKWBirkAocfFHqQNFDta/LgurfUEeNrOCJJkQtYWsmRCxx+AO5giLH/6QYfCN4US9dyCMWue2wyLm5fnkmGQAB1XiC4ihOSOvvTe/E4Nh1pHkZfv4KmN8IA1Hlh4AtmcjxZ+fQVRWmM/9zMn9CEmH8zJHpgeU4OPPWyAdRbZYPvm5k89YPaH5E/i4K/V8ORfjgQ1UsLsKhBeaHs+Dl99bL74000DSKEkgHJpxxI6iUFCHhJocS0O2z7WSYo5JNI1gy7iII5fdXbULFTrjXAIlw/9Ph9JC6mpgGZuphaZyfYmvqOKR0dd7Fzy9oE4FbVS0tRB/jmmO0JH3wArjUTDcqQFCA4EklBKBtoEFye+q6cIOwgInbJh50JokIX4AnStVJ3HUE6xAQd2NwxCgQFCE6CQmMA1SuKcS/O+hTFqh1vX9ICz6SuJexrmNSlR9QxSYEmAcGRaBJCmaT1kElafZ8UwyQp2oKQEE6KIAHBsQgSO85fEMmmIoXWKzaxfml3NlltoZ+cKQk8sboW/KtzWFJkCsDLFKVU3EMS0zWSyuN9B5LXMXu3MBIEtdIFSiKUrWP1jP88zoJoOpzsNgtSDyQKwEsUF5MXL/IzXWKwqyNxUPVAiChqVILqaxCt3kbFnAb85WKCUQqwaYeV1WbR6oEiAXlF4ht6I3e+OxShAh8t0/iw1abBgFQ+Di71IgRdGPXwY3a1o+ug8uDcZB91xYz/0bm1+queXI6MwTVOiiQBj0SSUM4N1S+BkcUNJQoG17guNcJgo3EFUgQ8SRENkVOfaLLrdAbdYFIrexMd2Cp3Cghs51ehHsAjUQ9U+xWoeEbD/vwKSx9NEn3k6ATwWHSCw5y4QHNfx8gb5j1c+3o7Au92pMgAsFUG+N/KC4OUNONiuVwlJJXJsepYEys2FwOrT6zwKsAY+askhygY5PrgHE49EAIgLwRcrpZBhJZk2DQRbsIwmKIhs6kHGkDRT8oruSVB5AeLkOSPc1UNN2Waj3jPkHuOk2KQ+2AnB7FQ9kAgMHiB4Msj3h6j5CXw2WWrhoqTemXAABxOHBzHGqWPRD6lqlYG2JfhiYq22fV/lSgDXOOkKAPGSRkQww3VyoAsbihRBrjGdSkDDhueK1AGjJMy0BAy9YkmOysD7ELQe1MG2Cp3KgNs51ehDBgnZUAMYVQrA3vzKyx99qUMsA2QowwYx6IMHOYbEGgy7Ah5Yzvq34HAuyQpqoFZ96xihRi5y0WFWdbfq5iUhkGEzgp0L/AuuJbm5mf8bUr/h/n/2wVbNtPZkuXCi2qvRuh49uzNg/A9vxr+yZsvskPJMBF46cfzLKO39CKS6iPZO2YPclT2NzvZMsvNkFMZxuKNr/j4PQy9pxU51/cXknRCr/8pNSavKddGvklcq8nV8Un99Q1hc2XouoZPDNlkxXb7lJqk1TWpq/60Zp1nh4CcvWzM11I/iEhCNWxuQ7C28Kp4a3e2SJM/8yJ8d9pUMaixb17FjxZztucKqjsxPiQlI5JxN03nIb2/1qYHy7nEImO48Hyi2FCfkG89xrg3Xp/pmR+JcZ96DnMvFEwmKKr1QDSBaKy3aeVIXXDvROFDvAyy5DW89slySbgOlyTHSNZK+srsMMfXydyfFwZTUhCi57S0/wUtXu9X4wOzVOfo86lMdn2As2K75EPMOh8C2FnOH0hl4s0kJn1xc8ckAsB9PEFkj38B&lt;/diagram&gt;&lt;/mxfile&gt;&quot;}"></div>
<script type="text/javascript" src="https://www.draw.io/js/viewer.min.js"></script></div></td>
        </tr>
    </table>
</asp:Content>
