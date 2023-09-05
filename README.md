<h2>GameOfLifeFlutterDesignPatternsSOLID</h2>

<p>Este projeto é uma implementação do famoso "Jogo da Vida", criado por John Conway, usando Flutter. O código foi estruturado seguindo os princípios SOLID e padrões de design para garantir uma arquitetura limpa e escalável.</p>

<h3>Riverpod</h3>

<p>O projeto utiliza o pacote <code>flutter_riverpod</code> para gerenciamento de estado. Riverpod é uma alternativa flexível e poderosa ao Provider, permitindo uma melhor separação de responsabilidades e uma maior flexibilidade em comparação com outras soluções de gerenciamento de estado.</p>

<h3>Design Patterns e SOLID</h3>

<p>O código foi estruturado seguindo os princípios SOLID:</p>

<ul>
  <li><strong>S</strong>ingle Responsibility Principle (Princípio da Responsabilidade Única)</li>
  <li><strong>O</strong>pen/Closed Principle (Princípio Aberto/Fechado)</li>
  <li><strong>L</strong>iskov Substitution Principle (Princípio da Substituição de Liskov)</li>
  <li><strong>I</strong>nterface Segregation Principle (Princípio da Segregação de Interface)</li>
  <li><strong>D</strong>ependency Inversion Principle (Princípio da Inversão de Dependência)</li>
</ul>

<p>Além dos princípios SOLID, foram aplicados padrões de design para garantir que o código seja modular e fácil de manter.</p>

<h3>Pacotes Utilizados</h3>

<ul>
  <li><code>flutter_riverpod</code>: Usado para gerenciamento de estado.</li>
  <li><code>flutter</code>: SDK do Flutter.</li>
</ul>

<hr>

<h2>GameOfLifeFlutterDesignPatternsSOLID (English)</h2>

<p>This project is an implementation of the famous "Game of Life" created by John Conway, using Flutter. The code is structured following SOLID principles and design patterns to ensure a clean and scalable architecture.</p>

<h3>Riverpod</h3>

<p>The project uses the <code>flutter_riverpod</code> package for state management. Riverpod is a flexible and powerful alternative to Provider, allowing for better separation of concerns and greater flexibility compared to other state management solutions.</p>

<h3>Design Patterns and SOLID</h3>

<p>The code is structured following the SOLID principles:</p>

<ul>
  <li><strong>S</strong>ingle Responsibility Principle</li>
  <li><strong>O</strong>pen/Closed Principle</li>
  <li><strong>L</strong>iskov Substitution Principle</li>
  <li><strong>I</strong>nterface Segregation Principle</li>
  <li><strong>D</strong>ependency Inversion Principle</li>
</ul>

<p>In addition to the SOLID principles, design patterns were applied to ensure the code is modular and easy to maintain.</p>
<p>Singleton: O padrão Singleton é usado na classe GameOfLife. Isso garante que apenas uma instância desta classe seja criada durante todo o ciclo de vida da aplicação. A implementação do Singleton é evidente pelo uso de um construtor privado (GameOfLife._()) e um método estático instance que retorna a única instância da classe.</p>

<h3>Packages Used</h3>

<ul>
  <li><code>flutter_riverpod</code>: Used for state management.</li>
  <li><code>flutter</code>: Flutter SDK.</li>
</ul>

<hr>
