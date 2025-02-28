package expo.modules.salesforcemessaging

import expo.modules.kotlin.modules.Module
import expo.modules.kotlin.modules.ModuleDefinition
import java.net.URL

class SalesforceMessagingModule : Module() {
  // Each module class must implement the definition function. The definition consists of components
  // that describes the module's functionality and behavior.
  // See https://docs.expo.dev/modules/module-api for more details about available components.
  override fun definition() = ModuleDefinition {
    // Sets the name of the module that JavaScript code will use to refer to the module. Takes a string as an argument.
    // Can be inferred from module's class name, but it's recommended to set it explicitly for clarity.
    // The module will be accessible from `requireNativeModule('SalesforceMessaging')` in JavaScript.
    Name("SalesforceMessaging")

    // Enables the module to be used as a native view. Definition components that are accepted as part of
    // the view definition: Prop, Events.
    View(SalesforceMessagingView::class) {
      Prop("driverExternalId") { view: SalesforceMessagingView, driverExternalId: String ->
          view.driverExternalId = driverExternalId
      }
    }
  }
}
