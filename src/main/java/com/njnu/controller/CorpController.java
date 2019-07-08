package com.njnu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.njnu.bean.Corporation;
import com.njnu.dao.CorporationMapper;
import com.njnu.util.AddressInfo;
import com.njnu.util.ResultBean;
import com.njnu.util.TableModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("corp")
public class CorpController {

    @Autowired
    private CorporationMapper mapper;
//    @RequestMapping("{page}")
//    public String page(@PathVariable("page") String page)
//    {
//        return "corp/"+page;
//    }

    /**
     * 查找全表的json数据方法
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("list")
    @ResponseBody
    public Object findall(Integer page, Integer limit){
        page=page==null?1:page;
        limit=limit==null?10:limit;
        PageHelper.startPage(page,limit);
        List<Corporation> list=mapper.selectAll();
        PageInfo<Corporation> info=new PageInfo<>(list);
        TableModel<Corporation> model=new TableModel(info.getList(),(int)info.getTotal());
        return model;
    }

    @RequestMapping("change")
    @ResponseBody
    public Object change(Integer id,String name,Integer scale,String tag,
                         String address,String lnglat,String intro,
                         String fullname,String legalperson,String scope,String changeType){
        int rows=-1;
        Corporation corporation=new Corporation();
        corporation.setCorpId(id);
        corporation.setCorpName(name);
        corporation.setCorpScale(scale);
        corporation.setTag(tag);
        corporation.setAddress(address);
        corporation.setAddressLngLat(lnglat);
        corporation.setIntroduction(intro);
        corporation.setFullCropName(fullname);
        corporation.setLegalPerson(legalperson);
        corporation.setBussinessScope(scope);
        ResultBean bean=null;
        System.out.println(fullname+changeType);
        try {
            if(changeType.equals("add")){
                corporation.setCorpId(null);
                rows=mapper.insertSelective(corporation);
            }else if(changeType.equals("edit")){
                rows=mapper.updateByPrimaryKeySelective(corporation);
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

    @RequestMapping("findbyid")
    @ResponseBody
    public Object selectbyid(Integer id){
        Corporation corporation=mapper.selectByPrimaryKey(id);
        return corporation;
    }

    @RequestMapping("findlLocation")
    @ResponseBody
    public Object findlLocation(){
        List<String> list=mapper.selectLocation();
        List<AddressInfo> addlsit=new ArrayList<>();
        for(int i=0;i<list.size();i++){
            String []point=list.get(i).split(",");
            AddressInfo addressInfo=new AddressInfo();
            addressInfo.setLng(point[0]);
            addressInfo.setLat(point[1]);
            Random random = new Random();
            addressInfo.setCount(random.nextInt(250 - 50 + 1) + 50);
            addlsit.add(addressInfo);
        }
        return addlsit;
    }

    @RequestMapping("listCorp")
    @ResponseBody
    public List<Corporation> findAll(){
        return mapper.selectAll();
    }
    /**
     * 返回码
     * @param strId
     * @return
     */
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
}
