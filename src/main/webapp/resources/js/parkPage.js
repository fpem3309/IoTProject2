function areaChange(e) {
    const opts = ["광산구", "동구", "서구", "남구", "북구"];
    const target = document.getElementById("gugun");

    if(e.value == 5) {
        target.options.length = 0;
        for (x in opts) {
            const opt = document.createElement("option");
            opt.value = opts[x];
            opt.innerHTML = opts[x];
            target.appendChild(opt);
        }
    } else {
        target.options.length = 0;
    }
}

$(document).ready( function() {
    $("#parkingList2Btn").click( function() {
        parkingList2();
    });
});

const parkingList2 = function() {
    const formData = $("#parkingList2").serialize();
    $.ajax({
        url : "parkingList21.do",
        type : "post",
        dataType : "json",
        data : formData ,
        success : resultHtml,
        error : function() {
            alert("error");
        }
    });
}

const resultHtml = function(data) {
    //console.log(data);
    let view = '<table id="example-datatable" class="table table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="example-datatable_info">';
    view += '<thead>';
    view += '<tr>';
    view += "<td>주차장 번호</td>";
    view += "<td>주차장 주소</td>";
    view += "<td>주차 가능 공간</td>";
    view += "<td>예약 종류</td>";
    view += "<td>예약일자</td>";
    view += "<td>회원이름</td>";
    view += "<td>관리</td>";
    view += "</tr>";
    view += "</thead>";
    view += "<tbody>";
    $.each(data, function(index, vo) {
        let type = (vo.msp_type==1)?'월권':'일권';
        view += "<tr>";
        view += "<td>"+vo.msp_no+"</td>";
        view += "<td>"+vo.msp_location+"</td>";
        view += "<td>"+vo.msp_num+"</td>";
        view += "<td>"+type+"</td>";
        view += "<td>"+vo.msp_date+"</td>";
        view += "<td>"+vo.msm_name+"</td>";
        view += '<td><input type ="button" onclick="parkPage('+vo.msp_no+')" value="신청" id="go" data-toggle="modal" data-target=".bd-example-modal-lg" class="btn btn-sm btn-default"></td>';
        view += "</tr>";
    });
    view += "</tbody>";
    view += "</table>";
    
    $("#parkingList21").html(view);
}

$(document).ready( function() {
    $("#parkingList2Btn").click( function() {
        parkingList2();
    });
});

var parkPage = function(msp_no) {
    $.ajax({
       url : "parkPage.do",
       type : "post",
       dataType : "json",
       data : { "msp_no" : msp_no },
       success : parkList,
       error : function() {
           alert("error");
       }
    });
}

var parkList = function(data)  {
    console.log(" popupPage : ", data);
    let view = ""; 
    view += '<div class="table-responsive">';
    view += '<div id="example-datatable_wrapper" class="dataTables_wrapper form-inline no-footer">';
    view += '<div class="row">';
    for(let i=1; i<=data.msp_num; i++) {
        view += '<button onclick="popupPage('+data.msm_no+', '+data.msp_no+', '+i+', '+data.msp_type+')" class="btn btn-sm btn-default">'+i+' 번자리</button>&nbsp;&nbsp;';
    }
    view += '</div>';
    view += '<div><img src="resources/img/123.png" style="max-width:100%"></div>';
    $("#modify").html(view);
}

function popupPage(msm_no, msp_no, msr_num, msp_type) {
    var win = window.open("popupPage.do?msm_no="+msm_no+"&msp_no="+msp_no+"&msr_num="+msr_num+"&msp_type="+msp_type, "popupWin", "width=526,height=227");
}