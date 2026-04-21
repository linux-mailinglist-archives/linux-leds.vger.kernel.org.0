Return-Path: <linux-leds+bounces-7785-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBrbGy2I52kU9wEAu9opvQ
	(envelope-from <linux-leds+bounces-7785-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 16:22:37 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9966D43BF10
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 16:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 49DE63031F20
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 14:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028E42C2363;
	Tue, 21 Apr 2026 14:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="pSUpIN+u"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B266A3C6A51
	for <linux-leds@vger.kernel.org>; Tue, 21 Apr 2026 14:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776781061; cv=none; b=aGvSCCutgqqRaLDBDyk0TS/Q8FO3pl05h54++j54ySXH0JG/CMVfdbedfVW5DM+NGFTYYqZ+iKIV3gYyEHiP/iKU1q9Eb2yarjzSdyXO7wEIAZghF0bILVKkwUdu4rwVxbpb+H8Cg30tnt5l3UzEnKVP9iGNeQkngcBEarI5LMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776781061; c=relaxed/simple;
	bh=HOWMD5JBxGVJZ/YWwEI+O7wOXjzjJyd3CIUAH0+4Elc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n7L+oRFRotMDmYNAQK9kZeVV08w79TCYmHUa2oKbTtqxqLXILoToc3fEZN3XsdWxIIU7yPtJKQrjd8LiVSwGWtppPsWWOxZOiXzp/oih7eR0E5n2kaHtcKesMhrQzgs1lR3xzFrxEjXBoQUM4vvvLGcTgIQRGJDFKigshulYQvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=pSUpIN+u; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 53BD7240029
	for <linux-leds@vger.kernel.org>; Tue, 21 Apr 2026 16:17:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1776781057; bh=NxoXZf5wORxUM30fErPWq6tEOrlrf1QFwwBF0fqQRyE=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=pSUpIN+uTter9tLRag0YJUTAK2+DoMV9+P/xT6FxCsfT5xXXTPM4axkSLJNJKBBTi
	 1EdDGBY29qIl4sOCvZjJfHk5nxr68EdL19Q1oAjXPPuzf/xqE6nrcNulMHwZw9Umon
	 JL3/OjmIkoJXazf0EAKFXs+o0It00EgervZr51r8rrrDxLMjcq5M1iGR8GsO0bveWs
	 bmz+UYYOauAxUVpJkzOs2L6FjgQvs13faXA+/Jk8XUuNKCl7nnEUDNgnPsom5qt9O0
	 K+qZCLPGMVGy50FHR0S3G6nhfEX4jYTgmmCPpKmy9HdKED3nLNZ1aKUE3i37AE1mwu
	 CWYqAKlMaEESQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4g0PZQ6XCNz9rxK;
	Tue, 21 Apr 2026 16:17:34 +0200 (CEST)
Message-ID: <c4964138177c4455f5eb07d0e23db2dfec40bf9c.camel@posteo.de>
Subject: Re: [PATCH v8 2/2] platform: Add initial synology microp driver
From: Markus Probst <markus.probst@posteo.de>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Bryan O'Donoghue	
 <bryan.odonoghue@linaro.org>, Lee Jones <lee@kernel.org>, Pavel Machek	
 <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>,  Gary Guo <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Greg
 Kroah-Hartman	 <gregkh@linuxfoundation.org>,
 platform-driver-x86@vger.kernel.org, 	linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, LKML	 <linux-kernel@vger.kernel.org>,
 rust-for-linux@vger.kernel.org
Date: Tue, 21 Apr 2026 14:17:36 +0000
In-Reply-To: <6104a5fe-a6e3-4c35-ff4f-731d1a5e4acb@linux.intel.com>
References: <20260420-synology_microp_initial-v8-0-7946a9124491@posteo.de>
	 <20260420-synology_microp_initial-v8-2-7946a9124491@posteo.de>
	 <6104a5fe-a6e3-4c35-ff4f-731d1a5e4acb@linux.intel.com>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-RI/JmpCN3XD2kPkbtbAB"
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7785-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[posteo.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9966D43BF10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-RI/JmpCN3XD2kPkbtbAB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-04-21 at 14:59 +0300, Ilpo J=C3=A4rvinen wrote:
> On Mon, 20 Apr 2026, Markus Probst wrote:
>=20
> > Add a initial synology microp driver, written in Rust.
> > The driver targets a microcontroller found in Synology NAS devices. It
> > currently only supports controlling of the power led, status led, alert
> > led and usb led. Other components such as fan control or handling
> > on-device buttons will be added once the required rust abstractions are
> > there.
> >=20
> > This driver can be used both on arm and x86, thus it goes into the root
> > directory of drivers/platform.
> >=20
> > Tested successfully on a Synology DS923+.
> >=20
> > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > ---
> >  MAINTAINERS                                        |   6 +
> >  drivers/platform/Kconfig                           |   2 +
> >  drivers/platform/Makefile                          |   1 +
> >  drivers/platform/synology_microp/Kconfig           |  13 +
> >  drivers/platform/synology_microp/Makefile          |   3 +
> >  drivers/platform/synology_microp/TODO              |   7 +
> >  drivers/platform/synology_microp/command.rs        |  54 ++++
> >  drivers/platform/synology_microp/led.rs            | 281 +++++++++++++=
++++++++
> >  drivers/platform/synology_microp/model.rs          |  49 ++++
> >  .../platform/synology_microp/synology_microp.rs    | 110 ++++++++
> >  10 files changed, 526 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index c1c686846cdd..49f08290eed0 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -25555,6 +25555,12 @@ F:	drivers/dma-buf/sync_*
> >  F:	include/linux/sync_file.h
> >  F:	include/uapi/linux/sync_file.h
> > =20
> > +SYNOLOGY MICROP DRIVER
> > +M:	Markus Probst <markus.probst@posteo.de>
>=20
> You should probably add:
>=20
> L:	platform-driver-x86@vger.kernel.org
>=20
> Through which tree the patches to this driver are generally expected to b=
e=20
> picked up?
I suppose platform-drivers-x86. The driver itself can be used both on
x86 and arm64. Although I also have seen Synology devices with PowerPC
(no device with PowerPC is supported in the driver yet).=20

>=20
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/embedded-controller/synology,ds18=
25p-microp.yaml
> > +F:	drivers/platform/synology_microp/
> > +
> >  SYNOPSYS ARC ARCHITECTURE
> >  M:	Vineet Gupta <vgupta@kernel.org>
> >  L:	linux-snps-arc@lists.infradead.org
> > diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
> > index 312788f249c9..996050566a4a 100644
> > --- a/drivers/platform/Kconfig
> > +++ b/drivers/platform/Kconfig
> > @@ -22,3 +22,5 @@ source "drivers/platform/arm64/Kconfig"
> >  source "drivers/platform/raspberrypi/Kconfig"
> > =20
> >  source "drivers/platform/wmi/Kconfig"
> > +
> > +source "drivers/platform/synology_microp/Kconfig"
> > diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
> > index fa322e7f8716..2381872e9133 100644
> > --- a/drivers/platform/Makefile
> > +++ b/drivers/platform/Makefile
> > @@ -15,3 +15,4 @@ obj-$(CONFIG_SURFACE_PLATFORMS)	+=3D surface/
> >  obj-$(CONFIG_ARM64_PLATFORM_DEVICES)	+=3D arm64/
> >  obj-$(CONFIG_BCM2835_VCHIQ)	+=3D raspberrypi/
> >  obj-$(CONFIG_ACPI_WMI)		+=3D wmi/
> > +obj-$(CONFIG_SYNOLOGY_MICROP)	+=3D synology_microp/
> > diff --git a/drivers/platform/synology_microp/Kconfig b/drivers/platfor=
m/synology_microp/Kconfig
> > new file mode 100644
> > index 000000000000..7c4d8f2808f0
> > --- /dev/null
> > +++ b/drivers/platform/synology_microp/Kconfig
> > @@ -0,0 +1,13 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +config SYNOLOGY_MICROP
> > +	tristate "Synology Microp driver"
> > +	depends on LEDS_CLASS && LEDS_CLASS_MULTICOLOR
> > +	depends on RUST_SERIAL_DEV_BUS_ABSTRACTIONS
> > +	help
> > +	  Enable support for the MCU found in Synology NAS devices.
> > +
> > +	  This is needed to properly shutdown and reboot the device, as well =
as
> > +	  additional functionality like fan and LED control.
> > +
> > +	  This driver is work in progress and may not be fully functional.
> > diff --git a/drivers/platform/synology_microp/Makefile b/drivers/platfo=
rm/synology_microp/Makefile
> > new file mode 100644
> > index 000000000000..63585ccf76e4
> > --- /dev/null
> > +++ b/drivers/platform/synology_microp/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +obj-y +=3D synology_microp.o
> > diff --git a/drivers/platform/synology_microp/TODO b/drivers/platform/s=
ynology_microp/TODO
> > new file mode 100644
> > index 000000000000..1961a33115db
> > --- /dev/null
> > +++ b/drivers/platform/synology_microp/TODO
> > @@ -0,0 +1,7 @@
> > +TODO:
> > +- add missing components:
> > +  - handle on-device buttons (Power, Factory reset, "USB Copy")
> > +  - handle fan failure
> > +  - beeper
> > +  - fan speed control
> > +  - correctly perform device power-off and restart on Synology devices
>=20
> Is this TODO list really needed within the kernel distribution?
Not really. Although it indicates the current state of the driver.

>=20
> If you planning on add these features (relatively) soon yourself (perhaps=
=20
> depending on when the rust infra required for these features becomes=20
> available), the list would not be that useful for other developers at all=
.
Yes. Also I haven't seen anyone work on input, hwmon, reboot/sysoff
rust abstractions yet, so I will likely need to add those as well.

>=20
> > diff --git a/drivers/platform/synology_microp/command.rs b/drivers/plat=
form/synology_microp/command.rs
> > new file mode 100644
> > index 000000000000..430cb858e1c3
> > --- /dev/null
> > +++ b/drivers/platform/synology_microp/command.rs
> > @@ -0,0 +1,54 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +use kernel::{
> > +    device::Bound,
> > +    error::Result,
> > +    serdev, //
> > +};
> > +
> > +use crate::led;
> > +
> > +#[expect(
> > +    clippy::enum_variant_names,
> > +    reason =3D "future variants will not end with Led"
> > +)]
> > +pub(crate) enum Command {
> > +    PowerLed(led::State),
> > +    StatusLed(led::StatusLedColor, led::State),
> > +    AlertLed(led::State),
> > +    UsbLed(led::State),
> > +    EsataLed(led::State),
> > +}
> > +
> > +impl Command {
> > +    pub(crate) fn write(self, dev: &serdev::Device<Bound>) -> Result {
> > +        dev.write_all(
> > +            match self {
> > +                Self::PowerLed(led::State::On) =3D> &[0x34],
> > +                Self::PowerLed(led::State::Blink) =3D> &[0x35],
> > +                Self::PowerLed(led::State::Off) =3D> &[0x36],
> > +
> > +                Self::StatusLed(_, led::State::Off) =3D> &[0x37],
> > +                Self::StatusLed(led::StatusLedColor::Green, led::State=
::On) =3D> &[0x38],
> > +                Self::StatusLed(led::StatusLedColor::Green, led::State=
::Blink) =3D> &[0x39],
> > +                Self::StatusLed(led::StatusLedColor::Orange, led::Stat=
e::On) =3D> &[0x3A],
> > +                Self::StatusLed(led::StatusLedColor::Orange, led::Stat=
e::Blink) =3D> &[0x3B],
> > +
> > +                Self::AlertLed(led::State::On) =3D> &[0x4C, 0x41, 0x31=
],
> > +                Self::AlertLed(led::State::Blink) =3D> &[0x4C, 0x41, 0=
x32],
> > +                Self::AlertLed(led::State::Off) =3D> &[0x4C, 0x41, 0x3=
3],
> > +
> > +                Self::UsbLed(led::State::On) =3D> &[0x40],
> > +                Self::UsbLed(led::State::Blink) =3D> &[0x41],
> > +                Self::UsbLed(led::State::Off) =3D> &[0x42],
> > +
> > +                Self::EsataLed(led::State::On) =3D> &[0x4C, 0x45, 0x31=
],
> > +                Self::EsataLed(led::State::Blink) =3D> &[0x4C, 0x45, 0=
x32],
> > +                Self::EsataLed(led::State::Off) =3D> &[0x4C, 0x45, 0x3=
3],
> > +            },
> > +            serdev::Timeout::Max,
> > +        )?;
> > +        dev.wait_until_sent(serdev::Timeout::Max);
> > +        Ok(())
> > +    }
> > +}
> > diff --git a/drivers/platform/synology_microp/led.rs b/drivers/platform=
/synology_microp/led.rs
> > new file mode 100644
> > index 000000000000..f89998a7e6b4
> > --- /dev/null
> > +++ b/drivers/platform/synology_microp/led.rs
> > @@ -0,0 +1,281 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +use kernel::{
> > +    device::Bound,
> > +    devres::{
> > +        self,
> > +        Devres, //
> > +    },
> > +    led::{
> > +        self,
> > +        LedOps,
> > +        MultiColorSubLed, //
> > +    },
> > +    new_mutex,
> > +    prelude::*,
> > +    serdev,
> > +    str::CString,
> > +    sync::Mutex, //
> > +};
> > +use pin_init::pin_init_scope;
> > +
> > +use crate::{
> > +    command::Command,
> > +    model::Model, //
> > +};
> > +
> > +#[pin_data]
> > +pub(crate) struct Data {
> > +    #[pin]
> > +    status: Devres<led::MultiColorDevice<StatusLedHandler>>,
> > +    power_name: CString,
> > +    #[pin]
> > +    power: Devres<led::Device<LedHandler>>,
> > +}
> > +
> > +impl Data {
> > +    pub(super) fn register<'a>(
> > +        dev: &'a serdev::Device<Bound>,
> > +        model: &'a Model,
> > +    ) -> impl PinInit<Self, Error> + 'a {
> > +        pin_init_scope(move || {
> > +            if let Some(color) =3D model.led_alert {
> > +                let name =3D CString::try_from_fmt(fmt!("{}:alarm", co=
lor.as_c_str().to_str()?))?;
> > +                devres::register(
> > +                    dev.as_ref(),
> > +                    led::DeviceBuilder::new().color(color).name(&name)=
.build(
> > +                        dev,
> > +                        try_pin_init!(LedHandler {
> > +                            blink <- new_mutex!(false),
> > +                            command: Command::AlertLed,
> > +                        }),
> > +                    ),
> > +                    GFP_KERNEL,
> > +                )?;
> > +            }
> > +
> > +            if model.led_usb_copy {
> > +                devres::register(
> > +                    dev.as_ref(),
> > +                    led::DeviceBuilder::new()
> > +                        .color(led::Color::Green)
> > +                        .name(c"green:usb")
> > +                        .build(
> > +                            dev,
> > +                            try_pin_init!(LedHandler {
> > +                                blink <- new_mutex!(false),
> > +                                command: Command::UsbLed,
> > +                            }),
> > +                        ),
> > +                    GFP_KERNEL,
> > +                )?;
> > +            }
> > +
> > +            if model.led_esata {
> > +                devres::register(
> > +                    dev.as_ref(),
> > +                    led::DeviceBuilder::new()
> > +                        .color(led::Color::Green)
> > +                        .name(c"green:esata")
> > +                        .build(
> > +                            dev,
> > +                            try_pin_init!(LedHandler {
> > +                                blink <- new_mutex!(false),
> > +                                command: Command::EsataLed,
> > +                            }),
> > +                        ),
> > +                    GFP_KERNEL,
> > +                )?;
> > +            }
> > +
> > +            Ok(try_pin_init!(Self {
> > +                status <- led::DeviceBuilder::new()
> > +                    .color(led::Color::Multi)
> > +                    .name(c"multicolor:status")
> > +                    .build_multicolor(
> > +                        dev,
> > +                        try_pin_init!(StatusLedHandler {
> > +                            blink <- new_mutex!(false),
> > +                        }),
> > +                        StatusLedHandler::SUBLEDS,
> > +                    ),
> > +                power_name: CString::try_from_fmt(fmt!(
> > +                    "{}:power",
> > +                    model.led_power.as_c_str().to_str()?
> > +                ))?,
> > +                power <- led::DeviceBuilder::new()
> > +                    .color(model.led_power)
> > +                    .name(power_name)
> > +                    .build(
> > +                        dev,
> > +                        try_pin_init!(LedHandler {
> > +                            blink <- new_mutex!(true),
> > +                            command: Command::PowerLed,
> > +                        }),
> > +                    ),
> > +            }))
> > +        })
> > +    }
> > +}
> > +
> > +#[derive(Copy, Clone)]
> > +pub(crate) enum StatusLedColor {
> > +    Green,
> > +    Orange,
> > +}
> > +
> > +#[derive(Copy, Clone)]
> > +pub(crate) enum State {
> > +    On,
> > +    Blink,
> > +    Off,
> > +}
> > +
> > +#[pin_data]
> > +struct LedHandler {
> > +    #[pin]
> > +    blink: Mutex<bool>,
> > +    command: fn(State) -> Command,
> > +}
> > +
> > +/// Blink delay measured using video recording on DS923+ for Power and=
 Status Led.
