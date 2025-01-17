Return-Path: <linux-leds+bounces-3807-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 943ECA1559C
	for <lists+linux-leds@lfdr.de>; Fri, 17 Jan 2025 18:22:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A158161F5E
	for <lists+linux-leds@lfdr.de>; Fri, 17 Jan 2025 17:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7023B19E82A;
	Fri, 17 Jan 2025 17:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="kHHVQKgK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ogy39ARl"
X-Original-To: linux-leds@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A448D25A643;
	Fri, 17 Jan 2025 17:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737134522; cv=none; b=mrljhPNU0ot8qdUjRfXItvRIxsTSUtWDuB0mFNLIqX+n4VhqWskh3C6zJyYFeL4pPfImtD+yqsd1/c6ERCEEgVFfnXCm9FDyqoh6vn3dOHdBkAUBivFnBKJguQQxsBfw3bOhr8UQyndPPL8pdAOibTAvQ5gF8YWKS2i/6rxcrlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737134522; c=relaxed/simple;
	bh=T2tjvu0cAsIDXHkAD4hNiLl9vQPDh8D67NAtbvh6uYI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=s4t+A8fk3G6d4X7wPvcBajSM/fCgkfVUqzL3Oa/Ylxc6T8THVUdJDbz5Ma2WF17V22Q9dNs/jpqg9mdGFpXeJ+TUQr/diM203P1FA3VQHtqceKwZcomANgEWz8UZHSSV0G6ZLj6Q3BhsE2v3UH2X0ExfHUWJ6neDZTOVBzt0JfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=kHHVQKgK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ogy39ARl; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 8BADA1380197;
	Fri, 17 Jan 2025 12:21:58 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Fri, 17 Jan 2025 12:21:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1737134518;
	 x=1737220918; bh=ybK0Mp3DwCuS/lUTRUYzklxDmoAKMSsXPPB4BxSOsfs=; b=
	kHHVQKgKXA7gAwsnJEZ9Bz/rnGjHKSpPB8E+9b9ZVMwT6JChu+JdhNkRY4HD6Mrl
	qWMIwq6zc5u5/H7mhuIM6JJX+mjYUmf9m2ejGM4s8DoW7ycWBlCzD5yVJ5GoaNTI
	EsN+scZ7AMixPaLrzecPDzswOpzLdYkLgMvt5wNpvuT/n5EjWdOLG1kSJoJAijav
	/gF7dTnMapyfRLSHyN5xEA4J9k2HyPoP6OI1D/7P6IiZODM6QAcJk2jFHphGuvnV
	v6cvmiOb2xpoA3gPREZw9UH+c0je3Sgs1DDTpX2TM0HTDpcD3PkCHZUWwjgEqTuJ
	JMMetKe+0rUHqFwQQQPEdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1737134518; x=
	1737220918; bh=ybK0Mp3DwCuS/lUTRUYzklxDmoAKMSsXPPB4BxSOsfs=; b=o
	gy39ARloDcSHwLTDTFMUeuKqKCrPCV1EkeRg0MatjKoZnXCSPRbSBVut9HAtDO30
	pLihPYx4keml1nF/3nxH4ZCKIL2x997aaRXEr3vnQRg/mNAyETc1IY8AQRGrEjB+
	tc/ayR7tWggT+JxWcK6hh7adnlU0yPfWju0Vv01YRR3pX2SyYQ9HiwhwDUXyHyFC
	0FwfQuQevfL8+XnBmKIqHGbtgf9mBx5u4J/Wzv2DzSzi7Gr8sTZN3MQqdfcW5gwd
	bv5Ev8XMPq48hC7xQjR+ovN2geu9DQtWGBfXBwH37IK/HbSjjxsOsSqyB9xA4RQh
	CNYIqNhtmrFkhdOozdD+g==
X-ME-Sender: <xms:tZGKZ_2eY2jE4JPlnzDo-pcPQnMuVyv5OYH2qDx4iBpk7_H7nXm9_g>
    <xme:tZGKZ-EbdDJbYdg5Q0BXMEF8boGFAPKu3s0XSpMZYI3PwD9yVbVYmQRocDdbv_95T
    CgIHUN_xvvKERS6CUY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeifedgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnh
    hovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpefhieeiueeugefgtdeh
    tdduheetffffheegveekjeejgeekudetteegudduteetvdenucffohhmrghinheptghhvg
    gtkhgpshihshhtvghmrdhishenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpd
    hnsggprhgtphhtthhopedujedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghgr
    rhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesgh
    hmrghilhdrtghomhdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtgho
    mhdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtth
    hopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgvvges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepmhgvsehklhhovghnkhdruggvvhdprhgtphhtthhopehpkhhotghhsehl
    vghnohhvohdrtghomh
