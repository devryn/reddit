var Navigation = React.createClass({

  render: function() {
    return (
    <header class='main-header'>
      <h1>Reddit</h1>
        <img src="http://i.imgur.com/3bPw0u1.png"/>
      <nav>
      <a href="/">Home</a>
      <a href="http://localhost:3000/boards">Boards</a>
      <a href="/links/new">New Link</a>
      </nav>
    </header>
    );
  }
});
