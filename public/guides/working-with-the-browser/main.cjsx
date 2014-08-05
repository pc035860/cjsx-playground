# @cjsx React.DOM

###*
 * Ref: http://facebook.github.io/react/docs/working-with-the-browser.html#refs-and-getdomnode
###

RefsDemo = React.createClass
  handleClick : (evt) ->
    @refs.myTextInput.getDOMNode().focus()

  render : ->
    <div>
      <input type="text" ref="myTextInput" />
      <input
        type="button"
        value="Focus the text input"
        onClick={this.handleClick}
      />
    </div>

React.renderComponent <RefsDemo />, (document.getElementById 'example')



###*
 * Ref: http://facebook.github.io/react/docs/more-about-refs.html#completing-the-example
###

App = React.createClass
  getInitialState : ->
    { userInput : '' }

  handleChange : (e) ->
    @setState(
      userInput : e.target.value
    )

  clearAndFocusInput : ->
    state =
      userInput : ''

    focus = =>
      @refs.theInput.getDOMNode().focus()

    @setState state, -> do focus

  render : ->
    <div>
      <div onClick={@clearAndFocusInput}>
        Click to Focus and Reset
      </div>
      <input ref="theInput" value={@state.userInput} onChange={@handleChange} />
    </div>

React.renderComponent <App />, (document.getElementById 'example2')
