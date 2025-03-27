Return-Path: <linux-leds+bounces-4369-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 040D8A728A4
	for <lists+linux-leds@lfdr.de>; Thu, 27 Mar 2025 03:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C260E188ECEC
	for <lists+linux-leds@lfdr.de>; Thu, 27 Mar 2025 02:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C90061FF2;
	Thu, 27 Mar 2025 02:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b="S6r218gq"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AA7208CA
	for <linux-leds@vger.kernel.org>; Thu, 27 Mar 2025 02:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743041634; cv=pass; b=RLW0fHVKHo0duc42w2RkKgmf9NHs6h3wFdM5Tg4bDDYGmhTTXYDmqTVt9MgCQXh8BT+esJVmopzcnTEN6+qYyk0PHAaYpugNAEkWltIOk3HDNOig3liKiK2GnhsN/2n2Eh7sDavwJ6iXW+/gcIEvgXQr8OQxfzeQUd164aFl7Yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743041634; c=relaxed/simple;
	bh=t3zBobmhm0Z+msMB7t2bNpWcr3jxDYRhfhpa7NAVa4A=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=n/oRk6CDI9C2bg6x3cOhb7pAXYdIcIVe6u81Agr+7L2rufTLsqtpHo6RmKKtkpFlEc5yJpYbPu6iY/kVPhgF26e2HjEtUiUeOGGOzIvJ8Fzm1+4lnX+VMxw+gYG3kg6kbJxzmM3ef4fL3QuxafvspdNy0W5MCesio0DBvzmJb28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au; spf=pass smtp.mailfrom=mcqueen.au; dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b=S6r218gq; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcqueen.au
ARC-Seal: i=1; a=rsa-sha256; t=1743041625; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Bfj2Q0DNx711aLoQ1Povau48wURII721tWRP8/HhmKxQkcFMfeOo5HOKC3xwuQOM5xAPpyYhMc7uuRO6owvhXpcP2K9RM8zQh57dKyyMSwOkCWkh5RtrqKyhMbvuQuCTpk2M2IbZqu0/TC3LU3Ie81I/8BZvgNFwc65MaKiiVBc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743041625; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YmkMs5x6nxtxK8p+Fz7KtjL0K2z8+0Li5EbiToux1kY=; 
	b=myUvw1Rs70sQM+NqCU6+SFFZOdK+B2c0EzffNQoCHpmq4lPPzYKRBMZGRNxF9K/GaDBtfexpZBwFdrY5WV76VIK2km+GBcxsurBQdi45hNBWD9kKRc/GHf2h7H6XJ4d1AndOexCd74zGyS/YKTHldXz+ncxcazVvOSDsGu/KDMw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=mcqueen.au;
	spf=pass  smtp.mailfrom=craig@mcqueen.au;
	dmarc=pass header.from=<craig@mcqueen.au>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743041625;
	s=zmail; d=mcqueen.au; i=craig@mcqueen.au;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=YmkMs5x6nxtxK8p+Fz7KtjL0K2z8+0Li5EbiToux1kY=;
	b=S6r218gqJVhUNVGQ9ynRc2dz02nByXvl7VoyBwmzvvFVmG6SvtHibjl2mBvbAM6N
	XmBJY09w04HEAApsr0IPTQ+POCLPwvdsSeeGv5kZ4hFc4OdTiCznKTmeUcvcaUPqMt3
	QPP/03W1BEk++Eiw5Wbgy54F5+154/lc+pUttgd0=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1743041623983202.79454637035008; Wed, 26 Mar 2025 19:13:43 -0700 (PDT)
Date: Thu, 27 Mar 2025 13:13:43 +1100
From: Craig McQueen <craig@mcqueen.au>
To: "Pavel Machek" <pavel@ucw.cz>
Cc: "linux-leds" <linux-leds@vger.kernel.org>
Message-ID: <195d5607793.123ade0861520613.8142955424851423602@mcqueen.au>
In-Reply-To: <Z+KsfcjvlsxAN2LE@duo.ucw.cz>
References: <20250311013143.371930-1-craig@mcqueen.au>
 <20250311013143.371930-2-craig@mcqueen.au> <Z+KsfcjvlsxAN2LE@duo.ucw.cz>
Subject: Re: [PATCH v2 1/1] leds: Introduce userspace LED triggers driver
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

On Wed, 26 Mar 2025 00:15:41 +1100 Pavel Machek  wrote:
 > > This driver creates a userspace LED triggers driver similar to=20
 > > uleds and uinput.=20
 > >=20
 > > New LED triggers are created by opening /dev/uledtriggers and writing=
=20
 > > a uledtriggers_user_dev struct. A new LED trigger is registered with t=
he=20
 > > name given in the struct.=20
 > >=20
 > > After the initial setup, writing an int value will set the trigger's=
=20
 > > brightness, equivalent to calling led_trigger_event().=20
 > >=20
 > > Alternatively, there are ioctls for setup, changing trigger brightness=
,=20
 > > or doing blinking.=20
 > >=20
 > > Closing the file handle to /dev/uledtriggers will remove the LED=20
 > > trigger.=20
 > =20
 > Would you explain some usecases where this is useful?=20
 > =20
 > Userspace can already control the leds using /sys/class/leds...=20

1. Loose coupling and flexible configuration

One benefit is that it allows userspace applications to control LEDs in a=
=20
way which is more loosely coupled to specific LEDs.

Eg an application might run on a variety of hardware with different LEDs, o=
r=20
users might want to choose what things are indicated on what LEDs. One user=
=20
might want a FAULT LED, another user might want an LED to blink for each=20
transmitted message, etc.

So, an application can create a number of userspace LED triggers. Then user=
s=20
can connect those triggers to LEDs however they like, and can even change=
=20
them dynamically without restarting the application.

2. Replicate in-kernel driver functionality in userspace

My use-case is, I'm writing a new driver in userspace (with CUSE) to=20
replace an earlier in-kernel driver. That in-kernel driver provided several=
=20
LED triggers. For me to replicate the driver's functionality completely, it=
=20
would be very nice for my userspace driver to also be able to drive LED=20
triggers just like the old in-kernel driver did.


 > > +++ b/include/uapi/linux/uledtriggers.h=20
 > > +/*=20
 > > + * Brightness levels for writes of int values, or for use with ULEDTR=
IGGERS_IOC_EVENT.=20
 > > + * These correspond to Linux kernel internal enum led_brightness in l=
inux/leds.h.=20
 > > + */=20
 > > +enum uledtriggers_brightness {=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0ULEDTRIGGERS_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=3D 0,=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0ULEDTRIGGERS_ON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D 1,=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0ULEDTRIGGERS_HALF=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=3D 127,=20
 > > +=C2=A0=C2=A0=C2=A0=C2=A0ULEDTRIGGERS_FULL=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=3D 255,=20
 > > +};=20
 > =20
 > We are trying to get rid of brightness half, etc.

Sure. What should I do? Should I just delete enum uledtriggers_brightness,=
=20
and the user can choose whatever integer value they want?

--=20
Craig McQueen