> > +///
> > +/// We assume it is the same for all other leds and models.
> > +const BLINK_DELAY: usize =3D 167;
>=20
> On C side time related consts are required to include the unit in their=
=20
> name. Perhaps Rust code should also follow this convention?
How about `const BLINK_DELAY: Msecs` ? The unit would be implied
through the already existing type alias `kernel::time::Msecs` for u32.

Thanks
- Markus Probst

--=-RI/JmpCN3XD2kPkbtbAB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmnnhvMbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPShGUQAISQRB4yyJEVVouSMoSg
vV6mXH2zS9xy4tG/XX+jnlpmAZDO7FmUVq70g9tRVjzwNPTuBahK47jzhBpPdT1j
YUnH6TFhK1aEEO4cZKmY6g4cZc/H0WrOHJFSNQPJSpVCyZ1K08KA9cjo4A5JY4Jl
wsmECCNJuns753aEPdOG+pSTlk3fnnzeukPmiCRz54SDJd7/UaVjmyc+AM1dGNLt
6aRDULEx0+idA7+DT+3a6s/jY6PdpNG9Iet7n80b3jTjdocLrYoeqVk44xRmWlBX
dL06/A6NxwidfSr3Sei0Lov1JMTp2bCUul73VxOjYGFf4AKGV8FKUgHS71gjhfEe
7LL8gs3tbJoSK25yuH/j5n7fDNhBIR4vi8oGfyoeCO5enFCvow3XMKEQ4Bjhf9cN
vTkH3w577/mKlVlpQAKkCrfl045P4NcOWTvIehO5djGvOQGr2UuFgWnhfH0GM8s6
Z8zxJcfYCzry6xNo6B4x2ZnVKSUUFzW4L87MlAtabPE2nTos6fuKoKz8IYMWc6is
9iTxKICtpzUt5FvAZC/TYTG58C+OdESCFKBprbSwEVORaElb94JPHF6Gsr5vvTw6
H2tW7alhPrzNWK1cZpXq2UcswM0Y+9sZMgfea9q1ZlJFWNMcPyHjFMuTcgdb5Pm5
OOBcx4uYgAMpLojgVurERoQ9
=GyTZ
-----END PGP SIGNATURE-----

--=-RI/JmpCN3XD2kPkbtbAB--

