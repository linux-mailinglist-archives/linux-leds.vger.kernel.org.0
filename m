Return-Path: <linux-leds+bounces-3808-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7355A155CA
	for <lists+linux-leds@lfdr.de>; Fri, 17 Jan 2025 18:32:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE11C1642E0
	for <lists+linux-leds@lfdr.de>; Fri, 17 Jan 2025 17:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B1571A262A;
	Fri, 17 Jan 2025 17:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="bk8LZWaP"
X-Original-To: linux-leds@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7253486324;
	Fri, 17 Jan 2025 17:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737135127; cv=none; b=AEjFAWhmUUyI3gKF7XBTlL0TXxmuaAvMijv5LDSyWwxyp+gepdxMvvOft0lJQlNPCp4L/0Ty4BlIGPqZLOztvps3YbRFB1tOmqJ2oTUbN2708VjeDVawRm0zGkA1ymv3+N5lE0OkiJ66rB2D+1oqepzEbFU9d0ErDVRjVyA/IvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737135127; c=relaxed/simple;
	bh=bY4uALpgubPEjqgxjU0eN/i3U6a+it5c5SeiKaidGMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tY+eHpOcUCvNUe9lZ9js9ySTGYn4iR/538KtF9eGake1LAxF+DL72ESbprxCgZoMlepM8XJfTp9HDppOrmqXJNHF+8PFlix+ZYuQ/bZFgfSbFnXaI+VAK89bezOpWAovm2oHk0ktrQ8JtCmPxxlT4Z6OywJK+rTfJq4f4qhAHvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=bk8LZWaP; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1737135113; bh=yb6jj0en9s109nes91IXVOVgdWPz16zhEh4ywBI5h3k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bk8LZWaPa+dBnFkEF4ysyRrigcgvqCFIe/VEfjUMRrFIBejy8DQKIcu5GBfmiZVlb
	 0t9IpJay2UnyCZTLCEg632Jmkjsfy4J/pc3FwIJC2Ief6s997Vgd/Q91+mK9iCRsIY
	 WysKGGSWzc8aJ0N8iHrvEDysvFDtmPfSaQUof+0E=
To: Mark Pearson <mpearson-lenovo@squebb.ca>, Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Peter Koch <pkoch@lenovo.com>,
 rust-for-linux@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] leds: leds_lenovo_se10: LED driver for Lenovo SE10
 platform
Date: Fri, 17 Jan 2025 18:31:51 +0100
Message-ID: <28103BB4-F415-45E1-8611-89C02E53E3CE@kloenk.dev>
In-Reply-To: <fe71a5b6-c544-449e-ab50-c85e1ffc0145@app.fastmail.com>
References: <20250113121620.21598-1-me@kloenk.dev>
 <20250113121620.21598-6-me@kloenk.dev>
 <fe71a5b6-c544-449e-ab50-c85e1ffc0145@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

On 17 Jan 2025, at 18:21, Mark Pearson wrote:

> Hi Fiona,
>
> On Mon, Jan 13, 2025, at 7:16 AM, Fiona Behrens wrote:
>> Add driver for the Lenovo ThinkEdge SE10 LED.
>>
>> This driver supports controlling the red LED located on the front pane=
l of the
>> Lenovo SE10 hardware. Additionally, it supports the hardware-triggered=

>> functionality of the LED, which by default is tied to the WWAN trigger=
=2E
>>
>> The driver is written in Rust and adds basic LED support for the SE10 =
platform.
>>
>> Signed-off-by: Fiona Behrens <me@kloenk.dev>
>> ---
>>  drivers/leds/Kconfig             |  10 +++
>>  drivers/leds/Makefile            |   1 +
>>  drivers/leds/leds_lenovo_se10.rs | 132 ++++++++++++++++++++++++++++++=
+
>
> All the other files are called leds-<name>. Should this be leds-lenovo-=
se10.rs?

This does not work with rust, as the rust makefile converts this filename=
 to a rust crate name, and those crate name cannot have dashes in them.
Not sure if we should fix this to hold to the file name conventions, mayb=
e something for @Miguel to decide

