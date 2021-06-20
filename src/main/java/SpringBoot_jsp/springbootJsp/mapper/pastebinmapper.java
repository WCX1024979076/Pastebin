package SpringBoot_jsp.springbootJsp.mapper;

import org.apache.ibatis.annotations.Mapper;

import SpringBoot_jsp.springbootJsp.pojo.pastebin;

import java.util.List;
import java.util.Map;

@Mapper
public interface pastebinmapper {

	void insert(pastebin Pastebin);

	pastebin select(int id);
	List<pastebin> select_email(Map mp);
	void delete(int id);

}
