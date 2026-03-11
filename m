Return-Path: <linux-leds+bounces-7300-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOnwI1mXsWnkDAAAu9opvQ
	(envelope-from <linux-leds+bounces-7300-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 17:24:57 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4C2267473
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 17:24:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60A31302BDFF
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 16:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494E536F419;
	Wed, 11 Mar 2026 16:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="ap6JnBaS"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055A43E0258;
	Wed, 11 Mar 2026 16:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773246268; cv=pass; b=Fx56FI+6cBQk1dg0fTaPG0vJKhzQr8hhK/213QcgPv3IbIADfbZGVQxH94QRMnig1C81HINOtTxg+Ca3JbEcms1z6MrYOi5/cFk5ONBbAGcv4Fd9E9l3r3auTLyD+xyn8blhN7E1agT6FGSV6b+yaRIxgz7xvCmcGYNMTE98EHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773246268; c=relaxed/simple;
	bh=Qv19zzCCIKamJe9eujjgx8WPJ7Pg9sKpjoBQNXDxbxc=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=oJoEKGmibNbvoEGP1a+WQtVks82Oakb7x5x5NCI3x96Wcw+FipNfBEop+Gzsf11xXbx7YAfRSfhGtBB9kRX9O+RdQBTgJWeb3S57zoafZkQO9pekxIUdUJx/hXoUQoMWOgahx1yL8aGe/fwB4vpqMnmeVdzXtJLLkGOj1IoWB78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=ap6JnBaS; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1773246220; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A9Pq6RuOp6k0ervkD1vDQ+LB4M5aCV3fh1cXVcP2HsBcYH9i2V/4WfFnUgeAjOSqhMSaPCNMpWh4zqIAVHYu+iQxX8kqCwQL70oJIUne2pVdE/i1inSEd20wqTjQxvpl8RAregVZUBEuRWGxqW/5oUDzq9NjGW8lv80iUylDnbg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773246220; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9IpzXAwapW1Q8JMpCD/JumH3JrfD5udwEvrBiNU0Uxg=; 
	b=gMw1TVRNj6kJQhp75eRAtK+qOmRL7VMNa+jumuzMvrBODcbjR15kSq+H2HKoiltxJbJm9UZ/jLwN4g4Y55CUXspxw2UZZxQm8OZuWSoeJr/7RfYHztCe65MUBIcOSEXvQDAWCv/Wv3oyFU0SvVROr1vTCoFd5jtqf3/8G9D8gs8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773246220;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=9IpzXAwapW1Q8JMpCD/JumH3JrfD5udwEvrBiNU0Uxg=;
	b=ap6JnBaS9KyEzC1SU8Ghc4ZNe/FgJrS4Wj6M2fIpjSH3oe9oofcBsnjhfe/4aiZi
	B0BRNoB6KRu+eyoH6R2b6fBdU5UhZLNvVE2E8X6ZTDExIm9Mc00TLO/VbNsZ7TZSajN
	FjepWG/JKcpyXlZc03S/QWoQ3c9J/UAHwnP5iZS4fw1INs9+F2C3eiP8gCUgZGupkv6
	gMnLCLIRAiK62V3Lhmd0MQ37iJOtenxKJV41LwUr+4W0y5YQz6+5KcK71JcY663hC/X
	YzOCGAAGDyk/i3vQ0tpTZ50IMNrW8coQ7zZrkjQ3/R0QNlHt54OLaL4iQ4N+5jNYyn8
	5r0Hs8ZaEQ==
Received: by mx.zohomail.com with SMTPS id 1773246218565243.66911748879772;
	Wed, 11 Mar 2026 09:23:38 -0700 (PDT)
Message-ID: <7624b42b4b7a6b36aaa4602f15ff86b22aee95ff.camel@rong.moe>
Subject: Re: [RFC PATCH 1/9] leds: Load trigger modules on-demand if used
 as hw control trigger
From: Rong Zhang <i@rong.moe>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=	
 <linux@weissschuh.net>, Benson Leung <bleung@chromium.org>, Guenter Roeck	
 <groeck@chromium.org>, Marek =?ISO-8859-1?Q?Beh=FAn?= <kabel@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark"
 <derekjohn.clark@gmail.com>, Hans de Goede	 <hansg@kernel.org>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?=	 <ilpo.jarvinen@linux.intel.com>, Ike Panhc
 <ikepanhc@gmail.com>, Vishnu Sankar	 <vishnuocv@gmail.com>,
 vsankar@lenovo.com, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org
In-Reply-To: <20260310120116.GI183676@google.com>
References: <20260227190617.271388-1-i@rong.moe>
	 <20260227190617.271388-2-i@rong.moe> <20260310120116.GI183676@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Mar 2026 00:18:30 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7300-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,weissschuh.net,chromium.org,squebb.ca,gmail.com,linux.intel.com,lenovo.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[rong.moe:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1F4C2267473
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Lee,

On Tue, 2026-03-10 at 12:01 +0000, Lee Jones wrote:
> On Sat, 28 Feb 2026, Rong Zhang wrote:
>=20
> > In the following patches, we are about to support hardware initiated
>=20
> Let's not talk about other commits.  Only tell us what's happening here.
>=20
> > trigger transitions to/from the device's hw control trigger. In case
> > the LED hardware switches itself to hw control mode, hw control trigger
> > must be loaded before so that the transition can be processed.
> >=20
> > Load the trigger module specified by hw_control_trigger, so that
> > hardware initiated trigger transitions can be processed when the hw
>=20
> "hardware"
>=20
> > control trigger is compiled as a module.
> >=20
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> >  drivers/leds/led-class.c    |  1 +
> >  drivers/leds/led-triggers.c | 33 +++++++++++++++++++++++++++++++++
> >  drivers/leds/leds.h         |  1 +
> >  3 files changed, 35 insertions(+)
> >=20
> > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > index d34a194535604..0fa45f22246e3 100644
> > --- a/drivers/leds/led-class.c
> > +++ b/drivers/leds/led-class.c
> > @@ -576,6 +576,7 @@ int led_classdev_register_ext(struct device *parent=
,
> > =20
> >  #ifdef CONFIG_LEDS_TRIGGERS
> >  	led_trigger_set_default(led_cdev);
> > +	led_load_hw_control_trigger(led_cdev);
>=20
> led_trigger_load_hw_control
>=20
> >  #endif
> > =20
> >  	mutex_unlock(&led_cdev->led_access);
> > diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> > index b1223218bda11..3066bc91a5f94 100644
> > --- a/drivers/leds/led-triggers.c
> > +++ b/drivers/leds/led-triggers.c
> > @@ -313,6 +313,39 @@ void led_trigger_set_default(struct led_classdev *=
led_cdev)
> >  }
> >  EXPORT_SYMBOL_GPL(led_trigger_set_default);
> > =20
> > +static inline bool led_match_hw_control_trigger(struct led_classdev *l=
ed_cdev,
> > +						struct led_trigger *trig)
> > +{
> > +	return (!strcmp(led_cdev->hw_control_trigger, trig->name) &&
> > +		trigger_relevant(led_cdev, trig));
>=20
>=20
> This is ugly.  Break it out and provide some commentary.
>=20
> > +}
> > +
> > +void led_load_hw_control_trigger(struct led_classdev *led_cdev)
> > +{
> > +	struct led_trigger *trig;
> > +	bool found =3D false;
> > +
> > +	if (!led_cdev->hw_control_trigger)
> > +		return;
> > +
> > +	/* default_trigger is handled by led_trigger_set_default(). */
>=20
> Sentences start with uppercase chars.
>=20
> > +	if (led_cdev->default_trigger &&
> > +	    !strcmp(led_cdev->default_trigger, led_cdev->hw_control_trigger))
> > +		return;
>=20
> Do you need to check default_trigger?
>=20
> strcmp() should be able to handle empty strings.

It checks the NULLity of led_cdev->default_trigger instead of its
emptiness. While passing an empty string to strcmp is fine, passing a
NULL pointer to strcmp() leads to a NULL dereference.

Thanks for your review. ACK to other comments :)

Thanks,
Rong

>=20
> > +
> > +	down_read(&triggers_list_lock);
> > +	list_for_each_entry(trig, &trigger_list, next_trig) {
> > +		found =3D led_match_hw_control_trigger(led_cdev, trig);
> > +		if (found)
> > +			break;
> > +	}
> > +	up_read(&triggers_list_lock);
> > +
> > +	if (!found)
> > +		request_module_nowait("ledtrig:%s", led_cdev->hw_control_trigger);
> > +}
> > +EXPORT_SYMBOL_GPL(led_load_hw_control_trigger);
> > +
> >  /* LED Trigger Interface */
> > =20
> >  int led_trigger_register(struct led_trigger *trig)
> > diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
> > index bee46651e068f..e85afd4d04fd0 100644
> > --- a/drivers/leds/leds.h
> > +++ b/drivers/leds/leds.h
> > @@ -21,6 +21,7 @@ void led_init_core(struct led_classdev *led_cdev);
> >  void led_stop_software_blink(struct led_classdev *led_cdev);
> >  void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned i=
nt value);
> >  void led_set_brightness_nosleep(struct led_classdev *led_cdev, unsigne=
d int value);
> > +void led_load_hw_control_trigger(struct led_classdev *led_cdev);
> >  ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
> >  			const struct bin_attribute *attr, char *buf,
> >  			loff_t pos, size_t count);
> > --=20
> > 2.51.0
> >=20

