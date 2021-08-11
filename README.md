# adm-025

## Общее

Слишком мало слайдов по теории
- см. комментарий к слайду 65

Не хватает решений, чтобы проверить.
- git репозитий содержит готовое


## IaC

Ansible & Terraform - synergy
terraform:
- выделяет ресурсы
- создаёт файлы playbook для ansible
ansible:
- ставит программы и настраивает их

g:ansible and terraform

### HashiCorp

https://www.hashicorp.com/resources/ansible-terraform-better-together
https://github.com/scarolan/ansible-terraform

Learn how users of the HashiCorp stack can use Ansible to achieve their goals of an automated enterprise—through
- complimentary security
- image management
- post provisioning configuration
- and integrated end to end automation solutions

Taking that step back, Ansible doesn't necessarily have to own and do every single task that it sets out to do.
There are other instruments that can do the job better than us, or can actually do it in a sense that we wouldn't actually be able to tackle it with.

You can use Terraform to call Ansible. Terraform is a great infrastructure provisioning tool, but you may have noticed that it doesn't come with a config management system. That's where Ansible comes in. We use Terraform to stand up virtual machines or cloud instances, and then we hand over the reins to Ansible to finish up the configuration of our OS and applications.

Ansible calling Terraform. In Ansible 2.5 we released a Terraform module to do just that. So within that module you can actually tell Terraform to run a Plan, to actually apply and set up your Terraform environment right then and there. So, going through that flow, you could start with Packer and then move onto Terraform, all through one Ansible playbook.


### CloudGuru

https://app.linuxacademy.com/search?query=ansible%20terraform&type=Course

https://linuxacademy.com/cp/modules/view/id/620
https://github.com/linuxacademy/content-deploying-to-aws-ansible-terraform

https://acloudguru.com/hands-on-labs/deploying-to-aws-with-terraform-and-ansible

Building Playbooks for Jenkins Master Setup
Building Playbooks for Jenkins Worker Setup
Building Jinja2 Templates for Ansible Playbooks

## Alice in the Clouds

https://github.com/maniaque/alice/tree/master/terraform
ec2 -> static site + nginx

## Terraform

IaC:
11: сравнение с разными инстументами:
- [x] Дописал посказки
- Terraform vs AWS CDK/boto3/CloudFormation vs Pulumi ...
- https://www.pulumi.com/docs/intro/vs/terraform/
 [x] Pulumi очень схож с boto3, только используется для всех облаков

3<->4:
  - [x] ?  поменять местами

8-13:
  - [x] Тут нельзя охватить весь синтаксис, поэтому сослаться, что разные части синтаксиса будут рассмотрены в последующих блоках.
  Основной является описание блоков.
  Хранение описания в одном файле - ну так себе идея - поэтому используется разбивка на несколько файлов. Привести стандартную разбивку.
  Показать, что тут
    > Добавил слайд с неболшими заключениями.
  - [x] файлы объединяются в один - 13 слайд
    
  - порядок разрешается зависимостями
    - может показать даже граф зависимостей `terraform graph` для небольшого примера
  - можно переопределять некоторые вещи (но как - попозже через override)
  // можно структуризировать код - модуль - единица структуризации -> после модулей

12: 
- [x] код - сниппет кода, так везде, может Алёна (в подчинении Ани) поможет?
(слайд 20 оформлен правильно)
в снипетах первую строку можно оформлять, как комментарий

```text
# path/to/file.tf
```
- [x] Проверить все сниппеты

14: 
- [x] убрать ссылку, они идет далее в 15 слайде

17: какие слайды нужны, чтобы выполнить это задание?
есть ли материал в тренинге?
- [x] > Идея в том чтобы показать различные способы аутентификации 
  > и взаимозаменяемсоть аргументов в методах определения Terraform провайдеров, а не один единственный "правильный"

18: предлагаю убрать пример с авторизацией в коде и дать сразу пример с использованием профиля
нужно ли этот пример дать до задания?
> см. коментарий к 17.

19:
  - [-] 3.2 слушатель может и не знать
> см. коментарий к 17.
  ~~4 зачем это нужно? это часто используется? мне кажется, на данный момент изучения Terraform - это чересчур~~ см. 20

20:
  - [x] аналогично к слайду 18: может поставить раньше
> добавил "frankfurt-node"
  первый - центральный aws account, второй региональны аккаунт

22:
  - [x] Base commands -> Main commands

```console
$ terraform
...
Main commands:
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure
```

  Добавить команду `destroy` и `validate`.
  Справа сообщение просто дублирует заголовок.
  Предлагаю показать, как получить список команд и справку по команде `terraform -help COMMAND`
  - если не пользуемся, то почему? подумать

