Return-Path: <linux-leds+bounces-3618-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C46189F37C0
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2024 18:46:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AC25161E9C
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2024 17:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47EBC2063C4;
	Mon, 16 Dec 2024 17:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJmzF1X7"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AC44EB38;
	Mon, 16 Dec 2024 17:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734371169; cv=none; b=QbWmi1nZbi2dvJJgm8ohvCWz4CFECZ1dE6qqHzmKnXK9n4UtmcrYpUq81gDKEGr3M5/tPknrZOiNBs4HJ8eFpfl+LLXo2dmxu8O93buaI5L69YB9YPfVVlGSOswHogqJ1/wz68XnXnitu45YleAglNLYomfWPGTrIYO/0L7SOqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734371169; c=relaxed/simple;
	bh=LDxIv1E3Cfi6mUhdbKPkPLS8LWB9TYypt4l83RYATcY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q/G6Flm2J6MMgf738N+BWGbMjcPZa2Sxcy4QapHa1sR/NLCYj+api6ihr8xJ8jj3HW7d6FM/cSzPqV7Hb2sm54Too3u0usG4JGIvGW/9JD06W4n4tXu0bryutcgVt3cqafBpO6mU3P8+/EnGuIqTRXoqjJPt/LmOR8bYpWp77FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJmzF1X7; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso3697853f8f.1;
        Mon, 16 Dec 2024 09:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734371166; x=1734975966; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LDxIv1E3Cfi6mUhdbKPkPLS8LWB9TYypt4l83RYATcY=;
        b=HJmzF1X7BH8a7JAB2Z2CP0c2FyLNl5VWYC5hDkaqasd3bxWllrhTcLVyP/eAChUVEm
         qu10ZI1SFUMeDKMT5ZF9RvBu0V8Mn2mKFi2BL8flwI7Sk4T93j6wRVPxpxFUXPghF5jq
         opzXJjWIbJDMAlFX9kZlMbhumAwntHKPwq/35c4uMd79nM/3FXzzQx7s49uhREsST9Zg
         F2rSBTuUA4GmNNOcozj4ni5/Z/W3NgOCrgL03/q9/P6n7Lrwfhu9IVTQdHhs0f+814SN
         RDRw9Rf01Q7p1/qAbwWdE1UQ1lhBX+rN4iGt9Q+1utCHAJZ01WJPp2ivfcAV/T7qZ1xn
         uw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371166; x=1734975966;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LDxIv1E3Cfi6mUhdbKPkPLS8LWB9TYypt4l83RYATcY=;
        b=ZrTNssPcdBj8iCoEmH7IzlP6IhQ/q+QxHM15X3Wio+Q4fK52ha7g2GockPOaxcMWZM
         N3koEVUJO/bAn2IW9BesBiAqikGxc/90ARqtbJAzI2V61EHlQ+CcY8WLX1sbeOYKAHCa
         QpI/X4T4C9+43JvNUIXwbp1+cFo1ie9AJe6hRNyWWktKxiPc72/lb9W3Vv98z1HTbQre
         zZtKvXi0CoGtEHITx9ZXRnKnhHjFReKZIbjySxNUHf8ym9ma0LUiiCnccUHQlWyU3Ar9
         OVGBMMCW6fOVVd3xyUScSYeA/jZxasMk7DaC+HOcYoVsnKiDuUHt36LuKaFpG7/PdmZ8
         yVHQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2lEYSpef6dXq0CBTagE5U55rBB9UY2B6MzIE9PpBvB/HiohEhMFLaTiGXXsT35CFo2vGY2L0PzWi5TQ==@vger.kernel.org, AJvYcCWmvmpbcJvZGDAHc+JhFJEmFvwSp7XnBZKE1XZACB5oaljPidKHHvIvAvMqMyMaB1DuuKR2tRyG7Sip@vger.kernel.org
X-Gm-Message-State: AOJu0YwqMABnjgLaK2phoXbZcm0CQtExj3+RlYdnipqCHzVFUNoF+Ezn
	/Ap5SezqzCAQB0jevRu8JL689yl1ozIOr0t0GRIAp6dcVlU3VPjo
