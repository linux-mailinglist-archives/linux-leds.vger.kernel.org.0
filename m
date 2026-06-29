Return-Path: <linux-leds+bounces-8795-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sKvpGiqpQmpO/QkAu9opvQ
	(envelope-from <linux-leds+bounces-8795-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 19:19:38 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E856DDA34
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 19:19:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LySIAnm7;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8795-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8795-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 47C5E3004432
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 17:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1662037BE75;
	Mon, 29 Jun 2026 17:19:33 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0D12F8EAE;
	Mon, 29 Jun 2026 17:19:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782753573; cv=none; b=pLh2WeIXIPvmmefG83kEJL/wMtuz7Md+n6nmQt27SxbI1F+e7Uo98XJgsm+Jgc9fur5mJMc5tEZY32UraDhuPka8YZJ9H/YlrGsGLQvXNRMGUMfcs0/EwljW8KPfxxrZ4ZTDRQMJUlK5o+9ZNWIFFCPRn7KBNYuktU7geqaI2r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782753573; c=relaxed/simple;
	bh=P1EWMB3LQRPM23CKgEw5c+2921EAwMu9drsHjbmttqE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RcpWj/byvbkmRZCD5pQye8OLe/yjaj2kwVPUhJMY7e2W1s85juFUDnWt9iGPZGY2BfCwa0qg8lDgiq3jbI4IDkqcCjMIhz1kaBJq+hh92jftjFvk3piI6kZcLzfRpBvoGkPPbQWe27GXgJHUoqKIwUY00uwkMBfJlqnuF3D0LkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LySIAnm7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED581F000E9;
	Mon, 29 Jun 2026 17:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782753571;
	bh=k14WBG5BYyRU40eMDKhd+3ayEC6wejzsH2WxO4tzxtk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LySIAnm7Q91OOrVSIgeo4t/99w/r7I0SmPPIJkiOvbwHrtO7z9guUbVYbSgrqRC6o
	 Vf1lpeFak8L+lNlkuhucmbUgCy7i1S4ME6T1u+/Bx/O2FJr22nbus63o2CyJTqW2pe
	 ec8n20rJau60w/a9KeQAXY1I1Px9uEn84rTv8uJU+NN1YulWwq7I+exXUAR3C8iODN
	 loLI3+OLOYpjB3YUl5DXvbB7NIB2/DooZjpQXg/XKI78fAKCNTI5nfniv3zbP3m0Z0
	 BbnQSATARDr5Zr+IH2wayxaO8YLW+rTKXbkw1FJs/DInEN3O5EnEyynQg19w48/5A2
	 amGhYscGFOYqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 2/2] platform: Add initial synology microp driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Probst" <markus.probst@posteo.de>
Cc: conor+dt@kernel.org, lee@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, ojeda@kernel.org, robh@kernel.org
In-Reply-To: <20260629-synology_microp_initial-v16-2-601e91c49e0d@posteo.de>
References: <20260629-synology_microp_initial-v16-0-601e91c49e0d@posteo.de>
 <20260629-synology_microp_initial-v16-2-601e91c49e0d@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 17:19:29 +0000
Message-Id: <20260629171930.4ED581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8795-lists,linux-leds=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:markus.probst@posteo.de,m:conor+dt@kernel.org,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:ojeda@kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,smtp.kernel.org:mid,posteo.de:email,sashiko.dev:url,lists.linux.dev:replyto,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 62E856DDA34

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] StatusLedHandler::brightness_set fails to turn off the LED when =
brightness is set to 0.
- [Low] The driver depends on a non-existent Kconfig symbol RUST_SERIAL_DEV=
_BUS_ABSTRACTIONS.
--

commit b10df269f564d88c0451b8cff4f399129c6cc317
Author: Markus Probst <markus.probst@posteo.de>

platform: Add initial synology microp driver

This commit adds an initial Synology Microp driver in Rust. It targets the
microcontroller found in Synology NAS devices to control various LEDs.

> diff --git a/drivers/platform/synology_microp/Kconfig b/drivers/platform/=
synology_microp/Kconfig
> new file mode 100644
> index 0000000000000..8878cfb7bcddb
> --- /dev/null
> +++ b/drivers/platform/synology_microp/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config SYNOLOGY_MICROP
> +	tristate "Synology Microp driver"
> +	depends on LEDS_CLASS && LEDS_CLASS_MULTICOLOR
> +	depends on RUST_SERIAL_DEV_BUS_ABSTRACTIONS

[Severity: Low]
Is RUST_SERIAL_DEV_BUS_ABSTRACTIONS defined anywhere in the kernel tree?

Referencing a non-existent config symbol in "depends on" makes it impossible
to satisfy the dependency, leaving the driver completely unselectable during
configuration.

[ ... ]
> diff --git a/drivers/platform/synology_microp/led.rs b/drivers/platform/s=
ynology_microp/led.rs
> new file mode 100644
> index 0000000000000..ce57adfd307f2
> --- /dev/null
> +++ b/drivers/platform/synology_microp/led.rs
[ ... ]
> +    fn brightness_set<'bound>(
> +        &self,
> +        dev: &'bound Self::Bus,
> +        classdev: &led::MultiColorDevice<'bound, Self>,
> +        brightness: u32,
> +    ) -> Result<()> {
> +        let mut blink =3D self.blink.lock();
> +        if brightness =3D=3D 0 {
> +            *blink =3D false;
> +        }
> +
> +        let amber_brightness =3D classdev.subleds()[1].brightness();
> +
> +        let (color, subled_brightness) =3D if amber_brightness =3D=3D 0 {
> +            (StatusLedColor::Green, classdev.subleds()[0].brightness())
> +        } else {
> +            (StatusLedColor::Amber, amber_brightness)
> +        };
> +
> +        Command::StatusLed(
> +            color,
> +            if subled_brightness =3D=3D 0 {

[Severity: Medium]
When brightness is 0, will subled_brightness actually be 0 here?

The LED subsystem does not automatically recalculate the subled brightness
before invoking this callback. If the subled retains its previous non-zero
value, will subled_brightness =3D=3D 0 evaluate to false, causing the drive=
r to
incorrectly send State::On to the hardware instead of State::Off?

> +                State::Off
> +            } else if *blink {
> +                State::Blink
> +            } else {
> +                State::On
> +            },
> +        )
> +        .write(dev)
> +    }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-synology_m=
icrop_initial-v16-0-601e91c49e0d@posteo.de?part=3D2

