Return-Path: <linux-leds+bounces-6891-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6F8MM6OgiGnSsgQAu9opvQ
	(envelope-from <linux-leds+bounces-6891-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 08 Feb 2026 15:41:39 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7306D108F32
	for <lists+linux-leds@lfdr.de>; Sun, 08 Feb 2026 15:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C190C3004D02
	for <lists+linux-leds@lfdr.de>; Sun,  8 Feb 2026 14:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67EA43587A1;
	Sun,  8 Feb 2026 14:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuSFG1Rp"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD482D0C95
	for <linux-leds@vger.kernel.org>; Sun,  8 Feb 2026 14:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770561696; cv=none; b=XOh/oz8i1jAm9VwDmVIj3ka5dIGt++7luFFp88VioIYu8e7MWNxLbaXo9yQmV+q+qWa4Df6vxI1T3RT5nJkZCj9DEu4SJXo5pdxB3azyy68zI6AMwUCdaKiu0Xd7AQ3mlIK2suXVJocG10AALlab/Eq1W9KvZldtW67QJg2y2GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770561696; c=relaxed/simple;
	bh=CZs6W4qtgovICtv3aQ4MI/35xymWjYMW9FmKLgGvuPQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=B0gO7KjU8dp1uBwBo/S9NsFLCo9w7sIeou7bjdRjsTpeCNsfDCaCH8VrMFc06TkjEcOjnYdN9XW8FVIE3H1oYlcIAcjXt52juVuoY9I8gOlbRSDnLqD5pyufXt0dzv0PkDZ2wigIoVdzHXh8jXs//4SG3Bkdd0mkX9i5hGnzEjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuSFG1Rp; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59ddf02b00aso4312872e87.0
        for <linux-leds@vger.kernel.org>; Sun, 08 Feb 2026 06:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770561694; x=1771166494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rYIWPdf9Ppa+RCJ5xZ0bnUhEJapRTVibnTDn3MDdLKE=;
        b=iuSFG1Rp7qDdoQS1exGm06yTiEKE8Ut9Sby3ZZLF/zCWH4LkssqaC3tX0QAvid2tDZ
         VnSHPoGkzaL+5sn2ZUpiaMdEjLhk53Nm2u2SyT1u1KyMVFz8swBc8zQz7RVPbK/fOJ56
         pEQOvQFR+dfhtTOTfHVmo2apfkd8UMJD7IajkDhVKME/rByfKkbfB9mle0n8li2B+E6P
         DPi7HGy3NVWGdWqFeGnjQkxhq2ZhzNR3xPl0lifC556ugcm0En8cd7ia7TAXTqjv9Pf7
         xnk/ay0/30ZjEGbiUoa+ejygg92xWM6xypLs/rRzgWt9C/856NQMTxWCoYnEPNpZLJWM
         c1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770561694; x=1771166494;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rYIWPdf9Ppa+RCJ5xZ0bnUhEJapRTVibnTDn3MDdLKE=;
        b=gDUtSrAoKdzegPBU/EEdjRDW/rmYjKTAn50oq39WFFWhNIbNxicdHXu4CxuWzcdAkP
         EiwvojON3nl9o2S5QAFMijkf+Bes3dSHBzsDRWkyGRJfQhX5M7nQj/yyO8qySkUO0ZAh
         7kM2QEFyKdixeSu81qCQAjs5BFgKtB4CN6g9NgivAeOmueQvPiQIARExZbm0tRx3cQBy
         MbeNjZGP06GpHG8il6CTlqU94Rc0NsBJShGZcMw1+8LOg+2lIBJJT4AiODpAK8J9Unep
         P7j7apX5dPdQ8yrX5jzDeHMzQD65hABbEP4APzBnHfGDdt1RySfbM08gzvLUyxmCJlrf
         Z6Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWAeC2Nyrpxw9DWZGgaQEJ6zFMXyh4yyRcrkgpyiywbmv57683QbXEcLlx+nMARLWUDJNhJ9T+SACQL@vger.kernel.org
X-Gm-Message-State: AOJu0YzbmbvuojA/5YJJgce3dABEdMBl4GkF3Uw9tmddU5fOBlc/0LId
	HltyD1PSIbHo6apNqJuchvg4hNZIiGM8+xqzwl4Fzdo3YRJqefsXzZH3
X-Gm-Gg: AZuq6aKV28OO2hvIxESDtdo4+3zMjo8b86wGp7wtjr8edNi5hJKSXf8daUewTc3VdQp
	wQEkmJ5EmUdRWMdbQ8l5VPv02UJsrCyL77JZCgHif0aUyigWAGg3BD7oc+HJYzUEM0f0gZzZqiA
	oug9Rqrl2XimWWcN8PQOWuUqxnZu7SSwGXj3xBVi9VWgM2rTJipkcFg19SfrS4dLApJ6olqaNxT
	CSTA4qIUTSJmcLs5bRiuvPmSrALbOESbH76BcoSBLC6l7IyxitHlRi6yUH5syeitcMb4Fn4o1iM
	lVYq8jWSdBwSh2YtQykHPjBQ+YL7qpYjjqnhMaV43F3t5RjlKNf/L3ARjVF6QnJyOipF37xh7lr
	qDD9CRNeE8zkRItwps5knyDJvz2gEO+z8AyMc+HytD1HTx7PZbyvU7MzjZv1djhgRMX4hvqFknH
	/NYbEyqflmHv1rvQDDRJ5z6GehFtlHtTA=
X-Received: by 2002:a05:6512:1302:b0:59e:39af:a70f with SMTP id 2adb3069b0e04-59e45156d7emr2557460e87.35.1770561693903;
        Sun, 08 Feb 2026 06:41:33 -0800 (PST)
Received: from ehlo.thunderbird.net ([178.137.246.208])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cfd475sm1948495e87.29.2026.02.08.06.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Feb 2026 06:41:33 -0800 (PST)
Date: Sun, 08 Feb 2026 16:41:32 +0200
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
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_11/11=5D_mfd=3A_motorola-cpca?=
 =?US-ASCII?Q?p=3A_add_support_for_Mot_CPCAP_composition?=
User-Agent: K-9 Mail for Android
In-Reply-To: <aYiH8iwetvRfWxGI@smile.fi.intel.com>
References: <20260206172845.145407-1-clamor95@gmail.com> <20260206172845.145407-12-clamor95@gmail.com> <aYiH8iwetvRfWxGI@smile.fi.intel.com>
Message-ID: <39B7F089-5B4A-47F7-B2EA-A526B290FA77@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,atomide.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-6891-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7306D108F32
X-Rspamd-Action: no action



8 =D0=BB=D1=8E=D1=82=D0=BE=D0=B3=D0=BE 2026=E2=80=AF=D1=80=2E 14:56:18 GMT=
+02:00, Andy Shevchenko <andriy=2Eshevchenko@intel=2Ecom> =D0=BF=D0=B8=D1=
=88=D0=B5:
>On Fri, Feb 06, 2026 at 07:28:45PM +0200, Svyatoslav Ryhel wrote:
>> Add a MFD subdevice composition used in Tegra20 based Mot board
>> (Motorola Atrix 4G and Droid X2)=2E
>
>=2E=2E=2E
>
>>  	{ =2Ename =3D "cpcap", },
>>  	{ =2Ename =3D "6556002", },
>>  	{ =2Ename =3D "mapphone-cpcap", },
>> +	{ =2Ename =3D "mot-cpcap", },
>
>Drop inner trailing comma=2E
>

That would be a stray change, wouldn't it?

>>  	{},
>
>Drop a comma at the terminator=2E
>

That would be a stray change as well, wouldn't it?

>>  };
>>  MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
>
>This can be done in the patch that adds driver data=2E
>

Then lets move there=2E

