Return-Path: <linux-leds+bounces-9011-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XuosIZz9UGqo9gIAu9opvQ
	(envelope-from <linux-leds+bounces-9011-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 16:11:40 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2158073BA5E
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 16:11:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Kb6WKvYM;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9011-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-9011-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 64E4A302672B
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 14:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A722D738A;
	Fri, 10 Jul 2026 14:10:50 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6C32E7369;
	Fri, 10 Jul 2026 14:10:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783692650; cv=none; b=MDFKi80aItvduMZd/VEYVhSbBpoSaQDSMDz156LEFyhuakISGSxEuO9g8OwE2ZlHTwU+9o5S5FLU4z4ZR3+8DGIuN6+15praIMFPlwyB7LDuUEC1dghZzE7EiC9Yq6N5ulyHUpQwN2BHimQHbO/DzQa6HUjE9RdndUnaYYlydBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783692650; c=relaxed/simple;
	bh=Wkuzc19WFCE/o9/fESvyZTC6ClK7uynBhtFhl0hfYlU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mor7dpLcA7TBAW23c1uW2dffF9550urqYISVBSh9aCepubMvEKOOFRWGEk0an4BwC259JzRupWShh0m5Ak2GUlTEWokLXxAC6jc5XPX/cWrlHQ7j5nWjL6rvZ5/Ug6rrnnIP9m6tSdbIwER9ClMJMVbJbla/mZFlQTVWVyamXko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kb6WKvYM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4801F000E9;
	Fri, 10 Jul 2026 14:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783692649;
	bh=EO/9BLIAhGfrHXRZfXYV9BmiCgGU/oq2KL/dCQ/YtsM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kb6WKvYMDoHygyO6ctRNvM63jpln6Pp8KXA4AOQohz1zfFhQY0fjPySqQz8BQS1K3
	 c0gDBZxbWIJ1e781slPBdW+HE+f3OytX2skTv07NhnkOkRDpoWi2hNU5ez5Zx33siP
	 /jIi903ZGL7OkjqKcLw43ZODLQj/hnP8r5uhBbWFOCHMu+GqXzTXwzRu0b6iwTuYZ7
	 nORne3nPosoTGQlQRIeZh+2kVHWtJAd9+uEY4NPeUpUl4TM6Sh8cdYzfGXM+LWCrdu
	 NgHoN/0/AmMg4YwNtSPS/XhXbkVswzUGJkoR48vFmAR/5Eswy//HZhsjZyP401PARJ
	 VYRlgNiiFBhlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] leds: pca963x: add multicolor LED class support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260710-monza-leds-v5-3-a8972d28c28f@oss.qualcomm.com>
References: <20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com>
 <20260710-monza-leds-v5-3-a8972d28c28f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 14:10:48 +0000
Message-Id: <20260710141048.8A4801F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-9011-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,lists.linux.dev:replyto,qualcomm.com:email,vger.kernel.org:from_smtp,smtp.kernel.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-leds@vger.kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2158073BA5E

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] State desynchronization on I2C failure leaves the chip stuck in sl=
eep mode.
--

--- Patch [3]: [PATCH v5 3/4] leds: pca963x: add multicolor LED class suppo=
rt ---
commit 8c03d358e0d33360e4842037176019ecbef4c7b9
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

leds: pca963x: add multicolor LED class support

Allow grouping of individual PCA963x PWM channels into a single
multicolor LED device by adding support for the LED multicolor class.
A child node with sub-children is treated as a multicolor group,
others are treated as single leds, keeping full backwards compatibility.

> diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
> index e3a81c60ee27c..e54a60c7bf282 100644
> --- a/drivers/leds/leds-pca963x.c
> +++ b/drivers/leds/leds-pca963x.c
[ ... ]
> @@ -221,22 +229,52 @@ static int pca963x_led_set(struct led_classdev *led=
_cdev,
[ ... ]
> +static int pca963x_led_mc_set(struct led_classdev *led_cdev,
> +			      enum led_brightness value)
> +{
> +	struct led_classdev_mc *mc_cdev =3D lcdev_to_mccdev(led_cdev);
> +	struct pca963x_led *led =3D container_of(mc_cdev, struct pca963x_led, m=
c_cdev);
> +	unsigned long cached_leds;
> +	int ret;
> +
> +	led_mc_calc_color_components(mc_cdev, value);
> +
> +	guard(mutex)(&led->chip->mutex);
> +
> +	cached_leds =3D led->chip->leds_on;
> +	for (unsigned int i =3D 0; i < mc_cdev->num_colors; i++) {
> +		led->led_num =3D mc_cdev->subled_info[i].channel;
> +		ret =3D pca963x_brightness(led, mc_cdev->subled_info[i].brightness);
> +		if (ret)
> +			return ret;

[Severity: High]
If an I2C error occurs here on a subsequent iteration of the loop, could the
hardware state become desynchronized from the software state?

Earlier iterations of this loop may have successfully completed and called
pca963x_track_power_state(), which updates the software state in
led->chip->leds_on. However, returning early here skips the
pca963x_sync_power_state() call.

If the early return happens when turning on the LEDs, led->chip->leds_on wi=
ll
have bits set, but the chip may still be in sleep mode. Future calls to set
brightness would then incorrectly believe the chip is already awake,
potentially leaving the hardware unresponsive until userspace explicitly tu=
rns
off every LED on the chip to reset the state.

> +
> +		pca963x_track_power_state(led, mc_cdev->subled_info[i].channel,
> +					  mc_cdev->subled_info[i].brightness);
> +	}
> +
> +	return pca963x_sync_power_state(led, cached_leds);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-monza-leds=
-v5-0-a8972d28c28f@oss.qualcomm.com?part=3D3