>
>>  3 files changed, 143 insertions(+)
>>  create mode 100644 drivers/leds/leds_lenovo_se10.rs
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index b784bb74a837..89d9e98189d6 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -223,6 +223,16 @@ config LEDS_TURRIS_OMNIA
>>  	  side of CZ.NIC's Turris Omnia router. There are 12 RGB LEDs on the=

>>  	  front panel.
>>
>> +config LEDS_LENOVO_SE10
>> +       tristate "LED support for Lenovo ThinkEdge SE10"
>> +       depends on RUST
>> +       depends on (X86 && DMI) || COMPILE_TEST
>> +       depends on HAS_IOPORT
>> +       imply LEDS_TRIGGERS
>> +       help
>> +	This option enables basic support for the LED found on the front of
>> +	Lenovo's SE10 ThinkEdge. There is one user controlable LED on the
>> front panel.
>> +
>>  config LEDS_LM3530
>>  	tristate "LCD Backlight driver for LM3530"
>>  	depends on LEDS_CLASS
>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>> index 18afbb5a23ee..2cff22cbafcf 100644
>> --- a/drivers/leds/Makefile
>> +++ b/drivers/leds/Makefile
>> @@ -37,6 +37,7 @@ obj-$(CONFIG_LEDS_IP30)			+=3D leds-ip30.o
>>  obj-$(CONFIG_LEDS_IPAQ_MICRO)		+=3D leds-ipaq-micro.o
>>  obj-$(CONFIG_LEDS_IS31FL319X)		+=3D leds-is31fl319x.o
>>  obj-$(CONFIG_LEDS_IS31FL32XX)		+=3D leds-is31fl32xx.o
>> +obj-$(CONFIG_LEDS_LENOVO_SE10)		+=3D leds_lenovo_se10.o
>
> Same note above on name formatting.
>
>>  obj-$(CONFIG_LEDS_LM3530)		+=3D leds-lm3530.o
>>  obj-$(CONFIG_LEDS_LM3532)		+=3D leds-lm3532.o
>>  obj-$(CONFIG_LEDS_LM3533)		+=3D leds-lm3533.o
>> diff --git a/drivers/leds/leds_lenovo_se10.rs
>> b/drivers/leds/leds_lenovo_se10.rs
>> new file mode 100644
>> index 000000000000..d704125610a4
>> --- /dev/null
>> +++ b/drivers/leds/leds_lenovo_se10.rs
>> @@ -0,0 +1,132 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +//! LED driver for  Lenovo ThinkEdge SE10.
>> +
>> +use kernel::ioport::{Region, ResourceSize};
>> +#[cfg(CONFIG_LEDS_TRIGGERS)]
>> +use kernel::leds::triggers;
>> +use kernel::leds::{Led, LedConfig, Operations};
>> +use kernel::prelude::*;
>> +use kernel::time::Delta;
>> +use kernel::{c_str, dmi_device_table};
>> +
>> +module! {
>> +    type: SE10,
>> +    name: "leds_lenovo_se10",
>> +    author: "Fiona Behrens <me@kloenk.dev>",
>> +    description: "LED driver for Lenovo ThinkEdge SE10",
>> +    license: "GPL",
>> +}
>> +
>> +dmi_device_table!(5, SE10_DMI_TABLE, [
>> +    "LENOVO-SE10": [SysVendor: "LENOVO", ProductName: "12NH"],
>> +    "LENOVO-SE10": [SysVendor: "LENOVO", ProductName: "12NJ"],
>> +    "LENOVO-SE10": [SysVendor: "LENOVO", ProductName: "12NK"],
>> +    "LENOVO-SE10": [SysVendor: "LENOVO", ProductName: "12NL"],
>> +    "LENOVO-SE10": [SysVendor: "LENOVO", ProductName: "12NM"],
>> +]);
>> +
>> +struct SE10 {
>> +    /// Led registration
>> +    _led: Pin<KBox<Led<LedSE10>>>,
>> +}
>> +
>> +impl kernel::Module for SE10 {
>> +    fn init(_module: &'static ThisModule) -> Result<Self> {
>> +        if SE10_DMI_TABLE.check_system().is_none() {
>> +            return Err(ENODEV);
>> +        }
>> +
>> +        let led =3D KBox::try_pin_init(
>> +            Led::register(
>> +                None,
>> +                LedConfig {
>> +                    name: Some(c_str!("platform:red:user")),
>> +                    #[cfg(CONFIG_LEDS_TRIGGERS)]
>> +                    hardware_trigger: Some(kernel::sync::Arc::pin_ini=
t(
>> +                        triggers::Hardware::register(c_str!("wwan")),=

>
> I was curious as to why the "wwan" in here.

This is the hardware trigger, as to the documentation I found from Lenovo=
 the trigger mode gives hardware control to the wwan module if installed =
in the hardware.

>
>> +                        GFP_KERNEL,
>> +                    )?),
>> +                    ..LedConfig::new(kernel::leds::Color::Red, LedSE1=
0)
>> +                },
>> +            ),
>> +            GFP_KERNEL,
>> +        )?;
>> +
>> +        Ok(Self { _led: led })
>> +    }
>> +}
>> +
>> +/// Valid led commands.
>> +#[repr(u8)]
>> +#[allow(missing_docs)]
>> +enum LedCommand {
>> +    #[cfg(CONFIG_LEDS_TRIGGERS)]
>> +    Trigger =3D 0xB2,
>> +    Off =3D 0xB3,
>> +    On =3D 0xB4,
>> +    Blink =3D 0xB5,
>> +}
>> +
>> +struct LedSE10;
>> +
>> +impl LedSE10 {
>> +    /// Base address of the command port.
>> +    const CMD_PORT: ResourceSize =3D 0x6C;
>> +    /// Length of the command port.
>> +    const CMD_LEN: ResourceSize =3D 1;
>> +    /// Blink duration the hardware supports.
>> +    const HW_DURATION: Delta =3D Delta::from_millis(1000);
>> +
>> +    /// Request led region.
>> +    fn request_cmd_region(&self) -> Result<Region<'static>> {
>> +        Region::request_muxed(Self::CMD_PORT, Self::CMD_LEN,
>> c_str!("leds_lenovo_se10"))
>> +            .ok_or(EBUSY)
>> +    }
>> +
>> +    /// Send command.
>> +    fn send_cmd(&self, cmd: LedCommand) -> Result {
>> +        let region =3D self.request_cmd_region()?;
>> +        region.outb(cmd as u8, 0);
>> +        Ok(())
>> +    }
>> +}
>> +
>> +#[vtable]
>> +impl Operations for LedSE10 {
>> +    type This =3D Led<LedSE10>;
>> +
>> +    const MAX_BRIGHTNESS: u8 =3D 1;
>> +
>> +    fn brightness_set(this: &mut Self::This, brightness: u8) {
>> +        if let Err(e) =3D if brightness =3D=3D 0 {
>> +            this.data.send_cmd(LedCommand::Off)
>> +        } else {
>> +            this.data.send_cmd(LedCommand::On)
>> +        } {
>> +            pr_warn!("Failed to set led: {e:?}\n)")
>> +        }
>> +    }
>> +
>> +    fn blink_set(
>> +        this: &mut Self::This,
>> +        delay_on: Delta,
>> +        delay_off: Delta,
>> +    ) -> Result<(Delta, Delta)> {
>> +        if !(delay_on.is_zero() && delay_off.is_zero()
>> +            || delay_on =3D=3D Self::HW_DURATION && delay_off =3D=3D
>> Self::HW_DURATION)
>> +        {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        this.data.send_cmd(LedCommand::Blink)?;
>> +        Ok((Self::HW_DURATION, Self::HW_DURATION))
>> +    }
>> +}
>> +
>> +#[vtable]
>> +#[cfg(CONFIG_LEDS_TRIGGERS)]
>> +impl triggers::HardwareOperations for LedSE10 {
>> +    fn activate(this: &mut Self::This) -> Result {
>> +        this.data.send_cmd(LedCommand::Trigger)
>> +    }
>> +}
>> -- =

>> 2.47.0
>
> I don't have the competence to review the rust code I'm afraid - so my =
limited feedback above is the best I can do. Not sure it's really worth a=
 reviewed-by tag, but I did read the code and learnt a little about rust =
in the process (which was fun).
>
> I did test your changes on my SE10 system and it works well.
> Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Thanks a lot,
Fiona

>
> Thanks!
> Mark

