package baseapi.getRequestQueryParams;
import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestGetQueryParamsRunner {
    @Test
    public Karate runTest(){
       return Karate.run("queryParameters").relativeTo(getClass());
    }
}
