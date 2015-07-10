package cn.jwdsy.crm.util;

import java.util.ArrayList;
import java.util.List;

import cn.jwdsy.crm.domain.SysLog;
import cn.jwdsy.crm.domain.SysUser;


public class ExportName {
	
	public static final ArrayList userNameList =  new ArrayList();
	public static final ArrayList logNameList =  new ArrayList();

	static{
		userNameList.add("用户编号");
		userNameList.add("用户名");
		userNameList.add("中文名");
		userNameList.add("密码");
		userNameList.add("推荐人");
		userNameList.add("移动电话");
		userNameList.add("电子邮件");
		userNameList.add("家庭地址");
		userNameList.add("家庭电话");
		userNameList.add("现住宅电话");
		userNameList.add("现住宅地址");
		userNameList.add("身份证");
		userNameList.add("紧急联系人");
		userNameList.add("紧急联系电话");
		userNameList.add("角色权限组");
		userNameList.add("操作权限组");
		userNameList.add("性别");
		userNameList.add("出生日期");
		userNameList.add("职务");
		userNameList.add("入职时间");
		userNameList.add("最高学历");
		userNameList.add("毕业学校");
		userNameList.add("毕业时间");
		userNameList.add("备注");
		userNameList.add("创建人");
		userNameList.add("创建时间");
		userNameList.add("修改人");
		userNameList.add("修改时间");
		
		logNameList.add("日志ID");
		logNameList.add("操作人");
		logNameList.add("操作时间");
		logNameList.add("操作内容");
	}

	public static ArrayList ConvertObj2DataList(List dataList) {
		//封装excel的数据集
		ArrayList arrayList = new ArrayList();
		if(dataList.get(0) instanceof SysUser){
			for(int i=0;dataList!=null && i<dataList.size();i++){
				List tempList = new ArrayList();
				SysUser sysUser = (SysUser) dataList.get(i);
				tempList.add(sysUser.getUserId());
				tempList.add(sysUser.getName());
				tempList.add(sysUser.getCnname());
				tempList.add(sysUser.getPassword());
				tempList.add(sysUser.getCommendMan());
				tempList.add(sysUser.getMovetelePhone());
				tempList.add(sysUser.getEmail());
				tempList.add(sysUser.getAddress());
				tempList.add(sysUser.getTelephone());
				tempList.add(sysUser.getNowAddress());
				tempList.add(sysUser.getNowtelePhone());
				tempList.add(sysUser.getIdentityCode());
				tempList.add(sysUser.getInstancyLinkman());
				tempList.add(sysUser.getInstancytelePhone());
				if(sysUser.getSysRole()!=null){
					tempList.add(sysUser.getSysRole().getRoleName());
				}
				if(sysUser.getSysUserGroup()!=null){
					tempList.add(sysUser.getSysUserGroup().getName());
				}
				tempList.add(sysUser.getSex());
				tempList.add(sysUser.getBirthday());
				tempList.add(sysUser.getDuty());
				tempList.add(sysUser.getWorkDate());
				tempList.add(sysUser.getHighSchool());
				tempList.add(sysUser.getFinishSchool());
				tempList.add(sysUser.getFinishSchoolDate());
				tempList.add(sysUser.getRemark());
				tempList.add(sysUser.getCreator());
				tempList.add(sysUser.getCreateTime());
				tempList.add(sysUser.getUpdater());
				tempList.add(sysUser.getUpdateTime());
				arrayList.add(tempList);
			}
		}else if(dataList.get(0) instanceof SysLog){
			for(int i=0;dataList!=null && i<dataList.size();i++){
				List tempList = new ArrayList();
				SysLog sysLog = (SysLog) dataList.get(i);
				tempList.add(sysLog.getLogId());
				tempList.add(sysLog.getUsername());
				tempList.add(sysLog.getOperateTime());
				tempList.add(sysLog.getContent());
				arrayList.add(tempList);
			}
		}
		return arrayList;
	}

}
