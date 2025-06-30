Return-Path: <linux-leds+bounces-4944-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B65AEDFA8
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 15:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BE5A3AAABD
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 13:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D90C285411;
	Mon, 30 Jun 2025 13:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBpBtzjt"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6909724501B;
	Mon, 30 Jun 2025 13:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751291658; cv=none; b=OGbQtxWAFFT+yqsbXkY5+s6Jk99ubBKG528UnqQT7rE5BC3eHhtajBdqIZFjckl6QKVvQqi7brIM++0mZYmoYr9h+0P+wiCGbDNBQxLfOfgrn1Rthy3A4cyT/S6bYug65GYF7nGgBe+DoteUhiSaC8rYwghjmPgntdghgPQzPRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751291658; c=relaxed/simple;
	bh=dxI/ZkRM43EsL7xoK+Mw5w89VIq3Ip60hsYWHHvxh7Y=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=lAkCI8VQkUotyVGsldldhtSIatdOd7PFDRL8dzYvk2X6gCrtizw5NnukgixMemGkMW2wuz/2peDu7sRgtv4nKGnr7eCCdByGjud5FXNkil9JG0nBzlnd3XsHzP3wy+AkCr1obJ8OvVPQl3341br7wbQg2ojy4grpZit677OfXYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBpBtzjt; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso709556e87.2;
        Mon, 30 Jun 2025 06:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751291655; x=1751896455; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfxKlKhqqc3sn6oQJ91bWsKwO4RMrtLJYTGaBDYAwXs=;
        b=LBpBtzjtwWQLQAoL4dJ0fcn4z2cCl5FEuI94bDxP++UsKbrTaXHjlFMbi7D4/3qV3P
         2XklGQgBMfdczWAqKY9FwUaFKwcwLsBvp/vtTpzpLiUCfFeCf6Vv1enYgp6TtLbHHOl8
         VV8CEsZ8fIj1M/aDPq7KsYvGrhpVeYxJmLojUXesgD6hogpvRzRt9Bb9v9SBxiN9acPW
         ly3Nw2ZKbNkXVKSE2kcDPFj6pd99H5X4dXWk/zD+smIxEf8S7UoctUIKIgN4m/AO7iKb
         2YnT2gv37eD3phwReh1eU2YoGGHA2Msluj1VinEoIG6YopvAtDUKvoFHPosaS9J/IsGs
         vo2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751291655; x=1751896455;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SfxKlKhqqc3sn6oQJ91bWsKwO4RMrtLJYTGaBDYAwXs=;
        b=fDtRm7zUspit7swImLwQYHa+S86+DpH5w1ukDF2196kahCELiNbYoZHzDPjyqeJVfG
         U69RiYtJ9dciUapwut+uoNEePapdJBcETJP4TSGlLqvY1CA+WGttmVbAwTSzZTrTOZEj
         BaBEXz5PMvsFRbZP8Z5rmHlBG7sqFpQCGd3yG4m1CK3jdl43RySv7K8v5BYm2P6bvLZm
         Td4Ea67Us8jQ9AYMYp3pcRmCU6BXY7c5eZHi90OiwtOjkQfAsIPNoy1W8K08DLUhM4L8
         jnGG0Jr0hwv1FogjN8Av3aKyGcUEsM21QfGo8Ccl7DNW58lEIhH3wI8Feg8n+5crpfty
         lBrw==
X-Forwarded-Encrypted: i=1; AJvYcCVeXVs12rZm+1Fl5MBP8QmR9ZrhsYoNr/GVYCy1f3wi/StftIpo5zERzFn7HEkF3bs0JQElWRMjfW/c@vger.kernel.org, AJvYcCWjksT5M2b1lJsll4FRLRWARLavHLVFkFwzB5+OqF6JJX5XXK9T2rsz2hBhH39mE4+/32SOO6AzJZLjC5DB@vger.kernel.org, AJvYcCXRz6EqWQ4X1PGyMSuMLowt2p0ltvDGeWvltrzOP/aO10u+gl9grF22vDaszc4IXpMr2Zu3jJQvYQblxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbMfUWRP8pdiSJgi3GR3f5Vgby2Ajmb1l+yJZ8ZCZk8AbeoRRP
	KDFVaVxR0gC97OVCpX3elPSnd0w7YcipnaktU9EuE0kYX+DGNPDCDW0TEmmzVLO+
