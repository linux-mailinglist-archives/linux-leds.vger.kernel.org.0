Return-Path: <linux-leds+bounces-9033-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uaqwGO6QUmpHRAMAu9opvQ
	(envelope-from <linux-leds+bounces-9033-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 20:52:30 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5272F742A5E
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 20:52:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Mqtfmr0e;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9033-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9033-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6643F3001A78
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 18:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FBF230E82D;
	Sat, 11 Jul 2026 18:52:23 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C428C30FC21
	for <linux-leds@vger.kernel.org>; Sat, 11 Jul 2026 18:52:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783795943; cv=none; b=gqyyWX6qXAt3NFlFsTwJtMe6PdPupTNysC7lQSyGbUVOEY3OZrfPvlnEcJ7Dh4tXVRfSnAiAmH0538fgYUdHuw77TSZOsDzdPoBpUoknsGu4QRciL05iNmefgKlxhD9ZTuF5OoOUznUPCC834sreYZWa/GVYrC87SuqkFe5PJ6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783795943; c=relaxed/simple;
	bh=i2Q4hr3r54FLbzPVYQUaH0hwaLYQ/kQIVH0ZBpaSf9g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Du/1GMkacw0T+kc/7XDloqzEtWTKJOvazJ2HZ8/64Aja0lbfzTRXtnDfG3TGGwXMdXsEVZG1gVCs2DVcaazKR1H+e/7vWKzwGOA5F7N6r68h/4lC+WfBE7HolfIWj1MdBIeR3VXKI8LthO8AxmszYjj6N2mgfN9uefKwkihR6xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mqtfmr0e; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF991F00A3A;
	Sat, 11 Jul 2026 18:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783795939;
	bh=skopOqdSu42/uiGZhAQx5k324GQ7rV8OCNCI65OGvWc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mqtfmr0e4me52Uj2vbBu36RVZuRM0efCAGzfbzigdP2SWY62/MoHEzjfZrTC1hXvN
	 dTBu5tS4yy8jEr0b+zhpLXwAxfz4VLBJwwCnaUPIzRNVZi6G8ZbUWGk3MRuGHlMZDi
	 Fw1GRfpBkkd1saJBnY/O7eKQ3Zs8holUMdZnpDc864VgMeUgXiEcV3I5GjLGX2yyJT
	 Q7yVWLyJq77Ow8LiK8etSxR2xH1XP6zbB2UR+vV/0dUA5FipLIm1xuqW5BM+Rgjwry
	 hkWovp2DD3K8cVMI00uIbMyx+jcP3+x1os3cp8fVpWvw4gPN9Txcz3sNfiu+ZpPUrH
	 vDOqPc/GcNBiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: core: Disable hardware control when writing
 brightness
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260712-leds-hw-control-brightness-set-v1-1-1de593b09d26@rong.moe>
References: <20260712-leds-hw-control-brightness-set-v1-1-1de593b09d26@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 18:52:18 +0000
Message-Id: <20260711185219.2BF991F00A3A@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-9033-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:i@rong.moe,m:lee@kernel.org,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,lists.linux.dev:replyto,rong.moe:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5272F742A5E

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] TOCTOU race in brightness_store() can cause unintended removal o=
f a newly registered trigger.
--

--- Patch [1]: [PATCH] leds: core: Disable hardware control when writing br=
ightness ---
commit 86a852e7c49262f7479b1653712185d4edd86c24
Author: Rong Zhang <i@rong.moe>

leds: core: Disable hardware control when writing brightness

This commit modifies the brightness sysfs attribute to disable hardware con=
trol
when written. It addresses an issue where the brightness attribute becomes
confusingly write-only while hardware control remains active.

> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index a51b0ed538864..3e25e5fb63dc8 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -72,7 +72,7 @@ static ssize_t brightness_store(struct device *dev,
>  	if (ret)
>  		goto unlock;
> =20
> -	if (state =3D=3D LED_OFF)
> +	if (state =3D=3D LED_OFF || led_trigger_is_hw_controlled(led_cdev))
>  		led_trigger_remove(led_cdev);

[Severity: Medium]
Could this introduce a race condition that removes an unrelated trigger?

led_trigger_is_hw_controlled() takes and drops the read-side of trigger_loc=
k:

drivers/leds/led-class.c:led_trigger_is_hw_controlled() {
	...
	guard(rwsem_read)(&led_cdev->trigger_lock);
	return led_cdev->trigger && led_cdev->trigger->trigger_type;
}

Since the lock is dropped before led_trigger_remove() acquires the write-si=
de
lock, is it possible for a concurrent thread to unregister the hardware
trigger and attach a new default trigger in the window between the check and
the removal?=20

If that sequence occurs, led_trigger_remove() might inadvertently remove the
newly attached trigger instead of the intended hardware trigger.

>  	led_set_brightness(led_cdev, state);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712-leds-hw-co=
ntrol-brightness-set-v1-1-1de593b09d26@rong.moe?part=3D1

