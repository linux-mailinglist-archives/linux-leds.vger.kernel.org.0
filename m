Return-Path: <linux-leds+bounces-3826-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC70A16AFF
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jan 2025 11:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 622A03A4945
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jan 2025 10:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E61618FC67;
	Mon, 20 Jan 2025 10:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dAh73Wl8"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E18187872;
	Mon, 20 Jan 2025 10:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737370065; cv=none; b=YwJH+2zkKnR0SSKojv/rCXgPGSdYdq70COLZk+1glvu0ajS8sSp9j5NOOTYOv5oZf9S7NeuulsIP4domrYNgKAzs9dLka9/5XS6LfqMRZaI0gqbJKquZecf2C4V9hR9NMKETSmJF9jiCRK4sSesnhtAeKybeysYW5id40WzNs14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737370065; c=relaxed/simple;
	bh=9//lnrNQKLDJWvJY9sOEvSW1GgrAH8nN4Vc9ONNRfTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQFqfscHhspcKfVpt9mcOVEr+2TfutiZTgeqRK+APm5NUy7w3E9EfXdceFe3p3a9eVEsGBJPugbk5f5W/9rEr9lQGg6v/GHqNl4CAuweYwiunIgZUGqkNOeVPUKHuTBoUL6QQUXW5LfWz4uR5SZzM6+8OIZZZ788C4h+IqBjqpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dAh73Wl8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8337C4CEDD;
	Mon, 20 Jan 2025 10:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737370065;
	bh=9//lnrNQKLDJWvJY9sOEvSW1GgrAH8nN4Vc9ONNRfTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dAh73Wl8NyGUzuFmZURKWZw9MlAZyRHY6bJn+fhlKNQj5+T5Kn2xU7IKDHROe6fPT
	 4vEfo2zTW1kFxz+6ePBC7D2s3q8C2beeEjsMax8Q9wnsJYzBKzclBQBNKP1yi9Attc
	 W9+/VU5EyIMrOJksmY9pakXzQoEFtbB6RGe+lN7Cld7VY394anYd+xPn7OZte3iY2y
	 a54LyH3l3iYEYsVP1z1F4kHfINQYYomXfHrqvfZONRk7vvEvYn7KnZ1KjvQXs9oDSE
	 dS4gsmfSC4UH6KjuyN4epOcXTrn79ADGzRt/edhH8OUg3vIZl3JqGs0u3B2s30tqq0
	 1bOtYrtSCcSIA==
Date: Mon, 20 Jan 2025 11:47:35 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Fiona Behrens <me@kloenk.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Peter Koch <pkoch@lenovo.com>, rust-for-linux@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] leds: leds_lenovo_se10: LED driver for Lenovo
 SE10 platform
Message-ID: <h4m7miz4xiejoctkbqaipusrlkhbptwlrdlexcso63232kesjs@5aeoxx6zuik7>
References: <20250113121620.21598-1-me@kloenk.dev>
 <20250113121620.21598-6-me@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113121620.21598-6-me@kloenk.dev>

On Mon, Jan 13, 2025 at 01:16:20PM +0100, Fiona Behrens wrote:
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
> +	Lenovo's SE10 ThinkEdge. There is one user controlable LED on the front panel.
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
>  obj-$(CONFIG_LEDS_LM3530)		+= leds-lm3530.o
>  obj-$(CONFIG_LEDS_LM3532)		+= leds-lm3532.o
>  obj-$(CONFIG_LEDS_LM3533)		+= leds-lm3533.o
> diff --git a/drivers/leds/leds_lenovo_se10.rs b/drivers/leds/leds_lenovo_se10.rs
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

There are currently two LED drivers utilizing the led_hw_trigger_type
mechanism to make certain triggers available only for certain LEDs:
- the leds-cros_ec.c driver, which registers the trigger under the name
  "chromeos-auto", to suggest that activating the trigger on this LED
  will make it blink automatically by hardware and that it is ChromeOS
  specific,
- the leds-turris-omnia.c driver, which registers the trigger under the
  name "omnia-mcu", to suggest that activating the trigger will make the
  LED blinking be controller by the MCU on Turris Omnia.

Using the name "wwan" for this trigger is too general. In the future
someone may want to create a software "wwan" trigger that will be
available for any LED class device, for example...

Please change the name of this LED-private trigger.

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
> +        Region::request_muxed(Self::CMD_PORT, Self::CMD_LEN, c_str!("leds_lenovo_se10"))
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
> +            || delay_on == Self::HW_DURATION && delay_off == Self::HW_DURATION)
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

No deactivation method for the trigger? NACK.

The driver must implement the deactivation method, since LED core
always allows disabling LED triggers. See led-trigger.c function
led_trigger_write(): if "none" is written to the sysfs `trigger`
file, the trigger is removed and the `trigger` file will afterwards
report that no trigger is activated on the LED.

Since you did not implement the deactivation method, this will result
in the system thinking that no LED trigger is selected on the LED,
but in fact your LED's blinking will still be controlled by hardware.

Marek

