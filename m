Return-Path: <linux-leds+bounces-2300-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAA3938999
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jul 2024 09:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7826B280E62
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jul 2024 07:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD827DF51;
	Mon, 22 Jul 2024 07:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="E2tFQNKp"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4F62F41;
	Mon, 22 Jul 2024 07:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721631987; cv=none; b=N4KLA0bah2i4+b2iOS9mL6jZX+T1su/xugQIL9/EkAYhg9El9DC53bqrO04pxrXN9vg4vQf61MAm04jeEPILrNLjSDHhsiHJBmCvSeV9kJRJFaLzaHQln/DS54Tv+l3P7A9jviOec1i6H7SWsYAa8afKJL0TOMVtMjhUwypvHDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721631987; c=relaxed/simple;
	bh=1+E9tbS14VMdqskXQej+GaKPqQyY0ZidczUggt3RCBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6oiQPdVlCe+xiiHhtqwb97AkMHrDOzI9xLh/WEQxQd6omwu15bLMQDGll8RPdr0IlystEkhuIgbuaWdopAyotK7zxPN0Qv9nv2TtMj0kcBC/YPpMf6YNfWtca9FXBiGnNhieORgSrHqjzUsJH+zzpKQEtxmeQ0g6Agx9sg7JVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=E2tFQNKp; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 791821C0082; Mon, 22 Jul 2024 09:06:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1721631983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0k6CMcYT278I93fU4dSlU6NHaQreWoiXjYqC3mADNWE=;
	b=E2tFQNKpUuRjrwcu3nORkt8HtqDliJp+ypLbkeec8JM0XvjrCwT/q3ZlxnUxlthUl8Bcr+
	Cd6w0qPof+Y3AcEQlziFLl2q/uzLdB1ETKUEoydOTTh+eoprovWZVeoJI557+aIwblZv4Q
	zOqkgcMYnYI5t80yXwVlJZm20lvt364=
Date: Mon, 22 Jul 2024 09:06:23 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
Cc: lee@kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 2/2] leds: Add LED1202 I2C driverr
Message-ID: <Zp4E76JNHTyx21wE@duo.ucw.cz>
References: <ZpzkBM_ZwM8hdwgP@admins-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IY44DbwITeRXMDmb"
Content-Disposition: inline
In-Reply-To: <ZpzkBM_ZwM8hdwgP@admins-MacBook-Air.local>


--IY44DbwITeRXMDmb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The LED1202 is a 12-channel low quiescent current LED driver.
> The output current can be adjusted separately for each channel by
> 8-bit analog (current sink input) and 12-bit digital (PWM) dimming contro=
l.
> The LED1202 implements 12 low-side current generators with independent di=
mming control.
> Internal volatile memory allows the user to store up to 8 different patte=
rns, each
> pattern is a particular output configuration in terms of PWM duty-cycle (=
on 4096 steps).
> Analog dimming (on 256 steps) is per channel but common to all patterns.


> +static ssize_t st1202_duration_pattern_show(struct device *dev,
> +					struct device_attribute *attr, char *buf)
> +{
> +	struct st1202_chip *chip;
> +	struct dev_ext_attribute *eattr;
> +	struct st1202_led_pattern_map *map;

New sysfs files need documentation.

Plus, this probably should use this interface, not custom one:

Documentation/ABI/testing/sysfs-class-led-trigger-pattern:What:         /sy=
s/class/leds/<led>/hw_pattern

It might be better to submit driver without pattern support, then
re-add it when driver is merged.

Best regards,
							Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--IY44DbwITeRXMDmb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZp4E7wAKCRAw5/Bqldv6
8lhLAJwMA/1uXVFBA1PUFM7TAdvvp5SZqACgoT9jPpa90vj5S95u+0seSnyC/7o=
=E2B4
-----END PGP SIGNATURE-----

--IY44DbwITeRXMDmb--

