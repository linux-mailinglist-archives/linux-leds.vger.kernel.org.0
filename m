Return-Path: <linux-leds+bounces-8990-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nvcLMCt7T2pthwIAu9opvQ
	(envelope-from <linux-leds+bounces-8990-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Jul 2026 12:42:51 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F070A72FC5C
	for <lists+linux-leds@lfdr.de>; Thu, 09 Jul 2026 12:42:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bPXya8ka;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8990-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8990-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13C4F30B4156
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jul 2026 10:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413503F7AB9;
	Thu,  9 Jul 2026 10:30:13 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0032A3F4130
	for <linux-leds@vger.kernel.org>; Thu,  9 Jul 2026 10:30:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593013; cv=none; b=GixmWNmX2cQ6bufELQP5Uq0+e4FjVtTkmpQYxPasiYwvc6PutovlIOGuztZdUnRaalpOPtngYPIHuaS2VttoDcdJOK/2GwJGXaE97Sb5gUVlpOGHRBRWTjvo+XHjKI5iHoEXFJAuGplIj25ernN9gJLQ1MSt49sw3eJfe9nOjik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593013; c=relaxed/simple;
	bh=wDwgK4DmfpyN3qUc9Q7k2BsFZ0Uk72G4GD3ygs2wyX4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GIK2GROF2B1p/XuNeOl01CYFM0cW10U8J2hQjO/gU2tMgLDsh9YqWjGMCwRXDkbvgWyGBDb32nt8LnsiCwbgjmQedLxAWCL6W/DTyT3UMBVMDUaURe2F8UTL5TGJCRtEV9InEqe9K8f072KP8pXVlJLfCCPXggFDktEe1vedw08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bPXya8ka; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60FE51F000E9;
	Thu,  9 Jul 2026 10:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783593011;
	bh=otLjqzIoJw41IlWu0vwoLX52jhne64d2NrWLno9ANqc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bPXya8ka9TJ8gaZ4okfTyNuo1Ivew+Ur1JNI+E1M5TjNnr8p2E+Ffj+2ylQuy6U6g
	 bdxZ7xXvWmUyEqKaobf/sCyk7Sqhq0D/qS7nWVDVoHgt3cSv2bR2YfthqEWZDcgdCM
	 bD79nx0Nqsfj4mnWZCYuL1RwbOjjdh63jHRfftTFW0rh/Amgh6gYiltBl/uWvFSX5b
	 3Z1+BEm/X+dvWCDY5XTnvcTlxxK0MpSkaIT2SE9aD+X211miqaTjD/zUhOYXyNcn5D
	 zdWmzgGJJb5NuX0M8Z5MPiZJxI39SklncubMqKFUBG8LwNbVmRHrww/OrgacSArSAa
	 qFbRWSCbNEZ3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: class: disable sysfs before unregistering LED
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Lee" <david.lee@trailofbits.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260709101210.104975-1-david.lee@trailofbits.com>
References: <20260709101210.104975-1-david.lee@trailofbits.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 10:30:10 +0000
Message-Id: <20260709103011.60FE51F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8990-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:david.lee@trailofbits.com,m:linux-leds@vger.kernel.org,m:lee@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,lists.linux.dev:replyto,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,trailofbits.com:email,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F070A72FC5C

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Reusing `LED_SYSFS_DISABLE` for unregistration teardown conflicts =
with V4L2 flash, which can clear the flag during unregistration and bypass =
the patch's protection.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but missing the `led=
_sysfs_is_disabled()` check in `multi_intensity_store()` bypasses the patch=
's newly introduced teardown protection, allowing the use-after-free to sti=
ll occur for multicolor LEDs.
- [High] This problem wasn't introduced by this patch, but concurrent `led_=
trigger_register` can attach a trigger to an unregistering LED device whose=
 embedded `dev` structure has already been freed, leading to a Use-After-Fr=
ee.
- [High] This problem wasn't introduced by this patch, but LED triggers hav=
e a Use-After-Free race condition where their sysfs attributes can execute =
concurrently with or after trigger deactivation.
--

--- Patch [1]: [PATCH] leds: class: disable sysfs before unregistering LED =
devices ---
commit a26d864d321effb464ac1db24d6210a72a4d07d3
Author: David Lee <david.lee@trailofbits.com>
Subject: leds: class: disable sysfs before unregistering LED devices

This commit attempts to fix a lifetime race during LED unregistration
by locking led_access and setting LED_SYSFS_DISABLE early in
led_classdev_unregister(). This blocks sysfs writers from accessing the
embedded struct led_classdev while it is being torn down.

> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 6a8ea94834fa3..a6c2468c0da1e 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -435,6 +435,9 @@ void led_classdev_unregister(struct led_classdev *led=
_cdev)
>  	if (IS_ERR_OR_NULL(led_cdev->dev))
>  		return;
> =20
> +	mutex_lock(&led_cdev->led_access);
> +	led_sysfs_disable(led_cdev);
> +

[Severity: High]
Does overloading LED_SYSFS_DISABLE for unregistration conflict with V4L2
flash devices?

If a user closes the V4L2 subdevice file concurrently during driver removal,
v4l2_flash_close() actively clears this flag:

drivers/media/v4l2-core/v4l2-flash-led-class.c:v4l2_flash_close() {
    ...
    led_sysfs_enable(led_cdev);
    mutex_unlock(&led_cdev->led_access);
}

Could this allow a blocked sysfs writer to acquire led_access after
unregister unlocks it, incorrectly see sysfs as enabled, and schedule work
on an unregistering or freed device?

[Severity: High]
This isn't a bug introduced by this patch, but does the lack of a
led_sysfs_is_disabled() check in multi_intensity_store() bypass this newly
added teardown protection?

If a concurrent sysfs write to multi_intensity blocks on led_access, and
acquires it after unregister unlocks it:

drivers/leds/led-class-multicolor.c:multi_intensity_store() {
    ...
    mutex_lock(&led_cdev->led_access);

    for (i =3D 0; i < mcled_cdev->num_colors; i++) {
    ...
}

Because it immediately proceeds without checking if sysfs is disabled,
could it call led_set_brightness() and schedule new work after unregister
has already flushed work queues, leading to a use-after-free?

>  #ifdef CONFIG_LEDS_TRIGGERS
>  	down_write(&led_cdev->trigger_lock);
>  	if (led_cdev->trigger)
>  		led_trigger_set(led_cdev, NULL);
>  	up_write(&led_cdev->trigger_lock);
>  #endif

[Severity: High]
This isn't a bug introduced by this patch, but is there a use-after-free
race condition when clearing the trigger here?

In led_trigger_set(), the deactivate callback is executed before the sysfs
groups are removed:

drivers/leds/led-triggers.c:led_trigger_set() {
    ...
    if (led_cdev->trigger->deactivate)
        led_cdev->trigger->deactivate(led_cdev);
    device_remove_groups(led_cdev->dev, led_cdev->trigger->groups);
    ...
}

Since sysfs operations for triggers (like transient_activate_store()) do not
acquire led_access, could a sysfs write that is preempted resume after
deactivate() frees the private data, modifying freed memory before
device_remove_groups() can prevent it?

[ ... ]

> @@ -455,6 +458,8 @@ void led_classdev_unregister(struct led_classdev *led=
_cdev)
>  	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED)
>  		led_remove_brightness_hw_changed(led_cdev);
> =20
> +	mutex_unlock(&led_cdev->led_access);
> +
>  	device_unregister(led_cdev->dev);
> =20
>  	down_write(&leds_list_lock);
>  	list_del(&led_cdev->node);
>  	up_write(&leds_list_lock);

[Severity: High]
This isn't a bug introduced by this patch, but does unregistering the
device before removing the LED from the global leds_list leave a dangling
pointer?

If device_unregister() drops the final reference and frees the device
structure, could a concurrent led_trigger_register() iterating over
leds_list match this unregistering LED?

drivers/leds/led-triggers.c:led_trigger_set() {
    ...
    ret =3D device_add_groups(led_cdev->dev, trig->groups);
    if (ret) {
    ...
}

Could this lead to led_trigger_set() dereferencing the already-freed
led_cdev->dev when attempting to attach the trigger's sysfs groups?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709101210.1049=
75-1-david.lee@trailofbits.com?part=3D1