X-ME-Proxy: <xmx:tZGKZ_5cSJVaha7rv6vamW381aNdtgq2MOdbygL8CQ7ttJ4z_wqrYQ>
    <xmx:tZGKZ004Z9YX27vOwK2gGmArjSL0r7uvmYXzz24yjtuZJ1VN13R8lA>
    <xmx:tZGKZyHrx--gH7cDLVNJbLEbQdx5qXkCX28PQeNiqhG3dw_yWBxRuA>
    <xmx:tZGKZ19fsZabqcc9BAaO6W77CFHEEf8pO0tU7YgpXxH4seNYzbnBtg>
    <xmx:tpGKZwXGl6CvRpfuHKagYByaScsoLehnQPDMtkw1P3tYQzh7r5h-lTFE>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9B3A23C006C; Fri, 17 Jan 2025 12:21:57 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 17 Jan 2025 12:21:36 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Fiona Behrens" <me@kloenk.dev>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Pavel Machek" <pavel@ucw.cz>,
 "Lee Jones" <lee@kernel.org>, "Jean Delvare" <jdelvare@suse.com>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Peter Koch" <pkoch@lenovo.com>, rust-for-linux@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <fe71a5b6-c544-449e-ab50-c85e1ffc0145@app.fastmail.com>
In-Reply-To: <20250113121620.21598-6-me@kloenk.dev>
References: <20250113121620.21598-1-me@kloenk.dev>
 <20250113121620.21598-6-me@kloenk.dev>
Subject: Re: [PATCH v2 5/5] leds: leds_lenovo_se10: LED driver for Lenovo SE10 platform
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Fiona,

On Mon, Jan 13, 2025, at 7:16 AM, Fiona Behrens wrote:
> Add driver for the Lenovo ThinkEdge SE10 LED.
>
> This driver supports controlling the red LED located on the front panel of the
> Lenovo SE10 hardware. Additionally, it supports the hardware-triggered
> functionality of the LED, which by default is tied to the WWAN trigger.
>
> The driver is written in Rust and adds basic LED support for the SE10 platform.
>
> Signed-off-by: Fiona Behrens <me@kloenk.dev>
> ---
>  drivers/leds/Kconfig             |  10 +++
>  drivers/leds/Makefile            |   1 +
>  drivers/leds/leds_lenovo_se10.rs | 132 +++++++++++++++++++++++++++++++

All the other files are called leds-<name>. Should this be leds-lenovo-se10.rs?

>  3 files changed, 143 insertions(+)
>  create mode 100644 drivers/leds/leds_lenovo_se10.rs
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index b784bb74a837..89d9e98189d6 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -223,6 +223,16 @@ config LEDS_TURRIS_OMNIA
>  	  side of CZ.NIC's Turris Omnia router. There are 12 RGB LEDs on the
>  	  front panel.
> 
> +config LEDS_LENOVO_SE10
> +       tristate "LED support for Lenovo ThinkEdge SE10"
> +       depends on RUST
> +       depends on (X86 && DMI) || COMPILE_TEST
> +       depends on HAS_IOPORT
> +       imply LEDS_TRIGGERS
> +       help
> +	This option enables basic support for the LED found on the front of
> +	Lenovo's SE10 ThinkEdge. There is one user controlable LED on the 
> front panel.
> +
>  config LEDS_LM3530
>  	tristate "LCD Backlight driver for LM3530"
>  	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 18afbb5a23ee..2cff22cbafcf 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -37,6 +37,7 @@ obj-$(CONFIG_LEDS_IP30)			+= leds-ip30.o
>  obj-$(CONFIG_LEDS_IPAQ_MICRO)		+= leds-ipaq-micro.o
>  obj-$(CONFIG_LEDS_IS31FL319X)		+= leds-is31fl319x.o
>  obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
> +obj-$(CONFIG_LEDS_LENOVO_SE10)		+= leds_lenovo_se10.o

Same note above on name formatting.

