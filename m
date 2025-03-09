Return-Path: <linux-leds+bounces-4202-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 939A2A583CD
	for <lists+linux-leds@lfdr.de>; Sun,  9 Mar 2025 12:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C204F169E16
	for <lists+linux-leds@lfdr.de>; Sun,  9 Mar 2025 11:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE1B2CCC0;
	Sun,  9 Mar 2025 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b="NCYSRv03"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FD22F28
	for <linux-leds@vger.kernel.org>; Sun,  9 Mar 2025 11:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741520002; cv=pass; b=MZ+yPb6o0O+Ykqu32CWYDnA7jLtw2zjnefZISNAlMTTWw/IxO0XPnJ55bGxnPhkVSuFt2R4wxyi76IeO4c4SGfjR5XqwSKhj0FaUf/itDyIdvgDd5YMdrEJBJTVyfvxTupIFPzjHONBFXt52nRZqQIo8WQpEDDjT23Q3Y19oT4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741520002; c=relaxed/simple;
	bh=SV1o9X7ubJKmBHT0HsQFrnIZW8AmsFw2laUXJYGJpXs=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=YxASCgvr1lu1wNxcDLCzU2vO+/pSiqd4jLml1O2Mh0uOJLXAuGMVZHQYuaiDc+UAvEAbPLFHb7RyAwUIyRzMJ5Cr6L+EvLFape7cp3ce0i2+VOoEUwV3Wz8WrEN/NW7KN0JlauQrVexaitjfFIREng/4QKFm06eNG0hQ8sbo2rI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au; spf=pass smtp.mailfrom=mcqueen.au; dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b=NCYSRv03; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcqueen.au
ARC-Seal: i=1; a=rsa-sha256; t=1741519997; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HOAUeEzAD+QJ2W/ll31jV0kI2Q0m9phzgY2PGI3jgOJL4wQys0hxbgRQpaxI9MW38U9/A5B4a4oWiGTOIRPmuQoiMPfaM4gA9cBMw+6XYO/7Oe0r1gYYTZ53R+FBPReNbMe83+SE61wxVIj3Swrfug+RlGUe1g7wlVn77LorVTQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741519997; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=41UmS3UuUoD3wbSNDjRtaBDCW4tjJNSrSvMwlxGIkBk=; 
	b=N70kQrPN9aNYAo60MBs9+f5DqMeke0tKfwZnHTkU4GHKgJ5ATgZianbMY8tJXlodPfX53gsGzqvPvs8UGE5GkeI+39xk7funXO+742TDzVvMJMaiL25t43rN7au4jtYnFES9oRCWKItiVNM3hAiseR7IINEdP9snKlXW9gfPX3E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=mcqueen.au;
	spf=pass  smtp.mailfrom=craig@mcqueen.au;
	dmarc=pass header.from=<craig@mcqueen.au>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741519997;
	s=zmail; d=mcqueen.au; i=craig@mcqueen.au;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=41UmS3UuUoD3wbSNDjRtaBDCW4tjJNSrSvMwlxGIkBk=;
	b=NCYSRv03IihUfHwStSVQSftq2U5LQQyK4i1ybh4nGWrE2P6ai3QUK+WUXgghSxX1
	qsVjHaBQcCTFS+kzFCo+jdu4L99sy08LrrtKv7FNpEQ2/ZDu4VtG4lA3yK3oq2bjjFD
	0yctSA38RK3niCDHK9oA8hY+Dt99qOvEj8usY2rI=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 174151999614810.147697265160673; Sun, 9 Mar 2025 04:33:16 -0700 (PDT)
Date: Sun, 09 Mar 2025 22:33:16 +1100
From: Craig McQueen <craig@mcqueen.au>
To: "Jacek Anaszewski" <jacek.anaszewski@gmail.com>
Cc: "linux-leds" <linux-leds@vger.kernel.org>
Message-ID: <1957aae44d5.c26ebfad443381.7757757126392409874@mcqueen.au>
In-Reply-To: <3c63272f-681b-5fa1-0319-497343fb7acc@gmail.com>
References: <20250306225524.318562-1-craig@mcqueen.au>
 <7ba6f144-0e5c-1d35-5ae0-9dc54751364b@gmail.com> <3c63272f-681b-5fa1-0319-497343fb7acc@gmail.com>
Subject: Re: [PATCH] led-triggers: accept "default" written to sysfs trigger
 attr
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

On Sat, 08 Mar 2025 04:10:49 +1100 Jacek Anaszewski  wrote:
 > On 3/7/25 17:50, Jacek Anaszewski wrote:=20
 > > Hi Craig,=20
 > >=20
 > > On 3/6/25 23:55, Craig McQueen wrote:=20
 > >> If the text "default" is written to the LED's sysfs 'trigger' attr, t=
hen=20
 > >> call led_trigger_set_default() to set the LED to its default trigger.=
=20
 > >> ---=20
 > >> =C2=A0 drivers/leds/led-triggers.c | 5 +++++=20
 > >> =C2=A0 1 file changed, 5 insertions(+)=20
 > >>=20
 > >> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.=
c=20
 > >> index b2d40f87a5ff..f2bc3bb5062d 100644=20
 > >> --- a/drivers/leds/led-triggers.c=20
 > >> +++ b/drivers/leds/led-triggers.c=20
 > >> @@ -54,6 +54,11 @@ ssize_t led_trigger_write(struct file *filp, struc=
t=20
 > >> kobject *kobj,=20
 > >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto unlock;=
=20
 > >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }=20
 > >> +=C2=A0=C2=A0=C2=A0 if (sysfs_streq(buf, "default")) {=20
 > >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led_trigger_set_default(l=
ed_cdev);=20
 > >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto unlock;=20
 > >> +=C2=A0=C2=A0=C2=A0 }=20
 > >> +=20
 > >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 down_read(&triggers_list_lock);=20
 > >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_for_each_entry(trig, &trigger_lis=
t, next_trig) {=20
 > >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (sysfs_stre=
q(buf, trig->name) &&=20
 > >> trigger_relevant(led_cdev, trig)) {=20
 > >=20
 > > Makes sense for me, this would be the second half of the feature that =
is=20
 > > now available only from DT level.=20
 > >=20
 > > Reviewed-by: Jacek Anaszewski jacek.anaszewski@gmail.com>=20
 > >=20
 > =20
 > But after re-thinking it - we need to return -EINVAL in case=20
 > LED class device does not define default trigger, so that the user=20
 > had proper feedback.=20
 > =20
 > So, led_trigger_set_default() needs to be extended to return error=20
 > in case of !led_cdev->default_trigger or !found.=20

In systems I've worked on, some LEDs have a default trigger, while others d=
on't. I.e. it seems normal for an LED to have a default trigger of "none". =
I don't think of this as an error condition, but a normal operation to set =
an LED's trigger back to "none".

The not-found case is an interesting corner case. It might be that a kernel=
 module that provides a trigger is presently not loaded, so the trigger is =
not currently available -- but will be available if the kernel module is lo=
aded again.

1. LED has a default trigger "moduletrigger".
2. Module that provides that trigger "moduletrigger" is unloaded.
3. LED has trigger set to something else, "othertrigger".
4. led_trigger_set_default() is called for that LED.
    Will the LED's trigger be effectively "none", or stay at "othertrigger"=
?
5. Module that provides "moduletrigger" is loaded again.
    Will the LED be connected to its default trigger "moduletrigger", or re=
main at "none"?

--=20
Craig McQueen


