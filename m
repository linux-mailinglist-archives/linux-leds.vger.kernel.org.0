Return-Path: <linux-leds+bounces-3493-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2E59E69A1
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 10:05:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB5C2281F64
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 09:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2F41E0DEA;
	Fri,  6 Dec 2024 09:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtxgC8i0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A73C22315;
	Fri,  6 Dec 2024 09:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733475910; cv=none; b=OgudmC/HBbFjhew+VF39w2ObGATSvMB+sVrK5FNSrS268sYGP+y4et15RUjCU+uQodEl5FFug+mtGRy1Mp64EPXmSYMM91qrJvI7DQSIyr1a7weACg9o9ejMUFV0XRZRCqZPf45shnb0bpRnE7NHvSd59OTHNYGHbQzLp3Hb9n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733475910; c=relaxed/simple;
	bh=Yr0g3WmQW+IHXu+PjpY2ZQ2+PDu7yU9MPGfZM+h7qLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I0COkSGbsQ6bdVQ1QdzTnEIA/JrzSzWTK0RL8EauV+FMoik6bMQYw9yWAIhXbd/5VIR94+055sGFvifxXLfPeem+1wtyn7Up0zaQxZ46WZ+nPuCFxcKsICbVHcqIHl+w3LwxqPscy5ZrlX1VeEIy6oYmZUCE5Kxp+fAinBcrG6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtxgC8i0; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso22328081fa.0;
        Fri, 06 Dec 2024 01:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733475907; x=1734080707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=efsIOzc9I0KV4PldJMZIG9pg8gFQONLYL0eK0acbihU=;
        b=FtxgC8i0AFBvDP84qXXe9gr1UOQ0u+M+Eb9sBCyp9VK1dpVw6TlXiL0BiGb6Lgueie
         k4Jf05HMBBkxkyAEa4TO/IRh4c9G73s7AnYhDpAvM8pXpe/9g0vuFu8oq3//Hozxo3S+
         pAUGZONNUAAz9gGwwgEg44/HHNCGfNKpbeWeFlHTGod1+s1KEtB5rKtML7P7V/3nnCLa
         K2bo/AV3HY/jUB5kxEIMoVrDZ/u4jbaH4Zy8XJH5KaXH18HpKPuNXiNIIJ6tLAKa5itq
         h/4qCvgYb8IXgWQc7CMxiAXCNLXzSgqyPcx3w1dAgjFpnXr0wQRZEUhMe1sx4DcXNOuN
         qEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733475907; x=1734080707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=efsIOzc9I0KV4PldJMZIG9pg8gFQONLYL0eK0acbihU=;
        b=c+npsdtGoGQb99w4bpScoy3np66zxVa0cgihBUmKZnWfNLT5doKB/CWjvxo9W5GXC0
         Iu/MR3yjEQJvczZMlTSYG2SVYLwVVEIVDXInRWMxuOykTP8iDIFHBWHR6JfjH0tQWJgx
         I/an0TKqJsVUX7tvL3H9W5yryuUJFEiEeQOsLUCPZRZuEHxbvkKTSPloCERlxS/yivYS
         l+2BG57naC+SWunlAr7We9XvArkLpmxcqiW2FN/edITULBDrJmNcthqMEWXA3GQlocty
         prrZYMEwnjA+hZTnfPHTTs/0vnpdXtsk0f/tCKDbB9CFTtugZOjoEoNsPG20X1s6jXAw
         HdqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2oDb/5+f64BQgwTgKFfOTcyJRFTkAIT212tlkPpdkJKZD+iKCPLdksVffjTDAmYrxYxI2du/cz5gmvw==@vger.kernel.org, AJvYcCWHfO/nkg79d5G03nZ9M9wmfuP1wBXascdFRGae1ZiNKuVlWG7LWMi1irXQUr7RcJ++QtaTXiH3ud5m@vger.kernel.org
X-Gm-Message-State: AOJu0YwdsRkRePT3wcUnXoTN0OPGm+zKslxDG+434JexKPKiSLlyfLIl
	u89SyuHRaPwengRyYx/WPAmeTVWe3vF+5ir1QvlpIYd+/6AGrug1ZR1F2vxLSNGC/Xk3bKuKCEs
	CkJ2Ts9v0Vhn2rxeryivrRUVf06I=
X-Gm-Gg: ASbGncsbXNUTYpb1sKZXT+oPOvJswCa0oCwCvKVTFxHEu3Y3WMG6te/oXvDrAWiDrGF
	KLYDTnuKvMkFSsly+RWC7WymnP83y+h0=
X-Google-Smtp-Source: AGHT+IG3PcR91L2T9z3OmlJIfEmknI/xIPqLFBSaFNeahHyyl0XqsdvHAwMamczMXZSxQGrufLIUoq1zoKwW+VQQ06I=
X-Received: by 2002:a05:651c:901:b0:2fb:4b0d:9092 with SMTP id
 38308e7fff4ca-3002f89e98dmr9183041fa.1.1733475906447; Fri, 06 Dec 2024
 01:05:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104141924.18816-1-kabel@kernel.org> <20241104141924.18816-13-kabel@kernel.org>
 <87bjyv9ecb.fsf@BLaptop.bootlin.com> <778f08f1774fcad5fcc39114dbb721793ebf95d6.camel@gmail.com>
 <2iocrd4a7l4avfhqmobbexo7k4u2poidkvvj7lpqh7vp7mprkm@pfgytqnmt2si> <ofd5ru77wypfysflpblafbbdgrcmzztqwoewfjfuusrnbma4aw@y3oc3etutisi>
In-Reply-To: <ofd5ru77wypfysflpblafbbdgrcmzztqwoewfjfuusrnbma4aw@y3oc3etutisi>
From: Klaus Kudielka <klaus.kudielka@gmail.com>
Date: Fri, 6 Dec 2024 10:04:49 +0100
Message-ID: <CAPy0QmsF1qr3A-89BDQHu-QVXpMhMGWt8e74FfDkqVT6Ha7q-g@mail.gmail.com>
Subject: Re: [PATCH leds v5 12/12] ARM: dts: turris-omnia: Add global LED
 brightness change interrupt
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Lee Jones <lee@kernel.org>, 
	regressions@lists.linux.dev, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2024 at 1:43=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org> =
wrote:
> On Thu, Dec 05, 2024 at 01:38:10PM +0100, Marek Beh=C3=BAn wrote:
> >
> > This is because the patch went into 6.13 but the rest of the patches
> > did not, Lee wants to take them for 6.14 :-(
> >
> > Apply this series and it will work.
> >
> > https://lore.kernel.org/linux-leds/20241111100355.6978-1-kabel@kernel.o=
rg/T/
>
> Alternatively you can overcome this issue if you enable the
> turris-omnia-mcu driver in 6.13:
>
>   CONFIG_CZNIC_PLATFORMS=3Dy
>   CONFIG_TURRIS_OMNIA_MCU=3Dy/m
> (and also the subsequent options).
>
> Marek

Thanks, I will try that when I'm back at the hardware (in a week or so).

Do I correctly understand the situation:
For the Turris Omnia LEDs there is now a temporary dependency on
CONFIG_TURRIS_OMNIA_MCU, which will vanish in 6.14?

Best regards, Klaus

