Return-Path: <linux-leds+bounces-9030-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8VcJF6F9UmqiQQMAu9opvQ
	(envelope-from <linux-leds+bounces-9030-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 19:30:09 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCB8742649
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 19:30:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rong.moe header.s=zmail2048 header.b=pmQOYYEd;
	dmarc=pass (policy=none) header.from=rong.moe;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9030-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9030-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A69E3010C32
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 17:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB50D3CD8C9;
	Sat, 11 Jul 2026 17:30:06 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F872DEA75;
	Sat, 11 Jul 2026 17:30:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783791006; cv=pass; b=oqGlrMdpWI0kWn/lWfmtVIVXw6oPR53yaciuYhAPIo4Pklkr5WN/rEHwrEycPiJ4zB1Pc4YrbauHalRX2QLbpZHD67TAEV/fGmS1Z+Gr/Hn6g+/yHZQzLciSTRLTheh+3yWur4nIx53ZvZOgRjGs4ZKKfBw9YmKSp6XqUDGzAQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783791006; c=relaxed/simple;
	bh=tdCl8S9EXRcGRSinqPII+69zeCNsXmw4ab9PKUjB/RY=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:Content-Type:Date:
	 MIME-Version; b=XVYziHnQpCAkmltUQwKo0B/SBm/4zYuGgg3otiNcQmJpmTTmuTN+rd6NMf1lbJumqrRC5CdmptiziR4iFXj8Gia+tZki74gYYYioOAL4K7dkpstr7J/+2iSJP8pmP0q2jVEDGb2OlwaZ8KTxPI8tIIS0JKmYEKft4uyya9GHF4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=pmQOYYEd; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal: i=1; a=rsa-sha256; t=1783790997; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l5JZ1gwErzyp4xnkQBNoeag4kg6tTrI+8nHUv0OxcLYQrbXxNZiVicQH+bqYQV6ILbDXhYOryA3LYUo+6rDl6Z0jxiEYZ94fcmw3UQUGwM6PMd1ZF3zcNfKqDePLNcAV2US2A4Lil0s4eLawesVHXYHyt0QJNd4BD5g9ybmUbgY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783790997; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SZ0R5QUCTRhf9KEbc/2wo1FZ0raYzTy1R8XLz/Hd3jY=; 
	b=VyAMQX/khrgHx7oXBDcJyi+OlPeTGB8nyO0AOjq2LDjto2hWOPRZIu+UNDFwCLZlFZ+NJPkXfB8XUUWz+zHzckBGQDeQ5HMH6oZcKpB1OpwidWQbBQ/YJ27MkGob2viaT5LFFLzyBOW6Rk/6HgVSDZmLhSfTCvS+JUp/viZ5/aM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783790997;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=SZ0R5QUCTRhf9KEbc/2wo1FZ0raYzTy1R8XLz/Hd3jY=;
	b=pmQOYYEd4bnRj6svjibon1QFGgYwqQ9+zjvQrMjunkQTXt54IVR5IyXBJ8pz63zF
	DqG0caoAnnnS3rHhfP/tSEWpos05hazLHVesw7i61Ed+Vw+fmTDzWFJIy7IE0m60ols
	B52HANIMj0L7szATucj5SWksEgg12FbJOOGFHmU2E4llozWlCb/yqD84QCHQeCvTMj6
	wKjXYOqSiAaH3undxa/hHUd92Ggn1vfNPwKOlHr8cAIAOrCSaV3OFyyxIne4o4Cbpva
	9WWktD7SX7qbeqoZlfMnBDgAYK5W6CZIOoNSb2JoSirt6SvPjccgmY4IZ2Ciq/jbChc
	cgHJhH0Rig==
Received: by mx.zohomail.com with SMTPS id 1783790993448285.44254175744675;
	Sat, 11 Jul 2026 10:29:53 -0700 (PDT)
Message-ID: <a0c35498226b33eebacf7641aed126ffc8f99456.camel@rong.moe>
Subject: Re: [PATCH RFC] leds: core: Report ENODATA for brightness of
 hardware controlled LED
From: Rong Zhang <i@rong.moe>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>, Lee Jones
	 <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 pavel@kernel.org
In-Reply-To: <20260521-cros_ec-leds-hw-trigger-brightness-v1-1-6cd9d7c9671e@weissschuh.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 01:14:10 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10 
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux@weissschuh.net,m:lee@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:pavel@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-9030-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[rong.moe:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BCB8742649


Hi Thomas, Lee,

Hopefully I am not too late to appear in the thread. I only noticed it
after it reached v7.2-rc1.

> While the LED is controlled fully by the hardware, the value cached by
> the LED driver core is incorrect. Return ENODATA to userspace in this
> case.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  drivers/leds/led-class.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 9e14ae588f78..a88e274228e5 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -27,12 +27,25 @@ static LIST_HEAD(leds_lookup_list);
> =20
>  static struct workqueue_struct *leds_wq;
> =20
> +static bool led_trigger_is_hw_controlled(struct led_classdev *led_cdev)
> +{
> +#ifdef CONFIG_LEDS_TRIGGERS
> +	guard(rwsem_read)(&led_cdev->trigger_lock);
> +	return led_cdev->trigger && led_cdev->trigger->trigger_type;

This is a sufficient but not necessary condition. A generic trigger
coordinating with the driver using hw_control_* interfaces returns false
here.

That's also one of the reasons why I would like to introduce a new
interface for the LED core to query the hardware control (offloaded)
state, see
https://lore.kernel.org/all/20260618-leds-trigger-hw-changed-v2-1-c28c44053=
cf3@rong.moe/

Thomas, could you kindly review the series and see if the series makes
sense to cros_ec?

> +#else
> +	return false;
> +#endif
> +}
> +
>  static ssize_t brightness_show(struct device *dev,
>  		struct device_attribute *attr, char *buf)
>  {
>  	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
>  	unsigned int brightness;
> =20
> +	if (led_trigger_is_hw_controlled(led_cdev))
> +		return -ENODATA;
> +

How about brightness_store()?

It's a no-op to set a brightness when the LED is controlled fully by the
hardware, and returning -ENODATA on read effectively makes the attribute
write-only. A write-only no-op attribute is very confusing.

We already call led_trigger_remove() when 0 (LED_OFF) is written to the
brightness attribute. Should we also break the write-only no-op dilemma
by doing the same in brightness_store() when
led_trigger_is_hw_controlled() is true?

While some software triggers use the brightness attribute to tune
itself, hardware control triggers don't seem to do so.

I also glanced some net or phy drivers that provides hardware control.
IIUC, calling brightness_set[_blocking]() while hardware control is
active causes the drivers to force software control and set the desired
brightness, leaving the hardware control trigger ("netdev") still active
(!)

So we are already living in a world that writing to the brightness
attribute effectively disables hardware control and makes the trigger
out-of-sync.

Also note that Documentation/leds/leds-class.rst says:

   When the LED is in hw control, no software blink is possible and doing
   so will effectively disable hw control.

IMO disabling hardware control in brightness_store() also matches such
semantics, though I guess these words originally referred to software
triggers.

I will submit a patch to deactivate private trigger upon
brightness_store() soon. For public hardware control trigger (i.e.,
"netdev"), it still needs my series to make it mutually exclusive with
the brightness attribute while in hardware control mode.

Thanks,
Rong

>  	mutex_lock(&led_cdev->led_access);
>  	led_update_brightness(led_cdev);
>  	brightness =3D led_cdev->brightness;
>=20
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260404-cros_ec-leds-hw-trigger-brightness-124ff8ce5dd6
>=20
> Best regards,
> -- =20
> Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

