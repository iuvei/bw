<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsps/layout/bui-header.jsp"%>
<style type="text/css">
   .bui-stdmod-body{
        overflow-x : hidden;
        overflow-y : auto;
      }
 </style>
<body  style="padding: 10px;">
    <div class="demo-content">
   <form id="searchForm" class="form-horizontal" style="outline: none;" method="post" >
    <input name="end_hidden" type="hidden" />
    <div class="well">
    	<div style="position: relative;display: inline-block;">
      	<div style="float: left;margin-right: 96px;">
      		
            <div class="control-group span14 ">
                <label class="control-label">时间：</label>
                <div class="bui-form-group" data-rules="{dateRange : true}">
                  <input name="startDate"  type="text" class="calendar calendar-time" value="${param.startDate }"  placeholder="起始时间" />
                  <span>&nbsp;-&nbsp;</span>
                  <input  name="endDate" type="text" class="calendar calendar-time" value="${param.endDate }"   placeholder="结束时间" />
                </div>
                <div style="margin-right: auto;margin: -30px 420px;">
                  <select onchange="changeFormatDate(this,'startDate','endDate')"  id="quiklychoicetime"   style="width:85px;">
                                <option value="">请选择</option>
                                <option value="1">今天</option>
                                <option value="2">昨天</option>
                                <option value="3">三天</option>
                                <option value="4">本周</option>
                                <option value="5">上周</option>
                                <option value="6">半月</option>
                                <option value="7">本月</option>
                                <option value="8">上月</option>
                                <option value="9">半年</option>
                                <option value="10">本年</option>
                              </select>
                </div>
            </div>
            
            <div class="control-group span5">
              <label class="control-label">用户账号：</label>
                <input name="loginaccount" class="input-small control-text"  type="text" />
            </div>
            
            <div class="control-group span5">
              <label class="control-label">上级账号：</label>
                <input name="parentName" class="input-small control-text"  type="text" />
            </div>
            
            <div class="control-group span7">
              <label class="control-label">支付方式：</label>
                <select name="paytype">
                    <option value="">--请选择--</option>
                    <option value="1">自动核准</option>
                    <option value="2">人工核准</option>
                </select>
            </div>
            
            <div class="control-group span7">
              <label class="control-label">审核结果：</label>
                <select name="paystatus">
                    <option value="">--请选择--</option>
                    <option value="1">待审核</option>
                    <option value="2">已审核</option>
                    <option value="3">已支付</option>
                    <option value="4">已拒绝</option>
                </select>
            </div>
			
			<div class="control-group">
              <label class="control-label">活动名称：</label>
              <div class="controls">
              	<select name="ecactivitycode" data-rules="{required:true}" >
                    <option value="">--请选择--</option>
                     <c:forEach var="item" items="${listEnterpriseBrandActivity }" varStatus="i" >
                    	<option value="${item.ecactivitycode }">${item.activityname }</option>
                    </c:forEach>
                </select>
              </div>
             </div>
               
        </div>
        <div style="position: absolute;right: 15px;top: 3px;">
               <button id="btnSearch" type="submit" class="button button-primary"><span class="icon-search icon-white"></span>搜索</button>
        </div>
    </div>
    </div>
    </form>
    <!-- 搜索页 ================================================== -->
    
    
    
    <input class="input control-text" type="hidden" id="lsh" >
    <input class="input control-text" type="hidden" id="auditFlag" >
    
    <!-- 此节点内部的内容会在弹出框内显示,默认隐藏此节点-->
    <div id="content1" class="hidden" style="display: none;">
      <form id="validtimeform" class="form-horizontal">
        <div class="row">
          <div class="control-group span15">
          
          	<label class="control-label">金额：</label>
          	<div class="controls" >
              	<p style="text-align:center"><input class="input control-text" type="text" id="paymoneyreal" style="width:167px;height:20px;" data-rules="{required : true}"/><br /><br /></p>
              	<p style="text-align:right">
              	<input type="button" class='button button-success botton-margin'  onclick="savePayMoney()" value="确定"></input>
              	</p>
   			</div>
   			
          </div>
        </div>
      </form>
    </div>
    
    <!-- 此节点内部的内容会在弹出框内显示,默认隐藏此节点-->
    <div id="content2" class="hidden" style="display: none;">
      <form id="validtimeform" class="form-horizontal">
        <div class="row">
          <div class="control-group span15">
          	
          	<label class="control-label">拒绝原因：</label>
          	<div class="controls" >
              	<p style="text-align:center"><input class="input control-text" type="text" id="auditremark" style="width:200px;height:20px;" data-rules="{required : true}" data-tip="{text:'填写拒绝原因'}"/><br /><br /></p>
              	<p style="text-align:right">
              	<input type="button" class='button button-success botton-margin'  onclick="saveAudit()" value="确定"></input>
              	</p>
   			</div>
   			
          </div>
        </div>
      </form>
    </div>
    
    <div class="search-grid-container well">
      <div id="grid">
    </div>
