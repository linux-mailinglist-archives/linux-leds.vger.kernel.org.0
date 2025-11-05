Return-Path: <linux-leds+bounces-6017-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E89EBC3733F
	for <lists+linux-leds@lfdr.de>; Wed, 05 Nov 2025 18:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6F2203467A0
	for <lists+linux-leds@lfdr.de>; Wed,  5 Nov 2025 17:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09753286D5D;
	Wed,  5 Nov 2025 17:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RI4rxAL8"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4F023EABA
	for <linux-leds@vger.kernel.org>; Wed,  5 Nov 2025 17:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762365184; cv=none; b=miV5v6z4a+ROKwlk7cJ+OSXS+w4EVQFwsaufbSu56/CVccJ0FgXnpPcRkmM/+lV9CRvkxflmhh4yLtjklW8FpgQd1bEX3ESBXtvLKHp1bweE5qZUl/hFLwFWw4sDZ81PhR3HwEPhzJqnb9KGmXRarJI+GxXVBWpPfRC4phr2S0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762365184; c=relaxed/simple;
	bh=PZdlsnPhYw4N7FRXdSz5JDrhXZB2el7w0h8zMCttJhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g2soFQGFMfRXh0OBpmKrvBd0cPfjf9f+M6ywSt7gQ8wA4z87ytGz6JDS+1C8VSGWbLITTmTbvHL7ggqN+HOYSerjiH1HGOeE4jB3rURKkHXsbpOd3gOEWQ2qdOoNfKdwXfY7aEco+jNGwlKFvx+RdnDFMo4eMGfnUw4TbXVOqqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RI4rxAL8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477563e28a3so855765e9.1
        for <linux-leds@vger.kernel.org>; Wed, 05 Nov 2025 09:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762365179; x=1762969979; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lEaSkrsIxTKbAaHCd/3CyW+N3+Pgj45RfOqjb4KQBw=;
        b=RI4rxAL8BNtyRQyDdw2iSIIx32Tyi6rkYiWnCZH55LkrL7GZW9oSA/HaZfrNfin2BT
         ehjO4rC2aUBDobMVhQIwazBj5KdzwaqjboZbfpvd39gcxNtmv3XApxpI09Gk6/bkqqOt
         nrI+bYIlGU/VyQdoQRK9VY9b49VwmWsUJvEqFgCt3MWwO+ip7o+izhYcX/vt8J5K1nGV
         HwfoU7t086N3LM9W3rXqg4QZFt0EGW+qmgPW1uMza3K2tb/36YPa0gBnbpW5ClScoP9W
         ro4erc3wl7ig2s8hRuOyHKA40pmxNvHGxC3uNmFDf9nMWSMLP2SORfEeN2DP0CovfRkG
         3YeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762365179; x=1762969979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9lEaSkrsIxTKbAaHCd/3CyW+N3+Pgj45RfOqjb4KQBw=;
        b=F6CpSKK/5ZS3yN0ZEX+TZI8iAPgcN8lZtXjWHxEtu3xTtV5v48kGChQ6IRJzBFr6F0
         j5xVCpOWo+xiG+mCB04RxdTj/XMHju50tP7tWOta0hRfzD1WVk2oq6hROghS1Zl/IdAN
         zRHS6atSXmKo2faY1/TvdIAXmpla77JF+iOXW56mCqwK+O80CRiWOt+HyhRLAXoGpYuR
         c4YE0xi2iTkvblAaSN5ntDx8gbfdCZ5HRiHYew8VmaOasIkqVsTu9eW+A7n6VG2WyZOi
         kRAzewxyb49nr5iDQ7uVokqQCBcaFvvi8bxHjAEG+VftBaCqO+j5XA/g7XSuHSMOsy1Z
         umYw==
X-Forwarded-Encrypted: i=1; AJvYcCWBx1xMTgyYx3uAiSyEdw9T3kwb6eD24GKh0bqqzgVwW4w9VBrGUd1Q+89DrqiVwH7FESsYhcnMfnpn@vger.kernel.org
X-Gm-Message-State: AOJu0YyB0Azyxggu6iuCAQHb/3k29wPH4pkSxpPURuYP1WQXw5Jv7AsU
	zTDwKAdaVTiLKBJlJdl2RW3sHZEG2/+3qDyxFFxkqig4ne6ut3MOErUhSq566EBH0IEPKRzRc4u
	aTV0Tbrw+vxB885+YdvO9IvY7ufcpkuo=
