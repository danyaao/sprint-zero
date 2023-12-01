# :shipit:
# MV* паттерны

## Общее
Все MV* паттерны в первую очередь призваны отделить UI от бизнес логики. Почему обязательно нужно разделять пользовательский интерфейс и логику?

### Сложность расширения и поддержки
Если весь код перемешан, то добавить новую фичу или расширить существую будет крайне трудоёмко

### Сложность тестирования
Тесты должны быть атомарны,а если весь код имеет большую связанность, тестировать его едва ли получится

## Model - View - Controller
MVC - один из самых старых архитектурных паттернов. Model отвечает за какие-то доменные модели. View отвечает за пользовательский интерфейс. Controller отвечает за обработку пользовательский действий, при этом Controller получает события напрямую, а не через View

## Model - View - Presenter
Отличается от MVC тем, что Presenter в отличии от Controller'а не работает с UI напрямую, а является как бы прослойкой между Model и View. View может как не знать о модели (Passive View), так и наоборот (Supervising View)

## Model - View - ViewModel
Отличается от предыдущих тем, что ViewModel работает с View не напрямую, а через DataBinding'и. Таким образом получается минимальная связанность и полностью свободный и от какой-либо логики UI. При этом в Model попадает тоже не всё, а только какие-то запросы обычно связанные или с БД, или с походом в сеть. Простые действия, не зависящие от бизнес логики, выполняются только на ViewModel