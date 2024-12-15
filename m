Return-Path: <linux-leds+bounces-3607-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B38919F237C
	for <lists+linux-leds@lfdr.de>; Sun, 15 Dec 2024 12:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 126F17A10D3
	for <lists+linux-leds@lfdr.de>; Sun, 15 Dec 2024 11:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A053F14B084;
	Sun, 15 Dec 2024 11:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8TaRfk8"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3C0145B03;
	Sun, 15 Dec 2024 11:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734262756; cv=none; b=WDMvWjC6XRYmkkE3BD5YMJIckFxaQfVW+aub8LLKvmnR+vtQb4z0vlJlLGxC+8SYw8RyfyrZxygJxS0oV9w16UaNp1dZR2+XeRITqkw4C10oHXdojYg8+P2oJo+5jmfFmhD+Cjenhzi6UrPrRbR2TqinjEpwbVfh2tWa7EHpJkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734262756; c=relaxed/simple;
	bh=xALTCpd8jzW0oO9ZcLpdgxp5GqeJYahzrwm/Vk98pNY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hfsZ5bh+QVFmQWcOL62fan1+ihfKpdL8Ya75jwNICDyqyhN/bCJndYWg4NES57cdtYoTY89fl/R0LGh3Ax06FFOhkyygzBh2tNXmedf+NwP4nVVhrzvNuhurWD0iLsSkFuxPUyOeRViMSZ/Fyq+i6mzgXm72U6LATpgufHjV7vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8TaRfk8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436341f575fso17434945e9.1;
        Sun, 15 Dec 2024 03:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734262752; x=1734867552; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xALTCpd8jzW0oO9ZcLpdgxp5GqeJYahzrwm/Vk98pNY=;
        b=T8TaRfk8k+8fa3nnYa/VxK7KPHOhfi6gmASjWtVwSHzFBdaD+dIfXMuligLSamSAM5
         juJ6DwJ/REycYpItSrWkC2XjFYkdC37BL0Ery+BVVcPgjEPP+t2lcz9JgFTP25o/78YX
         jIValN2GGRGYYGOnDKnNNcvnPizsJW69SESm1WjAtdx5JLgsTHXFWCL3q8w1BRuIYa4D
         593dmIJUo6Fi0ybrUCu2ZNWHfMRfOsG/sPK1XALDleoj60PDc97lAWOQW9tpG+0NCNjq
         rOCPFHu4HP/dCjn/DBNwxp+0KoGEwUJBYEFtQ0BXPfyB1S6BIdxfi8TjRavw/YcX3R1m
         ADhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734262752; x=1734867552;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xALTCpd8jzW0oO9ZcLpdgxp5GqeJYahzrwm/Vk98pNY=;
        b=QQQlHMUFduRDo0DosAQG+VLZG2V+zOF28VbWvlqR/eVatO3QptEpO5jc9VIGAD14JH
         qziOqOuieHSKD3IentlBl2+H+R8AvyoYozwRBcwV+l8GfXUscRDZY8UaAtZObJW6CyIS
         T+9qhbsmGgjqJY2HsaJemCXN0Vh/1dc9LLlth64r6prW1j14kMCNrkn395KY1YvfBjIh
         qZm/J1OazOCYVox2YDlgj3oYfxDJvPy9T7b3OMusIGXcYJ/ysaIJ5pSdZZzAPNzP4XHP
         nR++BH+qjpZg+enm3oHqNbVUXWGgQB9muOtWHPgsFeAkSJbkwzlUh+XJv2W8eOd37JqC
         eTcg==
X-Forwarded-Encrypted: i=1; AJvYcCVbjXqGOVzLV3eu4muZTOzUReu1Ju41trntUbX9b01dBsc8F+H8Rc0sVD2JZbs0cGwFU/KyoRZzatfcDQ==@vger.kernel.org, AJvYcCWdIHGurGlNFaFRyBSY13PC/SR3y20fk2MojaYAekJ1A1ThI4B2auH9uR5TFBySa0rjCgeWhvIG6XQC@vger.kernel.org
X-Gm-Message-State: AOJu0YzGc+THTpyJg1Y0voyHAlUrhBeqIKEXho8Sdf35pPlhqvs868Lf
	9bpL8nkbTqpYlMGMpPC25o7fPGWuP0/ngU4DewNIFNm6XZTCaK2P
