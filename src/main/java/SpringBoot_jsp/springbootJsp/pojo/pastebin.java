package SpringBoot_jsp.springbootJsp.pojo;

/**
 * 实体类
 * @author Administrator
 *
 */
public class pastebin {
	public Integer id;
	private String password;
	private String content;
	private String codetype;
	private Integer is_secret;
	private String email;
	public pastebin(){}


	public void set_pastebin(Integer id,String password,String content,String codetype,Integer is_secret) {
		this.id = id;
		this.password = password;
		this.content = content;
		this.codetype = codetype;
		this.is_secret = is_secret;
	}
	public void set_pastebin(String password,String content,String codetype,Integer is_secret,String email) {
		this.password = password;
		this.content = content;
		this.codetype = codetype;
		this.is_secret = is_secret;
		this.email=email;
	}

	public String get_emain()
	{
		return email;
	}
	public void setId(Integer id)
	{
		this.id=id;
	}
	public Integer get_id()
	{
		return id;
	}
	public String get_password()
	{
		return password;
	}
	public String get_content()
	{
		return content;
	}
	public String get_codetype()
	{
		return codetype;
	}
	public Integer get_is_secret()
	{
		if(is_secret==null)
			return 0;
		return is_secret;
	}

	@Override
	public String toString()
	{
		return  codetype+";"+content;
	}
}
