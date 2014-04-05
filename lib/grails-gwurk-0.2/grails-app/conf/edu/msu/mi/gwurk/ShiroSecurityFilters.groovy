package edu.msu.mi.gwurk

/**
 * Generated by the Shiro plugin. This filters class protects all URLs
 * via access control by convention.
 */
class ShiroSecurityFilters {
    def filters = {

        turk(uri: "/**") {
            before = {
                (!controllerName || (controllerName=="workflow" && actionName=="external") || !(controllerName in ["workflow","workflowrun","credentials"]))?true:accessControl()
            }
        }
    }
}