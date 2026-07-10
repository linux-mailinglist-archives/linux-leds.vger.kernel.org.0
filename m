Return-Path: <linux-leds+bounces-9014-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NAcqCDYPUWo/+wIAu9opvQ
	(envelope-from <linux-leds+bounces-9014-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 17:26:46 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A62D73C388
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 17:26:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lTGobCSW;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9014-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9014-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 173BE3046C1C
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 15:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B36257824;
	Fri, 10 Jul 2026 15:21:19 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D016364E89
	for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 15:21:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783696879; cv=none; b=s7a1F20UYAaI1EzBqsIpfq5vSbNXhrwQ/y7fYbnUucVDMSf4VZoM/ZH2apZgBp1+6QcIBxlwy0xikwXBbrBkfTIfk3/HfZ7GjMZKLY7GK6BR6ghn17MhPUTSxHUR/IGWs8gjWJg2NroNUNxfsH2JfTwXriwX1XWaOI27oTBA8G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783696879; c=relaxed/simple;
	bh=LrMz6NbhVlr6EstIHD7cdw8f4pc3WgwvWz/FORJtiTc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=el2RE1Lwh9l0q/dp8Y92CVusUKM6FMM31UolqKXcFUAh0YJFYh8/A9MZvxaoBhno49rkL1T8bQfm5W7jfgELvAU3Vay0XRJe2enoP/ti37a73JWuRep/V7bT8smxWp/SdwwFQYsbbvheQfARYOmFVhjek1WvbbYvMvSxJbmB5sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTGobCSW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011F71F00A3A;
	Fri, 10 Jul 2026 15:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783696878;
	bh=6SCvfwL7pHMJRG6OOfpZ/ik4p0eV+GpormIt3yQI+HU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lTGobCSWHB/62zR5FCwMOwhStAqYZxlT+ADd44Pt4ExNK8jqXKmCEVZxnqo30rxF8
	 t7TSYxPiJrw1wMaj3psViK3sjq/JS7DPMrwXndSc3ADzeEgxCH3qi5BquZLqQHAstx
	 anjnmfqATSGMbIl3GZzG03X7HINUR7eaWeNeBTP7SyS8izLQ5GWz01SpXTDuXhQm3f
	 hBwej9Cf4S5UHXbvA1h6zpNMxe+8VZYnIKxB12+aKGlDcWhG8LVvRrBNu1csYr4rX7
	 UykQ33Hws2HgpXEE3JgZtPUY1fFW0maiySjsklBsE+4qKmWmhuteFdf4lQ1fi6/7yn
	 j1aViIS+7jHHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: gpio: Skip unavailable LEDs during shutdown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Steve Dunnagan" <sdunnaga@redhat.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260710150841.19669-1-sdunnaga@redhat.com>
References: <20260710150841.19669-1-sdunnaga@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 15:21:17 +0000
Message-Id: <20260710152118.011F71F00A3A@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-9014-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:sdunnaga@redhat.com,m:linux-leds@vger.kernel.org,m:lee@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
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
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smtp.kernel.org:mid,vger.kernel.org:from_smtp,sashiko.dev:url,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A62D73C388

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The platform data probe path silently skips LEDs when GPIO lookup =
returns -EPROBE_DEFER, breaking deferred probing.
- [High] Teardown race: gpio_led_shutdown fails to disable software blink t=
imers and active triggers, allowing concurrent LED updates during system sh=
utdown.
- [Low] The driver does not use dev_err_probe() to handle and report probe =
failures.
- [Low] The driver uses generic names 'priv' and 'gpio_leds_priv' for its p=
rivate data, violating subsystem naming conventions.
--

--- Patch [1]: [PATCH] leds: gpio: Skip unavailable LEDs during shutdown ---
commit 94da8744ab857bc87f8158e7c51602a324f2f403
Author: Steve Dunnagan <sdunnaga@redhat.com>
Subject: leds: gpio: Skip unavailable LEDs during shutdown

This commit fixes an issue in gpio_led_shutdown() where an error-valued
GPIO descriptor could be passed to gpio_led_set(). It avoids a potential
invalid GPIO operation by ensuring we skip unavailable LEDs during the
shutdown process.

> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index ce4e79939731d..6a2f2386978d7 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -290,6 +290,9 @@ static void gpio_led_shutdown(struct platform_device =
*pdev)
>  	for (i =3D 0; i < priv->num_leds; i++) {

[Severity: Low]
This is a pre-existing issue, but does the use of the generic "priv" variab=
le
name violate subsystem naming conventions?

The LED subsystem guidelines prefer using the device name and "ddata" for
private data structures and variables rather than generic names like "priv"=
 or
"gpio_leds_priv".

>  		struct gpio_led_data *led =3D &priv->leds[i];
> =20
> +		if (IS_ERR(led->gpiod))
> +			continue;
> +
>  		if (!(led->cdev.flags & LED_RETAIN_AT_SHUTDOWN))
>  			gpio_led_set(&led->cdev, LED_OFF);

[Severity: High]
This isn't a bug introduced by this patch, but does gpio_led_shutdown() fail
to disable software blink timers and active triggers?

While the physical GPIO is turned off here, if a heartbeat or timer trigger
fires during the device shutdown phase (while interrupts are still active),=
 it
could queue a work to change the LED brightness. If the underlying GPIO
controller or sleepable bus is already shut down, could this concurrent acc=
ess
cause a crash or bus lockup?

>  	}

While reviewing this file, I noticed a couple of other pre-existing issues =
in
gpio_led_probe().

[Severity: High]
This is a pre-existing issue, but does gpio_led_probe() silently swallow
probe deferrals?

drivers/leds/leds-gpio.c:gpio_led_probe() {
    ...
			if (IS_ERR(led_dat->gpiod)) {
				dev_info(&pdev->dev, "Skipping unavailable LED gpio %d (%s)\n",
					 template->gpio, template->name);
				continue;
			}
    ...
}

If the GPIO lookup returns -EPROBE_DEFER (for example, if the controller
probes later), this catch-all check logs a generic message and skips the LED
instead of propagating the error. Will this cause the LED to be permanently
missing since the kernel won't re-attempt probing?

[Severity: Low]
This is another pre-existing issue, but should gpio_led_probe() use
dev_err_probe() to handle failures?

drivers/leds/leds-gpio.c:gpio_led_probe() {
    ...
		priv =3D gpio_leds_create(pdev);
		if (IS_ERR(priv))
			return PTR_ERR(priv);
    ...
}

Errors originating from gpio_leds_create() are returned directly. Subsystem
guidelines recommend always using dev_err_probe() to report probe failures
and correctly handle -EPROBE_DEFER.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710150841.1966=
9-1-sdunnaga@redhat.com?part=3D1

