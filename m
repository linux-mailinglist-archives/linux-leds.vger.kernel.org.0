Return-Path: <linux-leds+bounces-7784-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDcyODln52ld7wEAu9opvQ
	(envelope-from <linux-leds+bounces-7784-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 14:02:01 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E599843A638
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 14:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2F8D304564E
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 12:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4EC3A1685;
	Tue, 21 Apr 2026 12:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azj5ioZF"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA0D38C401;
	Tue, 21 Apr 2026 12:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776772803; cv=none; b=eYOt8NNX4R+jSaldavFGeb9nkNlUeLg8d8mOMCNfj1PnfXYshArQfayo810/TCaY0gN2OuG9k+FRaEaCGanuyXruCKxi0iGvfOijmTXL0KD7LtLiJnIUY4/5a9qe1rxxVPwm0AigmeoSzxm2dQxOjPYfOq1p7oL29Y8WUDxVeWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776772803; c=relaxed/simple;
	bh=OhhA5IHzEVtgzRcJ6wB2LpeOir82R2n0lgr1nerKDAE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=smuZRw41ELpZ/CvQFrkL8teAI4fMfZ5B+JDKZUjoEXinyO3xRLnuqViy/+YZ52HW/+o2+DKCC1CwTuhEMmUpbFCnB8/8UoE8Gn/tJG5NFrS3Dlwq81UhDpSeVnOJXhcX6AeZuj9zAJmoTh32Xi/xqxecOR05fRt/mF2U/AqrPx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azj5ioZF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776772801; x=1808308801;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=OhhA5IHzEVtgzRcJ6wB2LpeOir82R2n0lgr1nerKDAE=;
  b=azj5ioZFQu+54ZTzCUAi5lUzOmo5W0Ci/fjIFU8NQDLIbJz5BfIrl32g
   8Mz+UA22h1WblE1ohfaWzM86REAZTqVOAVunuhP8yjtpXHeyAATZ1HHC/
   2JGRHrS3Z71tduv0Mcx/Ldvs3Cqm3IJZKkfYFMPJekamE7poem/T8uuEJ
   h1Upfec7gePIWDRVI2lygI+58OIJwptq+CJeYmtZ/IMpxFkedW4z3/Ztf
   Q25MFdlTIWDkzjiJ/SCEYL2WT8c5efF1yGvCmwxT2vbrVY78tIRXxZ3Z0
   qeThM/xdzzUAnJJ0hWOkYxcrAtSi3cAxQzoL2nzWIy/Lc46BS5vmLPavR
   g==;
X-CSE-ConnectionGUID: CzgxIWESSAKo09k+E+rqRg==
X-CSE-MsgGUID: ktGlB9ATSDCl3Sk3N/+P4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88318613"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="88318613"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 04:59:59 -0700
X-CSE-ConnectionGUID: jYr8bTofRWStpl2NXVjiYA==
X-CSE-MsgGUID: l13upw/0RAOTY8LHZX4fFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="236029766"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.105])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 04:59:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Apr 2026 14:59:47 +0300 (EEST)
To: Markus Probst <markus.probst@posteo.de>
cc: Hans de Goede <hansg@kernel.org>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Lee Jones <lee@kernel.org>, 
    Pavel Machek <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
    Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
    =?ISO-8859-15?Q?Bj=F6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
    Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
    Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
    Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, 
    devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 2/2] platform: Add initial synology microp driver