X-Gm-Gg: ASbGnctbuSyz1mcZuaLsBqvFSUjTt7KHz2u0l52kZvXyoJGiH3RTC6YRI0MJ1Z2Cv4J
	oN6L3eu5XaIO4udY0Empxb1taKs5DFr+O6j8q6HRXk1513Hp2kz2+onfUkJ/1CcD7XjtGPYANIU
	PLKftBnlhDdxodISdOeZ7CkdLSfDQfZpImmxDcnjwWumUEUKiv1qPglpg9cAzmDg4Hb98cuIHhy
	zIqJ21rITGZwVe4kS6kNJVXH7LooRs/+D5ZSvfYXEsk0pxlO82+hmcpIlPtfFRkVbXk2S1VGWBF
	Yt7OWR1jLl6mp+ycp0bK7HoYEyc=
X-Google-Smtp-Source: AGHT+IGBJ/riXVZwoF0GRkipPWTNb3OBIdWhOHkRurhkAMxRMKmBaoGRuVMikgREKTp4489NMTgdUA==
X-Received: by 2002:a5d:6d87:0:b0:385:e94d:b152 with SMTP id ffacd0b85a97d-3889ad37d1fmr11079777f8f.54.1734371165558;
        Mon, 16 Dec 2024 09:46:05 -0800 (PST)
Received: from ?IPv6:2a02:168:6806:0:fc42:464d:ef2d:52a3? ([2a02:168:6806:0:fc42:464d:ef2d:52a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80608e3sm8635591f8f.103.2024.12.16.09.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:46:04 -0800 (PST)
Message-ID: <2f870913fcbf89043b6cfe26d32f9ae6d45cddd2.camel@gmail.com>
Subject: Re: [PATCH leds v5 12/12] ARM: dts: turris-omnia: Add global LED
 brightness change interrupt
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Marek =?ISO-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Lee Jones
 <lee@kernel.org>, 	regressions@lists.linux.dev, Pavel Machek
 <pavel@ucw.cz>, 	linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 soc@kernel.org, 	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de
 Goede	 <hdegoede@redhat.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, 	devicetree@vger.kernel.org
Date: Mon, 16 Dec 2024 18:46:04 +0100
In-Reply-To: <6gxg466bl7tbyfq5yoenpw5t3vcfcyywv3jydwwwiqik2pzqsv@3g4gk6m62mdk>
References: <20241104141924.18816-1-kabel@kernel.org>
	 <20241104141924.18816-13-kabel@kernel.org>
	 <87bjyv9ecb.fsf@BLaptop.bootlin.com>
	 <778f08f1774fcad5fcc39114dbb721793ebf95d6.camel@gmail.com>
	 <2iocrd4a7l4avfhqmobbexo7k4u2poidkvvj7lpqh7vp7mprkm@pfgytqnmt2si>
	 <ofd5ru77wypfysflpblafbbdgrcmzztqwoewfjfuusrnbma4aw@y3oc3etutisi>
	 <ec61714eaa3d84498cd69dc673fb11996550a3ea.camel@gmail.com>
	 <6gxg466bl7tbyfq5yoenpw5t3vcfcyywv3jydwwwiqik2pzqsv@3g4gk6m62mdk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2024-12-15 at 22:26 +0100, Marek Beh=C3=BAn wrote:
> On Sun, Dec 15, 2024 at 12:39:10PM +0100, Klaus Kudielka wrote:
> > Testing reveals:
> > I have to enable CONFIG_TURRIS_OMNIA_MCU_GPIO as well, to make the LEDS=
 work again with v6.13-rc2.
> >=20
> > So far, so good.
> >=20
> > But the upcoming dependency in 6.14 will be on CONFIG_TURRIS_OMNIA_MCU,=
 not on CONFIG_TURRIS_OMNIA_MCU_GPIO.
> > Is this correct?
>=20
> On both, see the first added line at
> =C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/commi=
t/?h=3Dfor-leds-next&id=3Dd82e09d62b3bdbfa9dac2daf3c3c071b6a79d2aa

Indeed, sorry for missing that. So, I'd say:

#regzbot fix: d82e09d62b3bdbfa9dac2daf3c3c071b6a79d2aa

and we leave 6.13 as it is.

Klaus

