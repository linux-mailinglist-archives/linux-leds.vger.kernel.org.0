Return-Path: <linux-leds+bounces-4242-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6453A5E8D8
	for <lists+linux-leds@lfdr.de>; Thu, 13 Mar 2025 00:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 077331774BB
	for <lists+linux-leds@lfdr.de>; Wed, 12 Mar 2025 23:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C101F1500;
	Wed, 12 Mar 2025 23:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b="CmGzt7E4"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740EC1EF0B6
	for <linux-leds@vger.kernel.org>; Wed, 12 Mar 2025 23:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741823814; cv=pass; b=AW53G+WN763j1dNSRdFHW6Jre1O8KzAWcwJgH2IzztiADfj5XD7li/4Ei+0q7Nd1AtR6lH0UVZL1FKFto950GKT6J+cVqJJr52K9o/eTD03gbRROnBqtCuHkoXQ+23YnysnRlu/ZZqrEweXqkeCuRntmI0zw+Z5kb4aTlGKrSfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741823814; c=relaxed/simple;
	bh=pPM3YW7S0biXZW5eJtTsJAtsrI3MxqNbQRFbiw4wzNU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ubdqS9A2Wp35joARF6hftxJjyYLJSTRDAuLcLvExl3XcQbNpepTWjvnQ0BWZxrWP9KVHsmVHc8vRfC9vW8Zb5CeJuUyPa+doHzOkaKikES3RKI/+QBau2sG+nQkme+CMbGfc64yQWrDAEuIu9QCg/PNr1o9Tth9at5/wt0M+9NY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au; spf=pass smtp.mailfrom=mcqueen.au; dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b=CmGzt7E4; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcqueen.au
ARC-Seal: i=1; a=rsa-sha256; t=1741823809; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=go15f+agBivAOC62x2mGF+17BSJp+k2TjzL3ZZZMhChWkQE5R41H3Yed4HugAJiiSWVwU6Fyn7C2142AKPXl/dvgkQbQ1zAkn9JqUkAfH2aVGaVdal8GFeT54fl8+dlsEw44gaWHei9dHuiY4o3xgyaTuHCWDvf2wXG/Qt6YZME=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741823809; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=24U2JqBgVjA4PaiyFzJvKiyhjpCn3fZ21Ul0s4tQr6g=; 
	b=miV8ON3m26Ojrw0VedGK9+Yw3IplZtf+XnC54+8zNDJnlnLSrhcTLxyRU1vXyXgTJ0TwY4mCSFa4kCutB1whnzVmGUFm7Y5acsJDXPt/7CL7jq96EZbkiKvdcgFEHhOQqNmj5tT9KhCx+jlZGiTJ53bWDR1b2Hx8ZtbV3l8t0DM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=mcqueen.au;
	spf=pass  smtp.mailfrom=craig@mcqueen.au;
	dmarc=pass header.from=<craig@mcqueen.au>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741823809;
	s=zmail; d=mcqueen.au; i=craig@mcqueen.au;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=24U2JqBgVjA4PaiyFzJvKiyhjpCn3fZ21Ul0s4tQr6g=;
	b=CmGzt7E44hDb61+z0oNCrkzyvbKf8/VNUgJ+5KqaQDiyizTJs8XNWGTxfLpSpSc+
	27WMdfFzFnNztcw7hA6UyfRu5juS3s0RA3Lv7TUvmDXsqmSvq9Isa+VgiLVvPNZvbqU
	uUhh9qECoHIp7D6JAt1stKqiS3WLATYkCIgMvvbU=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1741823808110390.40990683809537; Wed, 12 Mar 2025 16:56:48 -0700 (PDT)
Date: Thu, 13 Mar 2025 10:56:48 +1100
From: Craig McQueen <craig@mcqueen.au>
To: "Jacek Anaszewski" <jacek.anaszewski@gmail.com>
Cc: "linux-leds" <linux-leds@vger.kernel.org>
Message-ID: <1958cca1252.dee52fbe748038.1386257997277534271@mcqueen.au>
In-Reply-To: <982cd574-d0ca-4ce9-851c-f85d86a9b886@gmail.com>
References: <20250312011136.380647-1-craig@mcqueen.au> <982cd574-d0ca-4ce9-851c-f85d86a9b886@gmail.com>
Subject: Re: [PATCH v2] leds: led-triggers: Improvements for default trigger
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

On Thu, 13 Mar 2025 06:40:35 +1100 Jacek Anaszewski  wrote:
 > Hi Craig,=20
 > =20
 > Thanks for the update.=20
 > =20
 > On 3/12/25 02:11, Craig McQueen wrote:=20
 > > Accept "default" written to sysfs trigger attr.=20
 > > If the text "default" is written to the LED's sysfs 'trigger' attr, th=
en=20
 > > call led_trigger_set_default() to set the LED to its default trigger.=
=20
 > >=20
 > > If the default trigger is set to "none", then led_trigger_set_default(=
)=20
 > > will remove a trigger. This is in contrast to the default trigger bein=
g=20
 > > unset, in which case led_trigger_set_default() does nothing.=20
 > > ---=20
 > >   Documentation/ABI/testing/sysfs-class-led |  6 ++++++=20
 > >   drivers/leds/led-triggers.c               | 26 +++++++++++++++++++++=
+-=20
 > >   2 files changed, 31 insertions(+), 1 deletion(-)=20
 > >=20
 > > diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation=
/ABI/testing/sysfs-class-led=20
 > > index 2e24ac3bd7ef..0313b82644f2 100644=20
 > > --- a/Documentation/ABI/testing/sysfs-class-led=20
 > > +++ b/Documentation/ABI/testing/sysfs-class-led=20
 > > @@ -72,6 +72,12 @@ Description:=20
 > >   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/sys/class/leds/ onc=
