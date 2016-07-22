package info.devbug.selenium

import info.devbug.HomeController
import org.fluentlenium.adapter.FluentTest
import org.junit.runner.RunWith
import org.openqa.selenium.WebDriver
import org.openqa.selenium.phantomjs.PhantomJSDriver
import org.openqa.selenium.remote.DesiredCapabilities
import org.springframework.beans.factory.annotation.Value
import org.springframework.boot.test.SpringApplicationConfiguration
import org.springframework.boot.test.WebIntegrationTest
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner

/**
 * @author Aliaksei Bahdanau.
 */
@RunWith(SpringJUnit4ClassRunner::class)
@SpringApplicationConfiguration(classes = arrayOf(HomeController::class))
@WebIntegrationTest(randomPort = true)
open class BaseFluentIntegrationTest : FluentTest() {

    @Value("\${local.server.port}")
    protected  var serverPort: Int = 0

    override fun getDefaultDriver(): WebDriver {
        val caps = DesiredCapabilities()
        caps.isJavascriptEnabled = true

        // TODO path to the phantomjs should be extractes to the system path
        caps.setCapability("phantomjs.binary.path", "D:\\tools\\phantomjs\\bin\\phantomjs.exe")
        return PhantomJSDriver(caps)
    }

    override fun getDefaultBaseUrl(): String {
        return "http://localhost:" + serverPort
    }
}