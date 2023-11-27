package baseapi;

import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.junit.jupiter.api.Assertions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

public class ParallelBuilderWithTags {

private static final String CLASS_PATH = "classpath:";
private static final String DELIMITER = ",";

    @Test
    public void executeKarateTest(){
        Builder aRunner = new Builder();
        aRunner.path(getLocation());
        aRunner.tags(getTags());
        Results result = aRunner.parallel(3);
		System.out.println("Total Feature => " + result.getFeaturesTotal());
		System.out.println("Total Scenarios => " + result.getScenariosTotal());
		System.out.println("Passed Scenarios => " + result.getScenariosPassed());
		Assertions.assertEquals(0, result.getFailCount(), "There are Some Failed Scenarios ");
    }

    // private List<String> getTags(){
    //     String aTags= System.getProperty("tags","@Sanity");
    //     List<String> aTagList = Arrays.asList(aTags);
    //     return aTagList;

    // }
    //     private List<String> getLocation(){
    //     String aLocation= System.getProperty("location","baseapi/taggedRequests");
    //     List<String> aLocationList = Arrays.asList(CLASS_PATH + aLocation);
    //     return aLocationList;

    // }

    // To provide the capability of passing multiple locations and tags we need to enhance the above methods.
    // Step1: Provide the values for location and tags property. All the values will be separated by ","
    // Step2: Read the values and split them using the "," and creating a list out of it
    private List<String> getTags(){
        String aTags= System.getProperty("tags","@Sanity");
        List<String> aTagList = Collections.emptyList();
        // first check for the delimiter
        // if the aTags has the delimiter, split the string using the delimiter
        // create the list out of it
        // if aTags does not have delimiter, use the old logic
        if(aTags.contains(DELIMITER)){
            String tagArray[]= aTags.split(DELIMITER);
            aTagList = Arrays.asList(tagArray);
            return aTagList;
        }
        aTagList = Arrays.asList(aTags);
        return aTagList;
    }

     private List<String> getLocation(){
        String aLocation= System.getProperty("location","baseapi/taggedRequests");
        List<String> aLocationList = Collections.emptyList();
        if(aLocation.contains(DELIMITER)){
            String locationArray[]= aLocation.split(DELIMITER);
            aLocationList = Arrays.asList(locationArray);
            aLocationList.replaceAll((entry) -> {
                return CLASS_PATH + entry;
            });
            return aLocationList;
        }
        aLocationList = Arrays.asList(CLASS_PATH + aLocation);
        return aLocationList;
    }
}
