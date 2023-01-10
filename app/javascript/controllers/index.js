// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import ErrorController from "./error_controller.js"
application.register("error", ErrorController)

import HeaderController from "./header_controller.js"
application.register("header", HeaderController)

import ModalController from "./modal_controller.js"
application.register("modal", ModalController)

import PanelController from "./panel_controller.js"
application.register("panel", PanelController)

import SidebarController from "./sidebar_controller.js"
application.register("sidebar", SidebarController)

import SyncController from "./sync_controller.js"
application.register("sync", SyncController)