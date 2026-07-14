Return-Path: <linux-leds+bounces-9087-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dRFfDChyVmrW5gAAu9opvQ
	(envelope-from <linux-leds+bounces-9087-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 19:30:16 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B92C757725
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 19:30:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rong.moe header.s=zmail2048 header.b=OuAgYfjP;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9087-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-9087-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=rong.moe;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97E94303102A
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 17:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D4A4D90D5;
	Tue, 14 Jul 2026 17:28:47 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864E739CCFA;
	Tue, 14 Jul 2026 17:28:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784050127; cv=pass; b=FkEBhQF4EKAPqtcaLJid9Tim3Tq/Bg/f3HJQtUSM1O2lIHXQz454kuDvxSA1PCwbImYl+nKjMcm5BcJar2w7+m2MejLe+rnaqAxMPVJOY8nuo+A5oWB4fkQBZSJiXlJxCsvxYIVrqLz5PHbbghIjqzG/NTCHDSJdszCG68t6U7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784050127; c=relaxed/simple;
	bh=tEL+LgadNCVXK3zk1U7Y3n0Dd+AYjZjuLlyX1M8TqKo=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Q5GsrOMNsnP0Jf9wmxZDzrWAqUipQEN90DIHLNTnkOzY0PdWihUN6GAfz1zjVCywceZhWtfI5hl5tCs0Fm0a9s++PEING4v2DWI5VNgM9TXlr/9bxVRwNXUB1qb0PSWnOhyEnVXjCScd9S79cPA6wtmlgZVnHQuCHLZyVdOZoXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=OuAgYfjP; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal: i=1; a=rsa-sha256; t=1784050094; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RuOcbIQao1MpIN+K3hL+YQ6wcmXzNMQnBuJfvl/KKn1eH7WY578GuO7X/puN3Z8jn+NgxNTxFkk+o/QiJpjUSOx0aFAkk2Xm9YaYkPnzLQxplztuIPWPkIBUz8jn4gXnD570BYSQDY0BSRDIpeEoH737tVqjFhzcZIWkiFYhlMY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784050094; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=clUgr539Ot7PPYI1LxKPNc2mXqqCJnlkdZ/h2Wdwx9Y=; 
	b=jxoBdpGyjGigeSlVrSTwI+ZUHFmEqcrXwrshoAP27DPgw2pafHPHtjMVCIjpoh+GsqgqY+yGMXRxHHBli+SgqbAXBw/dSwKUMtKAI8CN14ovObVx2kDZq78ZgPB8c8OKgFsyDmBcj1rSMUIisBlfqgjkt2+btTwOj96lhbvMgg8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784050094;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=clUgr539Ot7PPYI1LxKPNc2mXqqCJnlkdZ/h2Wdwx9Y=;
	b=OuAgYfjPh0poj9V7HP7MIF6drOVixB/0febiGuE17AQNxb0K1Qy62KqTDp3dAAO0
	qQEZ1QfSPkDyKx0EIpBlKyLZcDVAHRjLLKY4p+Gnqe4Pu69ZZagoeMPMxeorDVeyU/e
	6mYUrk9Qi8JkUDm/7QkxCInni9HKbkXB3nd9IWJFhkHB4cGvSLM2/V2PQU7/xP7BjjD
	/JGeG/XYpZopItODn2YeVqOTzcD0AkmCM2rX29Bu7vyioDHjJQ/gt6MPpFXMZxk1qnS
	CxLupIAHxMOMNdeDHuoKpKmQKrJAZb6JHHJNwo2yG9UGt9hAb/8wrqJ3Cjo2EirxYpq
	9j3d1t6nGQ==
Received: by mx.zohomail.com with SMTPS id 1784050092021140.43958110021583;
	Tue, 14 Jul 2026 10:28:12 -0700 (PDT)
Message-ID: <9e8f5a1d9d55b6bfe7e788b8c148119793119e1c.camel@rong.moe>
Subject: Re: [PATCH RFC v2 5/9] leds: Add trigger_may_offload attribute
From: Rong Zhang <i@rong.moe>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Benson
 Leung	 <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Marek
 =?ISO-8859-1?Q?Beh=FAn?=	 <kabel@kernel.org>, Mark Pearson
 <mpearson-lenovo@squebb.ca>, "Derek J. Clark"	 <derekjohn.clark@gmail.com>,
 Hans de Goede <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Ike Panhc <ikepanhc@gmail.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, Vishnu
 Sankar <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 chrome-platform@lists.linux.dev, 	platform-driver-x86@vger.kernel.org
In-Reply-To: <b36aa937-b100-4fa3-bbc9-631c4c39ba40@t-8ch.de>
References: <20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe>
	 <20260618-leds-trigger-hw-changed-v2-5-c28c44053cf3@rong.moe>
	 <b36aa937-b100-4fa3-bbc9-631c4c39ba40@t-8ch.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 01:23:02 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10 
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-9087-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:linux@weissschuh.net,m:lee@kernel.org,m:pavel@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:bleung@chromium.org,m:groeck@chromium.org,m:kabel@kernel.org,m:mpearson-lenovo@squebb.ca,m:derekjohn.clark@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:ikepanhc@gmail.com,m:andrew+netdev@lunn.ch,m:kuba@kernel.org,m:vishnuocv@gmail.com,m:vsankar@lenovo.com,m:linux-leds@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chrome-platform@lists.linux.dev,m:platform-driver-x86@vger.kernel.org,m:derekjohnclark@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rong.moe:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,chromium.org,squebb.ca,gmail.com,linux.intel.com,lunn.ch,lenovo.com,vger.kernel.org,lists.linux.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rong.moe:from_mime,rong.moe:mid,rong.moe:email,rong.moe:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B92C757725

Hi Thomas,

Thanks for reviewing the series!

On Mon, 2026-07-13 at 22:36 +0200, Thomas Wei=C3=9Fschuh wrote:
> On 2026-06-18 00:47:59+0800, Rong Zhang wrote:
> > There are multiple triggers implementing hardware control. Only "netdev=
"
> > provides a custom attribute to determine if it's offloaded to hardware
> > (i.e., in hardware control). For other triggers, there is no obvious wa=
y
> > for userspace to determine the trigger state programmatically. Moreover=
,
> > userspace can't query if an LED device supports hardware control or
> > identifies these triggers.
> >=20
> > Add a new attribute "trigger_may_offload" to the LED core, so that
> > userspace can determine:
> >=20
> > - if the LED device supports hardware control (supported =3D> visible)
> > - which trigger is the hardware control trigger selected by the LED
> >   device
> > - if the trigger is selected ("<foo_trigger>")
> > - if the trigger is offloaded ("[foo_trigger]")
> >=20
> > Note: the documentation describes the attribute as "returning a list"
> > despite the LED core currently only supports one hardware control
> > trigger per LED device. This is intentional to make the attribute
> > extensible in the future without breaking userspace.
>=20
> Maybe also mention that the old 'offloaded' attribute is deprecated.
> However, does it really need to be deprecated?

Hmm, retaining the old one is indeed harmless.

I will leave the "offloaded" attribute as is, and add a short note to
the documentation of "trigger_may_offload" to briefly introduce the
relation between them.

>=20
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> >  .../ABI/obsolete/sysfs-class-led-trigger-netdev    | 16 ++++++++
> >  Documentation/ABI/testing/sysfs-class-led          | 22 +++++++++++
> >  .../ABI/testing/sysfs-class-led-trigger-netdev     | 13 -------
> >  Documentation/leds/leds-class.rst                  |  8 ++++
> >  drivers/leds/led-class.c                           | 23 +++++++++++
> >  drivers/leds/led-triggers.c                        | 45 ++++++++++++++=
++++++++
> >  drivers/leds/leds.h                                |  2 +
> >  drivers/leds/trigger/ledtrig-netdev.c              |  2 +
> >  8 files changed, 118 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/Documentation/ABI/obsolete/sysfs-class-led-trigger-netdev =
b/Documentation/ABI/obsolete/sysfs-class-led-trigger-netdev
> > new file mode 100644
> > index 000000000000..8d2fbfaf50c3
> > --- /dev/null
> > +++ b/Documentation/ABI/obsolete/sysfs-class-led-trigger-netdev
> > @@ -0,0 +1,16 @@
> > +What:		/sys/class/leds/<led>/offloaded
> > +Date:		June 2026
> > +KernelVersion:	7.3
> > +Contact:	linux-leds@vger.kernel.org
> > +Description:
> > +		Communicate whether the LED trigger modes are offloaded to
> > +		hardware or whether software fallback is used.
> > +
> > +		If 0, the LED is using software fallback to blink.
> > +
> > +		If 1, the LED blinking in requested mode is offloaded to
> > +		hardware.
> > +
> > +		/sys/class/leds/<led>/trigger_may_offload provides a generic
> > +		method to query the offloaded state of supported triggers,
> > +		superseding this attribute.
> > diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/=
ABI/testing/sysfs-class-led
> > index 0313b82644f2..edd5a9a74dfd 100644
> > --- a/Documentation/ABI/testing/sysfs-class-led
> > +++ b/Documentation/ABI/testing/sysfs-class-led
> > @@ -78,6 +78,28 @@ Description:
> >  		(which would often be configured in the device tree for the
> >  		hardware).
> > =20
> > +What:		/sys/class/leds/<led>/trigger_may_offload
> > +Date:		June 2026
> > +KernelVersion:	7.3
> > +Contact:	linux-leds@vger.kernel.org
> > +Description:
> > +		Names and states of triggers that may be offloaded to hardware.
> > +		Such triggers are also called "hw control trigger" in some
> > +		context.
> > +
> > +		Only exists when the LED supports trigger offload.
> > +
> > +		Reading this file returns a list of triggers that are capable to
> > +		be offloaded. The optional brackets around the trigger name
> > +		indicate the state of the current trigger:
> > +
> > +		- `foo_trigger`: the trigger is not selected.
> > +		- `<foo_trigger>`: the trigger is selected, but falls back to
> > +		  software blink for some reason (e.g., incompatible trigger
> > +		  parameters)
> > +		- `[foo_trigger]`: the trigger is selected and offloaded to
> > +		  hardware.
> > +
> >  What:		/sys/class/leds/<led>/inverted
> >  Date:		January 2011
> >  KernelVersion:	2.6.38
> > diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-netdev b=
/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
> > index ed46b37ab8a2..396d37a4b820 100644
> > --- a/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
> > +++ b/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
> > @@ -62,19 +62,6 @@ Description:
> >  		When offloaded is true, the blink interval is controlled by
> >  		hardware and won't reflect the value set in interval.
> > =20
> > -What:		/sys/class/leds/<led>/offloaded
> > -Date:		Jun 2023
> > -KernelVersion:	6.5
> > -Contact:	linux-leds@vger.kernel.org
> > -Description:
> > -		Communicate whether the LED trigger modes are offloaded to
> > -		hardware or whether software fallback is used.
> > -
> > -		If 0, the LED is using software fallback to blink.
> > -
> > -		If 1, the LED blinking in requested mode is offloaded to
> > -		hardware.
> > -
> >  What:		/sys/class/leds/<led>/link_10
> >  Date:		Jun 2023
> >  KernelVersion:	6.5
> > diff --git a/Documentation/leds/leds-class.rst b/Documentation/leds/led=
s-class.rst
> > index 84665200a88d..41342ecb5f6b 100644
> > --- a/Documentation/leds/leds-class.rst
> > +++ b/Documentation/leds/leds-class.rst
> > @@ -179,6 +179,9 @@ ops and needs to declare specific support for the s=
upported triggers.
> > =20
> >  With hw control we refer to the LED driven by hardware.
> > =20
> > +A sysfs attribute `trigger_may_offload` is provided for userspace to
> > +query supported triggers and their states.
> > +
> >  LED driver must define the following value to support hw control:
> > =20
> >      - hw_control_trigger:
> > @@ -240,6 +243,11 @@ LED trigger must implement the following API to su=
pport hw control:
> >                  return a boolean indicating if the trigger is offloade=
d to
> >                  hardware.
> > =20
> > +                If an LED driver specifies a hw control trigger but th=
e
> > +                latter doesn't implement this callback, a dev_err_once=
 will
> > +                be emitted and the LED trigger will be assumed to be n=
ot
> > +                offloaded.
>=20
> Not sure if this needs to be documented.
> I would make this optional initally and enforce it after all the drivers
> have been changed in the series.

Makes sense. Will remove the paragraph and rearrange the series so that
the attribute is introduced first while driver implementations are added
later.

ACK on all remaining comments as well as those in other replies. And
thanks a lot for your tag for cros_ec ;-)

