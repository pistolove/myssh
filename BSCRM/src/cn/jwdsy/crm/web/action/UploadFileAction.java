package cn.jwdsy.crm.web.action;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.xwork.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;

import cn.jwdsy.crm.domain.SysUser;
import cn.jwdsy.crm.domain.UploadFile;
import cn.jwdsy.crm.util.BeanUtil;
import cn.jwdsy.crm.util.GlobalParam;
import cn.jwdsy.crm.util.StringUtil;
import cn.jwdsy.crm.web.form.UploadFileForm;

import com.opensymphony.xwork2.ActionContext;

@Scope("prototype")
public class UploadFileAction extends BaseAction {

	private static final long serialVersionUID = 8306404514004461573L;
	
	private File[] uploadImages;
	private String[] uploadImagesContentType;
	private String[] uploadImagesFileName;
	
	public File[] getUploadImages() {
		return uploadImages;
	}

	public void setUploadImages(File[] uploadImages) {
		this.uploadImages = uploadImages;
	}

	public String[] getUploadImagesContentType() {
		return uploadImagesContentType;
	}

	public void setUploadImagesContentType(String[] uploadImagesContentType) {
		this.uploadImagesContentType = uploadImagesContentType;
	}

	public String[] getUploadImagesFileName() {
		return uploadImagesFileName;
	}

	public void setUploadImagesFileName(String[] uploadImagesFileName) {
		this.uploadImagesFileName = uploadImagesFileName;
	}
	

	public String AddUI(){
		sysLogService.RecordLog("进入上传文件页面!");
		return GlobalParam.ADD_UI;
	}

