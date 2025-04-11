Return-Path: <linux-leds+bounces-4459-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBB2A8594D
	for <lists+linux-leds@lfdr.de>; Fri, 11 Apr 2025 12:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC6E71BA168A
	for <lists+linux-leds@lfdr.de>; Fri, 11 Apr 2025 10:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6243278E51;
	Fri, 11 Apr 2025 10:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="L64UaKia"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0079B278E67
	for <linux-leds@vger.kernel.org>; Fri, 11 Apr 2025 10:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744366620; cv=none; b=a+7NGfizDLsnhyVaT7Q7Z+9fXRqmB45/QqZ9zJBeOXWo3PxmZOqXyA+cZIfordwrR8KPKqdqexUK9RbEL81tY6anK4YZJBvNRWVs04x7zMnWdn3qPKHDFIB3zsp6L54Vql6oOWe3poN/x8dDqciBL9fgkU6AIvxpYiAIqiL9MqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744366620; c=relaxed/simple;
	bh=aHOpWPUHfsZmdlr0ZQqkXoYZKBO7SeDubqdvuMAQM+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uhCd9Z3y2MmcgO5aYTp/24rO0dk/L8NJRj3UKGX0dmTZdQrQ43VABfEIbfRKS9yOE2c0x6ikJX6cnbJKKzX5Gs2scEpUpYpDMjW/V9L5itPxea9oOKdVElnU1bwm1U2KoL0HllIfs4IxyCXa45xzMbHgP9ElDT6BZbgUYU9r1G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=L64UaKia; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id A04981C00B2; Fri, 11 Apr 2025 12:08:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1744366096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tj/H9Ue6ZKg2tK2NLQ7m5g9hsK/EkMzihQ/0bmk6r9c=;
	b=L64UaKia0BNx+EnucUHPFNo9m9llu5HBvJO2ySbB/LoPYt+fyQlz/PMbLR+csJnhJQZE83
	quaVnEsypuRinlaWFFrJn7xAN8BkGPpjn/L5IqQdNTad/nsyi2mlyU/yjAwKomx0mydZcX
	+O8M9mGwq0OOKTfyFcjrRBvxz4XSB0A=
Date: Fri, 11 Apr 2025 12:08:16 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Craig McQueen <craig@mcqueen.au>
Cc: linux-leds <linux-leds@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] leds: Introduce userspace LED triggers driver
Message-ID: <Z/jqED+42U6jXRhm@duo.ucw.cz>
References: <20250311013143.371930-1-craig@mcqueen.au>
 <20250311013143.371930-2-craig@mcqueen.au>
 <Z+KsfcjvlsxAN2LE@duo.ucw.cz>
 <195d5607793.123ade0861520613.8142955424851423602@mcqueen.au>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2NM5tUEqOlSmXyut"
Content-Disposition: inline
In-Reply-To: <195d5607793.123ade0861520613.8142955424851423602@mcqueen.au>


--2NM5tUEqOlSmXyut
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

>  > > This driver creates a userspace LED triggers driver similar to=20
>  > > uleds and uinput.=20
>  > >=20
>  > > New LED triggers are created by opening /dev/uledtriggers and writin=
g=20
>  > > a uledtriggers_user_dev struct. A new LED trigger is registered with=
 the=20
>  > > name given in the struct.=20
>  > >=20
>  > > After the initial setup, writing an int value will set the trigger's=
=20
>  > > brightness, equivalent to calling led_trigger_event().=20
>  > >=20
>  > > Alternatively, there are ioctls for setup, changing trigger brightne=
ss,=20
>  > > or doing blinking.=20
>  > >=20
>  > > Closing the file handle to /dev/uledtriggers will remove the LED=20
>  > > trigger.=20
>  > =20
>  > Would you explain some usecases where this is useful?=20
>  > =20
>  > Userspace can already control the leds using /sys/class/leds...=20
>=20
> 1. Loose coupling and flexible configuration
>=20
> One benefit is that it allows userspace applications to control LEDs in a=
=20
> way which is more loosely coupled to specific LEDs.
>=20
> Eg an application might run on a variety of hardware with different LEDs,=
 or=20
> users might want to choose what things are indicated on what LEDs. One us=
er=20
> might want a FAULT LED, another user might want an LED to blink for each=
=20
> transmitted message, etc.
>=20
> So, an application can create a number of userspace LED triggers. Then us=
ers=20
> can connect those triggers to LEDs however they like, and can even change=
=20
> them dynamically without restarting the application.
>=20
> 2. Replicate in-kernel driver functionality in userspace
>=20
> My use-case is, I'm writing a new driver in userspace (with CUSE) to=20
> replace an earlier in-kernel driver. That in-kernel driver provided sever=
al=20
> LED triggers. For me to replicate the driver's functionality completely, =
it=20
> would be very nice for my userspace driver to also be able to drive LED=
=20
> triggers just like the old in-kernel driver did.

I don't believe the usecases warrant this complexity. Minimum version
would be somehow registering a trigger from userspace, and then
userspace driving the led using normal sysfs interface, but I guess
even that would be tricky to design nicely.

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--2NM5tUEqOlSmXyut
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZ/jqEAAKCRAw5/Bqldv6
8vV2AJ9+ziO6tdx71bCiX1xxGj9tkOa7pwCgtiDKUcd7LNwo4RPOwoimhNEc6Uc=
=Amic
-----END PGP SIGNATURE-----

--2NM5tUEqOlSmXyut--

