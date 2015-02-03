<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function onlineregistFormFormSubmit() {
		var grade=$("input[name=grade]:checked").val();
		if($.isEmpty(grade)){
			Easy.hmqDialogEror("请选择拟读年级");
			return;
		}
		$("#onlineregistForm").formAjax(function(data) {
			Easy.hmqDialog(data, function() {
				$("#datagrid_register").datagrid("reload");
				$("#homeWin").window("close");
			})
		});
	}
</script>
<form id="onlineregistForm" action="${ctx}/onlineregist/data/saveorupdate" method="post">
	<input type="hidden" name="id" value="${regist.id}">
	<table class="form">
		<tr>
			<th width="10%"><i>*</i>姓名</th>
			<td width="23%"><input type="text" name="name" value="${regist.name}" class="easyui-validatebox"  data-options="required:true" /></td>
			<th width="10%"><i>*</i>性别</th>
			<td width="23%">男:<input type="radio" name="sex" value="1" ${regist.sex==1?'checked':''} /> 
							女:<input type="radio" name="sex" value="0" ${regist.sex==0?'checked':''} />
			</td>
			<th width="10%"><i>*</i>民族</th>
			<td width="23%"><select name="nation.id"
				class="easyui-validatebox" data-options="required:true">
					<option value="">--请选择--</option>
					<c:forEach items="${nations}" var="nat">
						<option value="${nat.id}"
							${regist.nation.id==nat.id?"selected='selected'":""}>${nat.name}</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<th>身份证</th>
			<td>
				<c:if test="${regist.id!=null}">
					<input type="text" id="idcardno" name="idcardno"
					value="${regist.idcardno}" class="easyui-validatebox"
					data-options="required:true" />
				</c:if>
				<c:if test="${regist.id==null}">
					<input type="text" id="idcardno" name="idcardno"
					value="${regist.idcardno}" class="easyui-validatebox"
					data-options="required:true,validType:'validCar'" />
				</c:if>
			</td>
			<th>出生年月</th>
			<td><input type="text" name="birthday"
				value="${regist.birthday}" class="easyui-datebox"
				data-options="required:true" /></td>
			<th>户口所在地</th>
			<td><input type="text" name="place" value="${regist.place}"
				class="easyui-validatebox" data-options="required:true" /></td>
		</tr>
		<tr>
			<th>现住址</th>
			<td><input type="text" name="address" value="${regist.address}"
				class="easyui-validatebox" data-options="required:true" /></td>
			<th>现就读学校</th>
			<td><input type="text" name="school" value="${regist.school}"
				class="easyui-validatebox" data-options="required:true" /></td>
			<th>拟读年纪</th>
			<td>
				小学<input type="radio" name="grade" value="1" ${regist.grade==0?"checked='checked'":""}>
				初中<input type="radio" name="grade"	value="2" ${regist.grade==1?"checked='checked'":""}>
				高中<input type="radio" name="grade"	value="3" ${regist.grade==2?"checked='checked'":""}>
		</tr>
		<tr>
			<th>父亲姓名</th>
			<td><input type="text" name="father" value="${regist.father}"
				class="easyui-validatebox" data-options="required:true" /></td>
			<th>父亲工作单位</th>
			<td><input type="text" name="fatherwork" value="${regist.fatherwork}"
				class="easyui-validatebox" data-options="required:true" /></td>
			<th>父亲电话</th>
			<td><input type="text" name="fathertel" value="${regist.fathertel}"  class="easyui-validatebox" fathertel="required:true" /></td>
		</tr>
		<tr>
			<th>母亲姓名</th>
			<td><input type="text" name="mother" value="${regist.mother}"
				class="easyui-validatebox" data-options="required:true" /></td>
			<th>母亲工作单位</th>
			<td><input type="text" name="motherwork"
				value="${regist.motherwork}" class="easyui-validatebox"
				data-options="required:true" /></td>
			<th>母亲电话</th>
			<td><input type="text" name="mothertel"
				value="${regist.mothertel}" class="easyui-validatebox"
				data-options="required:true" /></td>
		</tr>
		<tr>
			<th>兴趣爱好</th> 
			<td colspan="5"><input type="text" name="interest"
				value="${regist.interest}" /></td>
		</tr>
		<tr>
			<th>获奖情况</th>
			<td colspan="5"><input type="text" name="award"
				value="${regist.award}"  /></td>
		</tr>
		<tr>
			<th>报读我校原因</th>
			<td><input type="text" name="reason" value="${regist.reason}"
				class="easyui-validatebox" data-options="required:true" /></td>
			<th>信息来源</th>
			<td>
				亲友介绍:<input type="radio" name="origin" value="0"  ${regist.origin==0?'checked':''} /> 
				老师推荐:<input type="radio" name="origin" value="1"  ${regist.origin==1?'checked':''} /> 
				慕名报读:<input type="radio" name="origin" value="2" ${regist.origin==2?'checked':''} />
			</td>
			<th>填报时间</th>
			<td><input type="text" id="datebox" name="date" value="${regist.date}" 
				class="easyui-datebox" data-options="required:true" /></td>
			</td>
			<script>
				var date=new Date();
				$('#datebox').val(date.getFullYear()+"-"+date.getMonth()+"-"+date.getDate());
			</script>
		</tr>
	</table>
</form>
<div style="margin-top: 5px; text-align: right; padding: 10px;">
	<input type="button" value="保存" onclick="onlineregistFormFormSubmit()"
		style="width: 60px; height: 30px" />
</div>
