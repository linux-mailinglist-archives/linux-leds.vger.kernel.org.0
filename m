Return-Path: <linux-leds+bounces-9027-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4wM8MQVmUWr+DwMAu9opvQ
	(envelope-from <linux-leds+bounces-9027-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 23:37:09 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC1C73F061
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 23:37:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=oaSX7nro;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9027-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9027-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BDAB300F15B
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 21:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2C53B992E;
	Fri, 10 Jul 2026 21:31:39 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE513B841F;
	Fri, 10 Jul 2026 21:31:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783719099; cv=none; b=VhOPOnNL79UJcYLhBxhf7lzx7mgEE94Le1SUXQ0gwq3niqUXE6jdpxe9q4sOU1x+fFfNQPdByrAK6Dj2L8pTgOY6rD48Bl89anR3T49OSbAJkOGzPoOdL7AN69Q1oYEouy2WqO/CM/f5U3iZfC1VcMl1ePhPI4o1gT92DTALVl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783719099; c=relaxed/simple;
	bh=5v61IlVSeDkyC/Z4Co6BrZpsVCKe26wCBJS6bh19aY4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vpn8rW8v5hBVq5gQcJqxPpRmFxIFfDdrE9agipa0XvYVnmN5swcqbogNC1+9qsg/xt3smMbSgZuVfLWvc5l5SftrkFui9rRgSg2YyGmtGN7kjGvdyah4HSxFBJvE21yz/ABYvfkA641knmAEQ9pSLeSHJfGpH4ienvjm5NY+eTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oaSX7nro; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586DE1F000E9;
	Fri, 10 Jul 2026 21:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783719097;
	bh=aAjCFKIWWx5KH4NgMJ34wsFrlPZGLM4oMHfSeqwZBk4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oaSX7nro+lY9TAH6UucIHJ+F7dNx0VJqOr5N+EtxDwQQPzaMN9lT8ffVZy6i/8LIK
	 QyJseGtuc/O8qFSflfCal3UjQ//c1qjFjJnXtaXAnzuRm+QvlLw+d2ClbsQKpL2O5y
	 h0Y2iQ5b2DC6QvYNSY7jcIaJuc7hD7gp1ym0TIS5LC/52ZXb4GNjyRu2zRA6TMNCJ1
	 JOA2gNBGRNNxSbTIFb9ehK6PkiRuhipRvKHC1XCuTSV8mpOf60qUssH3llWP7eelky
	 B/NJvNRpzz3UlyUG22pWrqfdhzN+e/8noZflmzVAKwU+G33Mzut6JTiPuZiyOMYEoB
	 nTcgW9ijDYRhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] [v6] Input: gpio-keys: make legacy gpiolib optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: dmitry.torokhov@gmail.com, lee@kernel.org, linux-leds@vger.kernel.org, linux-input@vger.kernel.org
In-Reply-To: <20260710211854.1371746-3-arnd@kernel.org>
References: <20260710211854.1371746-1-arnd@kernel.org>
 <20260710211854.1371746-3-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 21:31:36 +0000
Message-Id: <20260710213137.586DE1F000E9@smtp.kernel.org>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-9027-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smtp.kernel.org:mid,sashiko.dev:url,vger.kernel.org:from_smtp,arndb.de:email];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:dmitry.torokhov@gmail.com,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:linux-input@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3BC1C73F061

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Legacy platforms that specify both a valid GPIO and an IRQ for a b=
utton are forced into purely interrupt-driven mode, degrading them to simul=
ated pulse buttons.
- [Low] The patch includes a non-existent header file `linux/gpio/legacy.h`=
, unconditionally breaking the build.

Pre-existing issues:
- [High] The Rohm MFD drivers dynamically mutate a globally shared static s=
truct during probe, breaking reentrancy and violating MFD guidelines.
--

--- Patch [2]: [PATCH 2/6] [v6] Input: gpio-keys: make legacy gpiolib optio=
nal ---
commit 1e2acc08348477940313314a2e3563828ed3ae8b
Author: Arnd Bergmann <arnd@arndb.de>

Input: gpio-keys: make legacy gpiolib optional

Most users of gpio-keys and gpio-keys-polled use modern gpiolib interfaces,
but there are still number of ancient sh, arm32 and x86 machines that have
never been converted. Add an #ifdef block for the parts of the driver that
are only used on those legacy machines.

