Return-Path: <linux-leds+bounces-8774-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UGqlMoV2QmpF7wkAu9opvQ
	(envelope-from <linux-leds+bounces-8774-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 15:43:33 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 386C96DB6D7
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 15:43:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QFVMDnom;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8774-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8774-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 597143025483
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 13:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC3B3BB40;
	Mon, 29 Jun 2026 13:32:03 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A28B1ACEDE;
	Mon, 29 Jun 2026 13:32:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739923; cv=none; b=skbBwqzpDU1tsjX/pVkg7EYYb7A521QH3Ioaq1zPQ6j1LORgNxTaO0yGSFBr9JIZAV/stHopShzCOKO+31ml9BiZpNyMd5JDfSzdpmyhZuZDDU/heBuiSIpIJhqGhGxRLM5O4sxQbLcKsy87FclU2ICiPALWFk0vx6eIxek00+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739923; c=relaxed/simple;
	bh=UkwcG2uO6Own9BFxIH8ER5JD24SKVvOinkrPfwNTNKo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N6V+8qZe3GBUuPUHL8Yg3iufO7K/y4nRSbe5tKVOSCoilOih0jAVrfCYfDg4zZfVyWXwzq5bmRFw4iOiASiq0X5ijoQDvZDgZ5djIRc8YEUzA4wEvna7guuyC5oSvybWfvVSakaZtE4KVWx89W0voDSmn7BMrK00s/0zDxAzcBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QFVMDnom; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE78E1F000E9;
	Mon, 29 Jun 2026 13:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782739922;
	bh=vdikD+4Kh+7Ra8FylUThHN8QZevrrJLOLL6HRk/crpA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QFVMDnomhkpXk2EqW6RP+MULPcvSVUz/kAuw4wluIa3NOxVw7xEl+RhW6m7ubc79+
	 dGLAnB4CeY6jkckSW3UvToy8c2dwl5ibeG/qvmLX1RDa7jOWVLAW9sMALJ8uTKjn97
	 gcCXhU23pA4oBktVg19/i6hWLt6A6dXpKVD+LReX+GLsnE8GV/ZLCdmx2G1wzXExKN
	 Z+oDtE1vRjOivPraHipsY5mkQLe2RDXnFiXT35l1Srd1r4XT1B+D2S/blYFeMpxz4z
	 HjqxW/92UJ4zA2oHYjEVWQZNthhLX14KA2U7Pumd7RVsGwK09SkDo7ODiOKJh5YbRU
	 Q3OS9d8mque5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] [v5] Input: gpio-keys: make legacy gpiolib optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-leds@vger.kernel.org, lee@kernel.org, linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
In-Reply-To: <20260629130329.1291953-5-arnd@kernel.org>
References: <20260629130329.1291953-1-arnd@kernel.org>
 <20260629130329.1291953-5-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 13:32:01 +0000
Message-Id: <20260629133201.DE78E1F000E9@smtp.kernel.org>
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
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8774-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:linux-input@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 386C96DB6D7

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The target patch breaks button hold and debounce functionality for=
 legacy boards that specify both a GPIO and an IRQ in their platform data.
--

commit 7c2e3c482d0d5858bfbdee73da72e2a7bcba0509
Author: Arnd Bergmann <arnd@arndb.de>

Input: gpio-keys: make legacy gpiolib optional

This commit makes the legacy gpiolib interfaces optional in the gpio-keys
and gpio-keys-polled drivers by enclosing them in an #ifdef block. It also
modifies the gpio-keys driver to ignore the GPIO number if an IRQ is passed
to keep the Rohm PMIC drivers working.

Link: https://lore.kernel.org/all/b3c94552-c104-42e3-be15-7e8362e8039e@gmai=
l.com/
Link: https://lore.kernel.org/all/afJXG4_rtaj3l2Dk@google.com/
Link: https://lore.kernel.org/all/ajQ-CtU131FAJ9ES@google.com/

> diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/=
gpio_keys.c
> --- a/drivers/input/keyboard/gpio_keys.c
> +++ b/drivers/input/keyboard/gpio_keys.c

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
Does this skip requesting the legacy GPIO descriptor if an IRQ is provided,
breaking platforms that explicitly provide both?

Legacy boards (like assabet, collie, or h3xxx) use both a GPIO and an IRQ
to allow reading the button state alongside a custom IRQ trigger.

By skipping the GPIO setup when an IRQ is provided, bdata->gpiod remains
NULL. The driver then falls back to its IRQ-only mode where it can no
longer read the physical state of the GPIO, instead simulating an immediate
key press and release via a timer.

Could this break button hold and debounce functionality for these legacy
machines?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629130329.1291=
953-1-arnd@kernel.org?part=3D4

