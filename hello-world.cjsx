# @cjsx React.DOM

HelloMessage = React.createClass {
  render : ->
    return <div>Hello {@props.name}</div>
}

React.renderComponent <HelloMessage name="Robin" />, mountNode
