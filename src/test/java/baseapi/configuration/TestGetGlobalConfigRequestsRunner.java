package baseapi.configuration;
import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestGetGlobalConfigRequestsRunner {
    @Test
    public Karate runTest(){
       return Karate.run("getGlobalConfig","getRequest").relativeTo(getClass());
    }
}
