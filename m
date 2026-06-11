Return-Path: <linux-leds+bounces-8572-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o3fDNfyqKmrMugMAu9opvQ
	(envelope-from <linux-leds+bounces-8572-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 14:33:00 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B93671DEC
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 14:33:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="jMrjbGU/";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8572-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8572-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 394CF3102347
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 12:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6F43F6C32;
	Thu, 11 Jun 2026 12:31:55 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2930E3DB30C
	for <linux-leds@vger.kernel.org>; Thu, 11 Jun 2026 12:31:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781181115; cv=pass; b=jHmXPiOlBdAW1Isjt4njeyc5MB6AHN24sQgEvOI9wPtSNMw0/ZIH55AY4qGogfy4aC6Ad31U10OPMfOZIgFUx5emD+PfELACT3k6rHlA6wPgrkTq0AoKOTFTSyeWz0RTudMUikX4VE9PG5Y70+5X1skhkl4m/tlpg+/z6tkVMJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781181115; c=relaxed/simple;
	bh=N9w8AQ/izAnL6SZkvE0t7Zg95S0t93+i10d7C13tBDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OiOrWSWf02pnG7jpDIp+gCkHr7ma5bGzFbSrDsFWLCbT+6s7Z6ysiwW70kHXmqZrZKeg8IXYj2tvmM46YSi0ARhYP4eBlGAHAFnCq5dY15HGYx/8DK3ePsYNCAttm9sOPCjeT9gEtsbPoxoVGuoBEJOLk+grn6t+7yBV0TbhptU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMrjbGU/; arc=pass smtp.client-ip=74.125.82.178
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304d7f31215so7095481eec.1
        for <linux-leds@vger.kernel.org>; Thu, 11 Jun 2026 05:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781181113; cv=none;
        d=google.com; s=arc-20240605;
        b=dplLdO5xUoda9gz01bobHEdy/ImQHIM2vLRaFxLTFmx9iXNh5J+9XgOGv5MKYOughm
         bSrQHJQh2n+AVMBu7J6EWV4fO9+0nVdWybI9+YLP09HV+i787bverdCcnTRwdNWQ1k95
         GshCXq2orQSNStO9Dfdydp642n1VqRYjgAswzECH63fH4KVuJoPZ2fmqqjnPbbYVtpNI
         GmL+r119yLbHO92TKS/+n34QCEudXZ5M2S1iSflWytFiFGkhveNbHmERgZaS7BhFPIa8
         5QRAXBRCHFdhKcWdzRMq4A7rP7q2kZaiytqyZPfDLr25dPy0dfBJ+gHYZO1VAb28MLBQ
         6jWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w4CyzohY6NxCIsHAPrysIwJ2ZeDEULVaTSdexi5v2m4=;
        fh=xlqQY2huCEdM64nJo2uMrOuf88Bze2fWY9I3Frt8Q0A=;
        b=I4BQuOuduYhpUflYQpcFB1G9QcM9g0VyRJxcCKaP/6/13kZVEkWYHD6Fsur7q8MaXJ
         z7KZh9tlJvzP4qQwv4HIZidsZ3FlRNcjvCkFT4k0FBYMLu6lm0U7bbNyOOqJjg/Ek/aj
         2d+qqTHvM7ajmroni+UD7SQPy3ZVg6vja4t30l+j+1SiICoG0kAGbWkeYAscCqOKlfk6
         PXr/lLQfqv1SFq3BTvrrkJGNyeO2RwQb5w8v+KPvf1vVZeicqrfSF1whqKQQPJftkEZQ
         XF4rN+rPyWd6pvOmJVv9K4J8FaQjKF8L4u230cdbVA1EH9MHvHEBJ77at8dSsVlhDFu0
         JGyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781181113; x=1781785913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4CyzohY6NxCIsHAPrysIwJ2ZeDEULVaTSdexi5v2m4=;
        b=jMrjbGU/K/MiY2zpDfjCinZekRAjsHLsioZc4nj7eI4VhBvHnKb1u0mEDXZ6rpWSDc
         AFAhW+U8S/DDVHpdGjmLBtrX60cuCucbfedeMIigZmiyxFnFldmIr6MZ4nxTnrDPDhNk
         Djj0Yrjtf3uuX4fjdVvrEtKWaucr1c71MLU6RrNKuPHywTKCL2i7fnDs79eHmkqVkxgc
         7cwj57+IS/kQ+HMIFG5awsEfTAzAS6H/XvUC0URVujIuLj0WoxmR81MdiiNc0TVjTVbU
         p0UEzyUbVf42N3mVisgHO8vf2ahgMH92KtQOYVcdOJc6n20hj5gecF2MxtIDBesF9yVi
         3sOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781181113; x=1781785913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w4CyzohY6NxCIsHAPrysIwJ2ZeDEULVaTSdexi5v2m4=;
        b=TvTzNaRCnTiTcOp4vktPgUqEgY+Tj+MFyi+5/AWSSVpUiqms13NZQDnEZjVx6j+Uml
         laZVXvgko0kLj1KQGloB1mk1Mekx627ixUWQ2RSxrdiQ0GztqA0n6WuD2/MKGVz3tvRf
         AcQjuPzmX9Okmcx80F0DHzPGR0oRObzURAKrCMyobKEpVJ9F/hDW2h76kKBX2OgDlSBg
         23VNhrywx17Sdhgdahw0ykDb1TKG31iRvcyajrCw1bnOKAyT1BAr77ECwbTr8iIc5maW
         WcmsOaKdczC0REPIFGftOHRCv75LnyDIqI/Sb7WPr/+yewrV4uVReGEubQIyz5lltn5K
         mIkw==
X-Forwarded-Encrypted: i=1; AFNElJ/tI4/8UQlqEo75qevQwYoOvvZRk57yu59uV92bKEvDWsV/6ABWIy/G/bhv9ZslyKj6V7r7GaRHrcJO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+e/FZOCccP6TCOlcYViJFsNEdwV8hYvlIxOq0eF0EupNRCuRf
	Kn3KKoIF078ZWsWsS4EoDYw7obdEazSNs3NT98bO3/3xLtbBF0ZW7FbVg4Op/PxicOBF69NxtBX
	ZmZ2YTP/BukhcAKngE4RgywBeLcF2+a4=
X-Gm-Gg: Acq92OGrWWFdxi9gfgO8ddY5GgtYY/RQuQIANDtdgglacvEPciZapXoOJKM0yj4ZANj
	K4UOWyJ99EnIwtlHoJu7xqFQ+k06amwtdi5w6ntGW+V/stYYYQ8/b4R9K4VpMfytcM3Xh0fFb0V
	JylygXul8pXxrmers3sc9I8tYqBj3HMHUnb15b62ArjA3MxZt+buLJC0bxCE+3V8DcAuax8z9TZ
	idkMHKq9WQl0wEF/oxzbX195NBO1STmQAI67R1zH2CyyCQ8bkBEeOGxDTNou0xZwjqVKxT273HF
	meS2RRPTy/PQsV+o6zU=
X-Received: by 2002:a05:7300:2205:b0:304:13f3:e461 with SMTP id
 5a478bee46e88-308047892c8mr1778310eec.3.1781181113170; Thu, 11 Jun 2026
 05:31:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606045738.21050-1-clamor95@gmail.com> <20260606045738.21050-8-clamor95@gmail.com>
 <aihl9yIqN3adKWLr@ashevche-desk.local> <CAPVz0n2+27QVeWNgPm3PH6V2Ceuym6sbMtUrh7hSHe9PcRmfMA@mail.gmail.com>
 <aimxK3asZjebYrNt@ashevche-desk.local>
In-Reply-To: <aimxK3asZjebYrNt@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 11 Jun 2026 15:31:41 +0300
X-Gm-Features: AVVi8CfaCeDkKO_UpXhT478yTj8VjHK953EzmbL2Rc52Hp0WrpWg7gTbUSSSXw4
Message-ID: <CAPVz0n0z_6fuoxBzLcN0VdUBUWZB1c0VGsAkDW3xXnPuwZj-3w@mail.gmail.com>
Subject: Re: [PATCH v4 07/14] mfd: lm3533: Switch sysfs_create_group() to device_add_group()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8572-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 28B93671DEC

=D1=81=D1=80, 10 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 21:4=
7 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Jun 10, 2026 at 05:38:38PM +0300, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 9 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 2=
2:14 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5=
:
> > > On Sat, Jun 06, 2026 at 07:57:31AM +0300, Svyatoslav Ryhel wrote:
> > > > Switch from sysfs_create_group() to device_add_group() including de=
vice
> > > > managed where appropriate.
> > >
> > > This should use .dev_groups member of struct device_driver.
> >
> > Specify pls, device_add_group literally uses dev_groups, I don't
> > understand what is wrong.
>
> dev_groups of the struct device_driver. It means that the data should be
> static and be available before driver probe is called.
>
> ...
>
> > > > +     ret =3D devm_device_add_group(&bd->dev, &lm3533_bl_attribute_=
group);
> > >
> > > This will make Greg KH very grumpy. (For the record, original code as=
 well
> > > but it already is in upstream. So, thanks for trying to address this,=
 just
> > > needs a bit more of work.)
> >
> > In the prev iteration YOU asked to me to adjust this. I have adjusted
> > and now you say that this is not appropriate. I will just drop this
> > commit altogether.
>
> Yes, and I still tell that this is the way to fix that issue.
>
> You can even do it yourself in a few clicks (hint: `git log --grep` is th=
e tool
> of the day): 93afe8ba9b01 ("ACPI: TAD: Use dev_groups in struct device_dr=
iver").
> This is an example of what I meant.
>

Oh, very nice, thanks!

> > > > +     if (ret < 0)
> > > > +             return dev_err_probe(&pdev->dev, ret,
> > > > +                                  "failed to create sysfs attribut=
es\n");
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

