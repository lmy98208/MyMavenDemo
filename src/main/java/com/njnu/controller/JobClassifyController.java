package com.njnu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.njnu.bean.JobClassify;
import com.njnu.dao.JobClassifyMapper;
import com.njnu.util.ResultBean;
import com.njnu.util.TableModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("jobClassify")
public class JobClassifyController {
    @Autowired
    private JobClassifyMapper mapper;

    @RequestMapping("list")
    @ResponseBody
    private Object findAll(Integer page, Integer limit){
        page=page==null?1:page;
        limit=limit==null?8:limit;
        PageHelper.startPage(page,limit);
        List<JobClassify> list=mapper.selectAll();
        PageInfo<JobClassify> info=new PageInfo<>(list);
        TableModel<JobClassify> model=new TableModel(info.getList(),(int)info.getTotal());
        return model;
    }

    /**
     *
     * @param id
     * @param k1
     * @param k2
     * @param k3
     * @param changeType
     * @return
     */
    @RequestMapping("change")
    @ResponseBody
    public Object change(Integer id,String k1,String k2,String k3,String changeType){
        int rows=-1;
        JobClassify jobClassify=new JobClassify();
        jobClassify.setK1(k1);
        jobClassify.setK2(k2);
        jobClassify.setK3(k3);
        jobClassify.setJobKindId(id);
        ResultBean bean=null;
        System.out.println(k1+changeType);
        try {
            if(changeType.equals("add")){
                jobClassify.setJobKindId(null);
                rows=mapper.insertSelective(jobClassify);
            }else if(changeType.equals("edit")){
                rows=mapper.updateByPrimaryKeySelective(jobClassify);
            }
            if (rows>0)
            {
                bean=new ResultBean(ResultBean.CODE.SUCCESS);
            }
            else {
                bean=new ResultBean(ResultBean.CODE.FAIL);
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
            bean=new ResultBean(ResultBean.CODE.EXCEPTION);
        }
        return  bean;
    }

    @RequestMapping("delete")
    @ResponseBody
    public Object delete(String strId)
    {
        strId=strId.substring(1,strId.length()-1);
        String []idlist= strId.split(",");
        Integer []id=new Integer[idlist.length];
        for(int j=0;j<idlist.length;j++)
            id[j]=Integer.parseInt(idlist[j]);
        int len=id.length,i=0;
        ResultBean bean=null;
        try {
            for(i=0;i<len;i++)
                mapper.deleteByPrimaryKey(id[i]);
            if (i==len)
            {
                bean=new ResultBean(ResultBean.CODE.SUCCESS);
            }
            else {
                bean=new ResultBean(ResultBean.CODE.FAIL);
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
            bean=new ResultBean(ResultBean.CODE.EXCEPTION);
        }
        return  bean;
    }

    @RequestMapping("findByk1k2")
    @ResponseBody
    private Object findByk1k2(String k1,String k2,Integer page, Integer limit){
        page=page==null?1:page;
        limit=limit==null?8:limit;
        System.out.println(k1+k2);
        PageHelper.startPage(page,limit);
        try{
            List<JobClassify> list=mapper.selectByK1K2(k1,k2);
            PageInfo<JobClassify> info=new PageInfo<>(list);
            TableModel<JobClassify> model=new TableModel(info.getList(),(int)info.getTotal());
            return model;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
