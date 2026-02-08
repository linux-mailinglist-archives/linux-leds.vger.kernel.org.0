Return-Path: <linux-leds+bounces-6893-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cChwGpupiGlEtwQAu9opvQ
	(envelope-from <linux-leds+bounces-6893-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 08 Feb 2026 16:19:55 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBD91091F0
	for <lists+linux-leds@lfdr.de>; Sun, 08 Feb 2026 16:19:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2675A3011123
	for <lists+linux-leds@lfdr.de>; Sun,  8 Feb 2026 15:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B690A361672;
	Sun,  8 Feb 2026 15:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUCxohCm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4978B31281D
	for <linux-leds@vger.kernel.org>; Sun,  8 Feb 2026 15:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770563992; cv=none; b=TKvhY8L0PERDKCQFLjbjqLCSIgCoPCgVOlUv+tUvGjUkFGMrMDAqWXSSqdyT3qyIvljx+fyChR9kIHRhi0YWzQOD8UEXaXu4UIeibA1xzxK/6ZOdOaESRi9EN/4i81RipW06IkQ78NvVpyzePVfTuoresIU+Sh3aODyyskfx7mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770563992; c=relaxed/simple;
	bh=+xzriWSR5iGt8WjlG2DY92+pZ7PIMUvY0YdgOUgFfco=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=QDSoDJ/k57kBZoc36QR5zBPYlGUzZeCQh9fQHMtcDN7kpoyqXfUWZ3XVs4PyXxCfE49eqxdC9xesEZaf+rtvGXBxl2tbHn/64jO+LnJ7zyPdv+i9j5OkvQhsjPi95CC7DpWPoFFd27ITv9vmAW9DecOSOVaOUmYs+skghrA+0pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUCxohCm; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59de8155501so4033660e87.3
        for <linux-leds@vger.kernel.org>; Sun, 08 Feb 2026 07:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770563990; x=1771168790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W15qM4zjUo3jkGGj+XoI8VU/D/d6+cRvXAz+lQ/6Xi0=;
        b=SUCxohCmgYBUg1Doaa0sWREY1ExnWioYyxlVQOjTgL/iEYFU0UG4XsHNsQ6OCVhkvK
         bcPooG5fPikQ/ygZmJ+40ys7Jm1U7Y0rVs8LIAZ5nDfY9HSAl+SxuUy5rkhVSaiznFJv
         fxCefGGML/XdtYQKKou9qYYX9hAbN4TggSDpGr2zcdXeFpOqRs697S+iKY4mwki660KK
         IPLaKC1kx5zzhMQvGVIBJb4JXEf/6hu38tqoGDYeQnp07jL2lBHSYuYV34nTMncZ+gna
         g8lM6F/P1M2AM+DrcWXvZAfCIh5j+dJbd4GvGgpq3NhlzeZHvKIKOALiU59mz8ODEzK1
         LEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770563991; x=1771168791;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W15qM4zjUo3jkGGj+XoI8VU/D/d6+cRvXAz+lQ/6Xi0=;
        b=qzZD0GXyrIwZojsnWmACPvb9JYW+RoSVY4lWQAAWFCTsY7xRLvxt4hZCfg2WImQLIG
         4u3OI6hfZSppAnRM5f3dhtsTJ4RwCPhs6Tyggk1YZJoAK9tYsCh0ox5B7o/4mura1yYf
         Bz7m7XQL0hTlEpoGQXEz4YvAEkm0olN6dckpuJLVG9Zx77I4MsNG6uYIyn4Y4wGYRWfq
         Fu3YH9PvZTloS6Nro/Hb0bTfywke9QGwjM+SXFyPZNHQangDbjF1jDSbtmdiKDx98iDU
         IYqBKrTgpvSgElIMfQpVV7/e1DWkNksshmEhTYTgRIrjBGtqfgDWdTKpb/PQeKejEold
         qmCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzmCziOJMYjrR2kX4Wfvh38nhxICdxfEzIFNlEk5NGx8VvaW7nkJ3MEYBM+JBTbP2xVRtoW7J1OURl@vger.kernel.org
X-Gm-Message-State: AOJu0YzOushQbTOrPnhoQYuvvGEKJ6qprQDRmH5VQt/B/7+T3ciYOhRC
	gPNPacPl3+w1/+SMjvdx7gOMOAqlH7FH+5xFItqsuVHPoewXoXzABcIi
X-Gm-Gg: AZuq6aLcvS/gBlptF2JTdC17sAKD6Q5zob/7vWE11b+N9q8dBO/D6nNUsJDWQmQOHie
	vAYPPUsc3Na+GY1i8ZBoLL78UKnzkIkIPpddbseya9J2XZWATs7gvk/sFVBtUie9+wwv/HfURCb
	+UGob7deFc0qbc3jAqMqlbzjqpnUmn7IFXGBbObRRH3pKNgBe5PNQvOZnqMJB1VwaxUE+ip5HS9
	/fLes/3/CQ3KWLhRIwT66nrSLHmNL1UsXwSIzHqCmvA8vAmZX1FrXKn0xokwISMEmv6WUCY7sKm
	vb2uWO/sliD02z3knh9fOv08MA2T/8APG/bAAy8ITMM0Z1PjS0MZ0B8Oifo4Y+/MRY9Ib7sFY5s
	Sd+f35Txuse97D67drXDmjDbRYzFpi5qzqDMlwwvdPxUvcgBmH94bc1wjri4829sXRABz7GWyB0
	h0oYvu5BOf/dcHiKZfsS7c
X-Received: by 2002:a05:6512:2508:b0:59e:4f97:ad59 with SMTP id 2adb3069b0e04-59e4f97af15mr263855e87.10.1770563990386;
        Sun, 08 Feb 2026 07:19:50 -0800 (PST)
Received: from ehlo.thunderbird.net ([178.137.246.208])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6e8fsm1963107e87.9.2026.02.08.07.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Feb 2026 07:19:49 -0800 (PST)
Date: Sun, 08 Feb 2026 17:19:49 +0200
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?ISO-8859-1?Q?Nuno_S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Dixit Parmar <dixitparmar19@gmail.com>,
 Tony Lindgren <tony@atomide.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_10/11=5D_mfd=3A_motorola-c?=
 =?US-ASCII?Q?pcap=3A_diverge_configuration_per-board?=
User-Agent: K-9 Mail for Android
In-Reply-To: <aYiHnUW93AB0ARJH@smile.fi.intel.com>
References: <20260206172845.145407-1-clamor95@gmail.com> <20260206172845.145407-11-clamor95@gmail.com> <aYiHnUW93AB0ARJH@smile.fi.intel.com>
Message-ID: <D8B3E97F-3405-4EBD-882D-677F530E4EDB@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,atomide.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-6893-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AEBD91091F0
X-Rspamd-Action: no action



8 =D0=BB=D1=8E=D1=82=D0=BE=D0=B3=D0=BE 2026=E2=80=AF=D1=80=2E 14:54:53 GMT=
+02:00, Andy Shevchenko <andriy=2Eshevchenko@intel=2Ecom> =D0=BF=D0=B8=D1=
=88=D0=B5:
>On Fri, Feb 06, 2026 at 07:28:44PM +0200, Svyatoslav Ryhel wrote:
>> MFD have rigid subdevice structure which does not allow flexible dynami=
c
>> subdevice linking=2E Address this by diverging CPCAP subdevice composit=
ion
>> to take into account board specific configuration=2E
>>=20
>> Create a common default subdevice composition, rename existing subdevic=
e
>> composition into cpcap_mapphone_mfd_devices since it targets mainly
>> Mapphone board=2E
>
>=2E=2E=2E
>
>> -static const struct of_device_id cpcap_of_match[] =3D {
>> -	{ =2Ecompatible =3D "motorola,cpcap", },
>> -	{ =2Ecompatible =3D "st,6556002", },
>> -	{},
>> -};
>> -MODULE_DEVICE_TABLE(of, cpcap_of_match);
>> -
>>  static const struct spi_device_id cpcap_spi_ids[] =3D {
>>  	{ =2Ename =3D "cpcap", },
>>  	{ =2Ename =3D "6556002", },
>> +	{ =2Ename =3D "mapphone-cpcap", },
>>  	{},
>>  };
>
>This  also needs to be converted to use driver data=2E
>

I can do that, but is it needed? This id table, if I understand correctly,=
 is here solely to silence warnings about missing spi id table=2E Driver it=
self does not use it in any way and will never use since all available devi=
ces that use this driver rely solely on the device tree, all possible futur=
e devices will be relying on device tree too due to obvious reasons=2E

And please, may you contain all your reviewing in one iteration=2E Then bo=
th of us will spend less time working on the patch=2E Thank you!

>>  MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
>

