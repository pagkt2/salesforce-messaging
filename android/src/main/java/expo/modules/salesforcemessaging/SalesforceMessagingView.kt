package expo.modules.salesforcemessaging

import android.content.Context

import expo.modules.kotlin.AppContext
import expo.modules.kotlin.views.ExpoView
import com.salesforce.android.smi.core.*
import com.salesforce.android.smi.network.data.domain.prechat.PreChatField
import com.salesforce.android.smi.ui.*
import java.net.URL
import java.util.UUID

class SalesforceMessagingView(context: Context, appContext: AppContext) : ExpoView(context, appContext) {

  var driverExternalId: String = ""
  init {
    val url = URL("https://curri.my.salesforce-scrt.com")
    val coreConfig = CoreConfiguration(url, "00DHs00000CnigT", "Messaging_for_Mobile")
    val conversationID = UUID.randomUUID()
    val config = UIConfiguration(coreConfig, conversationID)

  // Create a core client from a config
      val coreClient = CoreClient.Factory.create(context, config)

  // Register a provider
      coreClient.registerHiddenPreChatValuesProvider( object : PreChatValuesProvider {

        // Implement the setValues method
        override suspend fun setValues(input: List<PreChatField>): List<PreChatField> {

          // Iterate through all the pre-chat fields
          input.forEach {

            // Specify the value for each field mapping
            if (it.name == "Driver_External_ID") {
              it.userInput = driverExternalId
            }
          }

          // Return the same list, but with updated values set
          return input
        }
      })

    val uiClient = UIClient.Factory.create(config)
    uiClient.openConversationActivity(context)
  }
}
