<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%><!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8"/>
    <title>${table.comment!}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="<%=path%>/js/ace/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=path%>/js/ace/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=path%>/js/ace/css/bootstrap-table.css"/>
    <link rel="stylesheet" href="<%=path%>/js/ace/css/bootstrap-table-fixed-columns.css"/>
    <link rel="stylesheet" href="<%=path%>/js/ace/css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" href="<%=path%>/js/ace/css/bootstrap-table-fixed-columns.css"/>
    <link rel="stylesheet" href="<%=path%>/js/bootstrap-select-1.13.0/css/bootstrap-select.min.css"/>
    <link rel="stylesheet" href="<%=path%>/js/ace/css/common.css"/>
    <style type="text/css">
        .changeColor {
            background-color: #ffe48d !important;
            color: #000;
        }

        .status {
            color: white !important;
        }

        table thead {
            background-color: #F8FAFC;
        }

        table {
            table-layout: fixed !important;
        }

        .bootstrap-table .fixed-table-container .table thead th .sortable {
            padding-right: 20px !important;
        }

        .modal-style {
            font-family: SimHei;
            font-size: 14px;
            color: #6F6F6F;
            margin-left: 5px;
        }

        .i-style {
            font-size: 20px
        }

        table td:hover {
            overflow: auto;
            white-space: pre-wrap;
        }

        #search_box {
            border-radius: 3px;
            border: 1px solid #BCE8F1;
            padding-bottom: 0px;
        }

        .modal-body .search_info {
            width: 520px !important;
        }

        .caret {
            display: none;
        }

        .open {
            max-height: 350px !important;
            min-width: 200px;
        }

    </style>
</head>

<body>
<div class="page-content">
    <div class="page_info">
        <div class="spelid_box_10"></div>
        <div id="search_box">
            <div class="search_tit">
                <i class="glyphicon glyphicon-search" style=""></i>
                ????????????
                <span class="right_icon" onclick="showSearchInfo(this)" name="0">
							<i class="glyphicon glyphicon-chevron-up" style=""></i>
				</span>
            </div>
            <div id="search_body" style="float: left; padding-bottom: 10px;">
                <#list table.fields as field>
                    <div class="search_info">
                        <span>${field.comment}</span>
                        <select id="${field.propertyName}Q" class="selectpicker" data-live-search="true">
                            <option value="0">?????????</option>
                        </select>
                    </div>
                </#list>
                <div class="search_info" style="width: auto;">
                    <button class="btn_own btn_toolbar btn-purple no-border" href="#" id="btn_query" onclick="query()"
                            style="border-width: 0;">
                        <i class="glyphicon glyphicon-search blue" class="btn_icon" style="color:rgb(105, 170, 70)"></i>??????
                    </button>
                    <button class="btn_own btn_toolbar btn-purple no-border" href="#" id="btn_reset"
                            onclick="resetSelect()" style="border-width: 0;">
                        <i class="glyphicon glyphicon-repeat blue" class="btn_icon"></i>??????
                    </button>
                </div>
            </div>
        </div>
        <div class="spelid_box_10"></div>
        <div class="table_box" style="clear: both">
            <div class="search_tit">
                <i class="glyphicon glyphicon-list" style=""></i>
                ????????????
            </div>
            <div id="toolbar" class="toolbar">
                <button class="btn_own btn_toolbar btn-info no-border" href="#" id="btn_refresh" onclick="refresh()"
                        style="border-width: 0;">
                    <i class="glyphicon glyphicon-refresh light-blue" class="btn_icon"
                       style="color: rgb(147, 203, 249)"></i>??????
                </button>
                <button class="btn_own btn_toolbar btn-purple no-border" href="#" id="btn_add" data-toggle="modal"
                        data-target="#add_box" style="border-width: 0;">
                    <i class="glyphicon glyphicon-plus blue" class="btn_icon"></i>??????
                </button>
            </div>
            <section id="box" class="content" style="clear: both;">
                <div class="panel-body" style="padding-bottom:0px; padding: 0px;">
                    <div class="box">
                        <div class="box-body" style="height: 100%;">
                            <table class="table text-nowrap" id="tb_customer"
                                   data-response-handler="responseHandler"></table>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
