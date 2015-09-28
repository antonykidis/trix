#= require trix/inspector/view

{handleEvent} = Trix

Trix.Inspector.registerView class extends Trix.Inspector.View
  name: "loggers"
  title: "Loggers"

  setElement: ->
    super
    handleEvent("change", onElement: @element, withCallback: @didChangeInput)

  didChangeInput: ({target}) =>
    logger = Trix.Logger.get(target.value)

    if target.checked
      logger.enable()
    else
      logger.disable()

  render: ->
    @loggers = Trix.Logger.getLoggers()
    super
