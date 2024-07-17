<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainForm.aspx.cs" Inherits="WebASP_HM_Ajax.Views.MainForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .box {
            width: 50px;
            height: 50px;
            border: solid 1px black;
            text-align: center;
            margin: 2px;
        }

        div.box {
            position: relative
        }
        .btn_Num{
            width: 50px;
            height: 50px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div runat="server" id="game"></div>
            <br />

            <div>
                <asp:Button ID="btn_Reset" runat="server" Text="Reset" />
            </div>
            <br />

            <div>
                <asp:Label ID="lbl_Score" runat="server" Text="Score: 0" Font-Size="Large" />
            </div>
            <br />

            <div>
                <input id="btn_Matrix_3" class ="btn_Num" type="button" value="3" runat="server" />
                <input id="btn_Matrix_4" class ="btn_Num" type="button" value="4" runat="server" />
                <input id="btn_Matrix_5" class ="btn_Num" type="button" value="5" runat="server" />
            </div>
        </div>
    </form>
    <script>
        function createMatrix(num) {
            // Create Main div
            let matrixSize = parseInt(num);
            let gameDiv = document.getElementById('game');
            gameDiv.innerHTML = '';
            gameDiv.setAttribute("data-matrixsize", num);

            let grid = document.createElement("div");

            let grid_template = '';
            for (var i = 0; i < matrixSize; i++) {
                grid_template += '1fr ';
            }
            grid_template = grid_template.substring(0, grid_template.length - 1);

            grid.style = `width: ${52 * matrixSize}px; height: ${52 * matrixSize}px; grid-template-columns: ${grid_template}; grid-template-rows: ${grid_template};`;
            grid.style.display = "grid";

            // Create Matrix
            for (var i = 0; i < (matrixSize * matrixSize); i++) {
                let box = document.createElement("div");
                box.className = "box";

                let btn = document.createElement("input");
                btn.type = "button";
                btn.value = btn.textContent = Math.floor(Math.random() * 9) + 1;
                btn.className = "btn_Num";
                btn.addEventListener("click", () => { game(btn.value); });

                box.appendChild(btn);
                grid.appendChild(box);
            }

            gameDiv.appendChild(grid);
        }
        createMatrix(3);

        var num1 = 0;
        var num2 = 0;
        var counter = 1;
        var score = 0;

        function game(num) {
            if (counter == 1) {
                num1 = parseInt(num);
                counter++;
            }
            else if (counter == 2) {
                num2 = parseInt(num);
                counter = 1;

                let sum = num1 + num2;

                if (sum == 10) {
                    score++;
                    let scoreLbl = document.getElementById("lbl_Score");

                    scoreLbl.textContent = `Score: ${score}`;
                }
                createMatrix(document.getElementById("game").dataset.matrixsize);
            }
        }
    </script>
</body>
</html>
