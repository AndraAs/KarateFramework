package baseapi;

import org.junit.jupiter.api.Test;

import org.junit.jupiter.api.Assertions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;
import org.junit.jupiter.api.Assertions;

public class ParallelBuilder {
    @Test
    public void executeKarateTest(){
        Builder aRunner = new Builder();
        aRunner.path("classpath:baseapi/postRequest");
        Results result = aRunner.parallel(3);
		System.out.println("Total Feature => " + result.getFeaturesTotal());
		System.out.println("Total Scenarios => " + result.getScenariosTotal());
		System.out.println("Passed Scenarios => " + result.getScenariosPassed());
		Assertions.assertEquals(0, result.getFailCount(), "There are Some Failed Scenarios ");
    }
    
}
