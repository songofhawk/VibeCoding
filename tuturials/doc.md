### 编码篇 <!-- id: O90Md6WZJozwJZx6F8qcrVyznlf -->

 <!-- id: YBIDdYh6Wop2sbxC0hrcNDR2nkh -->

### 言出法随 <!-- id: KXj7dC842opNKix9jwNcw5fwn6g -->

在这部分，我们将一起体验 AI 编程的无限魔力。无需任何编程基础，你只需要用自然语言描述想要什么，AI 就能帮你实现。这个过程就像对着魔法师说出咒语，然后眼看着你的想法变成现实。 <!-- id: EhfZd3cJPoBRSpxZmkecodcNn5g -->

我们这里假设你已经安装好了环境，包括 claude code （简称 cc）和 vscode 对应的插件。 <!-- id: CZ1Hdy1sZonqLSxNV1qcn5zsnLf -->

现在让我们准备一个文件夹，比如 ~/Desktop/VibeCoding （桌面上新建一个叫 VibeCoding 的文件夹），用 Vscode 打开它。大概是这个样子。 <!-- id: GrAId55G9ouFOsx4bO8cNgkUnre -->

![Image](assets/V7Okbv3YSo8dv2x8ZXfcPjKln6d.png) <!-- id: MFj6dFYo6ogzqQx1BrscCB8Unkf -->

5 分钟内让你获得第一次"言出法随"的成就感。 <!-- id: MxjXdG12toRfXvxV6Mxc2mvEnCh -->

#### 初探 AI 编程：一句话小项目（网页） <!-- id: FxKudCd06oSDaAxv3uCcpRPEn5f -->

话不多说，我们先来做一个网页，它的好处是即时可见：你生成的页面可以立刻在浏览器中打开，看到漂亮的效果。 <!-- id: I7OrdspmaovCURxuzRXc2wN3n26 -->

预期效果： <!-- id: GajJdEOeFosrHSxbcQzcW51Vndg -->

 <!-- id: H27odpPW5odOpHxIVZLce29mnyc -->

 <!-- id: SKYCdCpmRoMFnxxkyoUckeOsn8f -->

 <!-- id: WxISdg10Lo0dxdx2bQxcJacznbg -->

 <!-- id: CnfxdxCSso4dqaxc5WhcLTJLnsg -->

 <!-- id: QM33dR923ojWRFxK5iIcPkShnb4 -->


帮我做一个新年倒计时网页，显示距离 2026 年还有多少天、小时、分钟、秒。 <!-- id: Eq3Jd7DXloVJksxVZ6Gc9nIinCb -->
使用深蓝色渐变背景，白色大字体，加上烟花动画效果。 <!-- id: H5addkRb8oohkBxrAGtc2VJFny3 --> <!-- id: O94zdetl9okanvxvHsLc5EiDnkf -->

cc 马上就开始工作了，不过在执行任务的时候，cc 经常会申请所在文件夹的文件权限，或者执行命令/程序的权限，通常会弹出一个类似这样的窗口： <!-- id: JxNndmPjDooYL9xw9APcfJ3Yn5S -->

![Image](assets/Hcj5bsfn7oB5m5xbndvcwigjnyh.png) <!-- id: EmLWdi3XEoLB6Ax3XCvcTEA0ntb -->

基本上就是3个选项： <!-- id: Y9MAdRjSroWTSnxgJfVcZrXVnWf -->

 <!-- id: Myb9d0JAUoiACExjztYca84OnGb -->

 <!-- id: KZMYd05oUoS23Zx1BkUc2uAInGf -->

 <!-- id: VAhqdZmrLo4gkYxQse1cJG2Jngc -->

要注意识别一些“危险”的命令，比如删除（rm）文件，只允许一次性执行。 <!-- id: UTGadNqFEoqCaBxHbC9c1tL8nZf -->

当前这个命令只是创建文件，果断选 2，十几秒之后，我们就得到一个文件： <!-- id: O9vAdqYrTo3pQkxPcl3cT2hQnxd -->

![Image](assets/C6RnbWhmaoPyAgxGn2xcNC89nub.png) <!-- id: TOsXdCcC2owfBDxieANcXHiGnhh -->

如果在 VSCode 里直接打开它，里面大概是这个样子： <!-- id: IsBeddXnDoQr3PxxG4zcRBItnLd -->

```
<！DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width， initial-scale=1.0">
    <title>2026 新年倒计时</title>
    <style>
        * {
            margin： 0;
            padding： 0;
            box-sizing： border-box;
        }

        body {
            font-family： 'Arial'， sans-serif;
            background： linear-gradient(135deg， #0a1f44 0%， #1a4d8f 50%， #0a1f44 100%);
            min-height： 100vh;
            display： flex;
            justify-content： center;
            align-items： center;
            overflow： hidden;
            position： relative;
        }
 ......
``` <!-- id: OStpdOgV5opYYdx232pcA6eonpd -->

可以不用管内容，右键选择“在 Finder 中显示”（或者windows，“在资源管理器中显示”） <!-- id: Tm8CdWe0VogrkhxSCxmcJ4gKnYc -->

![Image](assets/RHX2bk9F2o23LTxlhKrc7o7Rnzf.png) <!-- id: OzgfdZYBOoUwFLxLmH2cKuE8nRg -->

再双击打开，应该就可以在浏览器中，看到类似这样的效果了： <!-- id: QwmNd1SkkoRLt1xolrfcMR7vnae -->

![Image](assets/JMxvbS90MoP6FtxhyL6cUe3Onkc.png) <!-- id: EZafd3hQTogHckxZSHdceA0enrb -->

怎么样，原来做一个网页可以这么简单！ <!-- id: G6EwdEGnzoI7v6xR5jwcguOznb9 -->

你可能会发现自己生成的效果，跟截图中不太一样，但肯定会符合你提的要求。这是大语言模型的特点决定的：输出结果有一定随机性，它有时会带来一定的困扰，大部分时候又会展现出迷人的魅力。你以后会慢慢学习到如何驾驭这种特性。 <!-- id: A2hzd9E8UolqrnxlDsMc2TtOnxg -->

 <!-- id: Jr8OdSR9Do0Vw8xX6kDceC8Vncg -->


小练习： <!-- id: HYNidCufHouFGPxC811cqY0jnPb -->
 <!-- id: CGCJdX7A4oPMv5xRJr8cpk3Cn7f -->
 <!-- id: AzlRdf1YjoxpPnxRZLHc1EGjnYd -->
 <!-- id: HqAtdpfBvoghGKxw5HUc4nbDnef -->
 <!-- id: CVradLQKboqq0Wx4kfOceuccnvd --> <!-- id: Ltx1ddRfBoGTUkxmy2QcqUNAn5f -->

####  <!-- id: DBUKdxnw9o1zfyxMMNfc8JHBnHg -->

#### 本地代码初体验：一句话小项目（本机） <!-- id: TmpQdUQF6oJvk5x4mr7c7wBenLh -->

