package baseapi.mocks;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.mockserver.client.MockServerClient;
import org.mockserver.model.HttpRequest;
import org.mockserver.model.HttpResponse;
import org.mockserver.model.MediaType;
import org.mockserver.model.Parameter;
import org.mockserver.netty.MockServer;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

@TestInstance(Lifecycle.PER_CLASS)
public class ProductCompositServiceParallelRunner {

    // Setup Method -> @BeforeAll -> Mock Server & Mock Client
    // Tear down -> @AfterAll -> Shutdown mock server & client
    // Test Method -> @Test(junit) -> Parallel Runner for feature file
    // Mock Product Service -> Intercept the request going to product service and
    // respond with mock response
    // MockReviewService -> Intercept the request going to review service and
    // respond with mock response
    private MockServer server;
    private MockServerClient client;

    @BeforeAll
    public void setup() {
        server = new MockServer(9092);
        client = new MockServerClient("localhost", server.getLocalPort());
    }

    @AfterAll
    public void tearDown() {
        if (server.isRunning()) {
            server.stop();
        }
        if (!client.hasStopped()) {
            client.stop();
        }
    }

    @Test
    public void runTest() {
        // To run the 2 below mocks we need to open the product composite jar by telling
        // it where those 2 services are running: java -jar
        // productcomposite-0.0.1-SNAPSHOT.jar
        // --product.service.url=http://localhost:9092
        // --review.service.url=http://localhost:9092
        // java -jar productcomposite-0.0.1-SNAPSHOT.jar
        // --product.service.url=http://localhost:9092
        // --review.service.url=http://localhost:9092

        mockProductService();
        mockReviewService();
        Builder aBuilder = new Builder();
        aBuilder.path("classpath:baseapi/mocks/productCompositServiceTest.feature");
        Results result = aBuilder.parallel(1);
        Assertions.assertEquals(0, result.getFailCount());
    }

    private void mockProductService() {
        String body = "{\r\n" +
                " \"name\": \"name-123\",\r\n" +
                " \"weight\": 123,\r\n" +
                " \"productID\": 123\r\n" +
                "}";
        HttpRequest interceptReq = HttpRequest.request("/product/{productId}")
                .withPathParameter(Parameter.param("productId", "123"));
        HttpResponse mockResponse = HttpResponse.response(body).withContentType(MediaType.APPLICATION_JSON);
        client.when(interceptReq).respond(mockResponse);
    }

    private void mockReviewService() {
        String body = "[\r\n" +
                "    {\r\n" +
                "        \"productId\": 123,\r\n" +
                "        \"reviewId\": 456,\r\n" +
                "        \"author\": \"John\",\r\n" +
                "        \"subject\": \"Good\",\r\n" +
                "        \"content\": \"This is a good product\"\r\n" +
                "    },\r\n" +
                "    {\r\n" +
                "        \"productId\": 123,\r\n" +
                "        \"reviewId\": 741,\r\n" +
                "        \"author\": \"Todd\",\r\n" +
                "        \"subject\": \"Very Good\",\r\n" +
                "        \"content\": \"This is a fantastic product\"\r\n" +
                "    }\r\n" +
                "]";
        HttpRequest interceptReq = HttpRequest.request("/review/{productId}")
                .withPathParameter(Parameter.param("productId", "123"));
        HttpResponse mockResponse = HttpResponse.response(body).withContentType(MediaType.APPLICATION_JSON);
        client.when(interceptReq).respond(mockResponse);
    }

}
