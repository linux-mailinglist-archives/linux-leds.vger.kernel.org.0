Return-Path: <linux-leds+bounces-4230-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E898BA5BDE1
	for <lists+linux-leds@lfdr.de>; Tue, 11 Mar 2025 11:27:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F75E3A8433
	for <lists+linux-leds@lfdr.de>; Tue, 11 Mar 2025 10:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227AF235BF7;
	Tue, 11 Mar 2025 10:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b="S3fUX0Pe"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164842356CA
	for <linux-leds@vger.kernel.org>; Tue, 11 Mar 2025 10:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741688846; cv=pass; b=bcjumZN3OhL9eINjlsfI1zmkKao0h+ggnOgUuaG12gHaU2WxvFiCCXlyNKreoslGGpxhmZfE4mr3ARUT0zIoL272aMKx9CYImGhhAJQmrs+qa1YM3fOLCP6JZJCDCOI11PlTaBw2+7RqjPVvDDYfCy5ifslfQJJcjhfzXkJheCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741688846; c=relaxed/simple;
	bh=qNhYZ+1IVvnahKzhq+ejHZoisfkMaWxAw+3rLi7RCX0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=QWK3fhkYSbEz4W2QurK8Z9QqwzV2A6LTg0y6prMBKJh0QJV2MzmYOicvYanzgVd2ie9E5Tv6Hr25mTP5I4/mw6mrWdFeUZUY2bJwgO/XOITJuqzVAt5YrZWMgHNKB6s+OEvMlvbYD1fnM8gvsiwB9hf6CzRCUULs6WxZarg03eg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au; spf=pass smtp.mailfrom=mcqueen.au; dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b=S3fUX0Pe; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcqueen.au
ARC-Seal: i=1; a=rsa-sha256; t=1741688841; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YBymVeqpqpEmYJoaBb5Dvv30Fe6c+9qicUEo3msn+u23kfLZqHiqfA20f0Paer3WZOxU3yI7mvqiQsSg/liUEItJSaPFIxXJEvdYlYBoqX0aG2AW2Q+LTsmCPSCi8GNvizjvpqm9qK47l1y0gX/tnbZxW1XKvg7aYmKzpeI6y1s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741688841; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Lu1bpq3d+OXZPKnzX6DVGkKi3y5Lt3H8VDYhldoM0dk=; 
	b=YYBpuJ/5rGk7T8Tv+X+RZewRpMczQuSwX3LRU7w3Vg8JpJuyn3pWjkQKhChQCOXilU3WcEAt4vpnz6cN0uA5hOOufnOpSkUhBzR/ftbLW0d7q43PEqxuFioPXBu6602DQrDIUUNmXQPH3rw2loQNWz+voxCwUInZDkz2TWcu0JE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=mcqueen.au;
	spf=pass  smtp.mailfrom=craig@mcqueen.au;
	dmarc=pass header.from=<craig@mcqueen.au>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741688841;
	s=zmail; d=mcqueen.au; i=craig@mcqueen.au;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Lu1bpq3d+OXZPKnzX6DVGkKi3y5Lt3H8VDYhldoM0dk=;
	b=S3fUX0PeCiQwTbgg7/xqQvRX2+GSE63Ap2uufcS8J9L7OGEkgYpwep3bSosqlEIP
	FlANzmLHuceCdCcu0xa6B1gqSB8/blLXxyIWOKX5HKkoFUdxLkbjEVmoYF/tPysciT0
	IfhKmOmaaWS8+vaGinHT+7gDEKPfkr2LBzGc1OgU=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1741688839283204.86776046194518; Tue, 11 Mar 2025 03:27:19 -0700 (PDT)
Date: Tue, 11 Mar 2025 21:27:19 +1100
From: Craig McQueen <craig@mcqueen.au>
To: "Jacek Anaszewski" <jacek.anaszewski@gmail.com>
Cc: "linux-leds" <linux-leds@vger.kernel.org>
Message-ID: <19584be9c55.108643cd88202.3290837959889396813@mcqueen.au>
In-Reply-To: <f1819943-ab2e-4a37-a4be-88a4a5f42437@gmail.com>
References: <20250306225524.318562-1-craig@mcqueen.au>
 <7ba6f144-0e5c-1d35-5ae0-9dc54751364b@gmail.com>
 <3c63272f-681b-5fa1-0319-497343fb7acc@gmail.com>
 <1957aae44d5.c26ebfad443381.7757757126392409874@mcqueen.au> <f1819943-ab2e-4a37-a4be-88a4a5f42437@gmail.com>
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