<!-- ????????? -->
<!-- ????????????????????????modal?????????????????????????????????????????????????????????titile???body???footer?????????????????????????????????????????? -->
<div class="modal fade" id="add_box" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="height: 520px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <font class="modal-title" id="myModalLabel">
                    <i class="glyphicon glyphicon-plus blue" class="btn_icon"></i><span
                            class="modal-style">??????</span>
                </font>
            </div>
            <div class="modal-body" style="float: left; ">
                <form id="applyForm">
                    <#list table.fields as field>
                        <div class="search_info">
                            <span>${field.comment}???</span>
                            <input type="text" id="${field.propertyName}A" name="${field.propertyName}" class="form-control"
                                   placeholder="?????????">
                        </div>
                    </#list>
                </form>
            </div>
            <div class="modal-footer" style="clear: both;">
                <button type="button" class="btn btn-default" data-dismiss="modal">??????
                </button>
                <button type="button" class="btn btn-primary" id="save_btn">
                    ??????
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="up_box" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="myModalLabelM"
     aria-hidden="true">
    <div class="modal-dialog" style="height: 520px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <font class="modal-title" id="myModalLabelM">
                    <i class="glyphicon glyphicon-edit i-style" style="color: rgb(255, 137, 42)"></i><span
                            class="modal-style">??????</span>
                </font>
            </div>
            <div class="modal-body" style="float: left; ">
                <#list table.fields as field>
                    <div class="search_info">
                        <span>${field.comment}???</span>
                        <input type="text" id="${field.propertyName}U" name="${field.propertyName}" class="form-control"
                               placeholder="?????????">
                    </div>
                </#list>
                <input type="hidden" id="id">
            </div>
            <div class="modal-footer" style="clear: both;">
                <button type="button" class="btn btn-default" data-dismiss="modal">??????
                </button>
                <button type="button" class="btn btn-primary" id="mod_btn">
                    ??????
                </button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="see_box" tabindex="-1" role="dialog" aria-labelledby="myModalLabelS" aria-hidden="true">
    <div class="modal-dialog" style="width: 80%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <font class="modal-title" id="myModalLabelS">
                    <i class="glyphicon glyphicon-list-alt i-style" style="color: rgb(105, 170, 70);"></i><span
                            class="modal-style">??????</span>
                </font>
            </div>
            <div class="modal-body" style="float: left; ">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <colgroup>
                            <col class="col-xs-2">
                            <col class="col-xs-6">
                        </colgroup>
                        <tbody>
                        <#list table.fields as field>
                            <tr>
                                <th scope="row">
                                    <code>${field.comment}</code>
                                </th>
                                <td id="${field.propertyName}S"></td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer" style="clear: both;">
                <button type="button" class="btn btn-default" data-dismiss="modal">??????
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>

