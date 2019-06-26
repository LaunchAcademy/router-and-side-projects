import React from 'react';

class GifsContainer extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      gifUrls: []
    }
  }

  componentDidMount(){
    fetch("/api/v1/gifs")
    .then(response => response.json())
    .then(gifUrls => {
      this.setState({ gifUrls: gifUrls })
    })
  }

  render() {
    const gifImgs = this.state.gifUrls.map((gifUrl) => {
      return(
        <li>
          <img src={gifUrl}></img>
        </li>
      )
    })

      return(
        <div className='page'>
          <h1>Gifs for the Masses</h1>
          <div className='gifs-list'>
            {gifImgs}
          </div>
        </div>
      )
  }
}

export default GifsContainer;