X-Gm-Gg: ASbGncugiTQ9lDt1pvBgoNQNF2nSl6PGF+QQbIgvL2lOwDOYOl+GbLIY3ZtmkD2J3UU
	idfpGGxsYWFIMgto5XBa6e2qLMlOtTiiRoeXK+dQJSdrd377Bly5OOIe2em5xytJ5/5RFcubZVS
	N0GK/8qRqho0gMb6zGkhnWsFzheyrOg8ALOdh/HAt/gJXObv4hpZgqwLlK1jqnqPFRdUhIivNRm
	Cn7w60Gv/d/v2A6iEMBJVH2pa9tQhQRryQ/2dKZqp2TG++YyfNe/ElEtvSKLCebaU7po8U=
X-Google-Smtp-Source: AGHT+IGciUtkbOV4HrOjJ54HhPQ9XGY8dHvKr6+yENCZnZ2xoPxoPH34lAsKvfd+H5tVgcE/NCQ51bvKiJhj7scwarQ=
X-Received: by 2002:a05:600c:4c27:b0:477:14ba:28da with SMTP id
 5b1f17b1804b1-4776201cbb8mr1857495e9.5.1762365179165; Wed, 05 Nov 2025
 09:52:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20210601005155.27997-1-kabel@kernel.org> <CA+V-a8tW9tWw=-fFHXSvYPeipd8+ADUuQj7DGuKP-xwDrdAbyQ@mail.gmail.com>
 <7d510f5f-959c-49b7-afca-c02009898ef2@lunn.ch> <CA+V-a8ve0eKmBWuxGgVd_8uzy0mkBm=qDq2U8V7DpXhvHTFFww@mail.gmail.com>
 <87875554-1747-4b0e-9805-aed1a4c69a82@lunn.ch> <CA+V-a8vv=5yRDD-fRMohTiJ=8j-1Nq-Q7iU16Opoe0PywFb6Zg@mail.gmail.com>
 <bd95b778-a062-47b1-a386-e4561ef0c8cd@lunn.ch> <CA+V-a8uB2WxU74mhkZ3SCpcty4T10Y3MOAf-SkodLCkp-_-AGA@mail.gmail.com>
 <CA+V-a8snRfFrZeuJ7QSt==B5vWAyTpHzdNj0Jx6oz_aaozbGYQ@mail.gmail.com> <b7454a3f-fac8-4789-a3ef-baf341aea8f0@lunn.ch>
In-Reply-To: <b7454a3f-fac8-4789-a3ef-baf341aea8f0@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 5 Nov 2025 17:52:32 +0000
X-Gm-Features: AWmQ_bmIpv8SkaaEilsxCChU_9NJf9Wu-EpY4_wdnpi5jkjBXVmxWrlfCpbMzck
Message-ID: <CA+V-a8v_1u2jGVRRKQCS7ZvvjKORrHjEBdTthjAF91LYEhvYYQ@mail.gmail.com>
Subject: Re: [PATCH leds v2 00/10] Add support for offloading netdev trigger
 to HW + example implementation for Turris Omnia
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org, 
	Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, Russell King <linux@armlinux.org.uk>, 
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, Nov 5, 2025 at 3:49=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Sorry for the delayed response.
> >
> > I started investigating adding PHY leds. In page 53 section "4.2.27
> > LED Behavior" [0] we have an option for LED0/1 combine feature
> > disable. For this is it OK to add a new DT property?
>
> Why do you need a new property?
>
> You just need to set this bit depending on what has been selected via
> /sys/class/led.
>
Ahh I get you now. When I trigger the sysfs file I get the below files:

# ls
brightness  device  device_name  full_duplex  half_duplex  interval
link  link_10  link_100  max_brightness  offloaded  power  rx  rx_err
subsystem  trigger  tx  tx_err  uevent

As per HW manual [0] we have,
0: Combine enabled (link/activity, duplex/collision).
1: Disable combination (link only, duplex only).

# Combine DISABLED (link + duplex only)
echo netdev > trigger
echo 1 > link
echo 1 > full_duplex  # or half_duplex
echo 0 > rx
echo 0 > tx

# Combine ENABLED (link + activity + duplex + collision)
echo netdev > trigger
echo 1 > link
echo 1 > rx
echo 1 > tx

So to Enable/Disable LEDx combine feature we just need to write as
above. Is my understanding correct?

[0] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductD=
ocuments/DataSheets/VMDS-10513_VSC8541-02_VSC8541-05_Datasheet.pdf

> And if the user asks for a mode which the hardware does not supported,
> the core will fall back to use on/off and blink the LED itself.
>
Ok.

> PHY LEDs are the wild west. Every vendor has its own idea what is
> important, and adds features which other vendors don't have. But that
> does not mean we need to support all the features in Linux. So the
> core has a reasonable set of features which we expect most PHYs can
> support. I don't want to add more features unless you have a big
> business case it is needed, and other PHY also have the same feature.
>
Agreed.

Cheers,
Prabhakar