25:
  - [x] > Terraform must store state about your managed infrastructure and configuration.
  Не раскрыто для чего: чтобы понимать, что изменять и что изменилось с последнего раза.
  https://www.terraform.io/docs/language/state/index.html
  + This state is used by Terraform to map real world resources to your configuration, keep track of metadata, and to improve performance for large infrastructures.

25*:
  - [x] Добавить определение ресурса
  data source vs resource / https://discuss.hashicorp.com/t/general-question-about-data-sources-vs-resources/8071
 > добавил на слайд 11
27, 28:
  - [x] изменить префикс упражнения
  28 - начать с 5. а не с 1. 
    
28:
  - [x] добавить упражнение: переименование ресурса + `terraform state mv`

30:
 - [x] Где можно хранить https://www.terraform.io/docs/language/settings/backends/remote.html
  Проблема курицы и яйца
 - [-] Создать бакет через terraform для хранения state - по сути это отдельный маленький проект со своим стейтом :)
  > не согласен, слишком простое упражнение, толком ничего не дает.

  Блокировка заслуживает отдельного слайда https://www.terraform.io/docs/language/state/locking.html
  - [x] `terraform force-unlock` надо вынести на слайд
  - [x] что если одновременно выполнить terraform apply из разных терминалов?
  - [x] сказать подробно про lock-механизм

31:
  - [x] Разделить упражнения на два:
    1. Как переезжать из локального стейта в удалённый
 - [x] 2. Управление состоянием - но тут идёт модификация состояния - хорошо/плохо?
 > не совсем, это два одинаковых стейта в разные моменты времени.

31*:
  - [x] добавить упражнение
  terraform plan и сохранить в файл
  потом terraform apply из файла
  это нужно для большой инфраструктуры

33:
  - [x] Добавить поиск по state-файлу
  $ terraform show
  $ terraform state show type.name
  ~~$ terraform show | grep name~~
  ~~$ terraform show -json | jq ...~~ продвинутая


33: ссылка не работает, возможно другие тоже
 - [x] 
>Проверил - работает

33*
  - [x] где-то после resource и импорта должен быть `data` - использование готовых ресурсов
> Добавил 12-ый слайд

34*:
  - [x] добавить слайд:
  _Что если стейт потерян или испорчен?_ Сослаться на импорт (в слайде 43)
  - Как откатывать state на предыдущий.
  - https://www.terraform.io/docs/cli/state/recover.html
  - https://stackoverflow.com/questions/57821319/how-to-rollback-to-previous-state-in-terraform

  Что такое state drift https://www.hashicorp.com/blog/detecting-and-managing-drift-with-terraform

35: -> 44
  - [x] Разбить на несколько слайдов:
  - определение variables в отдельном файле `variables.tf`
    > нет четкого codestyle
  - как их использовать
    > добавил пример
  - как переопределять
    > как задавать - указано в примерах далее
      - примеры для каждого способа
        > а не надо - это пример плохой практики
  - что если переменная задана не верна
> ошибка чтож еще 
> добавил их разбор в подсказки
  Тут Terraform Cloud несколько рано появилось. Лучше в отдельный модуль или не упоминать.
 > убрал

36:
  - [x] heredoc не указан в синтаксисе, а это полезная фишка.

  Дополнить упражнение:
> там именно такой сценари и предусмотрен
  - определить 2 переменные через variables.tf
    - одной дать значение по умолчанию
    - другой не дать
  - запустить как есть (defaults)
  - запустить и определить значения через переменную окружения
  - запустить и определить значения через `terraform.tfvars`
  - запустить и определить значение через `-var`

36*:
  - [x] Не хватает validation на слайдах
> добавил

38*
  - [x] Добавить слайд: Также потеряны функции, которых много
  https://www.terraform.io/docs/language/functions/index.html
    > добавил

39-40:
  - [x] заменить слайдом 43

44:
  - [x] я бы убрал картинку справа - не несёт полезной нагрузки
  > оставил, картинка с обучалок по tf

46:
  - [x] update link to https://www.terraform.io/docs/cli/import/index.html
  не хватает предварительного описания ресурса в конфигурации
  - а что если не совпадает описание?
 > непонятно
  4. сделать на практике и получить ошибку + список полей
>   это делаем дальше

48-49: (page-2)
  - [x] notes по нумерации не сопадают с пунктами, трудно связать - синхронизировать

51-52:
  - [x] Суффиксы названий отличаются от ex7 part 1, part 2.
  
  - если это одно, то надо нумерацию пунктов сквозную сделать
  > сделано
  
- [x] Плохо понимаю суть упражнения Ex8.  
  > Это упражнение логично вынести до импорта инфраструктуры, но куда?
  > там есть логика - сначала делаем новый,
  > а потом показываем как правильно с 3-5 новыми понятиями.
  > 
  4. Run terraform apply
     - Generate SSH key using Terraform
     - Apply key to the VM
     - Put out the ssh key
  5. Connect to VM through SSH
  6. Destroy  the VM
  Notes: если хотите сохранить ключ в файл, то есть специальный ресурс `local_file`.
     >

