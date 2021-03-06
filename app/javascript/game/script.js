import Swal from 'sweetalert2'
import { FetchRequest } from "@rails/request.js";

function Game(gameElement) {
  this.el = gameElement;

  const challengeLevel = JSON.parse(this.el.dataset.level)

  this.tileTypes = ['floor','wall'];

  this.tileDim = 128;

  // inherit the level's properties: map, player start, goal start.
  this.map = challengeLevel.map;
  this.theme = challengeLevel.theme
  this.player = {...challengeLevel.player};
  this.goal = {...challengeLevel.goal};
}
/*
 *  Populates the map with a nested loop.
 */
Game.prototype.populateMap = function() {

  this.el.className = 'game-container ' + this.theme;

  let tiles = document.getElementById('tiles');

  for (var y = 0; y < this.map.length; ++y) {

    for (var x = 0; x < this.map[y].length; ++x) {

      let tileCode = this.map[y][x];

      let tileType = this.tileTypes[tileCode];

      let tile = this.createEl(x, y, tileType);

      tiles.appendChild(tile); // add to tile layer
    }
  }
}
/*
 * Creates a tile or sprite element.
 *
 * @param {Number} x - The x coordinate.
 * @param {Number} y - The y coordinate.
 */
Game.prototype.createEl = function(x,y,type) {
   // create one tile.
  let el = document.createElement('div');

  // two class names: one for tile, one or the tile type.
  el.className = type;

  // set width and height of tile based on the passed-in dimensions.
  el.style.width = el.style.height = this.tileDim + 'px';

  // set left positions based on x coordinate.
  el.style.left = x*this.tileDim + 'px';

  // set top position based on y coordinate.
  el.style.top = y*this.tileDim + 'px';

  return el;
}

Game.prototype.placeSprite = function(type) {

  // syntactic sugar
  let x = this[type].x

  let y = this[type].y;

  // reuse the createTile function
  let sprite  = this.createEl(x,y,type);

  sprite.id = type;

  // set the border radius of the sprite.
  //sprite.style.borderRadius = this.tileDim + 'px';

  // get half the difference between tile and sprite.

  // grab the layer
  let layer = this.el.querySelector('#sprites');

  layer.appendChild(sprite);

  return sprite;
}
/*
 *  Sizes up map.
 */
Game.prototype.sizeUp = function() {

  // inner container so that text can be below it
  let map  = this.el.querySelector('.game-map');

  // inner container, height. Need this.map
  map.style.height = this.map.length * this.tileDim + 'px';

  map.style.width = this.map[0].length * this.tileDim + 'px';
}
/*
  *  Moves the player.
  *  @param {Object} event - The event object.
*/
/*
 *  Checks for the goal.
 */
Game.prototype.checkGoal = function() {
  if (this.player.y == this.goal.y &&
  this.player.x == this.goal.x) {
    const gameId = parseInt(document.getElementById('game-container-1').dataset.gameId);
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content
    fetch(`/games/${gameId} `, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        'X-CSRF-Token': csrfToken
      }
    })
    Swal.fire({
      icon: 'success',
      title: 'Good Job!',
      text: 'Go to next level or play again',
      showDenyButton: true,
      denyButtonText: 'Play again',
      confirmButtonText: 'Next Level'})
      .then((result) => {
        if (result.isConfirmed) {

          const challengeId = parseInt(document.getElementById('game-container-1').dataset.challengeId);
          fetch(`/challenges/${challengeId + 1}/games`, {
            method: 'POST',
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
              'X-CSRF-Token': csrfToken
            }
          })
          .then(response => response.json())
          .then(data => {
            window.location.href = `/games/${data.id}`
          })
        } else if (result.isDenied) {
        document.getElementById('code-reset').click();
        }
      })
  }
  else {
    Swal.fire({
      icon: 'error',
      title: 'You did not finish it',
      text: 'Try again!',
      showDenyButton: true,
      confirmButtonText: 'Try again',
      denyButtonText: 'Dashboard'})
      .then((result) => {
        if (result.isConfirmed) {
          document.getElementById('code-reset').click();
        } else if (result.isDenied) {
          window.location.href = '/dashboard'
        }
        })
  }
}
/*
 *  Listens for keyboard input.
 */

Game.prototype.buttomListener = function() {

  const canvas = document.getElementById('canvas');
  const buttonExecute = document.getElementById('code-execute')
  const buttonReset = document.getElementById('code-reset')

  buttonExecute.addEventListener('click', () => {
    const commands = canvas.querySelectorAll('button')
    const moviments = []
    commands.forEach( (command) => { moviments.push(command.dataset.command) })
    this.executeMoviment(moviments);
  })
  buttonReset.addEventListener('click', () => {
    window.location.reload();
    return false;
  })
}

/*
 * Move player left.
 */

Game.prototype.executeMoviment = function(moviments){
  for (let index = 0; index < moviments.length; index++) {
    const moviment = moviments[index];
    setTimeout(() => {
      switch (moviment) {
        case 'l':
          this.moveLeft()
          break;

        case 'u':
          this.moveUp();
          break;

        case 'r':
          this.moveRight();
          break;

        case 'd':
          this.moveDown();
          break;
      }
      if (index == moviments.length - 1){
        this.checkGoal();
      }
    }, 500 * (index))
  }
};

Game.prototype.moveLeft = function() {

  if (this.player.x == 0) {
    this.collide();
    return;
  }

  let nextTile = this.map[this.player.y][this.player.x - 1];

  if (nextTile == 1) {
    this.collide();
    return;
  }

  this.player.x -=1;

  this.updateHoriz();
}
Game.prototype.moveUp = function() {

  if (this.player.y == 0) {
    this.collide();
    return;
  }

  let nextTile = this.map[this.player.y-1][this.player.x];

  if (nextTile ==1) {
    this.collide();
    return;
  }

  this.player.y -=1;

  this.updateVert();
}
/*
 *  Moves the player right.
 */
Game.prototype.moveRight = function() {

  if (this.player.x == this.map[this.player.y].length - 1) {
    this.collide();
    return;
  }
  let nextTile = this.map[this.player.y][this.player.x + 1];

  if (nextTile == 1) {
    this.collide();
    return;
  }

  this.player.x +=1;

  this.updateHoriz();
}
/*
 * Moves the player down.
 */
Game.prototype.moveDown = function() {

  const timer = null;
  if (this.player.y == this.map.length - 1) {
    this.collide();
    return;
  }
  let nextTile = this.map[this.player.y+1][this.player.x];

  if (nextTile == 1) {
    this.collide();
    return;
  }

  this.player.y +=1;

  this.updateVert();
  clearTimeout(timer);
}

/*
 * Update helpers for player movement.
 */

Game.prototype.updateHoriz = function() {
   this.player.el.style.left = this.player.x * this.tileDim+ 'px';
};

Game.prototype.updateVert = function() {
   this.player.el.style.top = this.player.y * this.tileDim+ 'px';
};

Game.prototype.collide = function() {
  this.player.el.className += ' collide';

  let obj = this;

  window.setTimeout(function() {
    obj.player.el.className = 'player';
  },200);

  return 0;
};

/*
 * Initialization.
 */


function gameInit() {
  const gameElement = document.getElementById('game-container-1');
  if (gameElement) {

    let myGame = new Game(gameElement);

    myGame.populateMap();

    myGame.sizeUp();

    myGame.placeSprite('goal');

    let playerSprite = myGame.placeSprite('player');

    myGame.player.el = playerSprite;

    myGame.buttomListener();
  }
}

export {gameInit};
