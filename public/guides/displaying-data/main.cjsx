# @cjsx React.DOM

HelloWorld = React.createClass
  render : ->
    <p>
      Hello, <input type="text" placeholder="Your name here" />!
      It is {@props.date.toTimeString()}
    </p>

setInterval ->
  React.renderComponent <HelloWorld date={new Date()} />,
    document.getElementById 'example'
, 500
