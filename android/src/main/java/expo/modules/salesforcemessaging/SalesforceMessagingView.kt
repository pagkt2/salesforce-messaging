package expo.modules.salesforcemessaging

import android.content.Context

import expo.modules.kotlin.AppContext
import expo.modules.kotlin.views.ExpoView
import com.salesforce.android.smi.core.*
import com.salesforce.android.smi.ui.*
import java.net.URL
import java.util.UUID

class SalesforceMessagingView(context: Context, appContext: AppContext) : ExpoView(context, appContext) {
  init {
    val url = URL("https://curri.my.salesforce-scrt.com")
    val coreConfig = CoreConfiguration(url, "00DHs00000CnigT", "Messaging_for_Mobile")
    val conversationID = UUID.randomUUID()
    val config = UIConfiguration(coreConfig, conversationID)

    val uiClient = UIClient.Factory.create(config)
    uiClient.openConversationActivity(context)
  }
}
