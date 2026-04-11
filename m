Return-Path: <linux-leds+bounces-7694-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NX+Bft92mlM3AgAu9opvQ
	(envelope-from <linux-leds+bounces-7694-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 11 Apr 2026 18:59:39 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 610EF3E0F46
	for <lists+linux-leds@lfdr.de>; Sat, 11 Apr 2026 18:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CDEC301A916
	for <lists+linux-leds@lfdr.de>; Sat, 11 Apr 2026 16:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD902254B1F;
	Sat, 11 Apr 2026 16:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="Vht/vP05"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E29718027;
	Sat, 11 Apr 2026 16:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775926560; cv=none; b=kdVYCujz2l4WDuNCvB/ryerF65CrxjeyVbSlFjYlgNKIWVAw527bPzF4mTjJXQ2xGKkp2/zc6S8R0+P2Zib7bL+CNG1mcLkbVaOHYJIuzmptrv9ePLdydUbHo5D8EPOHrlTLTG+MPAoLHzBCEDiuqoGU7Sxn6ZdiwJ6QRKHjkhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775926560; c=relaxed/simple;
	bh=tkWBxxt/m+ro9op9eW9P6k/ciCdUOYvjl7vLvv70mSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GSNlwiDtfmXmsTDKMxh01KFlvZU9pTTtlPyHqOCDyKIqgTZ8YZZdX3+E0nDuzdTvDnLpl3STT47MO6ntEDOn2oMqI/V1boqOWBSjjbO1GphoCmgDLjEyTbjwQxT71CXp3hoRqSNxVHljkd/ESpgXgWxA3jaOWJ1grqTRGmKddlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=Vht/vP05; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1775926553; x=1776185753;
	bh=lUcR3jPZnG06a5u5Z83Hgqw/yPjOFKIGjC0OSho6sCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Vht/vP05mvFgFnXWVZNb+Olsao2j6bM0IXAiUL+dcbT0ohQy1in9u3d3ctFGqZJA9
	 y0kQFVw0ksGY6VUcbGhUvGsWKIdzRQ6j8gvWcwJSDJ9lI/jeHVk4WORq5wrtr7qcz6
	 bkDhqEW4n17ENkPQ8i5QerNWejdygHgubGSQKM57bv893/brQeFhgoPZNHRERJhyVk
	 f6XBZ2BhoFInGWIeB84VDxPopo+rJ7eIKQUirfdTftdjTpEJa+CInoaFc7r/BYYt00
	 /f7zy/5Xi68pIWgmguSijHsODqYuMONuoVbdzlmsPLDpO/HxxHK5O+9ugE16f6vinE
	 cohh7Tp0/xlag==
X-Pm-Submission-Id: 4ftKYc68pFz1DDLZ
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	platform-driver-x86@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Markus Probst <markus.probst@posteo.de>
Subject: Re: [PATCH v7 1/2] platform: Add initial synology microp driver
Date: Sat, 11 Apr 2026 19:55:44 +0300
Message-ID: <20260411165546.70962-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260411-synology_microp_initial-v7-1-9a3a094e763a@posteo.de>
References: <20260411-synology_microp_initial-v7-0-9a3a094e763a@posteo.de> <20260411-synology_microp_initial-v7-1-9a3a094e763a@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[onurozkan.dev,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[onurozkan.dev:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7694-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[onurozkan.dev:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[work@onurozkan.dev,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,vger.kernel.org,posteo.de];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,markus.probst.posteo.de,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:email,posteo.de:email,onurozkan.dev:dkim,onurozkan.dev:mid]
X-Rspamd-Queue-Id: 610EF3E0F46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 11 Apr 2026 17:27:34 +0200=0D
Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org> wro=
te:=0D
=0D
> From: Markus Probst <markus.probst@posteo.de>=0D
> =0D
> Add a initial synology microp driver, written in Rust.=0D
> The driver targets a microcontroller found in Synology NAS devices. It=0D
> currently only supports controlling of the power led, status led, alert=0D
> led and usb led. Other components such as fan control or handling=0D
> on-device buttons will be added once the required rust abstractions are=0D
> there.=0D
> =0D
> This driver can be used both on arm and x86, thus it goes into the root=0D
> directory of drivers/platform.=0D
> =0D
> Tested successfully on a Synology DS923+.=0D
> =0D
> Signed-off-by: Markus Probst <markus.probst@posteo.de>=0D
> ---=0D
>  MAINTAINERS                                        |   5 +=0D
>  drivers/platform/Kconfig                           |   2 +=0D
>  drivers/platform/Makefile                          |   1 +=0D
>  drivers/platform/synology_microp/Kconfig           |  13 +=0D
>  drivers/platform/synology_microp/Makefile          |   3 +=0D
>  drivers/platform/synology_microp/TODO              |   7 +=0D
>  drivers/platform/synology_microp/command.rs        |  55 ++++=0D
>  drivers/platform/synology_microp/led.rs            | 276 +++++++++++++++=
++++++=0D
>  drivers/platform/synology_microp/model.rs          |  49 ++++=0D
>  .../platform/synology_microp/synology_microp.rs    | 109 ++++++++=0D
>  10 files changed, 520 insertions(+)=0D
> =0D
> diff --git a/MAINTAINERS b/MAINTAINERS=0D
> index a667f4efb66e..78c99d831431 100644=0D
> --- a/MAINTAINERS=0D
> +++ b/MAINTAINERS=0D
> @@ -25554,6 +25554,11 @@ F:	drivers/dma-buf/sync_*=0D
>  F:	include/linux/sync_file.h=0D
>  F:	include/uapi/linux/sync_file.h=0D
>  =0D
> +SYNOLOGY MICROP DRIVER=0D
> +M:	Markus Probst <markus.probst@posteo.de>=0D
> +S:	Maintained=0D
> +F:	drivers/platform/synology_microp/=0D
> +=0D
>  SYNOPSYS ARC ARCHITECTURE=0D
>  M:	Vineet Gupta <vgupta@kernel.org>=0D
>  L:	linux-snps-arc@lists.infradead.org=0D
> diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig=0D
> index 312788f249c9..996050566a4a 100644=0D
> --- a/drivers/platform/Kconfig=0D
> +++ b/drivers/platform/Kconfig=0D
> @@ -22,3 +22,5 @@ source "drivers/platform/arm64/Kconfig"=0D
>  source "drivers/platform/raspberrypi/Kconfig"=0D
>  =0D
>  source "drivers/platform/wmi/Kconfig"=0D
> +=0D
> +source "drivers/platform/synology_microp/Kconfig"=0D
> diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile=0D
> index fa322e7f8716..2381872e9133 100644=0D
> --- a/drivers/platform/Makefile=0D
> +++ b/drivers/platform/Makefile=0D
> @@ -15,3 +15,4 @@ obj-$(CONFIG_SURFACE_PLATFORMS)	+=3D surface/=0D
>  obj-$(CONFIG_ARM64_PLATFORM_DEVICES)	+=3D arm64/=0D
>  obj-$(CONFIG_BCM2835_VCHIQ)	+=3D raspberrypi/=0D
>  obj-$(CONFIG_ACPI_WMI)		+=3D wmi/=0D
> +obj-$(CONFIG_SYNOLOGY_MICROP)	+=3D synology_microp/=0D
> diff --git a/drivers/platform/synology_microp/Kconfig b/drivers/platform/=
synology_microp/Kconfig=0D
> new file mode 100644=0D
> index 000000000000..7c4d8f2808f0=0D
> --- /dev/null=0D
> +++ b/drivers/platform/synology_microp/Kconfig=0D
> @@ -0,0 +1,13 @@=0D
> +# SPDX-License-Identifier: GPL-2.0=0D
> +=0D
> +config SYNOLOGY_MICROP=0D
> +	tristate "Synology Microp driver"=0D
> +	depends on LEDS_CLASS && LEDS_CLASS_MULTICOLOR=0D
> +	depends on RUST_SERIAL_DEV_BUS_ABSTRACTIONS=0D
> +	help=0D
> +	  Enable support for the MCU found in Synology NAS devices.=0D
> +=0D
> +	  This is needed to properly shutdown and reboot the device, as well as=
=0D
> +	  additional functionality like fan and LED control.=0D
> +=0D
> +	  This driver is work in progress and may not be fully functional.=0D
> diff --git a/drivers/platform/synology_microp/Makefile b/drivers/platform=
/synology_microp/Makefile=0D
> new file mode 100644=0D
> index 000000000000..63585ccf76e4=0D
> --- /dev/null=0D
> +++ b/drivers/platform/synology_microp/Makefile=0D
> @@ -0,0 +1,3 @@=0D
> +# SPDX-License-Identifier: GPL-2.0=0D
> +=0D
> +obj-y +=3D synology_microp.o=0D
> diff --git a/drivers/platform/synology_microp/TODO b/drivers/platform/syn=
ology_microp/TODO=0D
> new file mode 100644=0D
> index 000000000000..1961a33115db=0D
> --- /dev/null=0D
> +++ b/drivers/platform/synology_microp/TODO=0D
> @@ -0,0 +1,7 @@=0D
> +TODO:=0D
> +- add missing components:=0D
> +  - handle on-device buttons (Power, Factory reset, "USB Copy")=0D
> +  - handle fan failure=0D
> +  - beeper=0D
> +  - fan speed control=0D
> +  - correctly perform device power-off and restart on Synology devices=0D
> diff --git a/drivers/platform/synology_microp/command.rs b/drivers/platfo=
rm/synology_microp/command.rs=0D
> new file mode 100644=0D
> index 000000000000..5b3dd715afac=0D
> --- /dev/null=0D
> +++ b/drivers/platform/synology_microp/command.rs=0D
> @@ -0,0 +1,55 @@=0D
> +// SPDX-License-Identifier: GPL-2.0=0D
> +=0D
> +use kernel::{=0D
> +    device::Bound,=0D
> +    error::Result,=0D
> +    serdev, //=0D
> +};=0D
> +=0D
> +use crate::led;=0D
> +=0D
> +#[derive(Copy, Clone)]=0D
=0D
Copy and Clone seem never used, please drop them (also see [1]).=0D
=0D
[1]: https://rust-for-linux.zulipchat.com/#narrow/channel/509436-Nova/topic=
/clone.2Fcopy.20additions=0D
=0D
> +#[expect(=0D
> +    clippy::enum_variant_names,=0D
> +    reason =3D "future variants will not end with Led"=0D
> +)]=0D
> +pub(crate) enum Command {=0D
> +    PowerLed(led::State),=0D
> +    StatusLed(led::StatusLedColor, led::State),=0D
> +    AlertLed(led::State),=0D
> +    UsbLed(led::State),=0D
> +    EsataLed(led::State),=0D
> +}=0D
> +=0D
> +impl Command {=0D
> +    pub(crate) fn write(self, dev: &serdev::Device<Bound>) -> Result {=0D
> +        dev.write_all(=0D
> +            match self {=0D
> +                Self::PowerLed(led::State::On) =3D> &[0x34],=0D
> +                Self::PowerLed(led::State::Blink) =3D> &[0x35],=0D
> +                Self::PowerLed(led::State::Off) =3D> &[0x36],=0D
> +=0D
> +                Self::StatusLed(_, led::State::Off) =3D> &[0x37],=0D
> +                Self::StatusLed(led::StatusLedColor::Green, led::State::=
On) =3D> &[0x38],=0D
> +                Self::StatusLed(led::StatusLedColor::Green, led::State::=
Blink) =3D> &[0x39],=0D
> +                Self::StatusLed(led::StatusLedColor::Orange, led::State:=
:On) =3D> &[0x3A],=0D
> +                Self::StatusLed(led::StatusLedColor::Orange, led::State:=
:Blink) =3D> &[0x3B],=0D
> +=0D
> +                Self::AlertLed(led::State::On) =3D> &[0x4C, 0x41, 0x31],=
=0D
> +                Self::AlertLed(led::State::Blink) =3D> &[0x4C, 0x41, 0x3=
2],=0D
> +                Self::AlertLed(led::State::Off) =3D> &[0x4C, 0x41, 0x33]=
,=0D
> +=0D
> +                Self::UsbLed(led::State::On) =3D> &[0x40],=0D
> +                Self::UsbLed(led::State::Blink) =3D> &[0x41],=0D
> +                Self::UsbLed(led::State::Off) =3D> &[0x42],=0D
> +=0D
> +                Self::EsataLed(led::State::On) =3D> &[0x4C, 0x45, 0x31],=
=0D
> +                Self::EsataLed(led::State::Blink) =3D> &[0x4C, 0x45, 0x3=
2],=0D
> +                Self::EsataLed(led::State::Off) =3D> &[0x4C, 0x45, 0x33]=
,=0D
> +            },=0D
> +            serdev::Timeout::Max,=0D
> +        )?;=0D
> +        dev.wait_until_sent(serdev::Timeout::Max);=0D
> +        Ok(())=0D
> +    }=0D
> +}=0D
> diff --git a/drivers/platform/synology_microp/led.rs b/drivers/platform/s=
ynology_microp/led.rs=0D
> new file mode 100644=0D
> index 000000000000..a78a95588456=0D
> --- /dev/null=0D
> +++ b/drivers/platform/synology_microp/led.rs=0D
> @@ -0,0 +1,276 @@=0D
> +// SPDX-License-Identifier: GPL-2.0=0D
> +=0D
> +use kernel::{=0D
> +    device::Bound,=0D
> +    devres::{=0D
> +        self,=0D
> +        Devres, //=0D
> +    },=0D
> +    led::{=0D
> +        self,=0D
> +        LedOps,=0D
> +        MultiColorSubLed, //=0D
> +    },=0D
> +    new_mutex,=0D
> +    prelude::*,=0D
> +    serdev,=0D
> +    str::CString,=0D
> +    sync::Mutex, //=0D
> +};=0D
> +use pin_init::pin_init_scope;=0D
> +=0D
> +use crate::{=0D
> +    command::Command,=0D
> +    model::Model, //=0D
> +};=0D
> +=0D
> +#[pin_data]=0D
> +pub(crate) struct Data {=0D
> +    #[pin]=0D
> +    status: Devres<led::MultiColorDevice<StatusLedHandler>>,=0D
> +    power_name: CString,=0D
> +    #[pin]=0D
> +    power: Devres<led::Device<LedHandler>>,=0D
> +}=0D
> +=0D
> +impl Data {=0D
> +    pub(super) fn register<'a>(=0D
> +        dev: &'a serdev::Device<Bound>,=0D
> +        model: &'a Model,=0D
> +    ) -> impl PinInit<Self, Error> + 'a {=0D
> +        pin_init_scope(move || {=0D
> +            if let Some(color) =3D model.led_alert {=0D
> +                let name =3D CString::try_from_fmt(fmt!("{}:alarm", colo=
r.as_c_str().to_str()?))?;=0D
> +                devres::register(=0D
> +                    dev.as_ref(),=0D
> +                    led::DeviceBuilder::new().color(color).name(&name).b=
uild(=0D
> +                        dev,=0D
> +                        try_pin_init!(LedHandler {=0D
> +                            blink <- new_mutex!(false),=0D
> +                            command: Command::AlertLed,=0D
> +                        }),=0D
> +                    ),=0D
> +                    GFP_KERNEL,=0D
> +                )?;=0D
> +            }=0D
> +=0D
> +            if model.led_usb_copy {=0D
> +                devres::register(=0D
> +                    dev.as_ref(),=0D
> +                    led::DeviceBuilder::new()=0D
> +                        .color(led::Color::Green)=0D
> +                        .name(c"green:usb")=0D
> +                        .build(=0D
> +                            dev,=0D
> +                            try_pin_init!(LedHandler {=0D
> +                                blink <- new_mutex!(false),=0D
> +                                command: Command::UsbLed,=0D
> +                            }),=0D
> +                        ),=0D
> +                    GFP_KERNEL,=0D
> +                )?;=0D
> +            }=0D
> +=0D
> +            if model.led_esata {=0D
> +                devres::register(=0D
> +                    dev.as_ref(),=0D
> +                    led::DeviceBuilder::new()=0D
> +                        .color(led::Color::Green)=0D
> +                        .name(c"green:esata")=0D
> +                        .build(=0D
> +                            dev,=0D
> +                            try_pin_init!(LedHandler {=0D
> +                                blink <- new_mutex!(false),=0D
> +                                command: Command::EsataLed,=0D
> +                            }),=0D
> +                        ),=0D
> +                    GFP_KERNEL,=0D
> +                )?;=0D
> +            }=0D
> +=0D
> +            Ok(try_pin_init!(Self {=0D
> +                status <- led::DeviceBuilder::new()=0D
> +                    .color(led::Color::Multi)=0D
> +                    .name(c"multicolor:status")=0D
> +                    .build_multicolor(=0D
> +                        dev,=0D
> +                        try_pin_init!(StatusLedHandler {=0D
> +                            blink <- new_mutex!(false),=0D
> +                        }),=0D
> +                        StatusLedHandler::SUBLEDS,=0D
> +                    ),=0D
> +                power_name: CString::try_from_fmt(fmt!(=0D
> +                    "{}:power",=0D
> +                    model.led_power.as_c_str().to_str()?=0D
> +                ))?,=0D
> +                power <- led::DeviceBuilder::new()=0D
> +                    .color(model.led_power)=0D
> +                    .name(power_name)=0D
> +                    .build(=0D
> +                        dev,=0D
> +                        try_pin_init!(LedHandler {=0D
> +                            blink <- new_mutex!(true),=0D
> +                            command: Command::PowerLed,=0D
> +                        }),=0D
> +                    ),=0D
> +            }))=0D
> +        })=0D
> +    }=0D
> +}=0D
> +=0D
> +#[derive(Copy, Clone)]=0D
> +pub(crate) enum StatusLedColor {=0D
> +    Green,=0D
> +    Orange,=0D
> +}=0D
> +=0D
> +#[derive(Copy, Clone)]=0D
> +pub(crate) enum State {=0D
> +    On,=0D
> +    Blink,=0D
> +    Off,=0D
> +}=0D
> +=0D
> +#[pin_data]=0D
> +struct LedHandler {=0D
> +    #[pin]=0D
> +    blink: Mutex<bool>,=0D
> +    command: fn(State) -> Command,=0D
> +}=0D
> +=0D
> +#[vtable]=0D
> +impl LedOps for LedHandler {=0D
> +    type Bus =3D serdev::Device<Bound>;=0D
> +    type Mode =3D led::Normal;=0D
> +    const BLOCKING: bool =3D true;=0D
> +    const MAX_BRIGHTNESS: u32 =3D 1;=0D
> +=0D
> +    fn brightness_set(=0D
> +        &self,=0D
> +        dev: &Self::Bus,=0D
> +        _classdev: &led::Device<Self>,=0D
> +        brightness: u32,=0D
> +    ) -> Result<()> {=0D
> +        let mut blink =3D self.blink.lock();=0D
> +        (self.command)(if brightness =3D=3D 0 {=0D
> +            *blink =3D false;=0D
> +            State::Off=0D
> +        } else if *blink {=0D
> +            State::Blink=0D
> +        } else {=0D
> +            State::On=0D
> +        })=0D
> +        .write(dev)?;=0D
> +=0D
> +        Ok(())=0D
> +    }=0D
> +=0D
> +    fn blink_set(=0D
> +        &self,=0D
> +        dev: &Self::Bus,=0D
> +        _classdev: &led::Device<Self>,=0D
> +        delay_on: &mut usize,=0D
> +        delay_off: &mut usize,=0D
> +    ) -> Result<()> {=0D
> +        let mut blink =3D self.blink.lock();=0D
> +=0D
> +        (self.command)(if *delay_on =3D=3D 0 && *delay_off !=3D 0 {=0D
> +            State::Off=0D
> +        } else if *delay_on !=3D 0 && *delay_off =3D=3D 0 {=0D
> +            State::On=0D
> +        } else {=0D
> +            *blink =3D true;=0D
> +            *delay_on =3D 167;=0D
> +            *delay_off =3D 167;=0D
=0D
Perhaps using a named constant with a simple comment instead of a hard-code=
d=0D
integer would help to clarify what 167 is.=0D
=0D
- Onur=0D
=0D
> +=0D
> +            State::Blink=0D
> +        })=0D
> +        .write(dev)=0D
> +    }=0D
> +}=0D
> +=0D
> +#[pin_data]=0D
> +struct StatusLedHandler {=0D
> +    #[pin]=0D
> +    blink: Mutex<bool>,=0D
> +}=0D
> +=0D
> +impl StatusLedHandler {=0D
> +    const SUBLEDS: &[MultiColorSubLed] =3D &[=0D
> +        MultiColorSubLed::new(led::Color::Green).initial_intensity(1),=0D
> +        MultiColorSubLed::new(led::Color::Orange),=0D
> +    ];=0D
> +}=0D
> +=0D
> +#[vtable]=0D
> +impl LedOps for StatusLedHandler {=0D
> +    type Bus =3D serdev::Device<Bound>;=0D
> +    type Mode =3D led::MultiColor;=0D
> +    const BLOCKING: bool =3D true;=0D
> +    const MAX_BRIGHTNESS: u32 =3D 1;=0D
> +=0D
> +    fn brightness_set(=0D
> +        &self,=0D
> +        dev: &Self::Bus,=0D
> +        classdev: &led::MultiColorDevice<Self>,=0D
> +        brightness: u32,=0D
> +    ) -> Result<()> {=0D
> +        let mut blink =3D self.blink.lock();=0D
> +        if brightness =3D=3D 0 {=0D
> +            *blink =3D false;=0D
> +        }=0D
> +=0D
> +        let (color, subled_brightness) =3D if classdev.subleds()[1].inte=
nsity =3D=3D 0 {=0D
> +            (StatusLedColor::Green, classdev.subleds()[0].brightness)=0D
> +        } else {=0D
> +            (StatusLedColor::Orange, classdev.subleds()[1].brightness)=0D
> +        };=0D
> +=0D
> +        Command::StatusLed(=0D
> +            color,=0D
> +            if subled_brightness =3D=3D 0 {=0D
> +                State::Off=0D
> +            } else if *blink {=0D
> +                State::Blink=0D
> +            } else {=0D
> +                State::On=0D
> +            },=0D
> +        )=0D
> +        .write(dev)=0D
> +    }=0D
> +=0D
> +    fn blink_set(=0D
> +        &self,=0D
> +        dev: &Self::Bus,=0D
> +        classdev: &led::MultiColorDevice<Self>,=0D
> +        delay_on: &mut usize,=0D
> +        delay_off: &mut usize,=0D
> +    ) -> Result<()> {=0D
> +        let mut blink =3D self.blink.lock();=0D
> +        *blink =3D true;=0D
> +=0D
> +        let (color, subled_intensity) =3D if classdev.subleds()[1].inten=
sity =3D=3D 0 {=0D
> +            (StatusLedColor::Green, classdev.subleds()[0].intensity)=0D
> +        } else {=0D
> +            (StatusLedColor::Orange, classdev.subleds()[1].intensity)=0D
> +        };=0D
> +        Command::StatusLed(=0D
> +            color,=0D
> +            if *delay_on =3D=3D 0 && *delay_off !=3D 0 {=0D
> +                *blink =3D false;=0D
> +                State::Off=0D
> +            } else if subled_intensity =3D=3D 0 {=0D
> +                State::Off=0D
> +            } else if *delay_on !=3D 0 && *delay_off =3D=3D 0 {=0D
> +                *blink =3D false;=0D
> +                State::On=0D
> +            } else {=0D
> +                *delay_on =3D 167;=0D
> +                *delay_off =3D 167;=0D
> +=0D
> +                State::Blink=0D
> +            },=0D
> +        )=0D
> +        .write(dev)=0D
> +    }=0D
> +}=0D
> diff --git a/drivers/platform/synology_microp/model.rs b/drivers/platform=
/synology_microp/model.rs=0D
> new file mode 100644=0D
> index 000000000000..715d8840f56b=0D
> --- /dev/null=0D
> +++ b/drivers/platform/synology_microp/model.rs=0D
> @@ -0,0 +1,49 @@=0D
> +// SPDX-License-Identifier: GPL-2.0=0D
> +=0D
> +use kernel::led::Color;=0D
> +=0D
> +pub(crate) struct Model {=0D
> +    pub(crate) led_power: Color,=0D
> +    pub(crate) led_alert: Option<Color>,=0D
> +    pub(crate) led_usb_copy: bool,=0D
> +    pub(crate) led_esata: bool,=0D
> +}=0D
> +=0D
> +impl Model {=0D
> +    pub(super) const fn new() -> Self {=0D
> +        Self {=0D
> +            led_power: Color::Blue,=0D
> +            led_alert: None,=0D
> +            led_usb_copy: false,=0D
> +            led_esata: false,=0D
> +        }=0D
> +    }=0D
> +=0D
> +    pub(super) const fn led_power(self, color: Color) -> Self {=0D
> +        Self {=0D
> +            led_power: color,=0D
> +            ..self=0D
> +        }=0D
> +    }=0D
> +=0D
> +    pub(super) const fn led_alert(self, color: Color) -> Self {=0D
> +        Self {=0D
> +            led_alert: Some(color),=0D
> +            ..self=0D
> +        }=0D
> +    }=0D
> +=0D
> +    pub(super) const fn led_esata(self) -> Self {=0D
> +        Self {=0D
> +            led_esata: true,=0D
> +            ..self=0D
> +        }=0D
> +    }=0D
> +=0D
> +    pub(super) const fn led_usb_copy(self) -> Self {=0D
> +        Self {=0D
> +            led_usb_copy: true,=0D
> +            ..self=0D
> +        }=0D
> +    }=0D
> +}=0D
> diff --git a/drivers/platform/synology_microp/synology_microp.rs b/driver=
s/platform/synology_microp/synology_microp.rs=0D
> new file mode 100644=0D
> index 000000000000..f02c4dade76c=0D
> --- /dev/null=0D
> +++ b/drivers/platform/synology_microp/synology_microp.rs=0D
> @@ -0,0 +1,109 @@=0D
> +// SPDX-License-Identifier: GPL-2.0=0D
> +=0D
> +//! Synology Microp driver=0D
> +=0D
> +use kernel::{=0D
> +    device,=0D
> +    led::Color,=0D
> +    of::{=0D
> +        DeviceId,=0D
> +        IdTable, //=0D
> +    },=0D
> +    of_device_table,=0D
> +    prelude::*,=0D
> +    serdev, //=0D
> +};=0D
> +use pin_init::pin_init_scope;=0D
> +=0D
> +use crate::model::Model;=0D
> +=0D
> +pub(crate) mod command;=0D
> +mod led;=0D
> +mod model;=0D
> +=0D
> +kernel::module_serdev_device_driver! {=0D
> +    type: SynologyMicropDriver,=0D
> +    name: "synology_microp",=0D
> +    authors: ["Markus Probst <markus.probst@posteo.de>"],=0D
> +    description: "Synology Microp driver",=0D
> +    license: "GPL v2",=0D
> +}=0D
> +=0D
> +#[rustfmt::skip]=0D
> +of_device_table!(=0D
> +    OF_TABLE,=0D
> +    MODULE_OF_TABLE,=0D
> +    Model,=0D
> +    [=0D
> +        // apollolake=0D
> +        (DeviceId::new(c"synology,ds918p-microp"), Model::new()),=0D
> +=0D
> +        // evansport=0D
> +        (DeviceId::new(c"synology,ds214play-microp"), Model::new()),=0D
> +=0D
> +        // geminilakenk=0D
> +        (DeviceId::new(c"synology,ds225p-microp"), Model::new().led_usb_=
copy()),=0D
> +        (DeviceId::new(c"synology,ds425p-microp"), Model::new()),=0D
> +=0D
> +        // pineview=0D
> +        (DeviceId::new(c"synology,ds710p-microp"), Model::new().led_esat=
a()),=0D
> +        (DeviceId::new(c"synology,ds1010p-microp"), Model::new().led_ale=
rt(Color::Orange)),=0D
> +=0D
> +        // r1000=0D
> +        (DeviceId::new(c"synology,ds923p-microp"), Model::new()),=0D
> +        (DeviceId::new(c"synology,ds723p-microp"), Model::new()),=0D
> +        (DeviceId::new(c"synology,ds1522p-microp"), Model::new()),=0D
> +        (DeviceId::new(c"synology,rs422p-microp"), Model::new().led_powe=
r(Color::Green)),=0D
> +=0D
> +        // r1000nk=0D
> +        (DeviceId::new(c"synology,ds725p-microp"), Model::new()),=0D
> +=0D
> +        // rtd1296=0D
> +        (DeviceId::new(c"synology,ds118-microp"), Model::new()),=0D
> +=0D
> +        // rtd1619b=0D
> +        (DeviceId::new(c"synology,ds124-microp"), Model::new()),=0D
> +        (DeviceId::new(c"synolody,ds223-microp"), Model::new().led_usb_c=
opy()),=0D
> +        (DeviceId::new(c"synology,ds223j-microp"), Model::new()),=0D
> +=0D
> +        // v1000=0D
> +        (DeviceId::new(c"synology,ds1823xsp-microp"), Model::new()),=0D
> +        (DeviceId::new(c"synology,rs822p-microp"), Model::new().led_powe=
r(Color::Green)),=0D
> +        (DeviceId::new(c"synology,rs1221p-microp"), Model::new().led_pow=
er(Color::Green)),=0D
> +        (DeviceId::new(c"synology,rs1221rpp-microp"), Model::new().led_p=
ower(Color::Green)),=0D
> +=0D
> +        // v1000nk=0D
> +        (DeviceId::new(c"synology,ds925p-microp"), Model::new()),=0D
> +        (DeviceId::new(c"synology,ds1525p-microp"), Model::new()),=0D
> +        (DeviceId::new(c"synology,ds1825p-microp"), Model::new()),=0D
> +    ]=0D
> +);=0D
> +=0D
> +#[pin_data]=0D
> +struct SynologyMicropDriver {=0D
> +    #[pin]=0D
> +    led: led::Data,=0D
> +}=0D
> +=0D
> +#[vtable]=0D
> +impl serdev::Driver for SynologyMicropDriver {=0D
> +    type IdInfo =3D Model;=0D
> +    const OF_ID_TABLE: Option<IdTable<Self::IdInfo>> =3D Some(&OF_TABLE)=
;=0D
> +=0D
> +    fn probe(=0D
> +        dev: &serdev::Device<device::Core>,=0D
> +        model: Option<&Model>,=0D
> +    ) -> impl PinInit<Self, kernel::error::Error> {=0D
> +        pin_init_scope(move || {=0D
> +            let model =3D model.ok_or(EINVAL)?;=0D
> +=0D
> +            dev.set_baudrate(9600).map_err(|_| EINVAL)?;=0D
> +            dev.set_flow_control(false);=0D
> +            dev.set_parity(serdev::Parity::None)?;=0D
> +=0D
> +            Ok(try_pin_init!(Self {=0D
> +                led <- led::Data::register(dev, model),=0D
> +            }))=0D
> +        })=0D
> +    }=0D
> +}=0D
> =0D
> -- =0D
> 2.52.0=0D
> =0D
> =0D

