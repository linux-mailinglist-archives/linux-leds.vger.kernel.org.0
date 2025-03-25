Return-Path: <linux-leds+bounces-4364-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 74342A701DB
	for <lists+linux-leds@lfdr.de>; Tue, 25 Mar 2025 14:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBA0F7A3FA5
	for <lists+linux-leds@lfdr.de>; Tue, 25 Mar 2025 13:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD8519F471;
	Tue, 25 Mar 2025 13:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="CRABk5ol"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2698263F31
	for <linux-leds@vger.kernel.org>; Tue, 25 Mar 2025 13:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742908554; cv=none; b=XdJVAwvVkga76hkOc8hnuqAOVS64/fU10bxYXD8yGHCQnE+6jrlwK/UnUNjLoWLrdlQJUqZo13c04Og8YiBW+VXKe4EU3a+1hBCp/d4Ip/2/Jj3zoS8YFSmlS6+xrTXvjpXlpTjFSnZOcYgs+Umjr3h+VLOph8BM8+EPkihlBSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742908554; c=relaxed/simple;
	bh=NPt9T05jzxUEm7CVXlTowO90MeXItudZSt5Lae+yfMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGGnKzXb/SQcERwQEvAb8EwFopMjhenF+hw0CxlgO0G9isYwzHXijFf6dNyz8BgbuLUks8uRPh5Spp6GxtSHPK6x0OOLICenjriTn5avtXgQ2FxClGPq338x1SiXXgiQN+z5VO3qIRy+G1xik40xFswEiLH+0ci4QcJJ31ykkXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=CRABk5ol; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id E458F1C01A4; Tue, 25 Mar 2025 14:15:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1742908541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jzrlQwyjGcrOE23u9sRZQ5h2zp61SK/OImzAGnJN6aY=;
	b=CRABk5olfpSQU4+AY4Z53Uneyfz7xD25ZwIeeGU7wTMcWU5kNzMqSy8BtA4VZNU5HyhciY
	yjsvKSsQzCEWELpnX1LZH/IDEtAZ36oQ4JIRH6a7llUU5OuQjefoYIBCalE3Q7IKzJJdE7
	0kAvK0aCvcK5p/egOLvwVm3vX4FmLMI=
Date: Tue, 25 Mar 2025 14:15:41 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Craig McQueen <craig@mcqueen.au>
Cc: linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/1] leds: Introduce userspace LED triggers driver
Message-ID: <Z+KsfcjvlsxAN2LE@duo.ucw.cz>
References: <20250311013143.371930-1-craig@mcqueen.au>
 <20250311013143.371930-2-craig@mcqueen.au>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vrZMtjnaDQay+OkL"
Content-Disposition: inline
In-Reply-To: <20250311013143.371930-2-craig@mcqueen.au>


--vrZMtjnaDQay+OkL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This driver creates a userspace LED triggers driver similar to
> uleds and uinput.
>=20
> New LED triggers are created by opening /dev/uledtriggers and writing
> a uledtriggers_user_dev struct. A new LED trigger is registered with the
> name given in the struct.
>=20
> After the initial setup, writing an int value will set the trigger's
> brightness, equivalent to calling led_trigger_event().
>=20
> Alternatively, there are ioctls for setup, changing trigger brightness,
> or doing blinking.
>=20
> Closing the file handle to /dev/uledtriggers will remove the LED
> trigger.

Would you explain some usecases where this is useful?

Userspace can already control the leds using /sys/class/leds...


> +++ b/include/uapi/linux/uledtriggers.h
> +/*
> + * Brightness levels for writes of int values, or for use with ULEDTRIGG=
ERS_IOC_EVENT.
> + * These correspond to Linux kernel internal enum led_brightness in linu=
x/leds.h.
> + */
> +enum uledtriggers_brightness {
> +	ULEDTRIGGERS_OFF		=3D 0,
> +	ULEDTRIGGERS_ON			=3D 1,
> +	ULEDTRIGGERS_HALF		=3D 127,
> +	ULEDTRIGGERS_FULL		=3D 255,
> +};

We are trying to get rid of brightness half, etc. Userspace can
already make leds blink and use oneshot.

NAK.

Best regards,

								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--vrZMtjnaDQay+OkL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZ+KsfQAKCRAw5/Bqldv6
8uBaAKC05JOOIQ6kEJ8yQFN/dry4wqJQ1wCePE3BNyNdTEgtNa9UYxsq09xUric=
=ulmD
-----END PGP SIGNATURE-----

--vrZMtjnaDQay+OkL--

