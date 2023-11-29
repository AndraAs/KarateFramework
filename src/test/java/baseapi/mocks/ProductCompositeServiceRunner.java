package baseapi.mocks;

import org.junit.jupiter.api.BeforeAll;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class ProductCompositeServiceRunner {

    @Test
    public Karate runTest() {
        return Karate.run("productCompositServiceTest").relativeTo(getClass());
    }

}
