Return-Path: <linux-leds+bounces-3810-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08627A15642
	for <lists+linux-leds@lfdr.de>; Fri, 17 Jan 2025 19:03:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BBFA7A3C29
	for <lists+linux-leds@lfdr.de>; Fri, 17 Jan 2025 18:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7521A255C;
	Fri, 17 Jan 2025 18:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="gpPIezug";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oSAl/pVQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E32A95C;
	Fri, 17 Jan 2025 18:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737136999; cv=none; b=nIZhD2Q/q55wNvyKwfLpuydwO/Opjwem+Y59o6cJirGyNByqv4+mfZzMbY7IFBUUli0iJpRfmbJEsmImWINJuTgNuHSHFf2SQ/zCl/0Er5GNxHd4m+dGS9p/5HhaQF+ksGaAEk/fQ8kjx6fHsiYL0RBJl9On7odTTZfA0XnqK1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737136999; c=relaxed/simple;
	bh=Qnp3hMrfLMKq3Wf2Ocd9yYmSCpS1w9GszMjuONZFVas=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=BDmvQRqz/YDC8E7MbojFbEXkbBkA+5fnsraXoGGpp0T+vI5ow4YoWyAnP+0QU2j3BoqGSTCgoiXXdu7qsSTXnUmhdvPQfKdDROMMWgbupvYE/nQgVTmjt4Zcfad2FcqrDr4vuphFog8xcPgPQU5pUyeRSS7zxMte2qV9q+DTJVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=gpPIezug; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oSAl/pVQ; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 99A0C114020B;
	Fri, 17 Jan 2025 13:03:15 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Fri, 17 Jan 2025 13:03:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1737136995;
	 x=1737223395; bh=Hkif9yEdlFdPGZ9gD2yW+n/UPPl7TSgmUfKSNtrrPgI=; b=
	gpPIezugwyzOdanB3ah2Mvi6t1wTtEj+lv+I6g322bz2EfpRKQi8Fk0LmdSyE8fb
	CExa/kyCdQsQjgOsxhEDqo18IBM4M0YPpSeyN8KqqMUYokCfPrOLM64KmJWtizv6
	BHVanCDLv0rLz3oFr2j6zROH8IbcQSbJz+YYCL0hnB19R3gQOYFd2OTDo0/uDMpF
	DyOEK4eisMvjEh1WUtbZh8TpnDrWXgWyilgCxfkinPjvflRxXp06Y2eWAWptFxXI
	TIP1DOIRWpJWRHkQWGhupkUW1CntJV9mdYtI4zsqInhno7HkjrYViDT7bE4pw+9R
	wxVt3yl23NKlHAYQEwEkxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1737136995; x=
	1737223395; bh=Hkif9yEdlFdPGZ9gD2yW+n/UPPl7TSgmUfKSNtrrPgI=; b=o
	SAl/pVQRfx2cd+C0dwxjztUxnu1j/jwW1O6sJCK9k3zxb+YjMorpHsNw1VJo+GPf
	IKdleELQhIjS7YXcqbQ3zemVxQ30VDTyyNozLk6Cdfwv23Dy4//Twvg3H4K+Hm3Y
	2souhUDIN8zkcC0io52uXf0RD719nzQdXyjzHGu90KZlPUlyIeVilPLjTisD7rOj
	I5THEHUvY95CdzJ7QvYBOG/GdjtCxktu4TKitY8LdgfXEpsGcKb0ExnIELgS9gGy
	i3584FAmj0XSKss9ATefjjdCroZP2vjAP9Zk4XHZce9QCxfIBiLNbfoN0CmiqtNG
	Ccox0M0CBAmXxlCFWXJGw==
X-ME-Sender: <xms:Y5uKZ-h68x05RlnSo18wGJUvz4nc1_u4etRMj5FmjtKgJaG7j1X_Bw>
    <xme:Y5uKZ_Dg7UYfT3OwyBjc4VpJHDTrEDEigoxaZn3vzTXZcAmTBUg4pXzcxlPs_F1PH
    ocGDoqvv17wgFXRC1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeifedguddtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdforghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvg
    hnohhvohesshhquhgvsggsrdgtrgeqnecuggftrfgrthhtvghrnhephfeiieeuueeggfdt
    hedtudehteffffehgeevkeejjeegkeduteetgeduudettedvnecuffhomhgrihhnpegthh
    gvtghkpghshihsthgvmhdrihhsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    dpnhgspghrtghpthhtohepudejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehg
    rghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegrlhgvgidrghgrhihnohhrse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgt
    ohhmpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpth
    htoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlvggv
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehmvgeskhhlohgvnhhkrdguvghvpdhrtghpthhtohepphhkohgthhes
    lhgvnhhovhhordgtohhm