Link: https://lore.kernel.org/all/b3c94552-c104-42e3-be15-7e8362e8039e@gmai=
l.com/
Link: https://lore.kernel.org/all/afJXG4_rtaj3l2Dk@google.com/
Link: https://lore.kernel.org/all/ajQ-CtU131FAJ9ES@google.com/

> diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/=
gpio_keys.c
> --- a/drivers/input/keyboard/gpio_keys.c
> +++ b/drivers/input/keyboard/gpio_keys.c
> @@ -23,8 +23,8 @@
>  #include <linux/input.h>
>  #include <linux/gpio_keys.h>
>  #include <linux/workqueue.h>
> -#include <linux/gpio.h>
>  #include <linux/gpio/consumer.h>
> +#include <linux/gpio/legacy.h>

[Severity: Low]
Does this header file exist in the source tree? Because this include is
outside of any #ifdef blocks, it looks like it will unconditionally break
the build for anyone compiling with CONFIG_KEYBOARD_GPIO enabled.

>  #include <linux/of.h>
>  #include <linux/of_irq.h>
>  #include <linux/spinlock.h>

[ ... ]

> @@ -528,7 +528,8 @@ static int gpio_keys_setup_key(struct platform_device=
 *pdev,
>  			 */
>  			bdata->gpiod =3D NULL;
>  		}
> -	} else if (gpio_is_valid(button->gpio)) {
> +#ifdef CONFIG_GPIOLIB_LEGACY
> +	} else if (!button->irq && gpio_is_valid(button->gpio)) {

[Severity: High]
Does this new !button->irq condition inadvertently break legacy boards that
legitimately supply both a valid .gpio and an .irq?

For example, in arch/arm/mach-sa1100/assabet.c, assabet_keys_buttons defines
buttons with both .gpio =3D 0 and .irq =3D IRQ_GPIO0. Since the GPIO is no
longer requested when an IRQ is present, wouldn't the driver fall back to
purely interrupt-driven mode?

If so, this would lack a GPIO descriptor to read the physical button level,
turning holdable physical buttons into simulated momentary pulses via the
auto-release timer.

>  		/*
>  		 * Legacy GPIO number, so request the GPIO here and
>  		 * convert it to descriptor.

[ ... ]

> diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/ke=
yboard/gpio_keys_polled.c
> --- a/drivers/input/keyboard/gpio_keys_polled.c
> +++ b/drivers/input/keyboard/gpio_keys_polled.c
> @@ -18,8 +18,8 @@
>  #include <linux/input.h>
>  #include <linux/ioport.h>
>  #include <linux/platform_device.h>
> -#include <linux/gpio.h>
>  #include <linux/gpio/consumer.h>
> +#include <linux/gpio/legacy.h>

[Severity: Low]
Similar to gpio_keys.c, does this unconditionally break the build since
linux/gpio/legacy.h is missing from the tree?

>  #include <linux/gpio_keys.h>
>  #include <linux/property.h>

[ ... ]

> diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
> --- a/drivers/mfd/rohm-bd71828.c
> +++ b/drivers/mfd/rohm-bd71828.c
> @@ -39,7 +39,6 @@
> =20
>  static struct gpio_keys_button button =3D {
>  	.code =3D KEY_POWER,
> -	.gpio =3D -1,
>  	.type =3D EV_KEY,
>  	.wakeup =3D 1,
>  };

[Severity: High]
This isn't a bug introduced by this patch, but this static struct is modifi=
ed
dynamically during bd71828_i2c_probe() when assigning button.irq =3D ret.

Since mfd_add_devices() only shallow-copies the platform data, doesn't
mutating a globally shared static struct during probe break reentrancy?
Multiple instances of the PMIC or repeated probes due to unbind/deferral
could clobber each other's IRQ number here.

> diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
> --- a/drivers/mfd/rohm-bd718x7.c
> +++ b/drivers/mfd/rohm-bd718x7.c
> @@ -20,7 +20,6 @@
> =20
>  static struct gpio_keys_button button =3D {
>  	.code =3D KEY_POWER,
> -	.gpio =3D -1,
>  	.type =3D EV_KEY,
>  };

[Severity: High]
This is a pre-existing issue, but just like in rohm-bd71828.c, mutating this
shared static struct during bd718xx_i2c_probe() violates MFD guidelines and
could cause race conditions with concurrent or repeated probes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710211854.1371=
746-1-arnd@kernel.org?part=3D2