	public String SaveFiles(){
		ServletContext sc = ServletActionContext.getServletContext();
		String realpath = sc.getRealPath("UploadFiles");
		try {
			if(uploadImages!=null&&uploadImages.length>0){
				for(int i=0;i<uploadImages.length;i++){
					File file = new File(realpath,uploadImagesFileName[i]);
					FileUtils.copyFile(uploadImages[i], file);
					//将上传文件信息写入数据库
					UploadFile uploadFile = new UploadFile();
					long filesize = file.length()/1000;//字节/1000=k
					String filePath = "UploadFiles/" + uploadImagesFileName[i];
					SysUser uploadPerson = (SysUser) request.getSession().getAttribute("user");
					Date uploadTime = new Date();
					String suffix = uploadImagesFileName[i].substring(uploadImagesFileName[i].lastIndexOf(".")+1);
					uploadFile.setFileSize(filesize);
					uploadFile.setFileName(uploadImagesFileName[i]);
					uploadFile.setFilePath(filePath);
					uploadFile.setUploadPerson(uploadPerson);
					uploadFile.setUploadTime(uploadTime);
					uploadFile.setSuffix(suffix);
					uploadFileService.saveEntity(uploadFile);
					sysLogService.RecordLog("上传[ "+uploadFile.getFileName()+" ]文件!");
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "success";
	}
	
	public String Check(){
		List<SysUser> userList = sysUserService.checkEntities(new SysUser());
		ActionContext.getContext().put("userList", userList);
		UploadFile uploadFile = new UploadFile();
		String userId = request.getParameter("userId");
		String fileName = request.getParameter("fileName");
		String uploadTime = request.getParameter("uploadTime");
		if(userId!=null || fileName!=null || uploadTime != null){
			UploadFileForm model = new UploadFileForm();
			model.setFileName(fileName);
			model.setUploadTime(uploadTime);
			BeanUtil.CopyVO2PO(model, uploadFile);
			if(StringUtils.isNotBlank(userId)){
				SysUser uploadPerson = new SysUser();
				uploadPerson.setUserId(Integer.parseInt(userId));
				uploadFile.setUploadPerson(uploadPerson);
			}
		}
		List<UploadFile> fileListRes = uploadFileService.checkEntities(uploadFile);
		List<UploadFileForm> fileList = new ArrayList<UploadFileForm>();
		List<String> suffxs = new ArrayList<String>();
		suffxs.add("mp3");
		suffxs.add("wma");
		suffxs.add("jpg");
		suffxs.add("jpeg");
		suffxs.add("gif");
		suffxs.add("png");
		suffxs.add("bmp");
		suffxs.add("pdf");
		suffxs.add("ppt");
		suffxs.add("zip");
		suffxs.add("exe");
		suffxs.add("doc");
		suffxs.add("docx");
		suffxs.add("xls");
		suffxs.add("xlsx");
		suffxs.add("accdb");
		suffxs.add("ldb");
		suffxs.add("mdb");
		
		for(UploadFile file : fileListRes){
			UploadFileForm formFile = new UploadFileForm();
			BeanUtil.CopyPO2VO(file, formFile);
			if(!suffxs.contains(formFile.getSuffix())){
				formFile.setSuffix("unknow");
			}
			formFile.setUploadTime(formFile.getUploadTime().substring(0, 10));
			formFile.setUploadPerson(file.getUploadPerson().getCnname());
			fileList.add(formFile);
		}
		request.setAttribute("userId", userId);
		request.setAttribute("fileName", fileName);
		request.setAttribute("uploadTime", uploadTime);
		ActionContext.getContext().put("fileList", fileList);
		sysLogService.RecordLog("查询文件!");
		return GlobalParam.LIST_UI;
	}
	
	public String Delete(){
		String[] ids = request.getParameterValues("ids");//[1,IT日语单词(1-15页).doc]
		Integer[] is = StringUtil.ConvertStrings2Integers(ids);
		ServletContext sc = ServletActionContext.getServletContext();
		String realpath = sc.getRealPath("UploadFiles");
		for(String id : ids){
			if(id!=null){
				String[] idAName = id.split(",");
				Integer fileId = Integer.parseInt(idAName[0]);
				uploadFileService.deleteEntityByIds(UploadFile.class, fileId);
				File file = new File(realpath+"/"+idAName[1]);
				file.delete();
			}
		}
		sysLogService.RecordLog("删除文件ID为[ "+ids+" ]的"+is.length+"个文件!");
		return GlobalParam.LIST_ACTION;
	}
	
	public String Download(){
		try {
			ServletContext sc = ServletActionContext.getServletContext();
			String realpath = sc.getRealPath("UploadFiles");
			String reportRealpath = sc.getRealPath("Report");
	        //解决中文乱码问题
	        String filename=new String(request.getParameter("fileName").getBytes("iso-8859-1"),"UTF-8");
	        sysLogService.RecordLog("下载[ "+filename+" ]文件!");
	        File file = null;
	        if(filename.contains("Report/")){
	        	filename = filename.substring(7);
	        	file = new File(reportRealpath+"\\"+filename);
	        }else{
		        //创建file对象
		        file = new File(realpath+"/"+filename);
	        }
	        //设置response的编码方式
	        response.setContentType("application/x-msdownload");
	        //写明要下载的文件的大小
	        response.setContentLength((int)file.length());
        	//解决中文乱码
        	response.setHeader("Content-Disposition","attachment;filename="+new String(filename.getBytes("gbk"),"iso-8859-1"));       
			//读出文件到i/o流
			FileInputStream fis=new FileInputStream(file);
			BufferedInputStream buff=new BufferedInputStream(fis);
			byte [] b=new byte[1024];//相当于我们的缓存
			long k=0;//该值用于计算当前实际下载了多少字节
			//从response对象中得到输出流,准备下载
			OutputStream myout=response.getOutputStream();
			//开始循环下载
			while(k<file.length()){
			    int j=buff.read(b,0,1024);
			    k+=j;
			    //将b中的数据写到客户端的内存
			    myout.write(b,0,j);
			}
			//将写入到客户端的内存的数据,刷新到磁盘
			myout.flush();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String ImageView(){
		UploadFile uploadFile = new UploadFile();
		uploadFile.setSuffix("图片");
		List<UploadFile> fileList = uploadFileService.checkEntities(uploadFile);
		ActionContext.getContext().put("fileList", fileList);
		sysLogService.RecordLog("浏览所有图片文件!");
		return GlobalParam.IMAGE_VIEW;
	}


}
