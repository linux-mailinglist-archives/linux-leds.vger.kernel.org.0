Return-Path: <linux-leds+bounces-6897-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BYeBRKeiWlU/wQAu9opvQ
	(envelope-from <linux-leds+bounces-6897-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 09 Feb 2026 09:42:58 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B076010D210
	for <lists+linux-leds@lfdr.de>; Mon, 09 Feb 2026 09:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC227300AB09
	for <lists+linux-leds@lfdr.de>; Mon,  9 Feb 2026 08:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15727318B9F;
	Mon,  9 Feb 2026 08:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1SfwTvo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87065318B88
	for <linux-leds@vger.kernel.org>; Mon,  9 Feb 2026 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770626527; cv=none; b=lfBFAJBpsXCVYcoXGhQfzWnh3wAmYkrl1KR8cw8tZk/zGNWf3qzxEgJ5UvqA5UCdbFtg+pXBkNo3DE3eOZocPMYznm/Q/W1PXoM6sqlsF+yxFjYUSToyH5Yysll3gPrBKB0ix3jZxFkeA8XtJd1WHB0YK/Dos3fpnSaG071O2QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770626527; c=relaxed/simple;
	bh=LiYrdmZmpe82t7dlcM/f2AMhXxkyP+KlPiuEiIfS8hQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=YGrJabtCXgjvWUsb9a0cfCPA+sY+5xrgGBOjD/8R6+eJ6YMKEqJQHavmN24uIAkuqy8m8WM9B/cEEoZHk1f98QiPAwdto+Z7Lu36/DnOrmJHSCbggmRW5eoBl/nJaJeOLElLO1PqqleXIvK7oIJG1W6G0lqlv7R53t6aNbOn2ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1SfwTvo; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59dd490be5fso4678549e87.2
        for <linux-leds@vger.kernel.org>; Mon, 09 Feb 2026 00:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770626525; x=1771231325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cxn1uhOmh76vKJ6SWls1H47L/AWVvPiIPbvQPRDKQr8=;
        b=L1SfwTvoILdLWiZEM/WKIu+DQDmpBcgpgVzijYVryHfxXYLyZL6r9PF38UtqFncL/r
         6VwnOF5DGaQvbsKi5OEqR1RphjDzg8DqV7PvATylt823RkiVHPJP/Lmzdse1VkXJtltF
         /HR91rKSFkNGMmzzjqrYi0M/M/kvV61HeNNXwsJOjUpiIKInZC0NFW3tENP39PvexJ5g
         i7/aMqKhMazjSagPySl7jQTHNRUcbpAspxydL8WFvYnAgHfRBGaRWC6vd8MdyhFvmBuP
         j3HfPxeuK1oleeJpuJo4YY/C0AFEPg9OIfB9jsPRIdxaF3Jvtrx+YBaTNgauwtAXGTPp
         Xveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770626525; x=1771231325;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cxn1uhOmh76vKJ6SWls1H47L/AWVvPiIPbvQPRDKQr8=;
        b=oM79YvKenF5Pdq/qhxvs9FXYIUobRAkstJOUXTNFBaVR4N6vqow+PQr4rO7HY0QccY
         a6peLwGoypu+h8QnQ8j75m/tzTmPdS0yaXOTvUFUaSZMTJLVK6a/+7kzn0ohKY8vrKGr
         PL0TsYo32b2SCBQsxIaP4WP1X/c8S5a8ILttx7JMqsy/4hZwREWNPhafyl3SFqJ9NzbQ
         g47YFxHhikfZuytoSs/PKjtJQeo90tKmA3s3Ym81wtcg70uNsXOrZ9pF8SUy9n75Y/48
         PlmAx9ywYyzfFbR7u56VK6HVbF2uOiu6STcvGZES4wtLIliaGEnt/wdf0ajMER4YshoQ
         UWtw==
X-Forwarded-Encrypted: i=1; AJvYcCXaLwqiBp7b/WTULpNTRRhy+uvAyO+Iwvwzf6jhk3mfFAPkRFQwBsEXuxWFdL6enK+VQBwj3OfiHn+0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg6FSqbRum0yIbaSxW/A3HFLDYM/LKXmGA3AQT04u1BmG2UG0u
	rQzJ7/VJ5K7Cj/gM+DkZhmhipnxqlx+hSTDjrAZxHqCk5eNuhthoqGiC
X-Gm-Gg: AZuq6aLQ+Iiix6R4yFDVajrZYHYyKrto9o4l49w0k0n39Rb4PWTzM91B9IBpZ997WPJ
	PauCANUXskW/HJM1YdL+5AsuZ6+hnT4Io59dF/8lQy36PBAakjQpR6tslvmq/RGQPIHf6mNRj3e
	VqZU9s6sMmPIbXwDwG2z/0aGtH0UY1ZQymqhdo6Cz+BH6KWSOZcoGaOlDX6I3ravj6Cf3SruXOh
	605Z0SlHbeQ7E5cBjXgqOlfWd1cxjVPMaLzyAvyily54RyQ3Jg+OkXK8V+uzhx6h0qA7ryG3DZT
	CmjpFjtsFMgqeHxT1xe64qCHL+HTdOMR9r6k9ArOqnMGWH7jvsnfoI5JJEpVzqwX43N2TZPC5zq
	zaij7ud4CBb/PrVUJD14VkdfblFzU3GbQww8CSJl906GnwzcHG/PePSbTeS+titmInYJrV4wMt2
	+VdDNIOy0IPHOm08qTqFei
X-Received: by 2002:a05:6512:32c8:b0:59b:9ff8:468e with SMTP id 2adb3069b0e04-59e45156946mr3840197e87.31.1770626524350;
        Mon, 09 Feb 2026 00:42:04 -0800 (PST)
Received: from ehlo.thunderbird.net ([178.137.105.239])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44d29a48sm2425411e87.62.2026.02.09.00.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 00:42:03 -0800 (PST)
Date: Mon, 09 Feb 2026 10:42:02 +0200
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
In-Reply-To: <aYmYcd0431P5sUtq@smile.fi.intel.com>
References: <20260206172845.145407-1-clamor95@gmail.com> <20260206172845.145407-11-clamor95@gmail.com> <aYiHnUW93AB0ARJH@smile.fi.intel.com> <D8B3E97F-3405-4EBD-882D-677F530E4EDB@gmail.com> <aYmYcd0431P5sUtq@smile.fi.intel.com>
Message-ID: <5AA39777-F5C8-4AD5-A5C2-47265C8213F5@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-6897-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: B076010D210
X-Rspamd-Action: no action



9 =D0=BB=D1=8E=D1=82=D0=BE=D0=B3=D0=BE 2026=E2=80=AF=D1=80=2E 10:18:57 GMT=
+02:00, Andy Shevchenko <andriy=2Eshevchenko@intel=2Ecom> =D0=BF=D0=B8=D1=
=88=D0=B5:
>On Sun, Feb 08, 2026 at 05:19:49PM +0200, Svyatoslav Ryhel wrote:
>> 8 =D0=BB=D1=8E=D1=82=D0=BE=D0=B3=D0=BE 2026=E2=80=AF=D1=80=2E 14:54:53 =
GMT+02:00, Andy Shevchenko <andriy=2Eshevchenko@intel=2Ecom> =D0=BF=D0=B8=
=D1=88=D0=B5:
>> >On Fri, Feb 06, 2026 at 07:28:44PM +0200, Svyatoslav Ryhel wrote:
>
>=2E=2E=2E
>
>> >> -static const struct of_device_id cpcap_of_match[] =3D {
>> >> -	{ =2Ecompatible =3D "motorola,cpcap", },
>> >> -	{ =2Ecompatible =3D "st,6556002", },
>> >> -	{},
>> >> -};
>> >> -MODULE_DEVICE_TABLE(of, cpcap_of_match);
>> >> -
>> >>  static const struct spi_device_id cpcap_spi_ids[] =3D {
>> >>  	{ =2Ename =3D "cpcap", },
>> >>  	{ =2Ename =3D "6556002", },
>> >> +	{ =2Ename =3D "mapphone-cpcap", },
>> >>  	{},
>> >>  };
>> >
>> >This  also needs to be converted to use driver data=2E
>>=20
>> I can do that, but is it needed?
>
>For the consistency's sake=2E
>Also brief look at MFD SPI drivers I see that most of them use driver dat=
a=2E
>All that is redundancy? Maybe clean them up as well to show the point?
>
>> This id table, if I understand correctly, is here solely to silence war=
nings
>> about missing spi id table=2E Driver itself does not use it in any way =
and will
>> never use since all available devices that use this driver rely solely =
on the
>> device tree, all possible future devices will be relying on device tree=
 too
>> due to obvious reasons=2E
>
>Then maybe SPI should be fixed to avoid this table to be present? (But do=
n't
>waste your time, it will be a rabbit hole=2E)
>
>> >>  MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
>
>=2E=2E=2E
>
>> And please, may you contain all your reviewing in one iteration=2E Then=
 both of
>> us will spend less time working on the patch=2E Thank you!
>
>It's an impossible request, you should understand that=2E If you want, us=
e AI
>or your robot colleagues for that, I'm just a human being, I can't see
>everything at once=2E
>

Ability to see only nits and don't see the possible issues seems to be a t=
alent=2E

>