刚才你的第一个小项目，在网页版的 ChatGPT (豆包，Deepseek）工具中也能生成。不过既然本机已经安装了像 cc 这样的工具，那可就不仅仅是玩玩了，下面就来试试做个提高效率的小工具。 <!-- id: B8VidvVJpoGq3TxDIhOcWtNZnSg -->

整理杂乱的文件名 <!-- id: WTHUdbSnSoMw5AxGIjtcHJARnwg -->

你可能经常遇到这种情况，桌面或者某个文件夹里，堆满了杂乱不一的文件，可能是一堆 excel，word 或者其他文档。从名称完全看不来含义，很影响摸鱼工作效率，这时候，你非常想要整理它，但一想到一个个点开看内容，再自己起名字，就泄气了。 <!-- id: PHEcdufAJodISkxkkm2cDgRfnld -->

现在有了 cc 这个全能助手，终于可以着手开始了： <!-- id: Y2AVdLr3bo4qUIxz7zrcSGbUnpc -->

比如你有下面这样一堆文件： <!-- id: GRpCd5heHoGwZ2xihaJcxje3neh -->

![Image](assets/RuBUbnIGmoBeucxXbLDc5lzEnlg.png) <!-- id: L7YJdU5Ckow0czx4Tr9cRzZfnOe -->

它其实是一整部小说，内容大概是： <!-- id: L9AzdVuheoIl1gxPQJbcF2pHnRe -->

![Image](assets/SwvYbDTNno0LAYxjcVGcfRXGnde.png) <!-- id: Z0Thdh9fRo9JEKxxeyZcuUwLn3e -->

但只看文件名会觉得 WTF ?！，排列的顺序也是杂乱的，根本没法顺畅阅读。下面我们就用 cc 来整理一下： <!-- id: LmbydSn85olusnxp38zc2L3PnIb -->

 <!-- id: T2BOdqs51oeGZPxWsNuc5mbGnBb -->


当前文件夹下面，有一些文本文件，他们是一本小说的各个章节，请根据内容，帮我整理它们的文件名，让它们看起来有意义，而且按顺序排列。 <!-- id: LBXAd6p8Lo88zqx0opAcIkBbnAh --> <!-- id: DTZ3dPYyPodNEixWCbxc7SdrnMc -->

可以看到 cc 会认认真真地阅读每一篇文件的内容： <!-- id: Fnfxd8ojxoMJQfxttmbc3EwrnQI -->

![Image](assets/YGwcb4VEOosDZ3x6kHJcYuUhnRg.png) <!-- id: VZAvdgoTSoRSM7xAXQBcQlfHnuh -->

 <!-- id: NDySddh8Ro3Q2Nx1Kwxca8f2nsn -->

![Image](assets/PTqebiVX6oor1nxIQcfcBG8zndb.png) <!-- id: PhsFdPg50oZwIvxlJEdc5b7injh -->

非常完美吧？你会发现并不需要告诉 cc，它应该怎么做，只要说明你需要什么就好了。 <!-- id: XrZYdPNM7ozMTnxGGr1cJgYHndj -->

比如我们并没有让它读取每个文件的内容，用一句简短的表达提取大意，并且中英文混合，也没告诉它用 01，02 这种方式编号（如果是 1，2，3...... 11，12的话，可能排序就不对了），是它自己根据上下文推断出来的。 <!-- id: Lt1xdWieAofuUyxnwTRcaVmyn7f -->

这里要注意： <!-- id: MlH7dAA9toM99bxcDFbc3TQonkd -->

 <!-- id: H1EBdjPCXoZP52xd7d1cjxbdnDg -->

 <!-- id: UoLndYFdhoDp98xHn11cKtoenKc -->

 <!-- id: ASWRdIh8CoeQK7xEOWIcpt9snkc -->

### 实战项目：从 MVP 到部署与迭代 <!-- id: TX21dHuHoopvw9xNubAcQVzVn4c -->

在快速入门中，你体验了用一句话生成小项目的乐趣。但那些项目都是“一次性”的——生成后就完成了，没有后续的扩展和迭代。现在，我们要做一个真正的项目：从最简单的版本开始，一步步添加功能，最终部署上线，成为一个可以分享给朋友、甚至被陌生人使用的应用。 <!-- id: UrFcdzDDpoIJCGxM5evcM3bnnNg -->

在这个过程中，你会经历一个完整的软件开发周期，理解代码是如何组织的，项目是如何一点点"长大"的，以及如何把本地的代码变成互联网上的产品。 <!-- id: NwrSdA51Sog6EFxPctNctdnCndg -->

#### 我们要做什么？ <!-- id: J7VxdTU1GoXicHxvu1CcabeInKn -->

喵宇宙是一个在线宠物相册和展示平台。你可以在这里为自己的猫咪创建专属账号，给它起名字，上传多张精美照片，打造属于它的个性化展示空间。平台支持为猫咪添加趣味特效和装饰，让照片更加生动有趣。做好的展示馆可以轻松分享到微信、朋友圈等社交媒体，在电脑和手机上随时查看。你还可以在社区中浏览其他人的喵宇宙，给喜欢的猫咪点赞和评论，或者查看热门猫咪排行榜，发现更多可爱的毛孩子。 <!-- id: LP0vdAaTIoBBTUxAENuc0DT2nCc -->

##### 为什么选这个项目? <!-- id: FtYBdm0L1ojthcxCZAqcwr79nYf -->

###### 有趣 <!-- id: HCoGdNMFYo4Ml1xkIshcd8Gen2c -->

猫咪是人类最好的朋友之一，人人都爱晒猫，哪怕你自己没有养，也可以获得很多朋友的喜爱。你还可以和朋友比谁在社区中发现其他人的猫咪，收获满满的快乐。 <!-- id: TcPidiLl1oh93SxvHnycdAiInec -->

###### 技术栈全面 <!-- id: WmtJdKSllof5TSxLXBnc9vGVnIX -->

更重要的是，这个项目的学习曲线设计非常友好，只需5分钟你就能创建第一个猫咪卡片，10分钟上传自己的猫咪照片，20分钟做出精美的展示页面，1小时后就能拥有完整的展示馆。后续还可以添加特效让猫咪更萌，可以将项目部署上线让全世界都能访问。每个阶段都有明确的"哇"时刻！ <!-- id: GI7adx8b5oQ6IXxPwQWc0Vq1nnI -->

这是一个完整的全栈项目，涵盖了 Web 开发的所有关键技术！在前端方面，你会学习使用原生的 HTML、CSS、JavaScript 来构建界面，掌握多图上传、轮播展示、缩略图等图片处理技术。项目包含完整的用户系统，实现注册登录和个人主页功能。后端采用 Vercel 的 Serverless Functions，搭配 Supabase 提供的 PostgreSQL 数据库和云存储服务。你还会实现点赞、评论、分享等社交功能，添加 CSS 动画和滤镜特效让界面更加生动。最后，你会学习使用 Git 进行版本管理，并将项目一键部署到 Vercel 上线。整个过程覆盖了从前端到后端、从开发到部署的完整技能树！ <!-- id: NRTFdczqKo9WXCx2Sv1cCnvcnRe -->

###### 实用价值高 <!-- id: DADDd01jeoGdUrxMpSNcfRxenib -->

这个项目做完之后，真的可以用起来，展示自己家的喵星人，把它可以分享给朋友(建立猫友社区)，还可以举一反三创作更多的作品(狗狗展示馆、宝宝成长册、旅行相册等)。 <!-- id: BX9MdZBtJoHLQuxboEecUOdsnYb -->

##### 演进路线 <!-- id: J5hodp7atoM0IhxClZ6cDKV9n9e -->

我们将分 8 个阶段，来完成这个项目。 <!-- id: EHmpdjOlkozdiQxqoWvcYek5nHh -->

 <!-- id: ZLj4dc8u5opNesxKiJIcDVGAnDc -->

它对应的技术栈包括（不理解没关系，留个印象就好） <!-- id: Dp7XdWEnco57ZQxUdh1cVSK0nRb -->



阶段 <!-- id: D9andEAAloq6mpxFEjJcWXCWnQe --> <!-- id: RxffdiUGho8ktrxDYDRcppzznjd -->

前端 <!-- id: IfikdQkhToNuErxZKOCcT6HCnTf --> <!-- id: RV9AdmwWxoqbwuxYqqWcRQ9snJh -->

后端 <!-- id: RUVPd1t9QopKRvx8YD0cv6V7nee --> <!-- id: By5ad1q0PoavXpxQRTWchaf3nGb -->

数据库 <!-- id: U0xddT5V4ovyEIxMtKYcuf1yn9g --> <!-- id: TFbFdsUyloDmi9x53eYccmJen9g -->

其他服务 <!-- id: CQsodumeaoywRzxfnU8cSwoMn8d --> <!-- id: XYMgdjs1eohUQLxs4FgcY3DQnnh -->

1-4 <!-- id: Kbirdqh3Doo5ldx12p1c172ZnOf --> <!-- id: YyW2dzYTboSAmtxKnePczNkKnxf -->

HTML/CSS/JS <!-- id: IToFd4iJdowuB3xL8SLcSAf8ndb --> <!-- id: D3zpdPkJNoHsMAxCZGmcAx48n3g -->

无 <!-- id: JKs8dCqf1oBN8vxz0kPcIMFJnab --> <!-- id: X3rGdEvJKosxpgxPGdBc4TOnnSb -->

无 <!-- id: VzTKd44rSofh6PxHgmtcwovenB8 --> <!-- id: IZjldUECmoZmO2xe5mPcFwAlnKd -->

无 <!-- id: ZAWldkKSJoyKw5xi38Xc47QSnrc --> <!-- id: YEptdaoWiolvL8xcAsTc3kztnMg -->

5 <!-- id: N1mMd8CknowUcMxmUyVc7fKanbf --> <!-- id: Yy6ud5pNuoKRpdxOw8Fck61unGc -->

+ localStorage <!-- id: C8VCdXVrFoOjAzxW9sucGmYHnZb --> <!-- id: Fkptdga5eoo4Z1xSPQhcxIw9nib -->

无 <!-- id: DpjodvHrkoW4jBx1MMbcKhPFnTb --> <!-- id: Y5hKdJfguotmQKxBQxYcgajKnjf -->

无 <!-- id: C91hdN8Glo7EfDx9nh1cAeTbnEV --> <!-- id: O7PSdxqbdokSulxvlcgcNZtEnZG -->

无 <!-- id: RMHodRdrFoivydxsy6gcoB51nEf --> <!-- id: HDqkdrF5BoHa8DxWTxJcfV25nyh -->

6 <!-- id: Ghpxd1KNdoryjBx8s9WcRcmsnjc --> <!-- id: RVd6dI5s1osCkTxcLp1c0CLWn8d -->

+ 用户系统 <!-- id: Cj1bd5bqboiBbAxe6xLcBXucnUe --> <!-- id: MmQJdyDj2ojWedxCMzucXusynPg -->

Serverless <!-- id: PZBVdRsQ6opMBoxskzWcrr41nDe --> <!-- id: OZ0odzsY8oL5BJxrxJdcAwEQnvd -->

Supabase <!-- id: Tv8Sdu8E4og3UgxHjJecnQsanbh --> <!-- id: P4Sndf8KzowL2rxXI54cTmnenye -->

认证服务 <!-- id: O5OPdDyzHoFlOvxAE6ecxf9Angh --> <!-- id: XcKLd671PoMk7xxBoMScxdWFnxd -->

7-8 <!-- id: XP9fdB7E8oR4Gcx9czLcXDpgnGd --> <!-- id: FqWSd5d3Xow4d0xWxL4chH3enkU -->

+ 社交功能 <!-- id: GbLvdV54koxYVqxSFufcaZbEnJl --> <!-- id: K5RLdWhgJoHYeDxMcMzcCf5onQd -->

+ 数据 API <!-- id: OKHQd6TDDokoPcx55Zacmrf6nkh --> <!-- id: A16WdBpzGoNlcFxGDMecAAVrnAh -->

+ 关系表 <!-- id: WaLvdiGzzoKioSxTqkUcZr7QnBf --> <!-- id: LMtidgPaGoXbc1xIrIpcU5XbnNd -->

云存储 <!-- id: L5DbdRq5roLmoUxhvTfcSJ8vnVf --> <!-- id: QnXxdPj2WoKuPKxAKZMcNJnXnDe --> <!-- id: OGfHdnDzroiqd2xVsXPcyaDknFe -->

 <!-- id: PspldGpuqoiimvxmwvCcrWqVnYd -->

#### 2.1. 需求定义与环境准备 <!-- id: FrsadcIQvo4sx8xFcpVc09HBnhc -->

跟之前的一句话项目不同，咱们这个喵宇宙稍稍繁杂一些，还准备上线以后可以长期提供服务。所以在正式开始编码之前，你需要做一些准备工作。就像盖房子要先画图纸、准备工具一样，做项目也需要先定义需求、准备环境。 <!-- id: HhbTdjc64oeiySxFV7kcFCrTnjg -->

##### 2.1.1 什么是 PRD(产品需求文档)? <!-- id: HQY5d0zpbopJfkxubh8chlbLnMc -->

PRD 是 Product Requirements Document 的缩写，用来描述"我们要做什么"。 <!-- id: ICGBdRvBRoVzPyxa45rcgfRbnme -->

你可能会想：“我不是在和 AI 对话吗？为什么还要写文档？”其实，当项目变得复杂后，一句话往往说不清楚所有需求，这时文档就能帮你理清思路，避免遗漏重要功能。更重要的是，文档是给 AI 看的“完整说明书”，AI 能基于文档生成更加一致、更符合你整体设计的代码。 <!-- id: SfnFd6DkJonjbAxixYScdsfhnbb -->

好消息：PRD 不需要很复杂，用自然语言写清楚就行！ <!-- id: TCy1d7xvEoCytwx9sl7cCbCenSf -->

##### 2.1.2 MVP 版本的 PRD <!-- id: VC9Ed2bXSomPQqxiB4zcTuiFnje -->

MVP 是 Minimum Viable Product（最小可行产品）的缩写，指的是最简单但能用的版本。 <!-- id: KCtSdESXwoauiJxpRkAcKEeUn4d -->

采用 MVP 的方式开发有很多好处：它能让你快速看到成果，获得成就感和反馈；避免一开始就陷入复杂功能的泥潭；更重要的是，你可以先验证核心想法是否可行，再决定是否投入更多时间。就像搭积木，我们先搭好基础框架，确保它稳固，然后再一层层添加更多精彩的部分。 <!-- id: GQhed8pEaooWxGxaYvUcIr4MnVf -->

对于喵宇宙项目，我们先从最简单的版本开始：一个展示猫咪信息的卡片。 <!-- id: J5cFdC4Aio33gNxm010cUB03ncd -->

PRD 文档示例(阶段 1 MVP 版本)： <!-- id: VCSPd7OyLodlGdxTEtycEKK1nMh -->

```
喵宇宙 - MVP 版本

项目名称
猫咪卡片展示器 MVP

功能描述
一个简单的网页应用，可以展示猫咪的基本信息和照片。

核心功能
显示一个精美的猫咪卡片
卡片包含：猫咪名字、年龄、性格描述
显示一张默认的猫咪图片(可以是占位图)
卡片设计精美，有阴影和圆角效果
卡片底部有一个"查看详情"按钮(暂时不需要实际功能)

技术要求
所有代码放在一个 HTML 文件中，名字叫做 index.html
纯前端实现，无需后端

UI 风格
温馨可爱的风格
主色调：温暖的橙色或粉色系
卡片式设计，有阴影和悬浮效果
手机和电脑都能正常显示

约束条件
代码要有清晰的注释，适合初学者阅读
图片尺寸建议 400x300 像素
``` <!-- id: M3iddMJcWo3RkyxT3CMcIqr7nWe -->

这就是一份简单但完整的 PRD！ 你可以把它保存为 prd.md 文件，放在项目文件夹里。你可能对前后端的概念还不太理解，简单理解，所谓"纯前端"是指代码完全在浏览器中运行，用户看到的界面和交互都由前端实现;而"后端"则是运行在服务器上的程序，负责处理数据存储、业务逻辑等用户看不到的部分——我们会在阶段 6 引入后端。如果想深入了解，可以看 AWS 的这篇文档。 <!-- id: G9xydUGpOoprJXx69DsciVz3nrg -->


小贴士：我们在 [`templates/`](../templates/) 文件夹中准备了更多 PRD 模板，你可以根据项目阶段选择使用。 <!-- id: ACvzduZyvoGGfexphXycbFvkntf --> <!-- id: IhwddmLayoj7M6x5a4UchTpnnmh -->

#### 启动 <!-- id: ALFSdfBhSo6HTpxGFs9cee6qnCc -->

##### 阶段 1：生成 MVP — 第一个猫咪卡片 <!-- id: Xv4wdqVP9oA4ohxGviKchYAYnLd -->

现在，一切准备就绪！让我们生成第一个版本： <!-- id: I15Zd68ZMo1wOSxGd6ycm2V0nwc -->


参考文档 prd.md 描述的内容，做一个猫咪展示卡片。 <!-- id: VM2mdcl1ho7VB6xuDErcfJt8nLf --> <!-- id: JvL3dZdA1oVhghxLt19cSZlLnKg -->

发送这个提示词后会，cc 会： <!-- id: YuQlddpHRoadKAxNdtScmdm9nHc -->

 <!-- id: Ixxjdp1Aho6WrJxyWF3cNunUnmc -->

 <!-- id: DMXbd1RT4oJ97VxjjZhcQXHpnnh -->

 <!-- id: BlbMdtqOvo7p6cxLI0wcumJYnrg -->

 <!-- id: Bh8vdWGGQojivNxuoJWcvBmRngg -->

 <!-- id: AxkydkQgzopNF2xcPdAcjl0snRb -->

现在运行你的第一个项目： <!-- id: XxMqdLN4roaKmoxOekYcZHURnsc -->

 <!-- id: ZYoOdvwX9olXOwx23a2c2pYBnJg -->

 <!-- id: YqAkdMAaUoLlZ6xaOfbcbvLenic -->

 <!-- id: EItLdElDvovJGxxnElucVbCwnAz -->

 <!-- id: CYIbdDgbGok5ssxnZAzcgAlan5Y -->

成就感时刻：当你看到第一个猫咪卡片出现在浏览器中，恭喜你——你完成了喵宇宙的第一步！生成的界面是类似这样： <!-- id: YB2kdokl7o4h9Mxk2C0cHVrFnbh -->

![Image](assets/CxvobWWoVoEgc2xXetqcysh3n5e.png) <!-- id: J73zd0zA7oYOVPxXr8DcQ1yCnJc -->

虽然名字有点“货不对版”，但也算是像模像样了。如果把这个index.html文件发送到手机（比如通过微信），我们能看到它还挺适合在手机中观看（还记得我们在 PRD 中描述的 UI 风格吧）： <!-- id: CEVFdGWt2oQs0nxwpuHcDU6knuh -->

![Image](assets/QUjtb8OHRoOcC4xlhXyc0HvQnHs.png) <!-- id: IMdfdu0suo7EXCxkfwPcykhanse -->

代码阅读 <!-- id: U7zud7d5UovF8QxM7X8c0PAvnLe -->

这里我们第一次看一下代码内容： <!-- id: XUFadGP1FoRl69xHOT6ck9spnJh -->

```
<！DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>喵宇宙</title>
    <style>
        /* CSS 样式代码 */
        /* 包含：卡片布局、颜色、阴影、圆角等 */
    </style>
</head>
<body>
    <div class="container">
        <h1 class="title">🐱 喵宇宙 </h1>
        <div id="cardsContainer" class="cards-grid">
            <div class="loading">
                <div class="loading-spinner"></div>
                <p>加载中...</p>
            </div>
        </div>
    </div>

    <script>
        // Sample cat data - 示例猫咪数据
        const catsData = [
            {
                id： 1，
                name： "小橘",
                breed： "橘猫",
                age： "2岁",
                gender： "公"，
                description： "性格温顺，喜欢晒太阳，对小鱼干没有抵抗力。是个不折不扣的吃货，看见食物就会喵喵叫。",
                image： "https：//images.unsplash.com/photo-1574158622682-e40e69881006?w=500&h=400&fit=crop",
                badge： "最受欢迎",
                tags： ["温顺", "亲人", "吃货"]
            }，
        ......
    </script>
</body>
</html>
``` <!-- id: TjDtdaAbvokmFbxOxAvcGAIAnIf -->

第一次看代码，不要慌，让我们用简单的方式理解一下HTML 的结构。你可以把HTML想象成一本书： <!-- id: Z5ZldetVwoiVLox7PnfceTXWnP7 -->

- <head> 就像书的封面和版权页——包含书名(网页标题)、出版信息等，这些内容读者翻开书时看不到，但对书很重要。比如 `<title>喵宇宙</title>` 决定了浏览器标签页上显示什么名字。 <!-- id: EHJ8d2E2Lo1hCfxva55cfaRynQc -->

- <body> 就是书的正文内容——读者真正看到的文字、图片、按钮等都在这里。比如 <h2>小橘</h2> 会在页面上显示"小橘"这个标题。 <!-- id: APCDd5NBIoQ2O9x90rCcvLCxnSh -->

你会发现代码里有很多中文，从这些中文就能看出内容的对应关系。最棒的是那些双引号 " " 里面的文字，你可以直接修改，改完保存，刷新浏览器，页面就会跟着变化。这就像编辑Word文档一样简单，只不过现在编辑的是网页。 <!-- id: LRpdd87ljoJv5txsYvIc89E1n9f -->

现在不需要理解每一个标签的含义，先大胆地改改看，感受一下代码和页面的对应关系。想深入了解 HTML 的同学，可以关注阮一峰老师关于 HTML 的博文。（阮一峰老师编写了大量深入浅出的教程，他的博客，是入门学习编程的好地方。） <!-- id: TOeXdbkhzo5NgaxgGFFc6O7onNb -->

 <!-- id: M74Kde57LolG92xKk3uchM2Aned -->


小练习： <!-- id: Aqkfdbl4poJVfDxVcFLcO0acnRf -->
 <!-- id: YMKGdYrdYoWp7UxHWBScCUKRnBc -->
 <!-- id: Diq5dQwi5oHC14xZ5l2chnlLn8c -->
 <!-- id: FcEmdCX9UoYCsxxfdEwc11sBn1f --> <!-- id: T3AJd17rLoQR7txzWkjc4OtBnAe -->

 <!-- id: DXPLd1yOLoDY36xhfrzc9v7Nnxp -->

##### 阶段2：照片上传和展示 <!-- id: IkCMdOLftocUdlxQO7lcsW5cnIh -->

现在你已经有了一个精美的猫咪卡片。但是你可能会想："这些都是网图啊，我想放上自己家主子的照片！"。没错，这正是我们接下来要做的——让卡片能够展示真实的猫咪照片。 <!-- id: ALVyd893NoYwSQxvuZLcmlvenbf -->

我们需要添加一个"选择照片"按钮，当你点击它时，会弹出文件选择窗口让你挑选照片。选好后，照片会自动显示在卡片上，而且还会自动调整大小，刚好适配卡片的显示区域，不会变形或拉伸。 <!-- id: QqpId4qrpo0nJ6xmxyVcrIQwnLf -->

现在，让我们来告诉 AI 我们想要什么。你可以这样对 cc 说： <!-- id: RboFdhkyfoIqAZxiYuEc9VJznmg -->

```
在现有功能基础上，添加照片上传功能：

1. 在卡片上方添加一个"选择照片"按钮
2. 点击后打开文件选择对话框(只允许选择图片文件)
3. 用户选择图片后，自动替换卡片上的占位图
4. 图片自动缩放和裁剪，适配 300x200 的显示区域
5. 保持图片比例，不要拉伸变形

保持代码注释清晰。
``` <!-- id: V5umdBiRoo2HZfxy9GacdRmGnxb -->

发送这段话之后，Claude Code 就会开始工作了。它会修改你的 index.html 文件，添加文件选择按钮和相关的 JavaScript 代码。这些代码会处理文件读取和图片显示——听起来很复杂，不过 AI 会帮你搞定所有细节。 <!-- id: HCe2dyd0AogiT1xj0qzcinTEnod -->

好了，代码生成完毕！让我们来测试一下效果。首先刷新浏览器页面，你会看到出现了一个"选择照片"按钮。点击它，会弹出文件选择窗口。从你的电脑里挑一张最可爱的猫咪照片，然后点击确定——你的猫咪照片出现在了卡片上！ <!-- id: Ncsldc0lloZoQoxo8WicPbYLn0e -->

![Image](assets/FrRNbn27ToO7UGxjYQacN4fVnif.png) <!-- id: V8R4dTLzWoBrXyxlUQicEbqnnOg -->

替换完是这样子的： <!-- id: S0JKdx3ZNo1886xJwYdcMY7tnGg -->

![Image](assets/ICJ4bmnyLo8vtrxPzZAcjsUhnkg.png) <!-- id: OKAwdJ698oV1O9xK9Wtc1PuVnXf -->

而且下次再打开这个网页的时候，替换的照片也会被保留哦。 <!-- id: FRRedFuzKoDLIdxwA5qctTkgnWf -->

 <!-- id: COkrddW2uoEPnlxj0QHcWgeznyh -->

你可能好奇背后的原理。简单来说，浏览器提供了一种叫 File API 的能力，让网页可以读取你电脑上的文件。当你选择一张照片后，浏览器会创建一个临时的图片链接，然后代码把这个链接设置给卡片上的图片元素。下面是 AI 可能生成的代码片段，看看就好，现在不用完全理解（后面我们会删除这个调用 /手动狗头） <!-- id: NDTudDL7moVs5OxYyDJcAkrin5g -->

```
// 文件选择按钮的事件监听
function processAndDisplayImage(file， imgElement， catId) {
    const reader = new FileReader();

    // Read file and convert to data URL - 读取文件并转换为数据URL
    reader.onload = (e) => {
        const imageUrl = e.target.result;

        // Update image source - 更新图片源
        // CSS object-fit: cover will handle cropping automatically
        // CSS的object-fit: cover会自动处理裁剪
        imgElement.src = imageUrl;

        // Store in localStorage for persistence - 存储到本地存储以持久化
        try {
            localStorage.setItem(`cat-image-${catId}`, imageUrl);
        } catch (e) {
            console.warn('无法保存图片到本地存储:'， e);
        }
    };

    reader.onerror = () => {
        alert('文件读取失败，请重试');
    };

    // Read file as data URL - 读取文件为数据URL
    reader.readAsDataURL(file);
}

/**
 * Load saved images from localStorage
 * 从本地存储加载保存的图片
 */
function loadSavedImages() {
    catsData.forEach(cat => {
        const savedImage = localStorage.getItem(`cat-image-${cat.id}`);
        if (savedImage) {
            const imgElement = document.querySelector(`.cat-image[data-cat-id="${cat.id}"]`);
            if (imgElement) {
                imgElement.src = savedImage;
            }
        }
    });
}
``` <!-- id: FbocdYXHwoiHZVx6G8uclBb7nKb -->

这就是你的下一个成就时刻：用自己的猫咪照片制作了第一个展示卡片！赶紧截图发给朋友炫耀一下吧，当他们问"这是用什么工具做的"，你可以骄傲地说"我自己写的"。 <!-- id: InEndUhKSovEyBxUJDccjVUWnQc -->

 <!-- id: JQ1bd0oYoo5rHvxVZHfcRYsynZd -->


小贴士：如果你选择图片后没有显示，可能是浏览器的安全策略在作怪，试试刷新页面，或者把错误信息复制给 AI，让它帮你排查问题。如果图片显示得很模糊或者变形了，告诉 Claude "图片显示有问题，请保持原图比例"，它会帮你调整。 <!-- id: Of6Ndb4baof4Goxmf8vc1k11ndh --> <!-- id: Gx9Udeh3ooBBbExGzafc2HXfnT0 -->

 <!-- id: ZuFPdkGgqo8RkAxuMWRcdp3Bnoc -->

到这里，你已经完成了两个阶段的开发！现在你的猫咪展示卡片不仅有精美的设计，还能显示用户上传的真实照片了。你学会了如何用自然语言描述功能需求，如何在现有基础上一步步添加新功能。虽然我们提到了 File API 这个概念，但你会发现，即使不深究技术细节，也能做出很棒的东西。接下来，我们要让展示更加丰富——支持多张照片轮播，还能随时编辑猫咪的信息。 <!-- id: ITsjdGGEPoQy0CxJtJgc7GEWnIg -->


提示：如果刷新以后，上传的图片少了1、2张，那很可能是图片太大，浏览器保存不下了，很遗憾，它的存储空间只有 5MB，非常狭小，所以我们只能上传一些比较小的照片。好在后面我们有更好的方法来保存数据。 <!-- id: Q8OPdxVXRogu4vxatLTc9NNPnqf -->
 <!-- id: IqZVdbuQKoxd6hxfLQDcOve5ny5 --> <!-- id: JheHdwdUkovY7hxXUl6caCranUh -->

#### 小步快跑：版本管理与迭代 <!-- id: B9jwdtO6ioNXqIxBGr5cr5OHnBe -->

在继续添加新功能之前，让我们暂停一下，聊一个很重要但常被忽视的话题——版本管理。 <!-- id: ShwBdO1vEo9LAyx9TSwcXErengg -->

想象这样一个场景：你花了一个小时添加了一个很棒的新功能，兴高采烈地继续开发下一个功能。结果......新功能把之前的功能搞坏了！你想恢复到一小时前的版本，但是代码已经改得面目全非，根本找不回来了。这种崩溃的感觉，每个开发者都经历过。 <!-- id: C75AdltLtob8cYx2XjRc1aUlnNb -->

###### Git：最方便的版本管理工具 <!-- id: Veocd74OFo1BN5x97dYc8wbjnjh -->

版本管理(Version Control)就是为了解决这个痛点而生的。你可以把它想象成游戏里的存档功能，打Boss之前先存个档，失败了就读档重来。在编程中，我们使用一个叫 Git 的工具来做这件事。Git 是一个免费的版本管理工具，几乎所有程序员都在用它。这是一个命令行工具，不过Claude Code 内置了 Git 支持，你完全不需要记忆那些复杂的命令。 <!-- id: QxH8duVuioGoccx5cqHcSUqNnEb -->

Git 的核心概念其实很简单。每次你完成一个小功能，觉得"嗯，这个版本不错，值得保存"，就可以做一次"提交"(Commit)，就像按下游戏的存档按钮。提交时，你可以写一段说明，比如"添加了照片上传功能"，这样以后回看历史记录时，就能知道每个版本做了什么。所有的提交会形成一条历史记录链，你可以随时查看，甚至回退到任何一个之前的版本。 <!-- id: TlBWdJXZ2o2JIGxxur4c3ljjnkY -->

那么具体怎么操作呢？当你想保存当前进度时，只需要对 cc 说： <!-- id: Xq4Hdu77cofg2Dx6TlQcKuA9nYc -->


帮我提交当前代码到 Git，提交信息写:完成了照片上传功能"。 <!-- id: FWaBdmzm3oTV2kxXgmOcoyU3nAg --> <!-- id: Q9PVd80GkoKCgjxgtIzceb57n1d -->

Claude Code 会自动帮你完成所有操作——初始化 Git 仓库，添加文件，创建提交。整个过程你甚至不需要知道背后发生了什么。 <!-- id: MCy6d4xQvojjPRxFzClcnfgInld -->

如果你想查看之前做过哪些提交，可以说 <!-- id: OZx0ddAC0oQSD7xyO9ocmxg1nPd -->


显示 Git 提交历史 <!-- id: E1GmdlrFOo0gLAxtX54cbhRonRd --> <!-- id: NzT3dAurJo1vUwxkkmRclIhynoc -->

你会看到一个列表，每一项都是一次提交，包含提交的时间和说明信息，大概长这样： <!-- id: Oli4dbGj9oYcQdxwIiCcQOk0nMh -->

```
IN: git log --oneline --decorate --graph
OUT: * 9d49a2e (HEAD -> main) 完成了照片上传功能
``` <!-- id: SOttdFhauoumoFxMxmqcaDCQn8f -->

万一真的需要回退到之前的版本，也很简单，告诉 cc： <!-- id: XnROdmlnwo1S9IxMx54ch2xOnIh -->


回退到上一个提交 <!-- id: B04PdBoZwobMI0xIgwfcoQ2Ynub --> <!-- id: XlwodUUuzoOu4gxbz7lcNS4gnbf -->

就可以了。 <!-- id: VxHod0IGfomtsqxBijicGxQOnnf -->

建议养成“小步快跑”的习惯：每完成一个小功能就提交一次，不要等到做了很多功能才一次性提交。提交信息要写清楚做了什么，比如"添加了照片上传功能"比"更新代码"要好得多。这样，当你需要回看历史或者回退版本时，就能快速找到想要的那个点。 <!-- id: NHcTd5Mb7ovtT1xg8qqcSX1fnle -->

想深入了解 git 使用的同学可以查看 Scott Chacon 和 Ben Strab 写的书《Pro Git》或者知乎的这一篇长文档。 <!-- id: KTBNd0VQroslKQxUzPNc6lYJnYc -->

#####  GitHub：全球最大的代码分享平台 <!-- id: TGcAdpPdAo8xQqxHtLLc2UB0nUc -->

现在我们每一步提交，都在电脑中有了记录，可以随时回滚到之前的状态，但仅仅如此还不够：如果换一台电脑就找不到了，手机上更加看不到，为了可以随时访问自己的代码，随时修改提交，我们需要一个更强大的工具 Github。 <!-- id: UY0VduNQhohAO2xkq9qcGowYnGf -->

###### 什么是 GitHub? <!-- id: K7BNd8P3xogNmkxKLXwc50hqngh -->

GitHub 是一个代码托管平台，可以把它想象成"代码的云盘"。你可以把本地的 Git 仓库上传到 GitHub，它让你的代码永远不会丢失：即使电脑坏了，代码还在云端；随时随地访问：在任何设备上都能获取你的代码。比云盘更厉害的是，它会保存我们所有提交过的历史，所以代码逐渐丰富的过程也不会丢失，而且支持多个人一起开发项目，github 会很聪明地帮你合并大家的修改。 <!-- id: TWjAdcblnoTK1uxqj3vc2IU3nRf -->

全球有超过 1 亿程序员在使用 GitHub，几乎所有开源项目都托管在上面。 <!-- id: V5zYd19Ano905Wx5vRpc2JpnnRd -->

###### GitHub 的核心概念： <!-- id: YdB6dhHeCoDtlNx6TmIc68bXnue -->

- 仓库(Repository)：就是你的项目在云端的"文件夹" <!-- id: Tw7rdUGcco7wwWxrCVic6hNJnyh -->

- 推送(Push)：把本地的提交上传到 GitHub <!-- id: LCMcd3qHzo8ADjxc4qFcnhq5nTg -->

- 拉取(Pull)：从 GitHub 下载最新的代码到本地 <!-- id: JjIPdYn0IoVNf8xAD6gcoAu9nhf -->

- 克隆(Clone)：把别人的项目完整地复制到你的电脑 <!-- id: PsvIdltTHoQoeyxudafc51SinPc -->

###### 安装 GitHub CLI：命令行的魔法工具 <!-- id: POlSdGEusobFXExhivMc15TpnBd -->

在安装 github 本地工具之前，需要先去注册一个 github 账号，访问这个地址：https://github.com，点击右上角的"Sign up"按钮，可以用个人邮箱，或者谷歌、苹果的三方账号注册一个新用户，然后就可以安装本地 GitHub CLI了。 <!-- id: NlRzdX48HoWWbnxH9OIczBMxnAd -->

GitHub CLI(Command Line Interface)是 GitHub 官方提供的命令行工具，它能让你在 Claude Code 中直接操作 GitHub，无需打开浏览器。安装了它，你就可以用自然语言告诉 Claude 做什么，它会帮你执行对应的命令。 <!-- id: MgQ8d9Mk0opM5fxjT5vcvMbSnCE -->

安装步骤： <!-- id: Jg3EdgpWpoE1xnxkAJ0cBgMFnPb -->

安装非常简单，只需要对 Claude 说： <!-- id: SpSvdBK2bouR1RxtVJkcdAz9npe -->


帮我安装 GitHub CLI <!-- id: KeZWdbTm4osNYBxXsZfcK5YNnLg --> <!-- id: SLwTdHYjSoESNdxIvwscLFj0nfh -->

Claude Code 会根据你的操作系统自动执行安装命令： <!-- id: DSXFdmKHroEKbIxzcYPcCtZtnvh -->

- macOS：使用 Homebrew 安装 <!-- id: EzR2dh417oGieNxAEgecUfQOnvb -->

- Windows：使用 winget 或下载安装包 <!-- id: SqWed2yjYocy5gx2CSEc6Sorn2f -->

- Linux：使用包管理器安装 <!-- id: Mkvfdw39doBa30xVaXfccqHCnlf -->

安装完成后，你还需要登录你的 GitHub 账号。对 Claude 说： <!-- id: WJ8UdyrASo5wzgxkJmZcLxO4n3c -->


帮我登录 GitHub CLI <!-- id: IF4vdUFTco45WSxPfDncMpannKh --> <!-- id: MpGEdDPf8oALAAxfOxBcfvuAnme -->

Claude 会引导你完成登录流程： <!-- id: AaiAd5sCholSE4xWiwpcYgZZnEb -->

 <!-- id: D8f0db2xnouczLx4J8bclLYgnuh -->

 <!-- id: RsUKdFLYco2UByxgyxEclEMLnOd -->

 <!-- id: OWPNdjDyzo5rXmxjRzJc6oB1nw3 -->

 <!-- id: U5cpdurbSoa47xxqSrUc0KcBnZe -->

验证安装： <!-- id: EryfdLVSwoPFHuxMljwcqyFNnCg -->

想确认是否安装成功，可以对 Claude 说"检查 GitHub CLI 版本"。如果看到版本号(比如 gh version 2.40.0)，说明安装成功了。 <!-- id: RPlvd5NKJoptM0xoDYycq4wanuc -->

###### 推送项目到 GitHub <!-- id: CmOSdtL8doFHtpxZag1cSNbJnlc -->

1：确保代码已经提交到本地 Git <!-- id: ExIydFZHBozYqDxjcpJcgbCenzd -->

首先确认你的代码已经保存到本地 Git 仓库。对 Claude 说： <!-- id: OryudR61DoE4HDxcDVacDIHrnXe -->


显示 Git 状态 <!-- id: FUqndrw4roFcx2xwEErc51TLn0b --> <!-- id: AkBydMFqQoklmlx9esHcZS9Gntg -->


实际命令在下面，下面这几个步骤的命令以后经常用到，熟练了之后，就不需要每次通过 cc 来翻译了，可以自己通过终端跟机器对话： <!-- id: MemNdXhUAosUQexXWw5chQMCnhh -->
git status <!-- id: EUYWdxfo1oSXHnxhnDLc2o9cnCP --> <!-- id: UrYHdXjTFoWqCexKalFcuJlmnHe -->

如果有未提交的修改，先提交它们： <!-- id: CXeqdVeo1oWSnex5IPgcduCjnBc -->


提交所有修改，提交信息：准备发布到 GitHub <!-- id: M0YsdWlE9oBqcExsXFvcpl4vnaf --> <!-- id: WxlSdC4LzoNjiJx6J1acO6KynLd -->


实际命令： <!-- id: W4bldNVr1og3bBxTOOuc9eyQnKc -->
git add . <!-- id: IcIAdGJ5Eo8ub5xWwYwcuB5Cnfg -->
git commit -m 'xxxxx' <!-- id: WpYIdqzBropl5axgS2LcnjSln0f --> <!-- id: Yzd3dVJvpo9TyOxwPkQcUAPXnGf -->

2：在 GitHub 上创建仓库 <!-- id: WTO2d7gvWoh48exI7IKcQX0znfh -->

现在要在 GitHub 上创建一个"家"来存放你的项目。对 Claude 说： <!-- id: L0tedWbHYot8Nxx7ew1cHtO7nAc -->


帮我在 GitHub 上创建一个新仓库，名字叫 miao，描述为"喵宇宙，猫猫的展示舞台" <!-- id: BfIid3M6MomneOxt59wcRomhnpf --> <!-- id: NUwydJPkUoR2nGxUtKrcSOlYn8f -->


实际命令： <!-- id: JHONdV0R7oWFHvxqZircTB8knyf -->
gh repo create miao --public --source=. --remote=origin --push <!-- id: IuCMdLagJoEvaVx1GCLcq7CnnJe --> <!-- id: GFepdiFDjorTmUxGTx8cM5NCnJX -->

Claude Code 会使用 GitHub CLI 自动创建仓库。你可以选择创建公开仓库(所有人可见)或私有仓库(只有你能看到)。对于学习项目，建议选择公开仓库，这样可以分享给朋友，也能展示你的学习成果。 <!-- id: BqhmdVA33olLVDxzOuTcje8mnHf -->

3：推送代码到 GitHub <!-- id: TCTWdEbCJoNeI6xBUvccbNbDnW6 -->

仓库创建好了，现在要把本地代码上传上去。对 Claude 说： <!-- id: E5OrdVj4AoyjzNxT8FtcwDqJnFd -->


把代码推送到 GitHub <!-- id: JWOgdjTyloMyVuxqULMcsrjRn5e --> <!-- id: WaCld1f9uoS8Ynx21VFc1jyxnJb -->


实际命令： <!-- id: EDwKdPsmYoWsf0xIswVcZZH1n5f -->
git push  <!-- id: GleOdYCfboCiWExgj7ocAe59nTc --> <!-- id: SaFjd5fHEonAyUxFZoPcioJQnOe -->

Claude Code 会执行一系列命令： <!-- id: OOKWdWYFqoG5q7xCdBscFYfjn6e -->

 <!-- id: IlkWdirzKo1772x200hc8NMxnFd -->

 <!-- id: Gsi5d7qYHoJtfXxEhivc9F6sn8b -->

 <!-- id: QlMJdUZt1ofrxAxwPeUcvmfxnzb -->

推送完成后，你会看到成功的提示信息。 <!-- id: A5hSdRP52o7HSSxdChpcV96ynqd -->

4：查看你的在线仓库 <!-- id: S2lsdt88zobOXoxU91Xc7QAsnae -->

想看看你的项目在 GitHub 上的样子吗？对 Claude 说： <!-- id: B1f2d5j1qoZhwpx3mtwc9aJ4nbg -->


在浏览器中打开 GitHub 仓库 <!-- id: AkeRdEuKPoXEKRxYZH1cFiUSnQg --> <!-- id: DkSEd12gzoMzM0xPckmcG5RJnlg -->

浏览器会自动打开你的项目页面。你会看到： <!-- id: MT0GdWHb6o9KRnx1MSqcIDRqnhf -->

 <!-- id: GyXUdkqq2oKyO5xvKYwc5llInxb -->

 <!-- id: ViKVdpW2noeZqgxrPBgc2jIHnve -->

 <!-- id: C9kfdrOBVoxshsxT9HMcwWOHnYg -->

 <!-- id: CbxidV3f2oNGCJxSOfoc1lMYnoe -->

恭喜你！你的第一个项目已经在 GitHub 上了！仓库地址类似于 https://github.com/你的用户名/miao。 <!-- id: TBIZdkfB9ogvFvxhLgGcXZAonIb -->

你会看到，这里其实大部分使用的还是 git 命令，而不是 github cli（也就是 gh）命令，因为 gh 主要用于控制 github 服务器上的远程仓库，后面我们还会接触到它的用法。 <!-- id: Rz9sd1KnqopjifxcG6bcjnHBnyf -->

#### 功能增强 <!-- id: MPF6dsC4vogT8Xxuv7jc69bOnhg -->

##### 阶段 3：多图轮播和信息编辑 <!-- id: JQt3d6VYvoDudTxM1NAc5teYnEd -->

掌握了版本管理的基础后，让我们继续给项目添加新功能。你可能已经发现了：一张照片怎么够展示你家主子的盛世美颜呢？卖萌的、睡觉的、玩逗猫棒的......每一张都值得展示！所以这个阶段，我们要让卡片支持多张照片轮播，就像翻电子相册一样。而且，我们还要添加编辑功能，让你可以随时修改猫咪的名字、年龄、性格等信息。 <!-- id: ED2GdMA4eouWHPxcyvicJ4V4nQd -->

 <!-- id: AZPBdYkB9o8jrtxRIXLctHWSnec -->

想象一下效果：你一次性选择了五张照片，它们会自动轮播，每3秒切换一张。你还可以用左右按钮手动切换，就像在手机上翻相册一样。卡片上会显示"1/5"这样的指示器，告诉你现在是第几张。当你觉得猫咪的介绍需要更新时，点击"编辑信息"按钮，名字和性格描述就会变成可编辑的输入框，改完点"保存"就更新了，点"取消"就恢复原样。 <!-- id: I129dVZBso1l6SxYDSkcPz0dnzh -->

 <!-- id: K5mDdtcDSoqtavxcG30ccpu1nBf -->

来告诉 cc 我们的需求吧。你可以这样说： <!-- id: DZxyd6TN5o1z3kxA9gJc74rdnlh -->


在现有功能基础上，添加多图轮播和信息编辑功能：

1. 修改文件选择功能，支持一次选择多张图片
2. 添加一个轮播图组件：
   - 自动播放，每3秒切换一张
   - 有左右切换按钮
   - 有指示器显示当前是第几张(例如：1/5)
3. 添加"编辑信息"按钮，点击后：
   - 猫咪名字、年龄、性格变成可编辑的输入框
   - 显示"保存"和"取消"按钮
4. 点击"保存"后，更新显示的信息
5. 点击"取消"后，恢复原来的信息

UI 要美观，编辑状态和显示状态要有明显区分。 <!-- id: X2TrdFGGpoOwU0x3AL3cOtilnBg --> <!-- id: VckLdf0TsolVQqxNlPscrGcJnBG -->

 <!-- id: EQdCdF6O5oq5K4xDN6Jcw4Dnn2F -->

这个阶段涉及的技术点稍微多了一点，多文件上传需要让文件选择按钮支持"多选"模式，然后用一个循环把所有选中的图片都处理一遍。轮播图则需要用一个数组(就是一个列表)来存储所有图片，然后设置一个定时器，每隔3秒自动跳到下一张。至于信息编辑，就是在"显示模式"和"编辑模式"之间切换——显示模式时展示文字，编辑模式时展示输入框。 <!-- id: SYsIdSAFOoXvMYxuRv5c16SfnJf -->

 <!-- id: E1xQdzdqeo8sifxKGQ6cBbYynMb -->

你可能好奇代码长什么样。下面是一小段轮播图的代码示例，瞄一眼就好，不用深究： <!-- id: ErIFdJg3moQTBDxZdc5cA4finVe -->

```
// 多图上传
document.getElementById('imageInput').addEventListener('change', function(e) {
    const files = e.target.files; // 获取多个文件
    images = []; // 清空之前的图片

    for (let i = 0; i < files.length; i++) {
        const file = files[i];
        if (file.type.startsWith('image/')) {
            const imageUrl = URL.createObjectURL(file);
            images.push(imageUrl); // 添加到数组
        }
    }

    currentIndex = 0; // 重置索引
    showImage(currentIndex); // 显示第一张
    startSlideshow(); // 开始自动播放
});

// 轮播图切换
function showImage(index) {
    const img = document.querySelector('.cat-image img');
    img.src = images[index];

    // 更新指示器
    document.querySelector('.indicator').textContent = `${index + 1}/${images.length}`;
}

// 自动播放
function startSlideshow() {
    setInterval(() => {
        currentIndex = (currentIndex + 1) % images.length; // 循环
        showImage(currentIndex);
    }， 3000); // 每3秒
}
``` <!-- id: AHNOdIsDEoeKMMx1Xb9cgUDrnj0 -->

 <!-- id: BqaGdbu0toVHKFxsnsUcYLMEnhh -->

我在做这个需求的时候， cc 到这里没能一次性完成，它修改后的页面，无法再上传图片了（点击按钮没有反应），这时候，可以把现象告诉它，请它修改（你永远可以把 cc 当做实习生，明确告诉它你的任务和它的错误）： <!-- id: XoHadOjwjozIllxPOFJc4AFRnXf -->


我测试了一下，修改属性是成功的，也保存了，图片上也出现了左右切换的按钮，但是这回上传图片失败了，点击“选择照片”按钮没有反应。 <!-- id: OjmXdfABboC68fxSMkLcDQOLnDh --> <!-- id: A6EJdih5eoI9KLx2UnUcTr9BnFh -->

经过这次"指导"，它很快意识到自己的错误，并且修复了代码。现在刷新浏览器，让我们来体验一下新功能。 <!-- id: So59dxuz0oXTeGxXa1ocvx2Xntc -->

![Image](assets/WtfebZ0TIojCOTxJcY5c36wDn9d.png) <!-- id: Mq92dVRkFolfCvxVbiTc5pipnVe -->


小贴士：你自己在使用 cc 的时候，也经常会遇到它犯错，这很正常，把出错的信息尽量清晰地告诉它，让它来排查错误原因就好，一般经过2-3轮排查和修改，它都能修复错误，继续工作。 <!-- id: L1ENdHCvSoF9IBxVGV7chhD9nLT --> <!-- id: RQdNdShFvo3oS3xpprIcD1Bdnze -->

点击"选择照片"按钮，这次你可以按住 Ctrl(Windows)或 Command(Mac)键，一次选中多张照片。选好后，第一张照片会立即显示出来，然后每隔3秒自动切换到下一张。你还可以用左右按钮手动翻页，卡片上会显示"3/5"这样的数字，告诉你现在看的是第几张。 <!-- id: CHYfdSltloxtaMxIaQMc3vHPnQf -->

现在试试编辑功能。点击"编辑信息"按钮，你会发现猫咪的名字、年龄、性格都变成了可以输入的框。随便改点什么，比如把"活泼好动"改成"高冷傲娇"，然后点"保存"。 <!-- id: K5xpdTdd9oxJ76xicHoc515hnSb -->

![Image](assets/Z9XKbm0m4o3vEJxaG5VceVPGnxb.png) <!-- id: RT0SdourOo1TMax62MjciqT5n0f -->

嘭！卡片立刻更新了。如果你改到一半反悔了，点"取消"就能恢复原样。 <!-- id: RZWVdzTZhoVMs0xsDK2cjhlFnOc -->

这是你的又一个里程碑：一个功能完整的猫咪展示页面！ <!-- id: PSgNdTqt5oLiUHxFBInc9ndYn5g -->


小练习：试试对 cc 说 <!-- id: XnnwdJyXfo8X7BxNP2FckaW5nfb -->
 <!-- id: StcqdJ57IoBr7LxJkJGcrrDtnnf -->
 <!-- id: ACKEdYAiaoAecoxUB0ncUQ51nIc -->
 <!-- id: PRVzdH7mHoHFjvx7j7VcLHcRnge -->
每一个新功能都会让你的项目更强大。 <!-- id: CFc2dwWL9opIyyx3Qt9cLkLxn1X --> <!-- id: N3w0d2PqJoYrRZxVd3Dcidqong4 -->

最后，别忘了提交这个版本！对 cc 说："提交代码，提交信息：添加了多图轮播和信息编辑功能"。 <!-- id: XCjMdVKfdoL40rxMujgcoWtYnog -->

##### 阶段 4：分享动图 <!-- id: WbgbdsRQ7oGjqxx5KLScjV30npd -->

现在展示页面的功能已经很完整了，但你可能会想：怎么把轮播的效果分享给朋友呢？有一个最简单的方式，就是把它们保存为动图。我们会添加一个实用的"保存gif"按钮（gif 是一种可以变化的图片格式，很多动态的微信表情包，就是基于它生成的），点击它时，卡片会被导出为动图，自动下载到你的设备，然后你就可以把图片发到任何地方了。 <!-- id: C4EHdrzAGo0YxxxE1LqcDI4gnPe -->

来告诉 Claude 我们的需求： <!-- id: FOcTdqsRuoRTgOxNnd7chFTJnDg -->


添加一个按钮，
   - 将卡片轮播内容导出为 gif 动图
   - 自动下载，文件名为"猫咪-[名字].gif" <!-- id: MH4tdN3jBoIlFrxp4iScMfk7nTc -->
   - 按钮尽量不要显眼（以免破坏美观） <!-- id: FKe6dLWe3obLMIxsBs5c1Rruntc --> <!-- id: XIjbdE1HWoelj6xFSCycYRrFnBb -->

完成这个功能后，你就可以点击"保存为图片"按钮，卡片会被导出为一张精美的图片并自动下载到你的设备。然后打开微信，把图片发送给朋友或发到朋友圈。 <!-- id: WmM1d2dvsoalLdxy8BhcKDX5nCc -->

![Image](assets/Y82Dbhyx1oMMZqxREWycAgfznbh.png) <!-- id: VUj6dp4uFouNsDxeRUZcMaPSnRf -->

最后，别忘了提交一下这次代码修改的成果。 <!-- id: Cwo2dHJLqoXA8jxf5EEc6TFDnGb -->

#### 发布 <!-- id: Hfgddzry0osFMGxAlSZcvxyCn0d -->

随着项目功能的增加，你很快就会感受到分享的不便了：仅仅分享截图或者动图不够，要整个网站！而且哪有只能本机访问的网页呢？无论百度还是微博，不都是有个网址，在浏览器上输入就能看到么。 <!-- id: AaGIdU37ro1Ptcxb3WEc3wj5n0b -->

如果按照传统的软件开发思路，这时候你就需要租一台云服务器，把生成好的网页和图片上传到服务器，配置可访问的端口，再购买一个域名，然后把域名的解析地址指向自己的服务器，为了让浏览器不报警，可能还要申请一个 https 证书。 <!-- id: LOUKdlpjaoXdHDxPlMNcpOuInlg -->

好在，现在有很多服务帮我们做这件事儿。比如 Vercel, Cloudfare, Netlify 等等，因为之前已经用到了 github，这里我们就基于 github page 来发布自己的页面。 <!-- id: QNp6dWGf2ok4FRxofXFcdQmDnhb -->

##### 部署到 GitHub Pages：让全世界都能访问你的网页 <!-- id: GShQdURB7oEmlLx5jArcFxFNnvb -->

什么是 GitHub Pages? <!-- id: OuCFdGwQToyPPDxh8RuccMYXnxd -->

GitHub Pages 是 GitHub 提供的免费网页托管服务。简单来说，它可以把你的 HTML 文件变成一个真正可以访问的网站，就像打开百度、淘宝那样。 <!-- id: Ei3LdTdCdoV7UCxEUDjcFo8Ln5f -->

启用 GitHub Pages 的步骤： <!-- id: RJDadiXg3o6aEPxCQ3UcYdclnIf -->

GitHub Pages 的设置需要在浏览器中操作，但非常简单。对 Claude 说： <!-- id: Hy3Qdei78oFMB4x1GAucECXnn5g -->


打开我的 GitHub 仓库 <!-- id: Vqpnd08A4oWWyjxomBbcLOQPnEg --> <!-- id: MckAdRr03otwwvx1Gvscu5dznyd -->

浏览器会打开你的仓库页面。然后按照以下步骤操作： <!-- id: JiZPdXL4joIthaxtRPscDg5znQf -->


1：进入设置页面 <!-- id: CsQZdEj2oopr8zxpUnLcoSDGnfh -->
在仓库页面顶部，找到并点击 Settings（设置）标签。 <!-- id: BPIpdSBUYoR4s3xvyV4cbQoTnce -->
2：找到 Pages 设置 <!-- id: EdIkd0rInomvYYxteswcaMran3g -->
在左侧菜单中，向下滚动找到 Pages 选项，点击进入。 <!-- id: RXBvdQHBjo0meBxNrzFc1Hp6nTw -->
3：选择发布源 <!-- id: SnRgd99iToR4GAxa5n1cMqQXnZf -->
在 "Source"（源）部分：
1. 点击下拉菜单，选择 Deploy from a branch（从分支部署） <!-- id: Ipr3d6A2Ro2W7KxzVeKccp67nEd -->
2. 在 "Branch" 下拉菜单中选择 main <!-- id: Bt91dOwUPovO9MxeTnPcA9win6b -->
3. 文件夹选择 / (root)（根目录） <!-- id: TksPdPdgyo5G2qxyjdkcZl0Snxg -->
4. 点击 Save（保存） <!-- id: Dsrhdgi3GohfJUxaqMNcguPjnUy --> <!-- id: XadSd7eieo3OX1xb2YOcBmeVnIg -->
4：等待部署完成 <!-- id: SdJFdapPnoHJpzxshgFcSqU3nSf -->
保存后，GitHub 会自动开始部署。页面顶部会显示：Your site is live at https://你的用户名.github.io/miao/ <!-- id: HIMldZ1vuoEI8tx2j6BcF7VHnMe -->
通常需要 1-3 分钟完成部署。你可以刷新页面查看状态。 <!-- id: UcqydKMXloJECHxrKi8cKSI1n3d -->
5：访问你的在线网站 <!-- id: QrvXdr8FVoaBUExVSlYcvuONnCd -->
部署完成后，点击那个链接，或者在浏览器中输入：https://你的用户名.github.io/miao/ <!-- id: CPBrdTWcio76pixgalmcNaT0nve --> <!-- id: JfHsdxAJ0oDxnox8CRkcZWIsnEd -->

 <!-- id: F8cad9Te0onluOx7Bftcp9Ttnzc -->

成就感时刻：你的猫咪展示卡片出现在了一个真正的网站上！任何人只要有这个链接，都能访问你的作品！快去和朋友们分享吧。 <!-- id: VfB1deR6doWZHVx8q3rcJ3tpnch -->

 <!-- id: UHUIdipIWoUCJWxDylAcsEOdnWh -->

如果你觉得每次都要在浏览器里操作太麻烦，也可以让 Claude 帮你配置自动部署。对 Claude 说： <!-- id: J5bldyMUgo10lQxOQtjcE7ZvnLd -->


帮我配置 GitHub Actions，实现自动部署到 GitHub Pages <!-- id: YrvmdzQ0koXJYHx73EEclD70n4c --> <!-- id: MyOUdWzrJonKlBxboedc7X3ynNh -->

Claude 会创建一个配置文件 .github/workflows/deploy.yml，以后每次推送代码，GitHub 会自动部署最新版本到网站。 <!-- id: L3pldfCQZoIFsgxvIqYc5awUnhf -->

#### 数据共享 <!-- id: DkCXdITeFohyiYx9zJJcyFginTf -->

当你和朋友们玩儿一会儿喵宇宙的网站后，会觉得有些不对劲儿：怎么我们都访问同一个页面了，但是各自上传的照片，编辑的信息，还是彼此看不到呢？ <!-- id: XSfMd5fDxoZuihxLbkucIaJEn2S -->

这是因为咱们之前，照片和信息都是保存在浏览器缓存中的，这些缓存仍然在本机，互相无法共享，在编程的世界，一切信息都是数据，所以为了能互相看到彼此的信息，我们还要实现数据的共享。 <!-- id: EbjkduHEbo3swOxrzEIceymbnae -->

这时候就要引入前后端的概念了。简单来说，我们要把自己的程序拆成两部分，一部分用来展示，还是运行在浏览器中，称为前端；一部分用来存储，放在一台共享的机器上（一般叫服务器），称为后端。这样你和朋友们就可以通过这台服务器共享所有的猫猫照片了。 <!-- id: BQjBdT5ixo7CfaxlggtcQJennZc -->

![Image](assets/CYNBbJ57eoMNtPxibRZcwyPinAd.png) <!-- id: G1s5d8MOyoTVNyxZGNscMlQEnae -->

 <!-- id: AjHid0EtDoI5SExGHugcnpgunXg -->

从图里可以看出：只要数据都存在中间这个服务器上，你就可以和朋友们共享猫猫美图了。 <!-- id: LEYkdpLFRobTSbxOItLcFdBQndh -->


小贴士：你应该经常从新闻里看到，互联网企业招聘什么“前端程序员”、“后端程序员”之类的，说的就是他们各自擅长的编写在不同地方运行的程序。不过今天咱们这个 ai 打工人，可是个前后端通才，可以把所有工作都交给它。 <!-- id: I4uldSnivonv7zxiJfncRSGmnKg --> <!-- id: IylXdkcT2oHC46xyEpocK900n0c -->

##### 存储 <!-- id: MQmod14xKomzRdxgmOCcTVmLnpc -->

开始下一步之前，我们先思考一下，到底有哪些数据需要保存呢？ <!-- id: RMYfdQFmjoHy6GxBwpFclikNnRh -->

 <!-- id: Z3SXdwWqBoaBzfxAOaccOIpdnZc -->

 <!-- id: E5QTdgJk5orkLUxxOAlcDRsWnHe -->

 <!-- id: RYQVdw89PocLGFxqPzJcIEP4nNf -->

这都是我们要保存的内容，哪怕不懂编程，凭直觉也能感觉到它们有些不同：名字和信息都是文本和数字信息，而照片是像素组成的图片。通常来说，保存文本和数字信息用到的技术叫数据库，而保存图片这类文件的技术叫做对象存储。 <!-- id: BmYUdWnqFoI6YaxxKPycatsGnJh -->

###### 数据库存储（Databse） <!-- id: ZBlPdK7Qro9Y4XxHA88cupIsneg -->

数据库里面保存数据的基本单元叫做表（table），它和我们平时使用的 excel 表很像，也是分为行列的，比如咱们的猫猫信息，就可以用这样的表来存储： <!-- id: ZhQNd9ASQoYaZjxyW7ycQhzon7g -->

cats <!-- id: Fqxcd0lTbo07FOxb2whc9FrWnyq -->



编号 <!-- id: MS18dip9ioC6dwxm5gzc2U8Enig --> <!-- id: TeXPdpb9ho0ARVxaDpdcFPHEnAc -->

名字 <!-- id: KhocdtXvDotQLfxMnWTcG19FnKc --> <!-- id: CDcLdZkt6ofKzgx9QWzc6wLunYb -->

品种 <!-- id: RAZfdx3AEoXBeDx8khXcA6ynnLg --> <!-- id: GWj6dRz1uo4EozxpDuvcixTNnIf -->

年龄 <!-- id: Z0stdroTzortSTxB8yvcjHBsn6f --> <!-- id: Gmg4ddbs6otMuZx7vFjc2JFCnBg -->

性别 <!-- id: XXrhd8u1uop5ZVxDHhbcteAVnRe --> <!-- id: RMLedUiVjoL20hxnpbJcQ9FlnSb -->

描述 <!-- id: EEPEdgctWowyVTxKJe4cXFC9nah --> <!-- id: ATpedKee3omF5DxbCEEcyfl3nTf -->

标签 <!-- id: ZXIndKRCQoJw8nxbEtwceKMHnGd --> <!-- id: GmyxdcqQOou8ZHx6CxbcTlR3n5b -->

1 <!-- id: Bca0dhGicoRfhCxtPAncEE7OnSc --> <!-- id: GERqdS2nyouWqYxKw9ucSy7Wnhb -->

小橘 <!-- id: TSvFdpbdqoHvYsxz6UKcyp5nnKh --> <!-- id: Vbjwdvf3joL7DYxOKdjc1PRbnse -->

橘猫 <!-- id: F9Ubdj1e3ouVNCxdHRycUGhXn8w --> <!-- id: SsEWdd99Jof0VexXKSRcdJWznAd -->

2 <!-- id: ONb2dvCiPoBCHDxsSeAcAr0mnAb --> <!-- id: RZTldYWISo8njkxgy4Scso8wnUe -->

男 <!-- id: KuZzd5lPzo6CBzxzIwVceVsinFb --> <!-- id: JR7ud9ulCoENSTxNF52cGVMUnYc -->

性格温顺，喜欢晒... <!-- id: WbdSdSCrUonkBcxPhxcclpchn1w --> <!-- id: E8iJdmqSVoeC61xwmZ1ckhKlnRb -->

温顺、亲人、吃货 <!-- id: UmdtdRKRHorgImxezvgcUZZXnBd --> <!-- id: Q9pndhMJdoICaZxqSUAcAS6QnWg -->

2 <!-- id: ECc3dvyjHoKFXuxXr1mc81zKnWg --> <!-- id: UQridqcusoIRzFxG1F6cAJz3n3d -->

雪球 <!-- id: SfEFdysWhoAEPoxEL8Tc5QEmntd --> <!-- id: FieIduuIBoeMOmxleIxcxsphnfh -->

英短 <!-- id: TZ4fdJAFLoGPTBxNPuucog4QnR6 --> <!-- id: QRuudmIq9o4hd2xiwzTcd5G6nzd -->

1 <!-- id: QEEGdFVZuo548UxRlDycDsFGny6 --> <!-- id: N6AXd8HcqolqsIxbirScZcwHnyf -->

女 <!-- id: JxDpdpUG6of0AXxZJVqcr8DtnUf --> <!-- id: TzkJd1Or3oUAAKx9c97cMV25nEh -->

优雅的小公主... <!-- id: IW2mdrTV4o2Z4Nx27eLcVk1Snbg --> <!-- id: PBlodLw2fotKClxpx1McFBBSnHf -->

优雅、安静 <!-- id: LwIqdxGXooJ6wzxabM5clH1SnIe --> <!-- id: WKLFd983uo7oLbxiAdaczvo3nnc -->

 <!-- id: H95cdDdbioi9IAxRwsYcW4d1nPd --> <!-- id: R4pHdObzwoeN3gxyTaIcNFbOnxd -->

 <!-- id: NxHAdQwizoxRAkxR0fmcjErynPf --> <!-- id: WDBadPxrjoRuMIxXpiXctCznn1e -->

 <!-- id: MiG3dNtXUoccJLxJSEicao21nvh --> <!-- id: If32duSjCov57DxxTnkcJerqnih -->

 <!-- id: AgWWdWc1ToyroVx8AgncR9ghnBb --> <!-- id: LCpkdXAiroYiPex3dOOcmW9WnJc -->

 <!-- id: LUFUdq0sSoyCsgxOjMMcDcROnxc --> <!-- id: AxURdw1J4ocnPZxrAfAc3A2CnLe -->

 <!-- id: FGDWdNJlooThtQxw8VycbkW0nYf --> <!-- id: MJU6dYCITopxHPxHex9cQlwYnUf -->

 <!-- id: NKamdowTEoqM99xvQnXcgonVnBb --> <!-- id: Tn2SdxPRvoZgjuxgyXqcNtXpngf --> <!-- id: EE7Xd10psoZa6Tx4stgcsFc3n6d -->

###### 对象存储（Object Storage） <!-- id: ZC9Rd9HeKoM1G5xUwiUcTVpPnog -->

对象存储非常简单，就是前端可以把文件上传，服务器接收这个文件以后，保存起来，并且给它分配一个 url  地址，这样所有人就都能从浏览器中访问这个文件了。URL 大概长这个样子：https://vswrhnmhumfxgfrwpfwc.supabase.co/storage/v1/object/public/cat-images/6/1762661050243_tw65sc.png <!-- id: L9KCdl3b6oBjJ4xcYLzcebRcnre -->

你可能会有一点疑惑：这个 url，跟我们在 Github Page 上部署自己的网页，获取的 url 很像啊，只是长一点？对，实际上他们的存储和访问技术也是很像的，HTML 页面也是一个文件嘛。不过它们的使用场景还是有些不同： <!-- id: PWaOdKLfEoZ6Usx8u9tccNJZnjc -->

之前我们的 HTML 页面，是由程序员（就是你呀）编写并上传的，一般用户（比如你的朋友们）只是访问和查看。通常上传不会很频繁，毕竟需要编写更新了才会有一次上传嘛；总的文件数也不会太多；所以通过 git action action 来处理就足够了，哪怕普通用命令行上传也完全够用 <!-- id: Ma9edL5AVotiJWx5KbVcoHSSngg -->

而对象存储的内容不同：设想一下，如果咱们的“喵宇宙”项目有了千百万的用户，每时每刻都有人想上传自己爱喵的照片，就需要有专门的技术来应对这种非常频繁又大量的文件保存了，这就是对象存储的意义。 <!-- id: LZ4Sd0RVwomuJTxsLMEccNxDncf -->

仔细看上面的 url 的话，还会发现：上传后的文件名，都有很长的一串字符1762661050243_tw65sc.png，看上去没什么意义，这也是对象存储的标准做法：通过特定的算法，保证上传后的文件，有自己“唯一”的名字，这样成千上万的文件之间就不会重名。 <!-- id: NM7rdQViVoqnGVx9iqdcRdLqnOf -->


小贴士：我们以后看到技术相关的文章，可能会遇到一个词儿，叫数据持久化，其实它就是我们前面提到的数据存储——因为只有存起来，数据才不会消失，下次启动程序的时候，还能看到它们。这个词儿，是从作用的角度来表达数据存储的。从这个意义上说：之前我们提到的浏览器本地存储，本章节讲到的数据库和文件，都属于数据持久化的范畴，只是持久化的位置不同。 <!-- id: EWEodB0A7oupHOxwwZxcYwvEnP8 --> <!-- id: WHPqdHUi8oSIJGxpkabcVsvLnfg -->

 <!-- id: HOt5dQSMco0hvvxJWJrc47snnb2 -->

##### 创建 supabase 项目 <!-- id: PEHWdLzT3ov3DjxeOvocJb4MnXg -->

经典编程模式中，我们需要写后端程序来实现对数据库和对象存储的控制，然后再开放 API 接口给前端程序，相互沟通，整个过程变得比较复杂（当然也是有价值的，我们最终会把项目变成这种模式，但目前还不需要）。 <!-- id: Rp8edrwm1oKf3xxADijcKsgRnzd -->

对于很多练习性的小项目来说，我们难免会想：就不能让前端程序直接连接数据存储么？可以的，有需求就有供给：一些云服务厂商，就提供了这样面向互联网，前端可以直接访问的存储服务，其中的佼佼者就是 supabase。可以说，几乎所有 vibe coding 的云服务商，都接入了 supabase 的数据存储能力，它就是 ai 编程时代的标配。 <!-- id: VVEfdgsmLoBQYMxawoPc0bTnnxc -->

 <!-- id: Tv18d0AhpobQhqxgWzOcHoBknTf -->

 <!-- id: Si1Yd0PMZoy9OsxZYOacsQoMnQh -->

![Image](assets/G8rgbwDrJoG2PrxrvPXcEDWpnfe.png) <!-- id: Q6ScdPvqgodvXdxpaqEcUOMjnXb -->

 <!-- id: R46UdAdNYogo8rxGI7EcQLw9nJc -->

![Image](assets/CF9Lbxlwbof5dYxu2eIcddtfnUb.png) <!-- id: XbnDdQv1GoIznfx3xRpcWt3Qnyh -->

##### 创建数据表 <!-- id: ZvyzdxD3to5aLmxmvhlcreETnfc -->

现在有了project，我们就可以创建数据表了： <!-- id: BSaWdJzNEoGxoexcdpXchZ58nTd -->

 <!-- id: RZaYdqtDdocFTHxCCHscdtXRnWg -->

 <!-- id: GxMpdh0eSocsNixf2VZcatjdnDc -->

 <!-- id: IXEfd1bt8o9xuWxAmb3cdTGgnQg -->


![Image](assets/XFj4bp6Q3omacaxHVnqcV8k0nbc.png) <!-- id: PylPdPwhMogObPxB82HcAwz3n1b -->
![Image](assets/YLk0bjBNDoi3FDxi6cmchXNWnmf.png) <!-- id: HRazdt1oaorLV0xamFdc5bEQnye -->
 <!-- id: EJMbdEeHHoXRQUxOpoxcB3qlnYD -->
![Image](assets/VG5ibC0IMotaalxwaZScv6U3n5c.png) <!-- id: X9VddOvBIoYMJaxCMsDcgj9Tn8f -->
 <!-- id: DV8bd04UZo9bNxxkG9qcsobFnzc -->
 <!-- id: PQjodnqbAoYrhhxCV1WcDXlRnKd -->
 <!-- id: L22DdTj4uoqGSPxr0lCcipfwnVf -->
 <!-- id: HT2DddQBAo277wx2cducbermn5c -->
 <!-- id: XfLZdtuFSodqM3xLsQVcOWkFnab -->
 <!-- id: Ye33d2udeoKT10xfLt2czjyjnQe -->
 <!-- id: RIaudzMPHoNpLox8um7ciHsPn8c -->
 <!-- id: WgtpdclscoVrpdxAfrFcTG8InEb -->
 <!-- id: OdC2d4nOzorkeJxqEcOcs7lOnlc -->
![Image](assets/IBu4bTXvZowJgOxK0Iscza2vnCc.png) <!-- id: FfspdY4hMoPZxkxfXqicBNuXnHh -->
上面有很多字段，还需要选中 "Is Nullable" 的对钩，因为它们可能没有值，比如小猫还不知道性别，收养的猫不确定年龄等等。 <!-- id: AN3AdHq8To1a21xRDr5cncYQnLh --> <!-- id: Z3JddIkd9oIXAbxmGP0cUEdtn3d -->


小贴士：数据表和它的字段定义，也叫做数据结构，一般来说，在正式开发一个项目之前，我们需要先把数据结构定下来，它就是我们的“定海神针”，相当于一句话里的名词。 <!-- id: UOxYdGdrSo73QdxmziacrNTAnd9 --> <!-- id: X4aHdtoSHoBSakxS0X6cnflmnQf -->

现在这个数据表，我们已经可以保存数据啦，它右侧会展示一个 unrestricted 图标，表示没有被权限设置保护起来，拿到链接的任何人都可以访问和修改，不过现在还不用担心。 <!-- id: CYcUdEEfMogSlgxXlZTcsQUrnie -->

![Image](assets/AANnbEjKDo5bySxoYJzcSdGonXm.png) <!-- id: HrsOdm5k6ozO2mxlbyDcNFwjnKg -->

点击这个表名，就能查看里面的数据，当然，现在还是空的。 <!-- id: F3VKdJkp6oY9vOx0N8rcN6bWnpb -->

 <!-- id: ITp6dN5qgoczF3xJnOkcU80unQd -->

##### 创建对象存储 <!-- id: NJpPdaFkIoWkh7xXEfic3WgunWf -->

回到项目界面，选择 "Storage"，进入存储的设置： <!-- id: QonHdCXGoo9vWdxl20yc64oEngd -->

![Image](assets/L6vib0GbuolfaExhm9ic2P5nngg.png) <!-- id: WGCodKhLPocHeyx8TSmcqE4snhd -->

需要在这里，给自己创建一个桶（bucket），所谓桶，就是个文件的容器，大概可以看做 windows 电脑上的 C 盘、D盘吧。 <!-- id: DMzFdMp5Josic0xsij0c2BBEnHf -->

![Image](assets/RRBtb8E6dopNB4xWwHyciTm1nFf.png) <!-- id: O1lDdW2Haos4vLxAYXycUHf3n4e -->

我们给这个新桶起名叫 "cat-images"，打开 "public" 开关，让所有人都可以上传下载。 <!-- id: ZAuFdXc0doM2wlxBNIzcF394nEb -->

![Image](assets/GO0hbY8z4o5pzHxEVbicRyDXnAc.png) <!-- id: E7SodSP8Zoqlyjx4kLec76Lyn9e -->

##### 共享数据存储 <!-- id: CA8ndEEXWoadjIxLIu4cnrdBnFd -->

现在准备工作都已经完成，可以修改页面代码，把图片保存到对象存储，信息保存到数据库啦。 <!-- id: Q7vqddjIuo9dEzxoAOIcWKK0nlc -->

首先我们来修改 prd.md，把刚才新建的数据库表，补充到文件中: <!-- id: QsLldGkwloBeIOxKmeNcmxmAnBg -->

```
### 连接串
```
postgresql://postgres:[YOUR_PASSWORD]@db.xxxxx.supabase.co:5432/postgres
```
### 表结构
```sql
create table public.cats (
  id bigint generated by default as identity not null,
  name character varying not null,
  breed character varying null,
  age numeric null,
  sex smallint null,
  description text null,
  tags character varying null,
  created_at timestamp with time zone not null default now(),
  updated_at timestamp without time zone null default now(),
  images text[] null,
  constraint cat_pkey primary key (id)
) TABLESPACE pg_default;
```
### RLS 策略配置：
数据库已配置公开访问策略，允许所有人读写。
``` <!-- id: DqyTd6uxCo0DedxCsbwch9q7nee -->

其中连接串的具体值，在 supabase database 的 connect 设置中可以获取到： <!-- id: HPMRdcnWgo0CaWx6kIzcgSP5n0g -->

![Image](assets/ZMi8bHZNeoqGWzxWLeRcxNzrnXA.png) <!-- id: LITEdOPrXoZJD3xvy6mcKJRFnZd -->

而表结构可以在 cats 表菜单项的 "copy table schema" 中获取： <!-- id: A3GmdPFbHoPJ2gxUHoncP2rMn2g -->

![Image](assets/SznBbpitro8arexo4oecbQzdnyh.png) <!-- id: AkBIdEId9ovSh1xu8cGcLsYunBc -->

表达表结构的语言叫做 SQL，它是一种数据库专用的语言，告诉数据库如何查询和处理数据。几乎所有的关系型数据库，都支持标准的 SQL 语言。想初步了解的同学，可以阅读廖雪峰老师的 SQL 简介。 <!-- id: WbN1duHFWo1CPVxYUJIcWQ2qnje -->

准备好 prd.md 之后，我们就可以让 cc 做一次深度修改了： <!-- id: ZxsQdvq5YoZAKgxS1xAcZ3lmnag -->


现在，按照新的 prd，把数据存储在 supabase 表中 <!-- id: J2JxdFfWuoW687xCzLDcVDIDnde --> <!-- id: DR7adYRR7ouMp7xyLkgcjXZlnUh -->

有的时候，就是“话越少，事儿越大”：这次 cc 工作了很久，终于得到一个新页面，它在启动的时候，会首先初始化数据库连接： <!-- id: Anr0dAp00or7yyx31NHcbIfdnvg -->

```
        // Supabase configuration - Supabase 配置
        // TODO: 请在 Supabase Dashboard > Settings > API 中获取正确的 anon key
        // 参考 supabase-config-guide.md 文件获取详细步骤
        const SUPABASE_URL = 'https://vswrhnmhumfxgfrwpfwc.supabase.co';
        const SUPABASE_ANON_KEY = '【supabase annon key here】'; // 请替换为实际的 anon key

        // Initialize Supabase client - 初始化 Supabase 客户端
        let supabase = null;
        let supabaseEnabled = false;

        try {
            if (SUPABASE_ANON_KEY !== 'YOUR_SUPABASE_ANON_KEY_HERE') {
                supabase = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
                supabaseEnabled = true;
                console.log('✓ Supabase 客户端已初始化');
            } else {
                console.warn('⚠ Supabase 未配置，请在代码中设置 SUPABASE_ANON_KEY');
                console.warn('参考 supabase-config-guide.md 获取配置方法');
            }
        } catch (error) {
            console.error('Supabase 初始化失败:', error);
        }
``` <!-- id: WSvndxPpPo4YYUxsP1rcf9zMnTd -->

并且加载猫猫数据的时候，也不再从浏览器缓存中读取，而是直接读数据库了： <!-- id: XiqwdBjJ6otgP6xPf6DcFEg7nUe -->

```
        /**
         * Load cats from database
         * 从数据库加载猫咪数据
         * @returns {Promise<Array>} - Array of cat data
         */
        async function loadCatsFromDatabase() {
            // Check if Supabase is enabled - 检查是否启用了 Supabase
            if (!supabaseEnabled || !supabase) {
                console.warn('Supabase 未启用，使用默认数据');
                return null;
            }

            try {
                const { data, error } = await supabase
                    .from('cats')
                    .select('*')
                    .order('id', { ascending: true });

                if (error) {
                    console.error('从数据库加载失败:', error);
                    return null;
                }

                // Convert database format to app format - 转换数据库格式到应用格式
                return data.map(dbCat => ({
                    id: dbCat.id,
                    name: dbCat.name,
                    breed: dbCat.breed || '未知品种',
                    age: dbCat.age ? `${dbCat.age}岁` : '未知',
                    gender: dbCat.sex === 1 ? '公' : dbCat.sex === 2 ? '母' : '未知',
                    description: dbCat.description || '暂无描述',
                    // Use images from database if available, otherwise use default - 如果数据库有图片则使用，否则使用默认图片
                    images: (dbCat.images && dbCat.images.length > 0)
                        ? dbCat.images
                        : ["https://images.unsplash.com/photo-1574158622682-e40e69881006?w=500&h=400&fit=crop"],
                    badge: '数据库',
                    tags: dbCat.tags ? dbCat.tags.split(',').map(t => t.trim()).filter(t => t) : []
                }));
            } catch (error) {
                console.error('加载数据时出错:', error);
                return null;
            }
        }
``` <!-- id: UA25d8Xxdo12VuxaNkgcJ8w4nYg -->

此时打开页面，不要吃惊，一只猫猫都没了😄。原因很简单，咱们的数据库中，cats 表还是空的呢。 <!-- id: VPIWd4jO9ob0NwxLGXHcpksLnbg -->

我们当然可以在 supabase 页面里，点击 cats 表，手工编辑几只猫猫的信息，不过既然有 ai 帮我们干活，那还是偷个懒吧，直接说： <!-- id: RsjcdViwhojeuWx31xecT0XpnGd -->


现在项目已经可以连接 supabase了，帮我原来的演示数据，都插入到 supabase 表中 <!-- id: LZsDdWSRLoWU7Hxx8y0cM4Vsn1c --> <!-- id: SSwwdZRXKoJx4Wxrk2fc0GD8njg -->

cc 会贴心地帮我们创建一个工具页面： <!-- id: FfdAdxYVgoe5WJxU16iclHGkngg -->

![Image](assets/N6jAbjzCYoaQRCxAQLocYo9MnVd.png) <!-- id: IHFzdRI5sobPJmxuKNdchN5BnDK -->

插入演示数据成功后，页面就会恢复成最初的样子，看起来一切好像没有变化，但当你联系朋友们，就会发现情况不一样了：无论你编辑的信息，还是朋友编辑的，都可以随时让对方看到啦。 <!-- id: SV6YdVhrrow7QWxhxDYc7JxpnCd -->

##### 共享图片 <!-- id: SeYzdSxtUoCN0pxpqAncKEYwn9d -->

下面用同样的方法，共享图片的存储。首先编辑 prd.md，增加下面两句： <!-- id: BbRLdhTYHomPvXxx6uCcnoW3nBb -->

```
### Supabase Storage 配置：
**Storage Bucket**: `cat-images`
- 用于存储猫咪照片
- Public bucket（公开访问）
- 文件组织：`{catId}/{timestamp}_{randomString}.{ext}`
``` <!-- id: NRVcdjhnioMrgWxgiuYcJQ49nff -->

因为对象存储本质上，就是在上传/下载文件，而上传后的文件，不会保留原来的名字了（要不然所有人都上传，存储文件夹就很容易重名），所以这里我们给上传后的文件名，定了个规矩：都是按照猫咪 id + 当前时间 + 随机字符串来拼接的。 <!-- id: VqlVdvt8VojwXIxRIx2cUJBKnYd -->

然后再跟 cc 说： <!-- id: QMDmdjaGlo5uHIxoxt4c1zp8n3d -->


现在，可以把照片存储，也修改为存在 supabase storage 了 <!-- id: BCHrdazxcoXD5Yx7Gsac0TW0ntc --> <!-- id: UIneduifPonsNwxNmMscpzcvn1c -->

于是文件上传的代码也改变了，变成了下面这个函数： <!-- id: OUQPdm3SJoMPTax8F8kcP3Uinze -->

```
        /**
         * Upload image to Supabase Storage
         * 上传图片到 Supabase Storage
         * @param {File} file - Image file
         * @param {number} catId - Cat ID
         * @returns {Promise<string>} - Public URL of uploaded image
         */
        async function uploadImageToStorage(file, catId) {
            if (!supabaseEnabled || !supabase) {
                console.error('uploadImageToStorage: Supabase 未启用');
                throw new Error('Supabase 未启用');
            }

            // Generate unique filename - 生成唯一文件名
            const timestamp = Date.now();
            const fileExt = file.name.split('.').pop();
            const randomStr = Math.random().toString(36).substring(7);
            const fileName = `${timestamp}_${randomStr}.${fileExt}`;
            const filePath = `${catId}/${fileName}`;

            console.log(`uploadImageToStorage: 文件路径 = ${filePath}`);
            console.log(`uploadImageToStorage: 文件大小 = ${file.size} bytes`);
            console.log(`uploadImageToStorage: 文件类型 = ${file.type}`);

            // Upload file - 上传文件
            console.log('uploadImageToStorage: 调用 supabase.storage.upload()...');
            const { data, error } = await supabase.storage
                .from('cat-images')
                .upload(filePath, file, {
                    cacheControl: '3600',
                    upsert: false
                });

            if (error) {
                console.error('uploadImageToStorage: 上传失败', error);
                console.error('uploadImageToStorage: 错误详情:', JSON.stringify(error, null, 2));
                throw error;
            }

            console.log('uploadImageToStorage: 上传成功', data);

            // Get public URL - 获取公开 URL
            const { data: urlData } = supabase.storage
                .from('cat-images')
                .getPublicUrl(filePath);

            const publicUrl = urlData.publicUrl;
            console.log(`uploadImageToStorage: 公开 URL = ${publicUrl}`);

            return publicUrl;
        }
``` <!-- id: ORGgdycZ8oGMrgxwia6cSLtancc -->

核心就是这一句： <!-- id: HIy3dLUZ5oWdcSxIAEec18cQnzf -->

```
const { data, error } = await supabase.storage
                .from('cat-images')
                .upload(filePath, file, {
                    cacheControl: '3600',
                    upsert: false
                });
``` <!-- id: HMqldj3ZdoBzb3x7o5zcaTUHnZd -->

把选中的文件，上传到我们事先创建好的cat-images 桶中。 <!-- id: YhXYdtvegoqsSHxRNg9c95Connd -->

##### 享受共享时光 <!-- id: QUupdJ45Kovrzox6N3bc6phYnFc -->

现在，让我们再次提交所有的修改，访问已发布好的网页，上传自己真实的猫猫照片，和朋友们一起享受美好时光吧！ <!-- id: J1cAddT9io3xb8x1eAzcsi1JnJe -->

反正我已经上传了： <!-- id: VOjudjIlboTUaHxFc4acHjBnnJb -->

![Image](assets/GfNsbgxMmolpEexiegpcmxY1nNf.png) <!-- id: OtOldPQVYoxYtfxt2kycu88nn7b -->

#### 用户管理 <!-- id: ILLedutkUoXCUNx5t6nceQ9rnPb -->

到目前为止，我们的喵宇宙已经实现了你和朋友之间的共享，不过它还有不足：每个人都有自己的猫猫呀，我创建的猫咪信息和上传的照片，怎么别人也能修改？对，这当然不行。聪明的你肯定会想到，应该有个用户登录/注册的功能吧？这样上传的猫猫就有归属了，每个人只能修改自己上传的，不能改别人的。 <!-- id: YHUQdIOHTomv3fxDkjpcSjk6nmh -->

##### Supabase 设置 <!-- id: K32vdN0k0oPNVrxOZ11cJFrvn6e -->

用户管理，本来有一整套挺复杂的逻辑，涉及用户、角色、权限分配之类的，幸运的是，supabase 已经帮我们内置好了。 <!-- id: OodQdYTCDo0qhixJjIPcpFp5n1c -->

让我们回到 supabase 的管理页面，在左侧菜单中选择 authentication <!-- id: LZWxdCzX2o5K3QxNhlFckBlbn2b -->

![Image](assets/K2uObGNH9obsebx0gtAc7fFjnhc.png) <!-- id: JAtDdr4ipoI1fPxHY5wcuqfYnIh -->

然后，在二级菜单中选择 Sign In / Providers <!-- id: JUeNdWGw7oNUQkx3ts1c2MSanyc -->

![Image](assets/UmNGbmApEo3hzvxp0cJchKt9nNg.png) <!-- id: UZZpdLLHdoktKaxEpPycHziOnSb -->

重点配置一下 Users Signups 部分，也就是注册的能力： <!-- id: KcuudxbP6oMWJOxzf2icwq9Dnxb -->

![Image](assets/BsNNbib62ownKkx5xGtcZVYwn2f.png) <!-- id: J1tcdIOl9oig7UxgEBvcWaWwnRb -->

 <!-- id: H0O5dVWqeoXYgzxB1RBc5wtTnuh -->

 <!-- id: ZR59dmHFBoAbu7x8aO1cC1AunVd -->

 <!-- id: BKEYdzEdMoM2e2xYpw8cFMtRnuf -->

##### 代码集成 <!-- id: LuL6dWylJoai8txafA3cgzzxnjd -->

很简单，仍然是一句话任务： <!-- id: NhpSdq8WMoSTgvxRVFvc7qnxn7b -->


现在，基于 supabase 的权限认证功能，来帮我实现登录、注册，以及不同用户对自己猫咪的管理（增删改查）吧 <!-- id: X3BfdPcOdoV0uXx3GZVcKcOenhc --> <!-- id: JlGRdatWQopreVxenUXcxUoNnCe -->

###### 生成配置规则 <!-- id: QjkadbPsFowiqBxQL4TcHqYHnQn -->

执行完成后，会发现 cc 除了修改了 index.html，还生成了一个文档：supabase-config-guide.md；如果没有生成类似文档的话，那最好加一句要求： <!-- id: YL9RdvT9soaAfAxWDGoctkxQnkb -->


帮我生成调整 supabase 表结构和访问规则的语句 <!-- id: Fs3DduYL0op9IHxbsUxcQJCmn6d --> <!-- id: IGp5diRm1odi30xH5Rwc6wpQnFc -->

这个文档的里的语句，需要在 supabase 的 SQL Editor 里执行： <!-- id: SaMidJcG3oEOBhxwFBhcTZgznjb -->

![Image](assets/Gr5AbwmwvoeIHWx8nyWcXARDnAf.png) <!-- id: VmkYdWNa0onk3axdWRvcAnagnsf -->

它大概有这样几个作用： <!-- id: MNwYdqDPeoysw5xuT1IcVnwinxw -->

 <!-- id: Mm7mdIsWMohGccxywJKcmU3qnYf -->

 <!-- id: Zk9YdbkIYoA47wxNUr4cQgeLn5c -->

 <!-- id: KJ7TdgbbCoLDtTx1kWncCZQZnDd -->

###### 新增登录/注册功能 <!-- id: TlDmdYBrHoHTisxmMTdcbtFJn4e -->

现在重新刷新页码，就能看到页面右上角多了两个按钮： <!-- id: XtU4dIciuoGdUSx5hdBcP1eqnkb -->

![Image](assets/B3cjbvFRqoEabWxxJrccgffKn1e.png) <!-- id: FoyJdpOAZo7j4AxeIhscLj8fndh -->

点击“注册”，真的可以创建一个新用户： <!-- id: L0UBdspYGo28LgxK341cROtonnU -->

![Image](assets/M6VObrBN5oZByQxQVSbcm3FmnLc.png) <!-- id: Os5udPRShoe4c7x3I94cBd4fnfb -->

甚至输入完正确的邮箱和密码，点击注册以后，真的会收到一封确认邮件： <!-- id: QNEQd04N3orPF9xFP40cymjTnpb -->

![Image](assets/TwL8bYlVzoXVRcxJlHYc3j1TnQf.png) <!-- id: TP2EdITyjo1L2SxrUJ1cf249n9d -->

确认后，这个邮箱/密码就可以用于登录了，登录成功后，右上角的区域，会展示我们的邮箱，而且多出一个添加猫咪的按钮。 <!-- id: URzTdyvRPoMCJdxAIcocTb2Unb6 -->

![Image](assets/LV22bkFLfo9gRexEKYUcd1aDnnc.png) <!-- id: U7iqdry3ooCIJRxgvJZcyVEcn3g -->

从这里添加的，就是属于自己的猫咪了：按照提示依次填写猫咪信息，再上传照片后，就能得到一只新的猫猫了： <!-- id: VVU0d0sCpoLPLCx8j5fcnykBnTj -->

![Image](assets/BpzvbVyUtomai7xWSWbcaN3Hnjb.png) <!-- id: OIdkdan31oO0TtxlRHScmYuxnVb -->

 <!-- id: Ob3JdEGkJorDbyxLlnMcgffvnAd -->

#####  <!-- id: GDA8dtaVEoa3TSxjuMocgGMynqh -->

现在我们的喵宇宙已经支持多用户了，每个人都可以上传和管理自己的猫咪。但是一个真正的社区，不应该只是单向的展示，还需要互动！让我们为猫咪添加点赞和评论功能，让用户之间可以交流互动。

###### 功能规划 <!-- id: SocialFeaturePlanning -->

我们要实现两个核心的社区互动功能：
- **点赞功能** ❤️：用户可以为喜欢的猫咪点赞，每只猫只能点赞一次
- **评论功能** 💬：用户可以发表评论，分享对猫咪的想法和感受

这两个功能都需要：
1. 新的数据库表来存储数据
2. RLS 策略来控制权限
3. 前端 UI 来展示和操作

###### 数据库设计 <!-- id: InteractionDatabaseDesign -->

首先需要在 Supabase 中创建两张新表：

**likes 表**：存储点赞记录
- `cat_id`: 猫咪ID（外键关联到 cats 表）
- `user_id`: 用户ID（外键关联到 auth.users）
- 联合唯一约束：保证一个用户只能对一只猫点赞一次

**comments 表**：存储评论
- `cat_id`: 猫咪ID
- `user_id`: 用户ID
- `content`: 评论内容
- `created_at`: 创建时间

仍然是熟悉的配方，跟 cc 说一句话任务：

```
帮我实现社区互动功能：点赞和评论。要求：
1. 每个用户对每只猫只能点赞一次
2. 所有人都可以查看点赞和评论
3. 只有登录用户可以点赞和评论
4. 生成数据库配置的 SQL 脚本
```

执行完成后，cc 会生成一个 SQL 配置脚本（类似 `setup-interactions.sql`），在 Supabase SQL Editor 中执行即可。

###### RLS 权限配置 <!-- id: InteractionRLSPolicies -->

配置脚本会自动创建以下 RLS 策略：

**likes 表**：
- 查看权限：所有人（包括未登录用户）
- 添加权限：仅登录用户，且只能以自己的身份点赞
- 删除权限：只能删除自己的点赞

**comments 表**：
- 查看权限：所有人（包括未登录用户）
- 添加权限：仅登录用户，且只能以自己的身份发表
- 修改/删除权限：只能操作自己的评论

这些策略确保了数据安全，防止用户伪造他人身份进行操作。

###### 前端实现 <!-- id: InteractionUIImplementation -->

刷新页面后，你会发现每个猫咪卡片底部多了一个互动区域：

![社区互动界面示意]

**点赞功能**：
1. 点击 ❤️ 按钮即可点赞
2. 已点赞的按钮会变成红色
3. 再次点击可以取消点赞
4. 实时显示点赞数量

**评论功能**：
1. 点击 💬 按钮展开评论区
2. 可以看到其他用户的评论
3. 登录用户可以在输入框中发表评论
4. 评论按时间倒序排列（最新的在上面）
5. 显示评论者的用户名和发表时间

###### 安全防护 <!-- id: InteractionSecurity -->

为了防止 XSS 攻击，所有用户输入的评论内容都会自动进行 HTML 转义处理。这意味着即使用户输入了 `<script>` 等恶意代码，也会被转义为纯文本显示，不会被浏览器执行。

此外，RLS 策略在数据库层面强制执行权限检查，确保：
- 用户只能以自己的身份操作
- 无法通过 API 伪造他人的点赞或评论
- 只能删除自己的内容

###### 体验社区功能 <!-- id: ExperienceSocialFeatures -->

现在，让我们试试新功能：

1. **点赞其他用户的猫咪**：找一只可爱的猫咪，点击 ❤️ 按钮
2. **发表评论**：在评论框中输入你的想法，比如"好可爱的猫猫！"
3. **查看互动**：看看其他用户给你的猫咪点赞和评论了吗？

有了这些互动功能，喵宇宙终于变成了一个真正的社区！用户可以：
- 为喜欢的猫咪点赞，表达喜爱
- 发表评论，分享感受
- 看到自己的猫咪受欢迎程度
- 与其他猫奴交流互动

###### 技术要点总结 <!-- id: InteractionTechSummary -->

这个阶段我们学到了：
1. **数据库关联**：通过外键关联多个表（cats、likes、comments、users）
2. **唯一约束**：使用联合唯一索引防止重复点赞
3. **RLS 策略**：精细化控制增删改查权限
4. **XSS 防护**：对用户输入进行安全转义
5. **实时交互**：通过 Supabase JS SDK 实现即时数据同步

相关文档：
- [互动功能详细说明](../docs/INTERACTIONS.md)
- [数据库配置脚本](../docs/setup-interactions.sql)

##### 阶段8：互动和排行榜 <!-- id: Reh5dHo8SoFnU8xWfkPcp9Mcnmd -->

 <!-- id: OSjod82l7oIE2XxzTO3cRUrgnab -->

#### 代码阅读与学习 <!-- id: AoFJd9BlWo3LyHxIZzrctuolnxh -->

首次深入阅读和理解 AI 生成的代码，学习代码审阅，并通过提问 AI 来解释和理解代码结构，将 Vibe Coding 从“生成”转向“理解”。 <!-- id: NCr1d6nvAokOX0xNowWcBKeknjp -->

 <!-- id: WUn1dqQMuorLWkxVhmBcpODknyh -->

2.5. 深度重构：项目大迭代 <!-- id: BGtddtmWLoUhJmx1otvcaoULnwd -->

实践一次涉及多文件修改的大规模迭代或重构，体验 AI 的跨文件、全项目修改能力。 <!-- id: ZgifdZIn8onbNWxuS3jcPux4nTc -->

 <!-- id: OYCvdoN06ooIUAxa65XcHwGnngd -->

2.6. 底层原理初探：理解设计的价值 <!-- id: FkP2dYSpkoEQ7VxFSlTcvJRXnsd -->

结合项目实现，学习内存、存储、性能、CS 基础等概念，并回顾项目的设计文档，理解为什么需要这些底层约束。 <!-- id: Ab61dAcIooRmJIxsuzicQkRenkd -->

 <!-- id: JmWRdysDooSbe2xFGnKcBssgnDe -->

####  <!-- id: Uu1Cdut5xoVhL1xcrV6cmi7znce -->