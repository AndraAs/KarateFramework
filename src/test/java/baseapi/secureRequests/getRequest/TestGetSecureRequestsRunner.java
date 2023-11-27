package baseapi.secureRequests.getRequest;
import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestGetSecureRequestsRunner {
    @Test
    public Karate runTest(){
       return Karate.run("secureGetwithJWTToken").relativeTo(getClass());
    }
}