e a given trigger is selected. For=20
 > >   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0their documentation =
see `sysfs-class-led-trigger-*`.=20
 > >=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Writing "none" remove=
s the trigger for this LED.=20
 > > +=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Writing "default" set=
s the trigger to the LED's default trigger=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(which would often be=
 configured in the device tree for the=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hardware).=20
 > > +=20
 > >   What:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/sys/class/leds=
//inverted=20
 > >   Date:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0January 2011=20
 > >   KernelVersion:=C2=A0=C2=A0=C2=A0=C2=A02.6.38=20
 > > diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c=
=20
 > > index b2d40f87a5ff..00c898af9969 100644=20
 > > --- a/drivers/leds/led-triggers.c=20
 > > +++ b/drivers/leds/led-triggers.c=20
 > > @@ -49,11 +49,21 @@ ssize_t led_trigger_write(struct file *filp, struc=
t kobject *kobj,=20
 > >   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto unlock;=20
 > >   =C2=A0=C2=A0=C2=A0=C2=A0}=20
 > >=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0/* Empty string. Do nothing. */=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0if (sysfs_streq(buf, "")) {=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto unlock;=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0}=20
 > > +=20
 > =20
 > Do we need this? It seems to be the same case as any other arbitrary=20
 > string, for which we obviously don't have special handling.=20

I'll defer to you on this. I can remove it.

 > >   =C2=A0=C2=A0=C2=A0=C2=A0if (sysfs_streq(buf, "none")) {=20
 > >   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0led_trigger_remove(l=
ed_cdev);=20
 > >   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto unlock;=20
 > >   =C2=A0=C2=A0=C2=A0=C2=A0}=20
 > >=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0if (sysfs_streq(buf, "default")) {=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0led_trigger_set_defau=
lt(led_cdev);=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto unlock;=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0}=20
 > > +=20
 > >   =C2=A0=C2=A0=C2=A0=C2=A0down_read(&triggers_list_lock);=20
 > >   =C2=A0=C2=A0=C2=A0=C2=A0list_for_each_entry(trig, &trigger_list, nex=
t_trig) {=20
 > >   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (sysfs_streq(buf,=
 trig->name) && trigger_relevant(led_cdev, trig)) {=20
 > > @@ -98,6 +108,9 @@ static int led_trigger_format(char *buf, size_t siz=
e,=20
 > >   =C2=A0=C2=A0=C2=A0=C2=A0int len =3D led_trigger_snprintf(buf, size, =
"%s",=20
 > >   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0       led_cdev->trigger ? "none" : "[none]")=
;=20
 > >=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0if (led_cdev->default_trigger && led_cdev->de=
fault_trigger[0])=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0len +=3D led_trigger_=
snprintf(buf + len, size - len, " default");=20
 > > +=20
 > >   =C2=A0=C2=A0=C2=A0=C2=A0list_for_each_entry(trig, &trigger_list, nex=
t_trig) {=20
 > >   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool hit;=20
 > >=20
 > > @@ -278,9 +291,20 @@ void led_trigger_set_default(struct led_classdev =
*led_cdev)=20
 > >   =C2=A0=C2=A0=C2=A0=C2=A0struct led_trigger *trig;=20
 > >   =C2=A0=C2=A0=C2=A0=C2=A0bool found =3D false;=20
 > >=20
 > > -=C2=A0=C2=A0=C2=A0=C2=A0if (!led_cdev->default_trigger)=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0/* NULL pointer or empty string. Do nothing. =
*/=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0if (!led_cdev->default_trigger || !led_cdev->=
default_trigger[0])=20
 > >   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;=20
 > >=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0/* This case isn't sensible. Do nothing. */=
=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0if (!strcmp(led_cdev->default_trigger, "defau=
lt"))=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;=20
 > =20
 > This is rather validation of the default trigger name obtained from DT,=
=20
 > which, if at all, should be done after parsing DT property in=20
 > led_classdev_register_ext(). I'd skip it anyway.=20

In a separate patch I've submitted for the uleds driver, I want to add the=
=20
ability for users to set a default trigger for a userspace LED. Maybe I sho=
uld=20
add extra validation of the trigger name in that uleds driver patch.

 > > +=C2=A0=C2=A0=C2=A0=C2=A0/* Remove trigger. */=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0if (!strcmp(led_cdev->default_trigger, "none"=
)) {=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0led_trigger_remove(le=
d_cdev);=20
 > =20
 > This will be handled be led_trigger_set() called from=20
 > led_match_default_trigger() below.=20

I added this because users should have a way to get led_trigger_set_default=
()=20
to reset a LED's trigger to none, i.e. to have a default trigger of "none".

If led_cdev->default_trigger is NULL then the function exits early, so that=
=20
doesn't achieve it.

Without the proposed change, if led_cdev->default_trigger is "none", then=
=20
it will look for a trigger literally named "none", and won't find it, so it=
 will=20
follow the !found code path, which isn't helpful.

So, it seems beneficial to add explicit handling of "none" to remove any=20
existing trigger.

 > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0}=20
 > > +=20
 > >   =C2=A0=C2=A0=C2=A0=C2=A0down_read(&triggers_list_lock);=20
 > >   =C2=A0=C2=A0=C2=A0=C2=A0down_write(&led_cdev->trigger_lock);=20
 > >   =C2=A0=C2=A0=C2=A0=C2=A0list_for_each_entry(trig, &trigger_list, nex=
t_trig) {=20

--=20
Craig McQueen


