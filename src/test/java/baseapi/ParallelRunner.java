package baseapi;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Assertions;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

public class ParallelRunner {
    @Test
    public void executeKaratetests(){
        Results results = Runner.path("classpath:baseapi/postRequest").parallel(2);
        System.out.println("Total Feature => " + results.getFeaturesTotal());
		System.out.println("Total Scenarios => " + results.getScenariosTotal());
		System.out.println("Passed Scenarios => " + results.getScenariosPassed());
		Assertions.assertEquals(0, results.getFailCount(), "There are Some Failed Scenarios");
    }        

    
}