X-Gm-Gg: ASbGncszrKOSGy2BJsASzUDajyTGgc8XOnq9YCFTgNK6lMgfJbAa0EuFuu1XbJHOxnT
	0FIbRXa75e42WTh2vp2Ndb+72zUOQMBCdQI3BV+5+PuMgu3bnXK4KRsRtV98sdUW1hwjAU6m2al
	pBimr731fUdPZLxqe36vLcvnRPT056aJE5akIAbjtSvEAQa5ObDatnjI55SDLZ4IxG1U/xv3fTj
	lS8O9eFze0MAbAheCUiNOG1tiZ9CadBDLP8XNcda819mb0ECgGyVpl7uUUSuUusC8vououzMr2u
	bVenP6D+gzNH2MuI472+e4IVT0o=
X-Google-Smtp-Source: AGHT+IHCjjb2sJAgzXNsxbFtbUESnU4r2HWdLhNkKVc3bDDAlQfI1jI2mfRiPp/kKqOHOaY9q3fGmA==
X-Received: by 2002:a5d:47ac:0:b0:385:ef2f:9278 with SMTP id ffacd0b85a97d-38880ac5f92mr7767140f8f.2.1734262752015;
        Sun, 15 Dec 2024 03:39:12 -0800 (PST)
Received: from ?IPv6:2a02:168:6806:0:c726:52ac:a540:51aa? ([2a02:168:6806:0:c726:52ac:a540:51aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8012081sm5027268f8f.19.2024.12.15.03.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 03:39:11 -0800 (PST)
Message-ID: <ec61714eaa3d84498cd69dc673fb11996550a3ea.camel@gmail.com>
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
Date: Sun, 15 Dec 2024 12:39:10 +0100
In-Reply-To: <ofd5ru77wypfysflpblafbbdgrcmzztqwoewfjfuusrnbma4aw@y3oc3etutisi>
References: <20241104141924.18816-1-kabel@kernel.org>
	 <20241104141924.18816-13-kabel@kernel.org>
	 <87bjyv9ecb.fsf@BLaptop.bootlin.com>
	 <778f08f1774fcad5fcc39114dbb721793ebf95d6.camel@gmail.com>
	 <2iocrd4a7l4avfhqmobbexo7k4u2poidkvvj7lpqh7vp7mprkm@pfgytqnmt2si>
	 <ofd5ru77wypfysflpblafbbdgrcmzztqwoewfjfuusrnbma4aw@y3oc3etutisi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1-1 
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-12-05 at 13:42 +0100, Marek Beh=C3=BAn wrote:
> On Thu, Dec 05, 2024 at 01:38:10PM +0100, Marek Beh=C3=BAn wrote:
> >=20
> > This is because the patch went into 6.13 but the rest of the patches
> > did not, Lee wants to take them for 6.14 :-(
> >=20
> > Apply this series and it will work.
> >=20
> > https://lore.kernel.org/linux-leds/20241111100355.6978-1-kabel@kernel.o=
rg/T/
>=20
> Alternatively you can overcome this issue if you enable the
> turris-omnia-mcu driver in 6.13:
>=20
> =C2=A0 CONFIG_CZNIC_PLATFORMS=3Dy
> =C2=A0 CONFIG_TURRIS_OMNIA_MCU=3Dy/m
> (and also the subsequent options).
>=20
> Marek

Testing reveals:
I have to enable CONFIG_TURRIS_OMNIA_MCU_GPIO as well, to make the LEDS wor=
k again with v6.13-rc2.

So far, so good.

But the upcoming dependency in 6.14 will be on CONFIG_TURRIS_OMNIA_MCU, not=
 on CONFIG_TURRIS_OMNIA_MCU_GPIO.
Is this correct?

Best regards, Klaus