In-Reply-To: <20260420-synology_microp_initial-v8-2-7946a9124491@posteo.de>
Message-ID: <6104a5fe-a6e3-4c35-ff4f-731d1a5e4acb@linux.intel.com>
References: <20260420-synology_microp_initial-v8-0-7946a9124491@posteo.de> <20260420-synology_microp_initial-v8-2-7946a9124491@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7784-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[intel.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-leds@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,intel.com:dkim,posteo.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E599843A638
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 20 Apr 2026, Markus Probst wrote:

> Add a initial synology microp driver, written in Rust.
> The driver targets a microcontroller found in Synology NAS devices. It
> currently only supports controlling of the power led, status led, alert
> led and usb led. Other components such as fan control or handling
> on-device buttons will be added once the required rust abstractions are
> there.
> 
> This driver can be used both on arm and x86, thus it goes into the root
> directory of drivers/platform.
> 
> Tested successfully on a Synology DS923+.
> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  MAINTAINERS                                        |   6 +
>  drivers/platform/Kconfig                           |   2 +
>  drivers/platform/Makefile                          |   1 +
>  drivers/platform/synology_microp/Kconfig           |  13 +
>  drivers/platform/synology_microp/Makefile          |   3 +
>  drivers/platform/synology_microp/TODO              |   7 +
>  drivers/platform/synology_microp/command.rs        |  54 ++++
>  drivers/platform/synology_microp/led.rs            | 281 +++++++++++++++++++++
>  drivers/platform/synology_microp/model.rs          |  49 ++++
>  .../platform/synology_microp/synology_microp.rs    | 110 ++++++++
>  10 files changed, 526 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c1c686846cdd..49f08290eed0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25555,6 +25555,12 @@ F:	drivers/dma-buf/sync_*
>  F:	include/linux/sync_file.h
>  F:	include/uapi/linux/sync_file.h
>  
> +SYNOLOGY MICROP DRIVER
> +M:	Markus Probst <markus.probst@posteo.de>

You should probably add:

L:	platform-driver-x86@vger.kernel.org

Through which tree the patches to this driver are generally expected to be 
picked up?

> +S:	Maintained
> +F:	Documentation/devicetree/bindings/embedded-controller/synology,ds1825p-microp.yaml
> +F:	drivers/platform/synology_microp/
> +
>  SYNOPSYS ARC ARCHITECTURE
>  M:	Vineet Gupta <vgupta@kernel.org>
>  L:	linux-snps-arc@lists.infradead.org
> diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
> index 312788f249c9..996050566a4a 100644
> --- a/drivers/platform/Kconfig
> +++ b/drivers/platform/Kconfig
> @@ -22,3 +22,5 @@ source "drivers/platform/arm64/Kconfig"
>  source "drivers/platform/raspberrypi/Kconfig"
>  
>  source "drivers/platform/wmi/Kconfig"
> +
> +source "drivers/platform/synology_microp/Kconfig"
> diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
> index fa322e7f8716..2381872e9133 100644
> --- a/drivers/platform/Makefile
> +++ b/drivers/platform/Makefile
> @@ -15,3 +15,4 @@ obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
>  obj-$(CONFIG_ARM64_PLATFORM_DEVICES)	+= arm64/
>  obj-$(CONFIG_BCM2835_VCHIQ)	+= raspberrypi/
>  obj-$(CONFIG_ACPI_WMI)		+= wmi/
> +obj-$(CONFIG_SYNOLOGY_MICROP)	+= synology_microp/
> diff --git a/drivers/platform/synology_microp/Kconfig b/drivers/platform/synology_microp/Kconfig
> new file mode 100644
> index 000000000000..7c4d8f2808f0
> --- /dev/null
> +++ b/drivers/platform/synology_microp/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config SYNOLOGY_MICROP
> +	tristate "Synology Microp driver"
> +	depends on LEDS_CLASS && LEDS_CLASS_MULTICOLOR
> +	depends on RUST_SERIAL_DEV_BUS_ABSTRACTIONS
> +	help
> +	  Enable support for the MCU found in Synology NAS devices.
> +
> +	  This is needed to properly shutdown and reboot the device, as well as
> +	  additional functionality like fan and LED control.
> +
> +	  This driver is work in progress and may not be fully functional.
> diff --git a/drivers/platform/synology_microp/Makefile b/drivers/platform/synology_microp/Makefile
> new file mode 100644
> index 000000000000..63585ccf76e4
> --- /dev/null
> +++ b/drivers/platform/synology_microp/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-y += synology_microp.o
> diff --git a/drivers/platform/synology_microp/TODO b/drivers/platform/synology_microp/TODO
> new file mode 100644
> index 000000000000..1961a33115db
> --- /dev/null
> +++ b/drivers/platform/synology_microp/TODO
> @@ -0,0 +1,7 @@
> +TODO:
> +- add missing components:
> +  - handle on-device buttons (Power, Factory reset, "USB Copy")
> +  - handle fan failure
> +  - beeper
> +  - fan speed control
> +  - correctly perform device power-off and restart on Synology devices

Is this TODO list really needed within the kernel distribution?

If you planning on add these features (relatively) soon yourself (perhaps 
depending on when the rust infra required for these features becomes 
available), the list would not be that useful for other developers at all.

> diff --git a/drivers/platform/synology_microp/command.rs b/drivers/platform/synology_microp/command.rs
> new file mode 100644
> index 000000000000..430cb858e1c3
> --- /dev/null
> +++ b/drivers/platform/synology_microp/command.rs
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::{
> +    device::Bound,
> +    error::Result,
> +    serdev, //
> +};
> +
> +use crate::led;
> +
> +#[expect(
> +    clippy::enum_variant_names,
> +    reason = "future variants will not end with Led"
> +)]
> +pub(crate) enum Command {
> +    PowerLed(led::State),
> +    StatusLed(led::StatusLedColor, led::State),
> +    AlertLed(led::State),
> +    UsbLed(led::State),
> +    EsataLed(led::State),
> +}
> +
> +impl Command {
> +    pub(crate) fn write(self, dev: &serdev::Device<Bound>) -> Result {
> +        dev.write_all(
> +            match self {
> +                Self::PowerLed(led::State::On) => &[0x34],
> +                Self::PowerLed(led::State::Blink) => &[0x35],
> +                Self::PowerLed(led::State::Off) => &[0x36],
> +
> +                Self::StatusLed(_, led::State::Off) => &[0x37],
> +                Self::StatusLed(led::StatusLedColor::Green, led::State::On) => &[0x38],
> +                Self::StatusLed(led::StatusLedColor::Green, led::State::Blink) => &[0x39],
> +                Self::StatusLed(led::StatusLedColor::Orange, led::State::On) => &[0x3A],
> +                Self::StatusLed(led::StatusLedColor::Orange, led::State::Blink) => &[0x3B],
> +
> +                Self::AlertLed(led::State::On) => &[0x4C, 0x41, 0x31],
> +                Self::AlertLed(led::State::Blink) => &[0x4C, 0x41, 0x32],
> +                Self::AlertLed(led::State::Off) => &[0x4C, 0x41, 0x33],
> +
> +                Self::UsbLed(led::State::On) => &[0x40],
> +                Self::UsbLed(led::State::Blink) => &[0x41],
> +                Self::UsbLed(led::State::Off) => &[0x42],
> +
> +                Self::EsataLed(led::State::On) => &[0x4C, 0x45, 0x31],
> +                Self::EsataLed(led::State::Blink) => &[0x4C, 0x45, 0x32],
> +                Self::EsataLed(led::State::Off) => &[0x4C, 0x45, 0x33],
> +            },
> +            serdev::Timeout::Max,
> +        )?;
> +        dev.wait_until_sent(serdev::Timeout::Max);
> +        Ok(())
> +    }
> +}
> diff --git a/drivers/platform/synology_microp/led.rs b/drivers/platform/synology_microp/led.rs
> new file mode 100644
> index 000000000000..f89998a7e6b4
> --- /dev/null
> +++ b/drivers/platform/synology_microp/led.rs
> @@ -0,0 +1,281 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::{
> +    device::Bound,
> +    devres::{
> +        self,
> +        Devres, //
> +    },
> +    led::{
> +        self,
> +        LedOps,
> +        MultiColorSubLed, //
> +    },
> +    new_mutex,
> +    prelude::*,
> +    serdev,
> +    str::CString,
> +    sync::Mutex, //
> +};
> +use pin_init::pin_init_scope;
> +
> +use crate::{
> +    command::Command,
> +    model::Model, //
> +};
> +
> +#[pin_data]
> +pub(crate) struct Data {
> +    #[pin]
> +    status: Devres<led::MultiColorDevice<StatusLedHandler>>,
> +    power_name: CString,
> +    #[pin]
> +    power: Devres<led::Device<LedHandler>>,
> +}
> +
> +impl Data {
> +    pub(super) fn register<'a>(
> +        dev: &'a serdev::Device<Bound>,
> +        model: &'a Model,
> +    ) -> impl PinInit<Self, Error> + 'a {
> +        pin_init_scope(move || {
> +            if let Some(color) = model.led_alert {
> +                let name = CString::try_from_fmt(fmt!("{}:alarm", color.as_c_str().to_str()?))?;
> +                devres::register(
> +                    dev.as_ref(),
> +                    led::DeviceBuilder::new().color(color).name(&name).build(
> +                        dev,
> +                        try_pin_init!(LedHandler {
> +                            blink <- new_mutex!(false),
> +                            command: Command::AlertLed,
> +                        }),
> +                    ),
> +                    GFP_KERNEL,
> +                )?;
> +            }
> +
> +            if model.led_usb_copy {
> +                devres::register(
> +                    dev.as_ref(),
> +                    led::DeviceBuilder::new()
> +                        .color(led::Color::Green)
> +                        .name(c"green:usb")
> +                        .build(
> +                            dev,
> +                            try_pin_init!(LedHandler {
> +                                blink <- new_mutex!(false),
> +                                command: Command::UsbLed,
> +                            }),
> +                        ),
> +                    GFP_KERNEL,
> +                )?;
> +            }
> +
> +            if model.led_esata {
> +                devres::register(
> +                    dev.as_ref(),
> +                    led::DeviceBuilder::new()
> +                        .color(led::Color::Green)
> +                        .name(c"green:esata")
> +                        .build(
> +                            dev,
> +                            try_pin_init!(LedHandler {
> +                                blink <- new_mutex!(false),
> +                                command: Command::EsataLed,
> +                            }),
> +                        ),
> +                    GFP_KERNEL,
> +                )?;
> +            }
> +
> +            Ok(try_pin_init!(Self {
> +                status <- led::DeviceBuilder::new()
> +                    .color(led::Color::Multi)
> +                    .name(c"multicolor:status")
> +                    .build_multicolor(
> +                        dev,
> +                        try_pin_init!(StatusLedHandler {
> +                            blink <- new_mutex!(false),
> +                        }),
> +                        StatusLedHandler::SUBLEDS,
> +                    ),
> +                power_name: CString::try_from_fmt(fmt!(
> +                    "{}:power",
> +                    model.led_power.as_c_str().to_str()?
> +                ))?,
> +                power <- led::DeviceBuilder::new()
> +                    .color(model.led_power)
> +                    .name(power_name)
> +                    .build(
> +                        dev,
> +                        try_pin_init!(LedHandler {
> +                            blink <- new_mutex!(true),
> +                            command: Command::PowerLed,
> +                        }),
> +                    ),
> +            }))
> +        })
> +    }
> +}
> +
> +#[derive(Copy, Clone)]
> +pub(crate) enum StatusLedColor {
> +    Green,
> +    Orange,
> +}
> +
> +#[derive(Copy, Clone)]
> +pub(crate) enum State {
> +    On,
> +    Blink,
> +    Off,
> +}
> +
> +#[pin_data]
> +struct LedHandler {
> +    #[pin]
> +    blink: Mutex<bool>,
> +    command: fn(State) -> Command,
> +}
> +
> +/// Blink delay measured using video recording on DS923+ for Power and Status Led.
> +///
> +/// We assume it is the same for all other leds and models.
> +const BLINK_DELAY: usize = 167;