X-ME-Proxy: <xmx:Y5uKZ2G-AGCfqVGpeJ0VqaSNFYhSrUnqwsllhLv7SsKPN-SmBjIE5Q>
    <xmx:Y5uKZ3Shq2-Usd0k3HeOwSSB51UcSXR5qEFYz8yXeBndvdqJVlq3Ng>
    <xmx:Y5uKZ7y6VWrmPWxyl0ycqipllCVgz3n-OsA-TXRpYzaZHm4nReXuJg>
    <xmx:Y5uKZ14GfPqEm6pE56DAkbfDsnOFHjWLWNrBeEoi9DymANqoLgK4Dw>
    <xmx:Y5uKZ4gHnJvP59Utu1Y-VQw-U17WfzQtoGtK2p7iuaceQaCt1MBgqbnc>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 329823C0068; Fri, 17 Jan 2025 13:03:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 17 Jan 2025 13:02:53 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Fiona Behrens" <me@kloenk.dev>, "Miguel Ojeda" <ojeda@kernel.org>
Cc: "Alex Gaynor" <alex.gaynor@gmail.com>, "Pavel Machek" <pavel@ucw.cz>,
 "Lee Jones" <lee@kernel.org>, "Jean Delvare" <jdelvare@suse.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Peter Koch" <pkoch@lenovo.com>, rust-for-linux@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <4cba946d-f0ef-4ac8-bbdf-bcf2e3d0550b@app.fastmail.com>
In-Reply-To: <28103BB4-F415-45E1-8611-89C02E53E3CE@kloenk.dev>
References: <20250113121620.21598-1-me@kloenk.dev>
 <20250113121620.21598-6-me@kloenk.dev>
 <fe71a5b6-c544-449e-ab50-c85e1ffc0145@app.fastmail.com>
 <28103BB4-F415-45E1-8611-89C02E53E3CE@kloenk.dev>
Subject: Re: [PATCH v2 5/5] leds: leds_lenovo_se10: LED driver for Lenovo SE10 platform
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi

On Fri, Jan 17, 2025, at 12:31 PM, Fiona Behrens wrote:
> Hi,
>
> On 17 Jan 2025, at 18:21, Mark Pearson wrote:
>
>> Hi Fiona,
>>
>> On Mon, Jan 13, 2025, at 7:16 AM, Fiona Behrens wrote:
>>> Add driver for the Lenovo ThinkEdge SE10 LED.
>>>
>>> This driver supports controlling the red LED located on the front panel of the
>>> Lenovo SE10 hardware. Additionally, it supports the hardware-triggered
>>> functionality of the LED, which by default is tied to the WWAN trigger.
>>>
>>> The driver is written in Rust and adds basic LED support for the SE10 platform.
>>>
>>> Signed-off-by: Fiona Behrens <me@kloenk.dev>
>>> ---
>>>  drivers/leds/Kconfig             |  10 +++
>>>  drivers/leds/Makefile            |   1 +
>>>  drivers/leds/leds_lenovo_se10.rs | 132 +++++++++++++++++++++++++++++++
>>
>> All the other files are called leds-<name>. Should this be leds-lenovo-se10.rs?
>
> This does not work with rust, as the rust makefile converts this 
> filename to a rust crate name, and those crate name cannot have dashes 
> in them.
> Not sure if we should fix this to hold to the file name conventions, 
> maybe something for @Miguel to decide

Ah - thanks for the clarification (and to Miguel in the follow up)

