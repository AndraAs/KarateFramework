package baseapi.patchRequest;
import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestPatchRequestRunner {
    @Test
    public Karate runTest(){
       return Karate.run("patchJobDescription").tags("~@ignore").relativeTo(getClass());
    }
}