On C side time related consts are required to include the unit in their 
name. Perhaps Rust code should also follow this convention?

-- 
 i.

> +
> +#[vtable]
> +impl LedOps for LedHandler {
> +    type Bus = serdev::Device<Bound>;
> +    type Mode = led::Normal;
> +    const BLOCKING: bool = true;
> +    const MAX_BRIGHTNESS: u32 = 1;
> +
> +    fn brightness_set(
> +        &self,
> +        dev: &Self::Bus,
> +        _classdev: &led::Device<Self>,
> +        brightness: u32,
> +    ) -> Result<()> {
> +        let mut blink = self.blink.lock();
> +        (self.command)(if brightness == 0 {
> +            *blink = false;
> +            State::Off
> +        } else if *blink {
> +            State::Blink
> +        } else {
> +            State::On
> +        })
> +        .write(dev)?;
> +
> +        Ok(())
> +    }
> +
> +    fn blink_set(
> +        &self,
> +        dev: &Self::Bus,
> +        _classdev: &led::Device<Self>,
> +        delay_on: &mut usize,
> +        delay_off: &mut usize,
> +    ) -> Result<()> {
> +        let mut blink = self.blink.lock();
> +
> +        (self.command)(if *delay_on == 0 && *delay_off != 0 {
> +            State::Off
> +        } else if *delay_on != 0 && *delay_off == 0 {
> +            State::On
> +        } else {
> +            *blink = true;
> +            *delay_on = BLINK_DELAY;
> +            *delay_off = BLINK_DELAY;
> +
> +            State::Blink
> +        })
> +        .write(dev)
> +    }
> +}
> +
> +#[pin_data]
> +struct StatusLedHandler {
> +    #[pin]
> +    blink: Mutex<bool>,
> +}
> +
> +impl StatusLedHandler {
> +    const SUBLEDS: &[MultiColorSubLed] = &[
> +        MultiColorSubLed::new(led::Color::Green).initial_intensity(1),
> +        MultiColorSubLed::new(led::Color::Orange),
> +    ];
> +}
> +
> +#[vtable]
> +impl LedOps for StatusLedHandler {
> +    type Bus = serdev::Device<Bound>;
> +    type Mode = led::MultiColor;
> +    const BLOCKING: bool = true;
> +    const MAX_BRIGHTNESS: u32 = 1;
> +
> +    fn brightness_set(
> +        &self,
> +        dev: &Self::Bus,
> +        classdev: &led::MultiColorDevice<Self>,
> +        brightness: u32,
> +    ) -> Result<()> {
> +        let mut blink = self.blink.lock();
> +        if brightness == 0 {
> +            *blink = false;
> +        }
> +
> +        let (color, subled_brightness) = if classdev.subleds()[1].intensity == 0 {
> +            (StatusLedColor::Green, classdev.subleds()[0].brightness)
> +        } else {
> +            (StatusLedColor::Orange, classdev.subleds()[1].brightness)
> +        };
> +
> +        Command::StatusLed(
> +            color,
> +            if subled_brightness == 0 {
> +                State::Off
> +            } else if *blink {
> +                State::Blink
> +            } else {
> +                State::On
> +            },
> +        )
> +        .write(dev)
> +    }
> +
> +    fn blink_set(
> +        &self,
> +        dev: &Self::Bus,
> +        classdev: &led::MultiColorDevice<Self>,
> +        delay_on: &mut usize,
> +        delay_off: &mut usize,
> +    ) -> Result<()> {
> +        let mut blink = self.blink.lock();
> +        *blink = true;
> +
> +        let (color, subled_intensity) = if classdev.subleds()[1].intensity == 0 {
> +            (StatusLedColor::Green, classdev.subleds()[0].intensity)
> +        } else {
> +            (StatusLedColor::Orange, classdev.subleds()[1].intensity)
> +        };
> +        Command::StatusLed(
> +            color,
> +            if *delay_on == 0 && *delay_off != 0 {
> +                *blink = false;
> +                State::Off
> +            } else if subled_intensity == 0 {
> +                State::Off
> +            } else if *delay_on != 0 && *delay_off == 0 {
> +                *blink = false;
> +                State::On
> +            } else {
> +                *delay_on = BLINK_DELAY;
> +                *delay_off = BLINK_DELAY;
> +
> +                State::Blink
> +            },
> +        )
> +        .write(dev)
> +    }
> +}
> diff --git a/drivers/platform/synology_microp/model.rs b/drivers/platform/synology_microp/model.rs
> new file mode 100644
> index 000000000000..715d8840f56b
> --- /dev/null
> +++ b/drivers/platform/synology_microp/model.rs
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::led::Color;
> +
> +pub(crate) struct Model {
> +    pub(crate) led_power: Color,
> +    pub(crate) led_alert: Option<Color>,
> +    pub(crate) led_usb_copy: bool,
> +    pub(crate) led_esata: bool,
> +}
> +
> +impl Model {
> +    pub(super) const fn new() -> Self {
> +        Self {
> +            led_power: Color::Blue,
> +            led_alert: None,
> +            led_usb_copy: false,
> +            led_esata: false,
> +        }
> +    }
> +
> +    pub(super) const fn led_power(self, color: Color) -> Self {
> +        Self {
> +            led_power: color,
> +            ..self
> +        }
> +    }
> +
> +    pub(super) const fn led_alert(self, color: Color) -> Self {
> +        Self {
> +            led_alert: Some(color),
> +            ..self
> +        }
> +    }
> +
> +    pub(super) const fn led_esata(self) -> Self {
> +        Self {
> +            led_esata: true,
> +            ..self
> +        }
> +    }
> +
> +    pub(super) const fn led_usb_copy(self) -> Self {
> +        Self {
> +            led_usb_copy: true,
> +            ..self
> +        }
> +    }
> +}
> diff --git a/drivers/platform/synology_microp/synology_microp.rs b/drivers/platform/synology_microp/synology_microp.rs
> new file mode 100644
> index 000000000000..1fd4fc658d85
> --- /dev/null
> +++ b/drivers/platform/synology_microp/synology_microp.rs
> @@ -0,0 +1,110 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Synology Microp driver
> +
> +use kernel::{
> +    device,
> +    led::Color,
> +    of::{
> +        DeviceId,
> +        IdTable, //
> +    },
> +    of_device_table,
> +    prelude::*,
> +    serdev, //
> +};
> +use pin_init::pin_init_scope;
> +
> +use crate::model::Model;
> +
> +pub(crate) mod command;
> +mod led;
> +mod model;
> +
> +kernel::module_serdev_device_driver! {
> +    type: SynologyMicropDriver,
> +    name: "synology_microp",
> +    authors: ["Markus Probst <markus.probst@posteo.de>"],
> +    description: "Synology Microp driver",
> +    license: "GPL v2",
> +}
> +
> +#[rustfmt::skip]
> +of_device_table!(
> +    OF_TABLE,
> +    MODULE_OF_TABLE,
> +    Model,
> +    [
> +        // apollolake
> +        (DeviceId::new(c"synology,ds918p-microp"), Model::new()),
> +
> +        // evansport
> +        (DeviceId::new(c"synology,ds214play-microp"), Model::new()),
> +
> +        // geminilakenk
> +        (DeviceId::new(c"synology,ds225p-microp"), Model::new().led_usb_copy()),
> +        (DeviceId::new(c"synology,ds425p-microp"), Model::new()),
> +
> +        // pineview
> +        (DeviceId::new(c"synology,ds710p-microp"), Model::new().led_esata()),
> +        (DeviceId::new(c"synology,ds1010p-microp"), Model::new().led_alert(Color::Orange)),
> +        (DeviceId::new(c"synology,ds411p-microp"), Model::new()),
> +
> +        // r1000
> +        (DeviceId::new(c"synology,ds923p-microp"), Model::new()),
> +        (DeviceId::new(c"synology,ds723p-microp"), Model::new()),
> +        (DeviceId::new(c"synology,ds1522p-microp"), Model::new()),
> +        (DeviceId::new(c"synology,rs422p-microp"), Model::new().led_power(Color::Green)),
> +
> +        // r1000nk
> +        (DeviceId::new(c"synology,ds725p-microp"), Model::new()),
> +
> +        // rtd1296
> +        (DeviceId::new(c"synology,ds118-microp"), Model::new()),
> +
> +        // rtd1619b
> +        (DeviceId::new(c"synology,ds124-microp"), Model::new()),
> +        (DeviceId::new(c"synolody,ds223-microp"), Model::new().led_usb_copy()),
> +        (DeviceId::new(c"synology,ds223j-microp"), Model::new()),
> +
> +        // v1000
> +        (DeviceId::new(c"synology,ds1823xsp-microp"), Model::new()),
> +        (DeviceId::new(c"synology,rs822p-microp"), Model::new().led_power(Color::Green)),
> +        (DeviceId::new(c"synology,rs1221p-microp"), Model::new().led_power(Color::Green)),
> +        (DeviceId::new(c"synology,rs1221rpp-microp"), Model::new().led_power(Color::Green)),
> +
> +        // v1000nk
> +        (DeviceId::new(c"synology,ds925p-microp"), Model::new()),
> +        (DeviceId::new(c"synology,ds1525p-microp"), Model::new()),
> +        (DeviceId::new(c"synology,ds1825p-microp"), Model::new()),
> +    ]
> +);
> +
> +#[pin_data]
> +struct SynologyMicropDriver {
> +    #[pin]
> +    led: led::Data,
> +}
> +
> +#[vtable]
> +impl serdev::Driver for SynologyMicropDriver {
> +    type IdInfo = Model;
> +    const OF_ID_TABLE: Option<IdTable<Self::IdInfo>> = Some(&OF_TABLE);
> +
> +    fn probe(
> +        dev: &serdev::Device<device::Core>,
> +        model: Option<&Model>,
> +    ) -> impl PinInit<Self, kernel::error::Error> {
> +        pin_init_scope(move || {
> +            let model = model.ok_or(EINVAL)?;
> +
> +            dev.set_baudrate(9600).map_err(|_| EINVAL)?;
> +            dev.set_flow_control(false);
> +            dev.set_parity(serdev::Parity::None)?;
> +
> +            Ok(try_pin_init!(Self {
> +                led <- led::Data::register(dev, model),
> +            }))
> +        })
> +    }
> +}
> 
> 