<!-- 用户新增按钮是否有操作权限 -->
	<script type="text/javascript" src="${statics}/js/custom/page-quote.js"></script>
    <script type="text/javascript">


    var store ;
    
    var dialogGlobal = null;
    var dialogGlobalRefuse = null;
    function showUpdate(lsh, paymoneyreal){
    	$("#lsh").val(lsh);
    	$("#paymoneyreal").val(paymoneyreal);
    	
    	if(dialogGlobal == null) {
    		BUI.use('bui/overlay',function(Overlay){
        		dialogGlobal = new Overlay.Dialog({
        			width:340,
        			height:230,
        			title:"修改实发金额",
        			elCls : 'custom-dialog',
        			contentId:'content1',
        			buttons : [{
        				text:'取消',
        				elCls : 'button',
        				handler : function(){
        					this.close();
        				}
        			}]
        		});
        		//dialogGlobal.show();
        	});
    	}
    	dialogGlobal.show();
    }
    
	function showAudit(lsh, paymoneyreal,target){
		if($(target).hasClass("_active")) return;
		$(target).addClass("_active");
		
    	$("#lsh").val(lsh);
    	$("#auditremark").val("");
    	
    	if(paymoneyreal == 0) {
    		$("#auditremark").val("审核通过");
    		$("#auditFlag").val("通过");
    		saveAudit();
    	} else {
    		$("#auditFlag").val("拒绝");
    		
    		if(dialogGlobalRefuse == null) {
    			BUI.use('bui/overlay',function(Overlay){
    				dialogGlobalRefuse = new Overlay.Dialog({
            			width:340,
            			height:230,
            			title:"审核",
            			elCls : 'custom-dialog',
            			contentId:'content2',
            			buttons : [{
            				text:'取消',
            				elCls : 'button',
            				handler : function(){
            					$(target).removeClass("_active");
            					this.close();
            				}
            			}]
            		});
            		//dialogGlobal.show();
            	});
    		}
    		dialogGlobalRefuse.show();
    	}
    }
	
	function showPay(lsh, paymoneyreal,target){
		if($(target).hasClass("_active")) return;
		$(target).addClass("_active");
		
    	$("#lsh").val(lsh);
    	
    	BUI.Message.Confirm('是否确定发放红利？',function() {
			$.ajax({
				type : "POST",
				url : "${ctx}/activitypay/pay",
				data : {"lsh" : lsh},
				dataType : "json",
				success : function(data) {
					$(target).removeClass("_active");
					if (data.status == 1) {
						BUI.Message.Alert(data.message,'success');
						store.load();
					} else {
						BUI.Message.Alert(data.message,'warning');
					}
				}
			});
		}, 'question');
    }
	
	//保存新金额
	function savePayMoney() {
		
		if($("#paymoneyreal").val() == "" ) {
			$("#paymoneyreal")[0].focus();
			return ;
		}
		
		//BUI.Message.Confirm('是否确定操作吗？',function() {
			$.ajax({
				type : "POST",
				url : "${ctx}/activitypay/edit",
				data : {"lsh" : $("#lsh").val(), "paymoneyreal": $("#paymoneyreal").val()},
				dataType : "json",
				success : function(data) {
					if (data.status == 1) {
						BUI.Message.Alert(data.message,'success');
						dialogGlobal.close();
						store.load();
					} else {
						BUI.Message.Alert(data.message,'warning');
					}
				}
			});
		//}, 'question');
	}
	
	//保存审核结果
	function saveAudit() {
		
		if($("#auditremark").val() == "" ) {
			$("#auditremark")[0].focus();
			return ;
		}
		if(null!=dialogGlobalRefuse){
			dialogGlobalRefuse.close();
		}
	
		BUI.Message.Confirm('是否确定操作吗？',function() {
			$.ajax({
				type : "POST",
				url : "${ctx}/activitypay/audit",
				data : {"lsh" : $("#lsh").val(), "auditremark": $("#auditremark").val(), "auditFlag": $("#auditFlag").val() },
				dataType : "json",
				success : function(data) {
					if (data.status == 1) {
						BUI.Message.Alert(data.message,'success');
						if(dialogGlobal != null) {
							dialogGlobal.close();
						}
						
						store.load();
					} else {
						BUI.Message.Alert(data.message,'warning');
					}
				}
			});
		}, 'question');
	}
    
    (function(){
    	//权限判断

    	var audit_brand = ${sessionScope.ERCM_USER_PSERSSION['MN00C7'].menustatus==1};//审核权限
  		var pay_setting = ${sessionScope.ERCM_USER_PSERSSION['MN00C8'].menustatus==1};//发放权限
  		var edit_brand = ${sessionScope.ERCM_USER_PSERSSION['MN00C9'].menustatus==1};//修改权限
  		var export_excel = (1==1);
  		
  		var begintime = $("input[name='startDate']");
  	   var endtime = $("input[name='endDate']");
  	   if(!begintime.val()&&!endtime.val()){
  		   begintime.val(getDate("begintime"))
  		   endtime.val(getDate("endtime"));
  		   $("#quiklychoicetime option:eq(1)").attr("selected","selected");
  	   }
  	   
  		Date.prototype.format = function(format){ 
            var o = { 
            "M+" : this.getMonth()+1, //month 
            "d+" : this.getDate(), //day 
            "h+" : this.getHours(), //hour 
            "m+" : this.getMinutes(), //minute 
            "s+" : this.getSeconds(), //second 
            "q+" : Math.floor((this.getMonth()+3)/3), //quarter 
            "S" : this.getMilliseconds() //millisecond 
            } 
 
            if(/(y+)/.test(format)) { 
            format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
            } 
 
            for(var k in o) { 
            if(new RegExp("("+ k +")").test(format)) { 
            format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length)); 
            } 
            } 
            return format; 
        } 
  		
        function permissionValidate(){
        	var botton_arry = new Array();
            if(export_excel){
            	botton_arry.push({
            	          btnCls:'button button-primary',
            	          text:'<span class="icon-file icon-white"></span>导出到EXCEL(当前条件)',
            	          handler:function(){
            	          	searchForm.action = "${ctx}/activitypay/exportExcel";
            	          	searchForm.submit();
            	          	searchForm.action = "${ctx}/activitypay/pagelist";
            	          }
            	});
            }
        	return botton_arry;
        }
        
        
    	
        var Grid = BUI.Grid,
          Store = BUI.Data.Store,
          columns = [
			{ title: '流水号',width:'5%', dataIndex: 'lsh'},         
            { title: '用户账号',width:'5%', dataIndex: 'loginaccount'},
            { title: '活动名称',width:'10%', dataIndex: 'acname'},
            { title: '支付方式',width:'5%', dataIndex: 'paytype', renderer:function(value,obj){
            	if(value == "1") {
            		return "自动核准";
            	}
            	else if(value == "2") {
            		return "人工核准";
            	}
            }},
            { title: '红利金额',width:'5%', dataIndex: 'paymoneyaudit', renderer:function(value,obj){
            	return value.toFixed(2);
            }},
            { title: '实发金额',width:'5%', dataIndex: 'paymoneyreal', renderer:function(value,obj){
            	return value.toFixed(2);
            }},
            { title: '汇总时间',width:'8%', dataIndex: 'createtime',renderer:BUI.Grid.Format.datetimeRenderer},
            
            { title: '审核人/时间',width:'12%', dataIndex: 'category', renderer:function(value,obj){
            	if(obj.audittime != null) return (obj.auditer == "" ? "系统自动" : obj.auditer) + "<br />" + (new Date(obj.audittime).format("yyyy-MM-dd hh:mm:ss"));
            	else return "";
            }},
            { title: '支付人/时间',width:'12%', dataIndex: 'category2', renderer:function(value,obj){
            	if(obj.paytyime != null) return (obj.payer == "" ? "系统自动" : obj.payer) + "<br />" + (new Date(obj.paytyime).format("yyyy-MM-dd hh:mm:ss"));
            	else return "";
            }},
            
            { title: '支付状态',width:'5%', dataIndex: 'paystatus', renderer:function(value,obj){
            	if(value == "1") {
            		return "待审核";
            	}
            	else if(value == "2") {
            		return "已审核";
            	}
            	else if(value == "3") {
            		return "<font color='green'>已发放</font>";
            	}
            	else if(value == "4") {
            		return "<font color='red'>已拒绝</font>";
            	}
            }},
            { title: '审核结果',width:'6%', dataIndex: 'auditremark'},
            { title: '备注',width:'10%', dataIndex: 'descs'},
            { title: '流水倍数',width:'5%', dataIndex: 'lsbs'},
            
            { title: '操作',width:'12%',sortable: false,renderer:function(value,obj){
            	var  html = "";
            	if(obj.paystatus == "1") {
            		if(edit_brand) {
            			html += '<button type="button" onclick="showUpdate(\''+ obj.lsh+'\',\''+ obj.paymoneyreal+'\');" class="button  button-success botton-margin"><span class="icon-edit icon-white"></span>修改</button>';
            		}
					
					if(audit_brand) {
						html += '<button type="button" onclick="showAudit(\''+ obj.lsh+'\', 0);" class="button  button-info botton-margin">通过</button>';
						html += '<button type="button" onclick="showAudit(\''+ obj.lsh+'\', 1);" class="button  button-info botton-margin">拒绝</button>';
					}
					
            	} else if(obj.paystatus == "2") {
            		if(pay_setting) {
            			html += '<button type="button" onclick="showPay(\''+ obj.lsh+'\', 0);" class="button  button-info botton-margin">发放</button>';
            		}
            	} else if(obj.paystatus == "3") {
            		//
            	} else if(obj.paystatus == "4") {
            		//
            	}
            	
                return html;
            }}
          ];
      
        store = new Store({
            url : '${ctx}/activitypay/pagelist',
            autoLoad : false,
            pageSize: 15,
            sortInfo : {
                field : 'createtime',
                direction : 'desc'
              },
            remoteSort: true
          }),grid = new Grid.Grid({
            render:'#grid',
            autoRender:true,
            width:'100%',
            loadMask: true,
            fixedLayout:true,
            columns : columns,
            store: store,
            plugins : [ Grid.Plugins.CheckSelection ],
            emptyDataTpl : '<div class="centered"><img alt="Crying" src="${statics }/img/dataisnull.png"/><font style="color:red;font-size:20px;"><h2>没有找到匹配的数据!</h2></font></div>',
            tbar:{
             items:permissionValidate()
            },
            bbar : {
               	pagingBar:true,
            }
          }),datepicker = new BUI.Calendar.DatePicker({
              trigger:'.calendar-time',
              showTime:true,
              autoRender:true
           });
        
        
        
        grid.on('cellclick',function(ev){
          var sender = $(ev.domTarget);
          if(!sender.hasClass('x-grid-checkbox')){ //如果不是点中勾选列，不能进行选中操作
            return false;
          }
        });
        $("#searchForm").submit(function(){
      	  var obj = BUI.FormHelper.serializeToObject(this);
            obj.start = 0;
            store.load(obj);
      	  return false;
        }).submit();
        
    })();
    
    function test1(lsh,stype) {//web
		BUI.Message.Confirm('是否确定操作？',function() {
			$.ajax({
				type : "POST",
				url : "${ctx}/apigametype/updateweb",
				data : {"isweb" : stype, "lsh" : lsh},
				dataType : "json",
				success : function(data) {
					if (data.status == 1) {
						BUI.Message.Alert(data.message,'success');
						store.load();
					} else {
						BUI.Message.Alert(data.message,'warning');
					}
				}
			});
		}, 'question');
    }
    function test2(lsh,stype) {//h5
    	BUI.Message.Confirm('是否确定操作？',function() {
			$.ajax({
				type : "POST",
				url : "${ctx}/apigametype/updateh5",
				data : {"ish5" : stype, "lsh" : lsh},
				dataType : "json",
				success : function(data) {
					if (data.status == 1) {
						BUI.Message.Alert(data.message,'success');
						store.load();
					} else {
						BUI.Message.Alert(data.message,'warning');
					}
				}
			});
		}, 'question');
    }
    
    </script>
<!-- script end -->
  </div>
	
	</div>
	
</body>
</html>