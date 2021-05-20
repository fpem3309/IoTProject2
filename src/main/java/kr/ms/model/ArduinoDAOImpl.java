package kr.ms.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ArduinoDAOImpl implements ArduinoDAO {
    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public List<ArduinoVO> arduinoList() {
        SqlSession session = sqlSessionFactory.openSession();
        List<ArduinoVO> list = session.selectList("arduinoList");
        session.close();
        return list;
    }
    
    @Override
    public List<ArduinoVO> arduinoList2() {
        SqlSession session = sqlSessionFactory.openSession();
        List<ArduinoVO> list = session.selectList("arduinoList2");
        session.close();
        return list;
    }
}
