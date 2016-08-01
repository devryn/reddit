var Boardlinks = React.createClass({
  getInitialState: function () {
    return {
      showHighlight: false
    };
  },

  getClass: function (currentLink) {
    var top = this.props.links.map(function (link) {
      return link.upvotes_count - link.downvotes_count;
    });
    if (Math.max(...top) === (currentLink.upvotes_count - currentLink.downvotes_count) ) {
       if (this.state.showHighlight === true) {
          return 'highlight';
        } else {
          return ''
        }
     }
  },

clickedTop: function () {
  this.setState({
    showHighlight: !this.state.showHighlight
  })
},


  render: function() {
    var that = this;
    return (
      <div className='all-links'>
        <div className='top-btn'>
          <div onClick={this.clickedTop} className='btn'>Top Link</div>
        </div>
        <ul>
          {this.props.links.map(function (link) {
            return (
              <li key={link.id}>{link.upvotes_count - link.downvotes_count }
                <a className={that.getClass(link)} href={"/links/" + link.url}>{link.title}</a>
              </li>
            );
          })}
        </ul>
      </div>
    );
  }
});
