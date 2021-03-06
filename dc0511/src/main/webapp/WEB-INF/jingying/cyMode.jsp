<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ include file="/common/common.jspf" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table id="dg1"></table>
<script type="text/javascript">
    function doOk() {
        var row = $('#dg1').datagrid('getSelected');
        if(row==null){
            alert("请选择一项!")
            return false;
        }
        if (row.type=='y') {
            alert("当前模式已启用");
            return false;
        }
        $.post(
            "${proPath}/sysParam/updateParamForMode.mvc",
            {fieldName:row.fieldName,type:row.type},
            function(json){
                alert(json.msg);
                $('#dg1').datagrid("reload");
                $('#dg1').datagrid("clearSelections");
            },
            "json"
        );
        // commonGrid.getOpenSelectedRow("#dg", '/dc-manager/rest/sysParam/enableByPks');
    }
    $(function () {
        $('#dg1').datagrid({
            url:'${proPath}/sysParam/selectMode.mvc',
            singleSelect:true,
            columns:[[
                {checkbox:true},
                {field:'fieldName',title:'模式编号',width:100},
                {field:'fieldValue',title:'餐营模式',width:100},
                {field:'type',title:'是否启用',width:100,
                    formatter: function (value, row, index) {
                        if (value=='y'){
                            return value='是';
                        }else if(value=='n'){
                            return value='否';
                        }else {
                            return value='异常';
                        }
                    }
                }
            ]],
            fitColumns:true,
            toolbar:[{
                iconCls: 'icon-ok',
                text: '启用',
                handler:doOk
            }],
            //nowrap:false,
            pagination:true,
            rownumbers:true,
            pageSize:5,
            pageList:[5,10,15,20,25],
            /* queryParams: {
             userName: '1'
             }
             */
            /* rowStyler: function(index,row){
             if (row.unitcost>80){
             return 'background-color:#6293BB;color:#fff;';
             }
             }, */

            striped:true

        });
    })
</script>
</body>
</html>