<script src="<%=path%>/js/jquery-2.0.3.min.js"></script>
<script src="<%=path%>/js/ace/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/ace/js/bootstrap-table.js"></script>
<script src="<%=path%>/js/ace/js/bootstrap-table-zh-CN.js"></script>
<script src="<%=path%>/js/ace/js/bootstrap-table-fixed-columns.js"></script>
<script src="<%=path%>/js/ace/js/jquery.dataTables.min.js"></script>
<script src="<%=path%>/js/ace/js/jquery.dataTables.bootstrap.js"></script>
<script src="<%=path%>/js/ace/js/date-time/bootstrap-datetimepicker.min.js"></script>
<script src="<%=path%>/js/ace/js/date-time/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="<%=path%>/js/layer/layer.js"></script>
<script src="<%=path%>/js/ace/js/common.js"></script>
<script src="<%=path%>/js/ace/js/bootstrap-tab.js"></script>
<script src="<%=path %>/js/bootstrap-select-1.13.0/js/bootstrap-select.min.js"></script>
<script src="<%=path %>/js/bootstrap-select-1.13.0/js/i18n/defaults-zh_CN.min.js"></script>
<script src="<%=path %>/js/Convert_Pinyin.js"></script>
<script src="<%=path %>/js/bootstrapUtil.js"></script>
<script type="text/javascript">
    var tableH;
    var allh;
    var rowsJson;
    $(function () {
        // ????????????
        allh = $(window).height();
        // ??????????????????
        var searchH = document.getElementById("search_box").offsetHeight;
        // ????????????
        tableH = allh - searchH - 65;
        var oTable = new TableInit();
        oTable.Init();
        getAllDate();
    });

    function getAllDate() {
        $.ajax({
            url: '<%=path %>/deptInfo/listDeptInfo4Select.action',
            type: 'post',
            dataType: 'json',
            data: {},
            success: function (data) {
                var depts = data.depts;
                if (depts) {
                    for (var i = 0; i < depts.length; i++) {
                        var search = pinyin.getFullChars(depts[i].name) + "|" + pinyin.getCamelChars(depts[i].name) + "|" + (pinyin.getCamelChars(depts[i].name)).toLowerCase();
                        var op = $("<option>", {"text": depts[i].name, "value": depts[i].id, "data-tokens": search});
                        $('#nameQ').append(op);
                    }
                }
                $('.selectpicker').selectpicker('refresh');
            }
        });
    }

    // ???????????????????????????
    function showSearchInfo(obj) {
        // name 0-????????? 1-?????????
        var name = $(obj).attr('name')
        if (name == 0) {
            $(obj).children('.glyphicon').removeClass('glyphicon-chevron-up');
            $(obj).children('.glyphicon').addClass('glyphicon-chevron-down');
            $('#search_body').hide()
            $(obj).attr('name', 1);
        } else {
            $(obj).children('.glyphicon').removeClass('glyphicon-chevron-down');
            $(obj).children('.glyphicon').addClass('glyphicon-chevron-up');
            $('#search_body').show()
            $(obj).attr('name', 0);
        }
        resizeTableH();
    }

    // ???????????????table??????????????????
    $(window).resize(function () {
        resizeTableH();
    });

    // ????????????table??????
    function resizeTableH() {
        // ????????????
        allh = $(window).height();
        // ??????????????????
        var searchH = document.getElementById("search_box").offsetHeight;
        $('#tb_customer').bootstrapTable('resetView', {
            height: allh - searchH - 65
        });
    }

    $('#add_box').on('show.bs.modal', function () {
        $('#add_box').each(function () {
            var $clone = $(this).clone().css('display', 'block').appendTo('body');
            var top = Math.round(($clone.height() - $clone.find('.modal-content').height()) / 2);
            top = top > 0 ? top : 0;
            $clone.remove();
            $(this).find('.modal-content').css("margin-top", top);
        });
    });

    $('#up_box').on('show.bs.modal', function () {
        $('#up_box').each(function () {
            var $clone = $(this).clone().css('display', 'block').appendTo('body');
            var top = Math.round(($clone.height() - $clone.find('.modal-content').height()) / 2);
            top = top > 0 ? top : 0;
            $clone.remove();
            $(this).find('.modal-content').css("margin-top", top);
        });
    });

    // ??????table?????????????????????
    $('#tb_customer').on('click-row.bs.table', function (e, row, $element) {
        $('.change_color').removeClass('change_color');
        $($element).addClass('change_color');
        rowsJson = JSON.parse(JSON.stringify(row));
        TableInit();
    });
    var TableInit = function () {
        var oTableInit = new Object();
        //?????????Table
        oTableInit.Init = function () {
            $('#tb_customer').bootstrapTable({
                url: '<%=path%>/${controllerMappingHyphen}/list.action',         //???????????????URL???*???
                method: 'post',                      //???????????????*?????????????????????get??????????????????????????????
                contentType: "application/x-www-form-urlencoded",//post?????????????????????????????????
                toolbar: '#toolbar',                //???????????????????????????
                striped: true,                      //????????????????????????
                pagination: true,                   //??????
                // fixedColumns: true,                 //?????????
                // fixedNumber: 2,                     //??????????????????
                paginationLoop: false,
                paginationPreText: '?????????',
                paginationNextText: '?????????',
                sortable: true,                     //??????????????????
                sortOrder: "asc",                   //????????????
                queryParams: oTableInit.queryParams,//???????????????*???
                sidePagination: "server",           //???????????????client??????????????????server??????????????????*???
                pageNumber: 1,                       //??????????????????????????????????????????
                pageSize: 20,                       //????????????????????????*???
                pageList: [10, 20, 30, 50, 100],        //?????????????????????????????????*???
                singleSelect: true,               // ?????????true???????????????
                search: false,                       //???????????????????????????????????????????????????????????????????????????????????????????????????????????????
                strictSearch: false,
                showColumns: false,                  //????????????????????????
                showRefresh: false,                  //????????????????????????
                minimumCountColumns: 1,             //?????????????????????
                clickToSelect: true,                //???????????????????????????
                height: tableH,                     //???????????????????????????height?????????????????????????????????????????????????????????
                uniqueId: "id",                     //?????????????????????????????????????????????
                showToggle: false,                    //??????????????????????????????????????????????????????
                cardView: false,                  //????????????????????????
                detailView: false,                   //?????????????????????
                showFooter: false,
                responseHandler: function (res) {
                    return {
                        "total": res.total,//?????????
                        "rows": res.rows   //??????
                    };
                },
                columns: [
                    {
                        align: "center",
                        width: 35,
                        title: '',//??????  ?????????
                        formatter: function (value, row, index) {
                            return index + 1;
                        },
                        cellStyle: function (value, row, index) {
                            var bg_color = '#F2F2F2';
                            return {
                                css: {
                                    "background-color": bg_color
                                }
                            }
                        }
                    },
                    <#list table.fields as field>
                    {
                        align: "center",
                        field: '${field.propertyName}',
                        title: '${field.comment}',
                        sortable: 'false',
                    },
                    </#list>
                    {
                        field: 'operate',
                        title: '??????',
                        align: 'center',
                        events: operateEvents,
                        formatter: operateFormatter
                    }
                ],
            });
        };

        //????????????????????? ????????????
        oTableInit.queryParams = function (params) {
            params.limit = params.limit   //????????????
            params.offset = params.offset  //??????
            params.order = params.order
            params.sort = params.sort
            return params;
        };
        return oTableInit;
    };

    document.onkeydown = function (e) {
        var ev = document.all ? window.event : e;
        if (ev.keyCode == 13) {
            query();
        }
    }

    function operateFormatter(value, row, index) {

        return [
            '<a class="like" href="javascript:void(0)" title="??????">',
            '<i class="glyphicon glyphicon-edit" style="color: rgb(255, 137, 42)"></i>',
            '</a>  ',
            '<a class="information" href="javascript:void(0)" title="??????">',
            '<i class="glyphicon glyphicon-list-alt" style="color: rgb(105, 170, 70)"></i>',
            '</a>  ',
            '<a class="remove" href="javascript:void(0)" title="??????">',
            '<i class="glyphicon glyphicon-remove" style="color:rgb(221, 90, 67);"></i>',
            '</a>',
        ].join('');
    }

    }

    window.operateEvents = {
        'click .like': function (e, value, row, index) {
            dynamicAssignmentUp(row);
            $('#up_box').modal();
        },
        'click .remove': function (e, value, row, index) {
            layer.confirm("????????????" + row.name + "???", {
                btn: ['??????', '??????'], //??????
                title: '??????'
            }, function () {
                layer.closeAll('dialog');
                var index = layer.load(2, {shade: 0.1});
                $.ajax({
                    url: '<%=path%>/deptInfo/deleteDeptById.action',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        "id": row.id
                    },
                    success: function (data) {
                        layer.close(index);
                        if (data.msgCode == '1') {
                            layer.confirm('???????????????', {
                                btn: ['??????'], //??????
                                title: '??????'
                            }, function () {
                                // ???????????????
                                layer.closeAll('dialog');
                                $('#tb_customer').bootstrapTable('refresh');
                            });
                        } else {
                            layer.msg('?????????????????????????????????', {time: 1500});
                        }
                    }
                });
            }, function () {
                layer.closeAll('dialog');
            });
        },
        'click .information': function (e, value, rowDate, index) {
            dynamicAssignmentInfo(rowDate);
            $('#see_box').modal(); //???????????????
        }
    };

    //???????????????
    function resetSelect() {
        rowsJson = "";
        refresh();
    }

    // ????????????  var index = layer.load(2, {shade: 0.1});  layer.close(index);
    $('#save_btn').click(function () {
        <#list table.fields as field>
        var ${field.propertyName} = $('#${field.propertyName}A').val();
        if (${field.propertyName} == "") {
            layer.msg('?????????${field.propertyName}', {time: 1500});//????????????
            return;
        }
        </#list>

        var index = layer.load(2, {shade: 0.1});//??????
        $.ajax({
            url: '<%=path%>/${controllerMappingHyphen}/save',
            type: 'post',
            dataType: 'json',
            data: {
                <#list table.fields as field>
                "${field.propertyName}": ${field.propertyName},
                </#list>
            },
            success: function (data) {
                layer.close(index);
                if (data.msgCode == '1') {
                    $('#add_box').modal('hide');
                    layer.confirm('???????????????', {
                        btn: ['??????'] //??????
                    }, function () {
                        window.location.reload();
                    });
                }
                else {
                    layer.msg('?????????????????????????????????', {time: 1500});
                }
            }
        });
    });

    // ??????????????????
    $('#mod_btn').click(function () {
        <#list table.fields as field>
        var ${field.propertyName} = $('#${field.propertyName}U').val();
        if (${field.propertyName} == "") {
            layer.msg('?????????${field.propertyName}', {time: 1500});//????????????
            return;
        }
        </#list>
        var id = $('#id').val();
        var index = layer.load(2, {shade: 0.1});
        $.ajax({
            url: '<%=path%>/${controllerMappingHyphen}/update.action',
            type: 'post',
            dataType: 'json',
            data: {
                "id": id,
                <#list table.fields as field>
                "${field.propertyName}": ${field.propertyName},
                </#list>
            },
            success: function (data) {
                layer.close(index);
                if (data.msgCode == 1) {
                    $('#add_box').modal('hide');
                    layer.confirm('???????????????', {
                        btn: ['??????'] //??????
                    }, function () {
                        window.location.reload();
                    });
                }
                else {
                    layer.msg('?????????????????????????????????', {time: 1500});
                }
            }
        });
    });

    function refresh() {
        //??????
        $('#tb_customer').bootstrapTable('refresh');
    }

    $('#add_box').on('hidden.bs.modal', function () { //???????????????????????????
        clearForm($('#applyForm')); //??????????????????????????????
    });

    function clearForm(form) {
        // input??????
        $(':input', form).each(function () {
            var type = this.type;
            var tag = this.tagName.toLowerCase(); // normalize case
            if (type == 'text' || type == 'password' || tag == 'textarea')
                this.value = "";
                // ??????checkboxes??????
            // select ???????????????
            else if (tag == 'select')
                this.selectedIndex = -1;
        });
    };

    // ??????
    function query() {
        $('#tb_customer').bootstrapTable('refreshOptions', {
            offset: 0,
            limit: 20,
        });
    }

</script>
</html>