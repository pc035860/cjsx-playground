# @cjsx React.DOM

CommentBox = React.createClass
  loadCommentsFromServer : ->
    $.getJSON @props.url, null
    .then (data) =>
      @setState data : data
    , (xhr, status, err) =>
      console.error @props.url, status, err.toString()

  handleCommentSubmit : (comment) ->
    @state.data.push(comment)
    @setState data : @state.data
    $.post @props.url, comment, null, 'json'
    .then (data) =>
      @setState data : data
    , (xhr, status, err) =>
      console.error @props.url, status, err.toString()

  getInitialState : ->
    return data : []

  componentDidMount: ->
    do @loadCommentsFromServer
    # setInterval @loadCommentsFromServer, @props.pollInterval

  render : ->
    <div className="commentBox">
      <h1>Comments</h1>
      <CommentList data={@state.data} />
      <CommentForm onCommentSubmit={@handleCommentSubmit} />
    </div>

CommentList = React.createClass
  render : ->
    <div className="commentList">
      {for comment in @props.data
        <Comment author={comment.author}>
          {comment.text}
        </Comment>
      }
    </div>

CommentForm = React.createClass
  handleSubmit : ->
    author = @refs.author.getDOMNode().value.trim()
    text = @refs.text.getDOMNode().value.trim()

    return false if !text or !author

    @props.onCommentSubmit
      author : author
      text   : text
    @refs.author.getDOMNode().value = '';
    @refs.text.getDOMNode().value = '';

    return false

  render : ->
    <form className="commentForm" onSubmit={@handleSubmit}>
      <input type="text" placeholder="Your name" ref="author" />
      <input type="text" placeholder="Say something..." ref="text" />
      <input type="submit" value="Post" />
    </form>

converter = new Showdown.converter()
Comment = React.createClass
  render : ->
    rawMarkup = converter.makeHtml @props.children.toString()

    <div className="comment">
      <h2 className="commentAuthor">
        {@props.author}
      </h2>
      <span dangerouslySetInnerHTML={{__html : rawMarkup}} />
    </div>

React.renderComponent <CommentBox url="comments.json" pollInterval={2000} />,
  ($ '#content')[0]
