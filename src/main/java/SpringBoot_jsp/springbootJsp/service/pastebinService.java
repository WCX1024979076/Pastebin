package SpringBoot_jsp.springbootJsp.service;

import SpringBoot_jsp.springbootJsp.mapper.pastebinmapper;
import SpringBoot_jsp.springbootJsp.pojo.pastebin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service("pastebinservie")
@ComponentScan({"SpringBoot_jsp.springbootJsp.mapper"})
public class pastebinService {

    @Autowired
    private pastebinmapper Pastebinmapper;

    public pastebin insert(Map paste)
    {
        System.err.println("后台API开始插入");
        pastebin Pastebin=new pastebin();
        Pastebin.set_pastebin((String)paste.get("password"),(String)paste.get("code"),(String)paste.get("codetype"),(Integer) paste.get("is_secret"),(String) paste.get("email"));
        Pastebinmapper.insert(Pastebin);
        System.err.println("后台API数据插入完成");
        return Pastebin;
    }


    public void delete(Map paste)
    {
        Integer id= (Integer) paste.get("id");
        Pastebinmapper.delete(id);
    }

    public pastebin select(Map paste) {
        System.err.println("后台API开始查找");
        Integer id= (Integer) paste.get("id");
        pastebin Pastebin = Pastebinmapper.select(id);
        System.err.println("后台API查找完成");
        return Pastebin;
    }

    public List<pastebin> select_email(Map paste) {
        System.err.println("后台API开始查找邮箱结果");
        Map<String,Object> mp=new HashMap<>();
        mp.put("email",(String) paste.get("email"));
        mp.put("page",(Integer) paste.get("page")*10);
        List<pastebin> Pastebin = Pastebinmapper.select_email(mp);
        System.err.println("后台API查找完成");
        return Pastebin;
    }
}
