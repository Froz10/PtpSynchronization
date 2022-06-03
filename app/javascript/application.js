// Entry point for the build script in your package.json
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import "./errors.js"
import "./controllers"

Rails.start()
Turbolinks.start()
