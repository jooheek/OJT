/**
 * 
 */
package org.joohee.A00.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;


/**
 * @author jooheek
 *
 */
public interface BoardService {
	
	
	public List<Map<String,Object>> getList(Map<String,Object>map);
	


}
