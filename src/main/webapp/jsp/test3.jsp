<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <%--css部分--%>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/bootstrap-table.min.css">

    <%--js部分--%>
    <script src="../js/jquery-3.4.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrap-table.js"></script>
    <script src="../js/bootstrap-table-zh-CN.js"></script>
</head>
<body>

<div>
<table id="table">
</table>
</div>



<script type="text/javascript">
	$(function(){
		
		$(function(){
			var rows = $('#table').bootstrapTable('getData');//行的数据
			     var ids = "";
			     for(var i=0;i<rows.length;i++){
			         if(rows[i].check){
			             ids += rows[i].id+",";
			         }
			     }
			var rowData = $("#table").bootstrapTable('getRowByUniqueId', "id");
			console.log(rowData)
		})
		
		$('#table').bootstrapTable('destroy').bootstrapTable({
			ajax : function(request){
				    var url = "${pageContext.request.contextPath}/studentD/stuList"

						$.ajax({
							type:"post",
							url:url,
							data:'',
							dataType:"json",
					        contentType:"application/json;charset=UTF-8",
					        success: function(msg){
							    request.success({
                                    row:msg
                                });
					        	 console.log(msg);
					        	 $("#table").bootstrapTable('load',msg.stuList);
					        	},
					    	error: function(result) {
					             console.log(result);
					             alert("错误");
					        	},
						});
			},
			toolbar : '#toolbar', //工具按钮用哪个容器
			striped : true, //是否显示行间隔色
			sortable : true, //是否启用排序
			sortOrder : "asc", //排序方式
			cache : true,//是否缓存数据
			//dataField: "rows",//服务端返回数据键值 就是说记录放的键值是rows，分页时使用总记录数的键值为total
			//search: true,            //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
			strictSearch : true,
			//showColumns: true,         //是否显示所有的列
			showRefresh : true, //是否显示刷新按钮
			queryParamsType : 'limit',//查询参数组织方式
			minimumCountColumns : 2, //最少允许的列数
			clickToSelect : true, //是否启用点击选中行
			uniqueId : "id", //每一行的唯一标识，一般为主键列
			showToggle : false, //是否显示详细视图和列表视图的切换按钮
			cardView : false, //是否显示详细视图
			detailView : false, //是否显示父子表
			buttonsAlign : "right", //按钮位置
			columns:[{
				field:'classid',
				title:'班级',
			},{
				field:'stuid',
				title:'学号',
			},{
				field:'phone',
				title:'电话',
			},{
				field:'name',
				title:'姓名',
			},{
				field:'id',
				title:'id',
			},{
				field:'state',
				title:'状态',
			},{
				field:'age',
				title:'年龄'
			},{
				field:'Operate',
				title:'操作',
				formatter : function(value, row,
						index) {
					return "<button type='button' onclick='' class='btn btn-primary btn-lg' data-toggle='modal' data-target='#modalTable'>show</button>";
				},
			}],
					
		});
	})

</script>



<button type="button" id = "show111"class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modalTable">
  Launch modal table
</button>
<div id="modalTable" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal table</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table id="table2">
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script>
  var $table2 = $('#table2')

  $(function() {
    $('#modalTable').on('shown.bs.modal', function () {
    	
		$('#table2').bootstrapTable('destroy').bootstrapTable({
			ajax : function(request){
				    var url = "${pageContext.request.contextPath}/studentD/stuList"
					var stuid = 
						$.ajax({
							type:"post",
							url:url,
							data:'',
							dataType:"json",
					        contentType:"application/json;charset=UTF-8",
					        success: function(msg){
							    request.success({
                                    row:msg
                                });
					        	 console.log(msg);
					        	 $("#table2").bootstrapTable('load',msg.stuList);
					        	},
					    	error: function(result) {
					             console.log(result);
					             alert("错误");
					        	},
						});
			},
			toolbar : '#toolbar', //工具按钮用哪个容器
			striped : true, //是否显示行间隔色
			sortable : true, //是否启用排序
			sortOrder : "asc", //排序方式
			cache : true,//是否缓存数据
			columns:[{
				field:'classid',
				title:'班级',
				width : 100,
			},{
				field:'stuid',
				title:'学号',
				width : 100,
			},{
				field:'phone',
				title:'电话',
				width : 100,
			},{
				field:'name',
				title:'姓名',
				width : 100,
			},{
				field:'id',
				title:'id',
				width : 100,
			},{
				field:'state',
				title:'状态',
				width : 100,
			},{
				field:'age',
				title:'年龄',
				width : 100,
			}],
					
		});

		
      $table2.bootstrapTable('resetView')
    })
  })
  
</script>

<script type="text/javascript">

</script>




</body>
</html>