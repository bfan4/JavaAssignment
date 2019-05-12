$(document).ready(function () {
	console.log("Hello!");
	
    $(".delbtn").bind("click", Delete);
    $(".editbtn").bind("click", Edit);
    $(".savebtn").bind("click", Save);

    $(".delbtn").click(function () {
        var par = $(this).parent().parent();
        var tdName = par.children("td:nth-child(2)");
        console.log(tdName.text());
        $.post("deleteUser.jsp",
        	{
                name: tdName.text()
            },
            function () {

            })
    });
    
    $(".savebtn").click(function () {

        var par = $(this).parent().parent();
        
        var tdId = par.children("td:nth-child(1)");
        var tdName = par.children("td:nth-child(2)");
        var tdAge = par.children("td:nth-child(3)");
        var tdEmail = par.children("td:nth-child(4)");


        $.post("editUser.jsp",
            {
        	    id: tdId.text().trim(),
                name: tdName.text().trim(),
                age: tdAge.text().trim(),
                email: tdEmail.text().trim()
            },
            function () {

            })

    });
    
    
    
});

function Delete() {
    var par = $(this).parent().parent();
    par.remove();
};

function Edit() {
    var par = $(this).parent().parent();
    var tdName = par.children("td:nth-child(2)");
    var tdAge = par.children("td:nth-child(3)");
    var tdEmail = par.children("td:nth-child(4)");
    

    tdName.html("<input type='text' id='txtName' value='" + tdName.html() + "'/>");
    tdAge.html("<input type='text' id='txtAge' value='" + tdAge.html() + "'/>");
    tdEmail.html("<input type='text' id='textEmail' value='" + tdEmail.html() + "'/>");

};

function Save() {
    var par = $(this).parent().parent();
    var tdName = par.children("td:nth-child(2)");
    var tdAge = par.children("td:nth-child(3)");
    var tdEmail = par.children("td:nth-child(4)");


    tdName.html(tdName.children("input[type=text]").val());
    tdAge.html(tdAge.children("input[type=text]").val());
    tdEmail.html(tdEmail.children("input[type=text]").val());

};