Thanks,
Rong

>=20
> > +
> >  LED driver can activate additional modes by default to workaround the
> >  impossibility of supporting each different mode on the supported trigg=
er.
> >  Examples are hardcoding the blink speed to a set interval, enable spec=
ial
> > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > index 9e14ae588f78..0ac80b93b8b5 100644
> > --- a/drivers/leds/led-class.c
> > +++ b/drivers/leds/led-class.c
> > @@ -90,8 +90,31 @@ static const struct bin_attribute *const led_trigger=
_bin_attrs[] =3D {
> >  	&bin_attr_trigger,
> >  	NULL,
> >  };
> > +
> > +static DEVICE_ATTR(trigger_may_offload, 0444, led_trigger_may_offload_=
show, NULL);
>=20
> DEVICE_ATTR_RO()
>=20
> > +static struct attribute *led_trigger_attrs[] =3D {
> > +	&dev_attr_trigger_may_offload.attr,
> > +	NULL,
>=20
> No comma after the sentinel.
>=20
> > +};
> > +
> > +static umode_t led_trigger_is_visible(struct kobject *kobj,
> > +				      struct attribute *attr,
> > +				      int idx)
> > +{
> > +	struct device *dev =3D kobj_to_dev(kobj);
> > +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> > +
> > +	if (attr =3D=3D &dev_attr_trigger_may_offload.attr &&
> > +	    !led_cdev->hw_control_trigger)
>=20
> Can be a single line.
>=20
> > +		return 0;
> > +
> > +	return attr->mode;
> > +}
> > +
> >  static const struct attribute_group led_trigger_group =3D {
> >  	.bin_attrs =3D led_trigger_bin_attrs,
> > +	.attrs =3D led_trigger_attrs,
> > +	.is_visible =3D led_trigger_is_visible,
> >  };
> >  #endif
> > =20
> > diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> > index b1223218bda1..c43229d9c4c1 100644
> > --- a/drivers/leds/led-triggers.c
> > +++ b/drivers/leds/led-triggers.c
> > @@ -313,6 +313,51 @@ void led_trigger_set_default(struct led_classdev *=
led_cdev)
> >  }
> >  EXPORT_SYMBOL_GPL(led_trigger_set_default);
> > =20
> > +/*
> > + * Caller must ensure led_cdev->trigger_lock held,
>=20
> Use lockdep_assert_held() to document and validate locking invariants.
>=20
> > + * and led_cdev->trigger->name must match led_cdev->hw_control_trigger=
.
> > + */
> > +static bool led_trigger_get_offloaded(struct led_classdev *led_cdev)
> > +{
> > +	if (likely(led_cdev->trigger->offloaded))
> > +		return led_cdev->trigger->offloaded(led_cdev);
> > +
> > +	dev_err_once(led_cdev->dev,
> > +		     "hw control trigger %s doesn't implement offloaded(), this is a=
 bug\n",
> > +		     led_cdev->trigger->name);
> > +	return false;
> > +}
> > +
> > +ssize_t led_trigger_may_offload_show(struct device *dev,
> > +				     struct device_attribute *attr, char *buf)
> > +{
> > +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> > +	bool hit, offloaded =3D false;
> > +	struct led_trigger *trig;
> > +	int len;
> > +
> > +	mutex_lock(&led_cdev->led_access);
> > +	down_read(&led_cdev->trigger_lock);
>=20
> guard()?
>=20
> > +
> > +	trig =3D led_cdev->trigger;
> > +
> > +	hit =3D trig && !strcmp(led_cdev->hw_control_trigger, trig->name);
> > +	if (hit)
> > +		offloaded =3D led_trigger_get_offloaded(led_cdev);
> > +
> > +	/* [offloaded] <active_but_not_offloaded> inactive */
> > +	len =3D sysfs_emit(buf, "%s%s%s\n",
> > +			 offloaded ? "[" : (hit ? "<" : ""),
> > +			 led_cdev->hw_control_trigger,
> > +			 offloaded ? "]" : (hit ? ">" : ""));
> > +
> > +	up_read(&led_cdev->trigger_lock);
> > +	mutex_unlock(&led_cdev->led_access);
> > +
> > +	return len;
> > +}
> > +EXPORT_SYMBOL_GPL(led_trigger_may_offload_show);
> > +
> >  /* LED Trigger Interface */
> > =20
> >  int led_trigger_register(struct led_trigger *trig)
> > diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
> > index bee46651e068..9177e098989b 100644
> > --- a/drivers/leds/leds.h
> > +++ b/drivers/leds/leds.h
> > @@ -27,6 +27,8 @@ ssize_t led_trigger_read(struct file *filp, struct ko=
bject *kobj,
> >  ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
> >  			const struct bin_attribute *bin_attr, char *buf,
> >  			loff_t pos, size_t count);
> > +ssize_t led_trigger_may_offload_show(struct device *dev,
> > +				     struct device_attribute *attr, char *buf);
> > =20
> >  extern struct rw_semaphore leds_list_lock;
> >  extern struct list_head leds_list;
> > diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigg=
er/ledtrig-netdev.c
> > index a26109ca4b1c..21f22eea4ab8 100644
> > --- a/drivers/leds/trigger/ledtrig-netdev.c
> > +++ b/drivers/leds/trigger/ledtrig-netdev.c
> > @@ -487,6 +487,8 @@ static ssize_t offloaded_show(struct device *dev,
> >  {
> >  	struct led_netdev_data *trigger_data =3D led_trigger_get_drvdata(dev)=
;
> > =20
> > +	dev_warn_once(dev, "offloaded attribute has been deprecated, see trig=
ger_may_offload.\n");
> > +
> >  	return sprintf(buf, "%d\n", trigger_data->hw_control);
> >  }
> > =20
> >=20
> > --=20
> > 2.53.0
> >=20

