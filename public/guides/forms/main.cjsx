# @cjsx React.DOM

###*
 * Ref: http://facebook.github.io/react/docs/forms.html#controlled-components
###

# 1
CC1 = React.createClass
  render : ->
    <input type="text" value="Hello" />

React.renderComponent <CC1 />, (document.getElementById 'controlled-component1')

# 2
CC2 = React.createClass
  getInitialState : ->
    {value : 'Hello'}

  handleChange : (evt) ->
    @setState(
      value : evt.target.value
    )

  render : ->
    <input type="text" value={@state.value} onChange={@handleChange} />

React.renderComponent <CC2 />, (document.getElementById 'controlled-component2')


###*
 * Ref: http://facebook.github.io/react/docs/forms.html#uncontrolled-components
###

UCC = React.createClass
  getInitialState: ->
    {value : 'Hello!'}

  handleChange : (evt) ->
    @setState(
      value : evt.target.value
    )

  render : ->
    <div>
      <input type="text" defaultValue={@state.value} onChange={@handleChange} /><br />
      <p>Inputed value: {@state.value}</p>
    </div>

React.renderComponent <UCC />, (document.getElementById 'uncontrolled-component')