55:
  - [x] default_tags variable should be a map -> перенести в пункт 1

61:
  - [x] название и ссылка -> две разные ссылки -> исправить
  - [ ] сделать упражнение для `-replace` : сломать машину ¯\_(ツ)_/¯ и пересоздать её

63: (61)
  - [x] > Сколько бы вы не пытались объявить ресурсы в разных файлах внутри одной директории terraform всегда будет их склеивать.
  > Почитайте дискуссию на гитхабе – в общем есть другой официальный выход - модули
  Нужна тогда ссылка на дискуссию

65:
  - [ ] > читаем документацию
  я понял, почему так мало теории - потому что идут отсылки на чтение документации. Курс не должен зависеть от этого.
  можно копипастить из официальной доки

  > В этом тренинге мы не будем писать сложные модули – это не является целью тренинга, однако базовые понятия и простейшие примитивы мы, все же напишем.
  может быть воспринято отрицательно: люди приходят учиться, и должны мочь решать задачи на практике - если  простейшие вещи это покрыывают, то ОК, иначе плохо. Перефразировать или убрать

  Нет понятной аналогии, что модули это условно "подпрограммы" - есть имя, список входных (variables) и выходных параметров (outputs). Могут быть локальные переменные (locals), тогда слушателям станет проще.

66:
  - [х] > один из приемов работы с терраформ (не слушайте мой вредный совет) – удалить папку –dot. .terraform
  студенты слушают тренера и давать "вредные советы" - ну так себе идея. - убрать слово "вредные советы"
  > кэш может быть не валидным, поэтому ... удалить папку –dot. .terraform
  звучит что Terraform не production качества продукт. Что действительно
  > происходит если кэш не валидный? Разве он его сам не может обновить? -> расписать почему

68-69:
  - [ ] переформулировать задание, чтобы было понятнее

69*:
  - [ ] списки модулей - где найти готовые:
  - уже разработаны
  - меньше поддерживать
  - посмотреть кто делал - крупные компаний в приоритете
    - какие issue закрыты

70:
  - [ ] не хватает поставки проблемы - управлять однотипными ресурсами

  не хватает примера, если переменная == значение, то одно свойство иначе другое:
  например, если есть префикс, то в locals можно определить имена с префиксом
  или pause==true, count => 0, иначе 1 - тогда можно будет не тратить ресурсы, но и убивать инфраструктуру польностью не обязательно.
  нет выражений со *. Как адресовать к ним https://www.terraform.io/docs/language/expressions/splat.html
  - упражнение вытащить все IP какого-нибудт instance

  - [x] foreach -> for_each

72: p75
  - добавить что такое local.books + сменить layout
  - показать что создано несколько ресурсов в облаке и стейте
  - [ ] > Часто встречается конструкция to_set(ДРУГОЙ_ТИП)
  это обязательно надо вынести на слайд

  dynamic vs for_each - им не ясна разница - указать явно, for_each для ресурса, dynamic - для блоков внутри ресурса

73:
  - [ ] пункт 1 - добавить несколько книжек

76:
  - [ ] разделить на два:
  для depends_on указать, что он требуется, когда есть _неявная_ связь между ресурсами
  - пример база данных должна быть разёрнута до сервиса её использущую
  - [ ] есть ссылка на практику в notes, но нет упражнения

77:
  - [x] > Возможно вам потребуется работать с workspaces
  это must have для dev, test, prod окружений - просто позволяет поднять ещё одно окружение

79*: p85
  - [x] Как работать с разными environment
  1. разные AWS профили
  2. разные аргументы к модулям / project_name/prefix
  3. workspace
  4. copy-paste

80:
  - [x] указать выбор нужной утилиты версии terraform (приём с PATH)
  <!-- - [x] Полезная утилита tfswitch https://tfswitch.warrensbox.com/ -->

83:
  - [x] backup you state -> your

87:
  - [ ] пример - учебный, для поиграться и понять - нужен.
  <!-- Также нужно что-то более реальное: например, можно вызвать Ansible, чтобы настроить что-то на ec2. Пока студенты используют готовый проект, потом сам смогут писать такое. -->
  пункт 2 - запись во внешнюю систему, которая не может работать с terraform - как практический пример

91:
  - что ещё почитать-посмотреть
    - внешние программы/ресурсы
  - [ ] [pre-commit](https://github.com/antonbabenko/pre-commit-terraform) заслуживает хотя бы упоминания
  - [terragrunt](https://terragrunt.gruntwork.io/)

