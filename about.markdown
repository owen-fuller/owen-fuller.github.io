---
layout: page
title: About
permalink: /about/
---

This is the base Jekyll theme. You can find out more info about customizing your Jekyll theme, as well as basic Jekyll usage documentation at [jekyllrb.com](https://jekyllrb.com/)

You can find the source code for Minima at GitHub:
[jekyll][jekyll-organization] /
[minima](https://github.com/jekyll/minima)

You can find the source code for Jekyll at GitHub:
[jekyll][jekyll-organization] /
[jekyll](https://github.com/jekyll/jekyll)


[jekyll-organization]: https://github.com/jekyll



<h1>Snake Game</h1>
<canvas id="snakeGame" width="400" height="400" style="border:1px solid black;"></canvas>

<script>
// --- Snake Game ---
const canvas = document.getElementById("snakeGame");
const ctx = canvas.getContext("2d");

const box = 20;  // grid size
let snake = [{ x: 9 * box, y: 9 * box }];
let direction;
let food = {
  x: Math.floor(Math.random() * 19) * box,
  y: Math.floor(Math.random() * 19) * box
};
let score = 0;

document.addEventListener("keydown", event => {
  if (event.key === "ArrowLeft" && direction !== "RIGHT") direction = "LEFT";
  if (event.key === "ArrowUp" && direction !== "DOWN") direction = "UP";
  if (event.key === "ArrowRight" && direction !== "LEFT") direction = "RIGHT";
  if (event.key === "ArrowDown" && direction !== "UP") direction = "DOWN";
});

function drawGame() {
  ctx.fillStyle = "lightgrey";
  ctx.fillRect(0, 0, 400, 400);

  // Draw snake
  for (let i = 0; i < snake.length; i++) {
    ctx.fillStyle = i === 0 ? "green" : "darkgreen";
    ctx.fillRect(snake[i].x, snake[i].y, box, box);
  }

  // Draw food
  ctx.fillStyle = "red";
  ctx.fillRect(food.x, food.y, box, box);

  // Move snake
  let snakeX = snake[0].x;
  let snakeY = snake[0].y;

  if (direction === "LEFT") snakeX -= box;
  if (direction === "UP") snakeY -= box;
  if (direction === "RIGHT") snakeX += box;
  if (direction === "DOWN") snakeY += box;

  // Eat food
  if (snakeX === food.x && snakeY === food.y) {
    score++;
    food = {
      x: Math.floor(Math.random() * 19) * box,
      y: Math.floor(Math.random() * 19) * box
    };
  } else {
    snake.pop(); // remove tail
  }

  const newHead = { x: snakeX, y: snakeY };

  // Game over
  if (
    snakeX < 0 || snakeY < 0 ||
    snakeX >= canvas.width || snakeY >= canvas.height ||
    snake.some(segment => segment.x === newHead.x && segment.y === newHead.y)
  ) {
    clearInterval(game);
    alert("Game Over! Score: " + score);
  }

  snake.unshift(newHead);

  // Draw score
  ctx.fillStyle = "black";
  ctx.font = "16px Arial";
  ctx.fillText("Score: " + score, 5, canvas.height - 5);
}

let game = setInterval(drawGame, 100);
</script>
