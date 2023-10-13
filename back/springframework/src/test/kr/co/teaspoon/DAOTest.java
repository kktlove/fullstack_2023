package kr.co.teaspoon;

import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@Repository
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/applicationContext.xml"})
public class DAOTest {
    private static final Logger logger = LoggerFactory.getLogger(DAOTest.class);
    /*
    @Inject
    private SqlSession sqlSession;
    @Test
    public void repositoryTest(){
        List<Sample> sampleList = sqlSession.selectList("sample.sampleList");
        for(Sample sample : sampleList){
            logger.info(sample.toString());
        }
    } */
}
