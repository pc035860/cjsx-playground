# @cjsx React.DOM

###*
 * Ref: http://facebook.github.io/react/docs/reusable-components.html#transferring-props-a-shortcut
###
CheckLink = React.createClass
  render : ->
    @transferPropsTo(<a>{@props.children}</a>)


React.renderComponent(
  <CheckLink href="javascript:alert('Hello, world!');" id="yeah" className="no">
    Click here!
  </CheckLink>,
  document.getElementById('transferring-props')
)


###*
 * Ref: http://facebook.github.io/react/docs/reusable-components.html#mixins
###
SetIntervalMixin =
  componentWillMount : ->
    @intervals = []

  setInterval : (args...) ->
    @intervals.push (setInterval args...)

  componentWillUnmount : ->
    @intervals.map clearInterval


TickTock = React.createClass
  mixins : [SetIntervalMixin]
  getInitialState : ->
    return seconds : 0
  componentDidMount: ->
    @setInterval(@tick, 1000)
  tick : ->
    @setState seconds : @state.seconds + 1
  render : ->
    <p>
      React has been running for {@state.seconds} seconds.
    </p>

React.renderComponent <TickTock />, document.getElementById('mixins')
