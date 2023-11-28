package baseapi;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

import baseapi.utils.CustomExtentReport;

public class ParallelRunnerWithExtentReport {
        @Test
    public void executeKarateTest(){
        Builder aRunner = new Builder();
        aRunner.path("classpath:baseapi/configuration");
        Results result = aRunner.parallel(3);
		// Extent report
        CustomExtentReport extentReport = new CustomExtentReport()
        .withKarateResult(result)
        .withReportDir(result.getReportDir())
        .withReportTitle("Karate Test Execution Report");
        extentReport.generateExtentReport();

    }
    
}
