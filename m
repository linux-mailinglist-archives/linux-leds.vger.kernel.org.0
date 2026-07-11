Return-Path: <linux-leds+bounces-9031-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eOtmLDuHUmqPQgMAu9opvQ
	(envelope-from <linux-leds+bounces-9031-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 20:11:07 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3675742765
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 20:11:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rong.moe header.s=zmail2048 header.b="f/QB/gjO";
	dmarc=pass (policy=none) header.from=rong.moe;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9031-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-9031-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61E453002A00
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 18:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340EB3CF203;
	Sat, 11 Jul 2026 18:10:58 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993A73CF1F6;
	Sat, 11 Jul 2026 18:10:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783793458; cv=pass; b=kA4qH0xTHBQ5dTOUY9WHlOBOPSGXi37d4Vv+gcVuEbALiJVBsf4w3Ko9egWUwHyCCiD3BVMPu0u/V9LX6Jbl9l000WPAp3T1zAt/sTDWHUlgcCv4tfcEqdU6i2Pr8PEtafjjZ4P4DQ1F3Dq7AOuSS8AsOUz4lOURHQV2O8/esNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783793458; c=relaxed/simple;
	bh=3LPAs2HbSz2hNXwL6ANEN51mzDD0mSS8Qv4UXGPhr/g=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CPZ9xdlfDG48MecQfMWNc4l6702PirTmS+H8trNNANOwcK2ZL6PioIZCV++CCzsDrq+6P7PSCgypdAzAeFM/atdNbADfiQ8AriKuceg87l6x87PkbzHTzY4kAEFdJnI248i89v313z8d1LSnGoj/cvIExP0GSfzwJmsGiBviQ2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=f/QB/gjO; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal: i=1; a=rsa-sha256; t=1783793447; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lGUoyKI/ymbEcgL75ZMG6rizrVswjzqUk8S6PLzuvLiG9yM6XKF6GsXirETvbiYj/696Rkh174D3o7ZuMn9uRSkqi34L0SnnJ3oF+bgzj1NPFL856B2PWTdbvgrpaqzaCus5/X8L52CdgviiSRh2n16qkVCJc6ff5skgLqPtn7g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783793447; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SGUunRNT+HAXKbGikLHOUJ39kd6arcTavHAsz6FvKpk=; 
	b=bg2uKpCr7PWnbh2mGwVQDtJau8IknhRClNGYt74MAt6neTs5BW/X4+94CZNqN2xGIr2pdnwjj00Fr36ORVfdpCLXwoBQDAfQ8mYs/HYhvGCDT4+056qNkGLo6Cblwzl+jA97nde9CRQmpvudFR1tyPgxC3vx+3epKnoEph2PUGI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783793447;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=SGUunRNT+HAXKbGikLHOUJ39kd6arcTavHAsz6FvKpk=;
	b=f/QB/gjOO7cxyNr3tUeuUZEtIzZ66wkQdk/fZOvXTgqx4Xo76ddVeUWeQXQ4Jj19
	Rx7e+IhPDD0b3ww0b6dUcPdRe7Id4dWHmQETjIjp2Qo3po56aZbgx4QujqqITPjczr6
	lLG2QJR6VZyvbIv0fBBa0d9XK1SNYskszhDohBiT4Xh0fwFINE7niOFn5nhlchk+Q87
	/Y3V+XufMXJrPNl519xQlmJlZX4WS/kTdbTB+opvXw7LCkz1fE6zkcuowGpZ5ZZHF3s
	4XFdpvrAc9/K3qzd9W6mAnX6wCAvtZAcuk8GfBYEGG6/XzF0GVIlTKm6lhWSLRn8uMh
	NKpFYJdB3g==
Received: by mx.zohomail.com with SMTPS id 178379344477840.83227898738551;
	Sat, 11 Jul 2026 11:10:44 -0700 (PDT)
Message-ID: <0bfe0a11e502a68afe6c06d001df3cf56a0e506b.camel@rong.moe>
Subject: Re: [PATCH RFC] leds: core: Report ENODATA for brightness of
 hardware controlled LED
From: Rong Zhang <i@rong.moe>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>, Lee Jones
	 <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 pavel@kernel.org
In-Reply-To: <a0c35498226b33eebacf7641aed126ffc8f99456.camel@rong.moe>
References: <a0c35498226b33eebacf7641aed126ffc8f99456.camel@rong.moe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 02:05:39 +0800
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@weissschuh.net,m:lee@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:pavel@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-9031-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3675742765

On Sun, 2026-07-12 at 01:14 +0800, Rong Zhang wrote:
> Hi Thomas, Lee,
>=20
> Hopefully I am not too late to appear in the thread. I only noticed it
> after it reached v7.2-rc1.
>=20
> > While the LED is controlled fully by the hardware, the value cached by
> > the LED driver core is incorrect. Return ENODATA to userspace in this
> > case.
> >=20
> > Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> > ---
> >  drivers/leds/led-class.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >=20
> > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > index 9e14ae588f78..a88e274228e5 100644
> > --- a/drivers/leds/led-class.c
> > +++ b/drivers/leds/led-class.c
> > @@ -27,12 +27,25 @@ static LIST_HEAD(leds_lookup_list);
> > =20
> >  static struct workqueue_struct *leds_wq;
> > =20
> > +static bool led_trigger_is_hw_controlled(struct led_classdev *led_cdev=
)
> > +{
> > +#ifdef CONFIG_LEDS_TRIGGERS
> > +	guard(rwsem_read)(&led_cdev->trigger_lock);
> > +	return led_cdev->trigger && led_cdev->trigger->trigger_type;
>=20
> This is a sufficient but not necessary condition. A generic trigger
> coordinating with the driver using hw_control_* interfaces returns false
> here.
>=20
> That's also one of the reasons why I would like to introduce a new
> interface for the LED core to query the hardware control (offloaded)
> state, see
> https://lore.kernel.org/all/20260618-leds-trigger-hw-changed-v2-1-c28c440=
53cf3@rong.moe/
>=20
> Thomas, could you kindly review the series and see if the series makes
> sense to cros_ec?
>=20
> > +#else
> > +	return false;
> > +#endif
> > +}
> > +
> >  static ssize_t brightness_show(struct device *dev,
> >  		struct device_attribute *attr, char *buf)
> >  {
> >  	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> >  	unsigned int brightness;
> > =20
> > +	if (led_trigger_is_hw_controlled(led_cdev))
> > +		return -ENODATA;
> > +
>=20
> How about brightness_store()?
>=20
> It's a no-op to set a brightness when the LED is controlled fully by the
> hardware, and returning -ENODATA on read effectively makes the attribute
> write-only. A write-only no-op attribute is very confusing.
>=20
> We already call led_trigger_remove() when 0 (LED_OFF) is written to the
> brightness attribute. Should we also break the write-only no-op dilemma
> by doing the same in brightness_store() when
> led_trigger_is_hw_controlled() is true?

Sorry, I should have dropped the two paragraphs above from my draft
before sending the reply, but they were accidentally left behind. Please
ignore them.

Writing brightness is not a no-op as the following paragraphs will say.

Thanks,
Rong

>=20
> While some software triggers use the brightness attribute to tune
> itself, hardware control triggers don't seem to do so.
>=20
> I also glanced some net or phy drivers that provides hardware control.
> IIUC, calling brightness_set[_blocking]() while hardware control is
> active causes the drivers to force software control and set the desired
> brightness, leaving the hardware control trigger ("netdev") still active
> (!)
>=20
> So we are already living in a world that writing to the brightness
> attribute effectively disables hardware control and makes the trigger
> out-of-sync.
>=20
> Also note that Documentation/leds/leds-class.rst says:
>=20
>    When the LED is in hw control, no software blink is possible and doing
>    so will effectively disable hw control.
>=20
> IMO disabling hardware control in brightness_store() also matches such
> semantics, though I guess these words originally referred to software
> triggers.
>=20
> I will submit a patch to deactivate private trigger upon
> brightness_store() soon. For public hardware control trigger (i.e.,
> "netdev"), it still needs my series to make it mutually exclusive with
> the brightness attribute while in hardware control mode.
>=20
> Thanks,
> Rong
>=20
> >  	mutex_lock(&led_cdev->led_access);
> >  	led_update_brightness(led_cdev);
> >  	brightness =3D led_cdev->brightness;
> >=20
> > ---
> > base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> > change-id: 20260404-cros_ec-leds-hw-trigger-brightness-124ff8ce5dd6
> >=20
> > Best regards,
> > -- =20
> > Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

