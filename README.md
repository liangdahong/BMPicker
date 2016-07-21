<h1>DraedSwift（使用swift仿"阿里云"）</h1>
<blockquote>
<p>准备边学swift边完善这个项目，进度可能有一点慢。如果对你有一定的帮助求<a href="https://github.com/asiosldh/DraedSwift">❤️star</a></p>
<p><a href="https://itunes.apple.com/cn/app/a-li-yun/id981011420?spm=5176.8106753.379550.2.Jd0ZuH&amp;mt=8" target="_blank">阿里云AppStore地址</a></p>
</blockquote>
<h2>1、先欣赏一沟swift的优雅代码(哈哈)</h2>
<div class="cnblogs_code">
<pre><span style="color: #008080;"> 1</span> <span style="color: #0000ff;">class</span><span style="color: #000000;"> DRAlert: UIView {
</span><span style="color: #008080;"> 2</span>     
<span style="color: #008080;"> 3</span>     @IBOutlet weak var titleLabel: UILabel!
<span style="color: #008080;"> 4</span>     @IBOutlet weak var messLabel: UILabel!
<span style="color: #008080;"> 5</span>     @IBOutlet weak var layoutC1: NSLayoutConstraint!
<span style="color: #008080;"> 6</span>     @IBOutlet weak var layoutC2: NSLayoutConstraint!
<span style="color: #008080;"> 7</span>     
<span style="color: #008080;"> 8</span>     <span style="color: #0000ff;">private</span> var cancelBlock: (() -&gt; ()) =<span style="color: #000000;"> {};
</span><span style="color: #008080;"> 9</span>     <span style="color: #0000ff;">private</span> var confirmBlock: (() -&gt; ()) =<span style="color: #000000;"> {};
</span><span style="color: #008080;">10</span> 
<span style="color: #008080;">11</span>     <span style="color: #0000ff;">override</span><span style="color: #000000;"> func awakeFromNib() {
</span><span style="color: #008080;">12</span> <span style="color: #000000;">        super.awakeFromNib();
</span><span style="color: #008080;">13</span>         self.layoutC1.constant = <span style="color: #800080;">0.5</span><span style="color: #000000;">;
</span><span style="color: #008080;">14</span>         self.layoutC2.constant = <span style="color: #800080;">0.5</span><span style="color: #000000;">;
</span><span style="color: #008080;">15</span>         self.frame =<span style="color: #000000;"> UIScreen.mainScreen().bounds;
</span><span style="color: #008080;">16</span>         self.autoresizingMask =<span style="color: #000000;"> UIViewAutoresizing.None;
</span><span style="color: #008080;">17</span> <span style="color: #000000;">    }
</span><span style="color: #008080;">18</span> 
<span style="color: #008080;">19</span>     <span style="color: #0000ff;">internal</span> <span style="color: #0000ff;">class</span> func alert(title: String?, mess: String?, cancelBlock: (() -&gt; ()), confirmBlock: (() -&gt; ())) -&gt;<span style="color: #000000;"> (DRAlert) {
</span><span style="color: #008080;">20</span>         let alert = NSBundle.mainBundle().loadNibNamed(<span style="color: #800000;">"</span><span style="color: #800000;">DRAlert</span><span style="color: #800000;">"</span>, owner: nil, options: nil).first <span style="color: #0000ff;">as</span>!<span style="color: #000000;"> DRAlert;
</span><span style="color: #008080;">21</span>         alert.titleLabel.text =<span style="color: #000000;"> title;
</span><span style="color: #008080;">22</span>         alert.messLabel.text =<span style="color: #000000;"> mess;
</span><span style="color: #008080;">23</span>         alert.cancelBlock =<span style="color: #000000;"> cancelBlock;
</span><span style="color: #008080;">24</span>         alert.confirmBlock =<span style="color: #000000;"> confirmBlock;
</span><span style="color: #008080;">25</span>         <span style="color: #0000ff;">return</span><span style="color: #000000;"> alert;
</span><span style="color: #008080;">26</span> <span style="color: #000000;">    }
</span><span style="color: #008080;">27</span> 
<span style="color: #008080;">28</span>     <span style="color: #0000ff;">internal</span> func show() -&gt;<span style="color: #000000;"> () {
</span><span style="color: #008080;">29</span>         UIApplication.sharedApplication().keyWindow?<span style="color: #000000;">.addSubview(self);
</span><span style="color: #008080;">30</span> <span style="color: #000000;">    }
</span><span style="color: #008080;">31</span> 
<span style="color: #008080;">32</span>     <span style="color: #0000ff;">internal</span> func diss() -&gt;<span style="color: #000000;"> () {
</span><span style="color: #008080;">33</span> <span style="color: #000000;">        self.removeFromSuperview();
</span><span style="color: #008080;">34</span> <span style="color: #000000;">    }
</span><span style="color: #008080;">35</span> 
<span style="color: #008080;">36</span> <span style="color: #000000;">    @IBAction func cancelButtonClick() {
</span><span style="color: #008080;">37</span> <span style="color: #000000;">        self.diss();
</span><span style="color: #008080;">38</span> <span style="color: #000000;">        self.cancelBlock();
</span><span style="color: #008080;">39</span> <span style="color: #000000;">    }
</span><span style="color: #008080;">40</span>     
<span style="color: #008080;">41</span> <span style="color: #000000;">    @IBAction func confirmButtonClick() {
</span><span style="color: #008080;">42</span> <span style="color: #000000;">        self.diss();
</span><span style="color: #008080;">43</span> <span style="color: #000000;">        self.confirmBlock();
</span><span style="color: #008080;">44</span> <span style="color: #000000;">    }
</span><span style="color: #008080;">45</span> }</pre>
</div>
<h2>2、效果图（原app）</h2>
<hr />
<p>&nbsp;</p>
<p>2.1、主页</p>
<p><img title="主页" src="http://images2015.cnblogs.com/blog/724434/201607/724434-20160721082143169-238677257.jpg" alt="主页" />&nbsp;</p>
<hr />
<p>&nbsp;</p>
<p>2.2、控制台</p>
<p><img src="http://images2015.cnblogs.com/blog/724434/201607/724434-20160721082359388-1980193617.jpg" alt="" /></p>
<hr />
<p>&nbsp;</p>
<p>2.3、域名注册</p>
<p><img src="http://images2015.cnblogs.com/blog/724434/201607/724434-20160721082411529-349728365.jpg" alt="" /></p>
<hr />
<p>&nbsp;</p>
<p>&nbsp;</p>
<ul>
<li><a href="https://github.com/asiosldh/DraedSwift">求❤️star </a></li>
<li><a href="http://www.jianshu.com/users/8cd6042f01e8/latest_articles" target="_blank">博客地</a></li>
</ul>
<hr />
<p>&nbsp;</p>