>  obj-$(CONFIG_LEDS_LM3530)		+= leds-lm3530.o
>  obj-$(CONFIG_LEDS_LM3532)		+= leds-lm3532.o
>  obj-$(CONFIG_LEDS_LM3533)		+= leds-lm3533.o
> diff --git a/drivers/leds/leds_lenovo_se10.rs 
> b/drivers/leds/leds_lenovo_se10.rs
> new file mode 100644
> index 000000000000..d704125610a4
> --- /dev/null
> +++ b/drivers/leds/leds_lenovo_se10.rs
> @@ -0,0 +1,132 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//! LED driver for  Lenovo ThinkEdge SE10.
> +
> +use kernel::ioport::{Region, ResourceSize};
> +#[cfg(CONFIG_LEDS_TRIGGERS)]
> +use kernel::leds::triggers;
> +use kernel::leds::{Led, LedConfig, Operations};
> +use kernel::prelude::*;
> +use kernel::time::Delta;
> +use kernel::{c_str, dmi_device_table};
> +
> +module! {
> +    type: SE10,
> +    name: "leds_lenovo_se10",
> +    author: "Fiona Behrens <me@kloenk.dev>",
> +    description: "LED driver for Lenovo ThinkEdge SE10",
> +    license: "GPL",
> +}
> +
> +dmi_device_table!(5, SE10_DMI_TABLE, [
> +    "LENOVO-SE10": [SysVendor: "LENOVO", ProductName: "12NH"],
> +    "LENOVO-SE10": [SysVendor: "LENOVO", ProductName: "12NJ"],
> +    "LENOVO-SE10": [SysVendor: "LENOVO", ProductName: "12NK"],
> +    "LENOVO-SE10": [SysVendor: "LENOVO", ProductName: "12NL"],
> +    "LENOVO-SE10": [SysVendor: "LENOVO", ProductName: "12NM"],
> +]);
> +
> +struct SE10 {
> +    /// Led registration
> +    _led: Pin<KBox<Led<LedSE10>>>,
> +}
> +
> +impl kernel::Module for SE10 {
> +    fn init(_module: &'static ThisModule) -> Result<Self> {
> +        if SE10_DMI_TABLE.check_system().is_none() {
> +            return Err(ENODEV);
> +        }
> +
> +        let led = KBox::try_pin_init(
> +            Led::register(
> +                None,
> +                LedConfig {
> +                    name: Some(c_str!("platform:red:user")),
> +                    #[cfg(CONFIG_LEDS_TRIGGERS)]
> +                    hardware_trigger: Some(kernel::sync::Arc::pin_init(
> +                        triggers::Hardware::register(c_str!("wwan")),

I was curious as to why the "wwan" in here.

> +                        GFP_KERNEL,
> +                    )?),
> +                    ..LedConfig::new(kernel::leds::Color::Red, LedSE10)
> +                },
> +            ),
> +            GFP_KERNEL,
> +        )?;
> +
> +        Ok(Self { _led: led })
> +    }
> +}
> +
> +/// Valid led commands.
> +#[repr(u8)]
> +#[allow(missing_docs)]
> +enum LedCommand {
> +    #[cfg(CONFIG_LEDS_TRIGGERS)]
> +    Trigger = 0xB2,
> +    Off = 0xB3,
> +    On = 0xB4,
> +    Blink = 0xB5,
> +}
> +
> +struct LedSE10;
> +
> +impl LedSE10 {
> +    /// Base address of the command port.
> +    const CMD_PORT: ResourceSize = 0x6C;
> +    /// Length of the command port.
> +    const CMD_LEN: ResourceSize = 1;
> +    /// Blink duration the hardware supports.
> +    const HW_DURATION: Delta = Delta::from_millis(1000);
> +
> +    /// Request led region.
> +    fn request_cmd_region(&self) -> Result<Region<'static>> {
> +        Region::request_muxed(Self::CMD_PORT, Self::CMD_LEN, 
> c_str!("leds_lenovo_se10"))
> +            .ok_or(EBUSY)
> +    }
> +
> +    /// Send command.
> +    fn send_cmd(&self, cmd: LedCommand) -> Result {
> +        let region = self.request_cmd_region()?;
> +        region.outb(cmd as u8, 0);
> +        Ok(())
> +    }
> +}
> +
> +#[vtable]
> +impl Operations for LedSE10 {
> +    type This = Led<LedSE10>;
> +
> +    const MAX_BRIGHTNESS: u8 = 1;
> +
> +    fn brightness_set(this: &mut Self::This, brightness: u8) {
> +        if let Err(e) = if brightness == 0 {
> +            this.data.send_cmd(LedCommand::Off)
> +        } else {
> +            this.data.send_cmd(LedCommand::On)
> +        } {
> +            pr_warn!("Failed to set led: {e:?}\n)")
> +        }
> +    }
> +
> +    fn blink_set(
> +        this: &mut Self::This,
> +        delay_on: Delta,
> +        delay_off: Delta,
> +    ) -> Result<(Delta, Delta)> {
> +        if !(delay_on.is_zero() && delay_off.is_zero()
> +            || delay_on == Self::HW_DURATION && delay_off == 
> Self::HW_DURATION)
> +        {
> +            return Err(EINVAL);
> +        }
> +
> +        this.data.send_cmd(LedCommand::Blink)?;
> +        Ok((Self::HW_DURATION, Self::HW_DURATION))
> +    }
> +}
> +
> +#[vtable]
> +#[cfg(CONFIG_LEDS_TRIGGERS)]
> +impl triggers::HardwareOperations for LedSE10 {
> +    fn activate(this: &mut Self::This) -> Result {
> +        this.data.send_cmd(LedCommand::Trigger)
> +    }
> +}
> -- 
> 2.47.0

I don't have the competence to review the rust code I'm afraid - so my limited feedback above is the best I can do. Not sure it's really worth a reviewed-by tag, but I did read the code and learnt a little about rust in the process (which was fun).

I did test your changes on my SE10 system and it works well.
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Thanks!
Mark