X-Gm-Gg: ASbGncv4sz/gANiKOW9M1eGx5aq81AmSfcGIWn1qqbC2EDn/vo2NP0cGF+8KPhhMeL4
	BS7tY1ETv50ZffJZGtf8UgDV3/tlJWzKBnt+tpe2Uf9a+TewH2OQVLco8fW+d+mh0QZm2TRYpgX
	qz5/tetnkmDEmRrYZ9+WDU1wIOwDtJPhketemUQnKmWNpUiy2odJycR2ifnQnwx/wET4A7mRFai
	Ar82ShgC9/kG6hVqsk0tDw8jxSN2AwRZ2653BJvaRy3Z1L0XA09OvCvf1sLFb0z9Ek7IUurGCSj
	e1iKH7AaDTWP5L2XstkuAx5S26GJjF4APya6Z6dMu919E5vXzdwvg8EZVo6scLWWp66QeaI7XUz
	O3xy1ek+ezI8=
X-Google-Smtp-Source: AGHT+IEFfbreu10LLCTj7YTb4EDfAbv0b02bWlYyqbRfnaepG6UskV4t7Qf+MfrhQMwTBc9VIQUpEA==
X-Received: by 2002:ac2:4e0a:0:b0:553:30fc:cee4 with SMTP id 2adb3069b0e04-5550b9e8f15mr3752361e87.49.1751291654151;
        Mon, 30 Jun 2025 06:54:14 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2cdf62sm1440212e87.163.2025.06.30.06.54.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:54:13 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v2 5/8] dt-bindings: vendor-prefixes: Add Wuxi i-Core
 Electronics
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <779ee1b0-d624-4189-8452-6e27dfcf2684@kernel.org>
Date: Mon, 30 Jun 2025 17:53:59 +0400
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 =?utf-8?Q?Jean-Fran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>,
 Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Boris Gjenero <boris.gjenero@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Paolo Sabatino <paolo.sabatino@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <64C9BD77-1AFB-4B7B-BBD1-CE06F0F4642A@gmail.com>
References: <20250629130002.49842-1-jefflessard3@gmail.com>
 <20250629130002.49842-7-jefflessard3@gmail.com>
 <CAMuHMdW+vGr-KyvPr84qr_k1sJV88SFn+oF_oi8_MKJkbyHXbg@mail.gmail.com>
 <779ee1b0-d624-4189-8452-6e27dfcf2684@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)

> On 30 Jun 2025, at 4:24=E2=80=AFpm, Krzysztof Kozlowski =
<krzk@kernel.org> wrote:
>=20
> On 30/06/2025 10:19, Geert Uytterhoeven wrote:
>> Hi Jean-Fran=C3=A7ois,
>>=20
>> On Sun, 29 Jun 2025 at 15:00, Jean-Fran=C3=A7ois Lessard
>> <jefflessard3@gmail.com> wrote:
>>> Assign vendor prefix "icore", based on their domain name.
>>>=20
>>> Signed-off-by: Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail.com>
>>=20
>> Thanks for your patch!
>>=20
>>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>>> @@ -694,6 +694,8 @@ patternProperties:
>>>     description: International Business Machines (IBM)
>>>   "^ibm,.*":
>>>     description: International Business Machines (IBM)
>>> +  "^icore,.*":
>>> +    description: Wuxi i-Core Electronics Co., Ltd.
>>=20
>> This sounds a bit too generic to me.  What is the domain name?
>=20
> Good point. icore.com should be but obviously it points somewhere =
else,
> so this does not follow ticker / domain name style.

As per the response to Geert earlier, the domain is i-core.cn (not .com)

See: http://www.i-core.cn/en/

CH.=