On Mon, 10 Mar 2025 05:50:23 +1100 Jacek Anaszewski  wrote:
 > On 3/9/25 12:33, Craig McQueen wrote:=20
 > > On Sat, 08 Mar 2025 04:10:49 +1100 Jacek Anaszewski  wrote:=20
 > >   > On 3/7/25 17:50, Jacek Anaszewski wrote:=20
 > >   > > Hi Craig,=20
 > >   > >=20
 > >   > > On 3/6/25 23:55, Craig McQueen wrote:=20
 > >   > >> If the text "default" is written to the LED's sysfs 'trigger' a=
ttr, then=20
 > >   > >> call led_trigger_set_default() to set the LED to its default tr=
igger.=20
 > >   > >> ---=20
 > >   > >> =C2=A0 drivers/leds/led-triggers.c | 5 +++++=20
 > >   > >> =C2=A0 1 file changed, 5 insertions(+)=20
 > >   > >>=20
 > >   > >> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-tri=
ggers.c=20
 > >   > >> index b2d40f87a5ff..f2bc3bb5062d 100644=20
 > >   > >> --- a/drivers/leds/led-triggers.c=20
 > >   > >> +++ b/drivers/leds/led-triggers.c=20
 > >   > >> @@ -54,6 +54,11 @@ ssize_t led_trigger_write(struct file *filp,=
 struct=20
 > >   > >> kobject *kobj,=20
 > >   > >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto unl=
ock;=20
 > >   > >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }=20
 > >   > >> +=C2=A0=C2=A0=C2=A0 if (sysfs_streq(buf, "default")) {=20
 > >   > >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led_trigger_set_def=
ault(led_cdev);=20
 > >   > >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto unlock;=20
 > >   > >> +=C2=A0=C2=A0=C2=A0 }=20
 > >   > >> +=20
 > >   > >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 down_read(&triggers_list_lock);=
=20
 > >   > >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_for_each_entry(trig, &trigg=
er_list, next_trig) {=20
 > >   > >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (sysf=
s_streq(buf, trig->name) &&=20
 > >   > >> trigger_relevant(led_cdev, trig)) {=20
 > >   > >=20
 > >   > > Makes sense for me, this would be the second half of the feature=
 that is=20
 > >   > > now available only from DT level.=20
 > >   > >=20
 > >   > > Reviewed-by: Jacek Anaszewski jacek.anaszewski@gmail.com>=20
 > >   > >=20
 > >   >=20
 > >   > But after re-thinking it - we need to return -EINVAL in case=20
 > >   > LED class device does not define default trigger, so that the user=
=20
 > >   > had proper feedback.=20
 > >   >=20
 > >   > So, led_trigger_set_default() needs to be extended to return error=
=20
 > >   > in case of !led_cdev->default_trigger or !found.=20
 > >=20
 > > In systems I've worked on, some LEDs have a default trigger, while oth=
ers don't. I.e. it seems normal for an LED to have a default trigger of "no=
ne". I don't think of this as an error condition, but a normal operation to=
 set an LED's trigger back to "none".=20
 > >=20
 > > The not-found case is an interesting corner case. It might be that a k=
ernel module that provides a trigger is presently not loaded, so the trigge=
r is not currently available -- but will be available if the kernel module =
is loaded again.=20
 > =20
 > Fair enough.=20
 > It would be good to add this description to the entry related to=20
 > "trigger" file in Documentation/ABI/testing/sysfs-class-led.=20
=20

I tried to update that document. But I wasn't sure what the required=20
format is, when I'm not adding a new attribute but (slightly) modifying=20
the behaviour of an existing attribute. Should I add a note to the existing=
=20
/sys/class/leds/<led>/trigger description, or should I add a new=20
/sys/class/leds/<led>/trigger entry at the bottom of the document,=20
describing the modified behaviour?

--=20
Craig McQueen


