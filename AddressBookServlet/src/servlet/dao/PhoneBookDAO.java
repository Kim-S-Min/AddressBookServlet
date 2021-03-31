package servlet.dao;

import java.util.List;

public interface PhoneBookDAO {
	public List<PhoneBookVo> getList();
	public List<PhoneBookVo> search(String keyword);
	public boolean insert(PhoneBookVo vo);
	public boolean delete(Long id);
}