>
>>
>>>  3 files changed, 143 insertions(+)
>>>  create mode 100644 drivers/leds/leds_lenovo_se10.rs
>>>
>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>> index b784bb74a837..89d9e98189d6 100644
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -223,6 +223,16 @@ config LEDS_TURRIS_OMNIA
>>>  	  side of CZ.NIC's Turris Omnia router. There are 12 RGB LEDs on the
>>>  	  front panel.
>>>
>>> +config LEDS_LENOVO_SE10
>>> +       tristate "LED support for Lenovo ThinkEdge SE10"
>>> +       depends on RUST
>>> +       depends on (X86 && DMI) || COMPILE_TEST
>>> +       depends on HAS_IOPORT
>>> +       imply LEDS_TRIGGERS
>>> +       help
>>> +	This option enables basic support for the LED found on the front of
>>> +	Lenovo's SE10 ThinkEdge. There is one user controlable LED on the
>>> front panel.
>>> +
>>>  config LEDS_LM3530
>>>  	tristate "LCD Backlight driver for LM3530"
>>>  	depends on LEDS_CLASS
>>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>>> index 18afbb5a23ee..2cff22cbafcf 100644
>>> --- a/drivers/leds/Makefile
>>> +++ b/drivers/leds/Makefile
>>> @@ -37,6 +37,7 @@ obj-$(CONFIG_LEDS_IP30)			+= leds-ip30.o
>>>  obj-$(CONFIG_LEDS_IPAQ_MICRO)		+= leds-ipaq-micro.o
>>>  obj-$(CONFIG_LEDS_IS31FL319X)		+= leds-is31fl319x.o
>>>  obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
>>> +obj-$(CONFIG_LEDS_LENOVO_SE10)		+= leds_lenovo_se10.o
>>
>> Same note above on name formatting.
>>
>>>  obj-$(CONFIG_LEDS_LM3530)		+= leds-lm3530.o
>>>  obj-$(CONFIG_LEDS_LM3532)		+= leds-lm3532.o
>>>  obj-$(CONFIG_LEDS_LM3533)		+= leds-lm3533.o
>>> diff --git a/drivers/leds/leds_lenovo_se10.rs
>>> b/drivers/leds/leds_lenovo_se10.rs
>>> new file mode 100644
>>> index 000000000000..d704125610a4
>>> --- /dev/null
>>> +++ b/drivers/leds/leds_lenovo_se10.rs
>>> @@ -0,0 +1,132 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +//! LED driver for  Lenovo ThinkEdge SE10.
>>> +
>>> +use kernel::ioport::{Region, ResourceSize};
>>> +#[cfg(CONFIG_LEDS_TRIGGERS)]
>>> +use kernel::leds::triggers;
>>> +use kernel::leds::{Led, LedConfig, Operations};
>>> +use kernel::prelude::*;
>>> +use kernel::time::Delta;
>>> +use kernel::{c_str, dmi_device_table};
>>> +
>>> +module! {
>>> +    type: SE10,
>>> +    name: "leds_lenovo_se10",
>>> +    author: "Fiona Behrens <me@kloenk.dev>",
>>> +    description: "LED driver for Lenovo ThinkEdge SE10",
>>> +    license: "GPL",
>>> +}
>>> +
>>> +dmi_device_table!(5, SE10_DMI_TABLE, [
>>> +    "LENOVO-SE10": [SysVendor: "LENOVO", ProductName: "12NH"],
>>> +    "LENOVO-SE10": [SysVendor: "LENOVO", ProductName: "12NJ"],
>>> +    "LENOVO-SE10": [SysVendor: "LENOVO", ProductName: "12NK"],
>>> +    "LENOVO-SE10": [SysVendor: "LENOVO", ProductName: "12NL"],
>>> +    "LENOVO-SE10": [SysVendor: "LENOVO", ProductName: "12NM"],
>>> +]);
>>> +
>>> +struct SE10 {
>>> +    /// Led registration
>>> +    _led: Pin<KBox<Led<LedSE10>>>,
>>> +}
>>> +
>>> +impl kernel::Module for SE10 {
>>> +    fn init(_module: &'static ThisModule) -> Result<Self> {
>>> +        if SE10_DMI_TABLE.check_system().is_none() {
>>> +            return Err(ENODEV);
>>> +        }
>>> +
>>> +        let led = KBox::try_pin_init(
>>> +            Led::register(
>>> +                None,
>>> +                LedConfig {
>>> +                    name: Some(c_str!("platform:red:user")),
>>> +                    #[cfg(CONFIG_LEDS_TRIGGERS)]
>>> +                    hardware_trigger: Some(kernel::sync::Arc::pin_init(
>>> +                        triggers::Hardware::register(c_str!("wwan")),
>>
>> I was curious as to why the "wwan" in here.
>
> This is the hardware trigger, as to the documentation I found from 
> Lenovo the trigger mode gives hardware control to the wwan module if 
> installed in the hardware.
>
Ah - I should probably have known that :) All good.

Mark

