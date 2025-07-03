Return-Path: <linux-leds+bounces-4969-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3EFAF66FF
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 02:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AE975210A6
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 00:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A98146D6A;
	Thu,  3 Jul 2025 00:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQG1R1PO"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911AF13C82E;
	Thu,  3 Jul 2025 00:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751503850; cv=none; b=WPv3C6FoU/kX3OjO7F3kbBm/i6GCWhSMKvCGqhAtJIsdN0L7MmTcvB1RqWsl9ottsRGns87jJbY2flh1POv8qBn//RTD331MUHDGvWSfERC3b24cdiizW783RXVldyzkAcw9Gi3B5wnfa+9N8gGVt0FA/qZF9yGZEvJjDl8ghH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751503850; c=relaxed/simple;
	bh=aZglv2R1f59obVIMoI4cssPnJyx67eHAThxQR1GKJO0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=kbSPnZX8DK5GtIhWGVLEV725Un3QT/l03ckgtbXuVPaPHwKc3oj7FpDdrZ3Hi2OXoKKaHoBuoO9yiIfBz5Q7nRD+00JJQRtsOaKSvJIWMRp8BsqHp9mdiHcLLwhErAD339N9m4YAgDbBWJOjG0ICHXIZktG6V4a7Qg3j4VbuACo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQG1R1PO; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6fada2dd785so66527936d6.2;
        Wed, 02 Jul 2025 17:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751503847; x=1752108647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/w3t0Fye+PJNVHpASDzRV4VuIFPhtiLbyHjMXLTWP0Q=;
        b=MQG1R1POImfR8dv5JEPDBhl9+Sao+XgvpWBOJfgz1rgJsEqcmZbGTNzym9CClsZqxr
         a8wHx3rXtWgdsvhgNnf1Q0l3e34iFDF76yKaK+hdo7o5cya9eYB4WS32ouKTs/iUNCFN
         oOp3EV0MELEW6KgaHHya0Jhg9FVywhJFuLUUyhRZRu7Pox50I45UXwN/557knGGqHPpO
         gqcQc4fygcTMdvGtGXF+VqwGMc4iQWYKmiMeWIX7hQpUYv6py9sZuBVKhU8bbWWxoeNs
         Oip+7fO/xdWsats6ZvnqXj0Frdazbq5OCfRxmMGyBBjeHoIDksHzKC8CJAg2zkivXXXm
         qckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751503847; x=1752108647;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/w3t0Fye+PJNVHpASDzRV4VuIFPhtiLbyHjMXLTWP0Q=;
        b=IZZ6pZrqnIoFai8aMkmTILT15/EJ0LGEEvw4yB0TPx5WApLsZKQA6ikA1CTlilRiFZ
         O8p9bjTbi4R/uzseoeNBIRHNAKFBda4ptyVFNsX7xvqcgF+jK4IgoLRurSbNrh2NOaWj
         vX0DM+EDrU9CxHS6oGWmjTqAc7sK4h/1YgRyXjcApuCQ9j/W3n4FguLLYlDU4P0Hilun
         54phsTT8HNkvi554MzuZudenUMV7EMBNL0lUregVyawLpwtLAI/nXLERNaNeRP0s5CvX
         ccfamKjqmYQjCGCpWujqbFtcbj5kSex7UUWMqCLRLnPFd9Bvc6u5pUCwEoJDT19AdXZ1
         xnPw==
X-Forwarded-Encrypted: i=1; AJvYcCURsnFdC0npD8LnyX1Vqrdy+tPwCPLVyj2gK3Aihn+Wi0AhpC9vsPanlFWvw7nKGm+mpN+LJjCPf4rY@vger.kernel.org, AJvYcCV1vmwkrhxCV3HLakL12AWq9am5Ba75TyJGPkKCcewfzOF19sjLquVu8NkVEE3d2ds7PYUusnFv6K/Hsg==@vger.kernel.org, AJvYcCVfRkKQtU+6Q3XoBsacznLeCjMqJjk60EYIMQfKNlSCXisP/m1zpkb12hfFQn71QvvVNnJZmnBOxSnrOdRD@vger.kernel.org
X-Gm-Message-State: AOJu0YwjjTySTncNApRgtZi+KkWwbFk59c5KwL78YTqDzQjFvfPUoaNx
	0HKCfnBRRbSSUacDzGUFaq1t9H6qE2AJyK0vmE5ZjbiWRBFZHXmsQeGD
X-Gm-Gg: ASbGncsDnWbbMxefZzAZN+7dcnWc/8Jq5dbZOiRflq108pEUUAv3D3LeEmtWnkKsvc9
	GlAJYKI8MArUPL8yONKYLAj4aTT7aPglufPwHYvNX7rGAQO18diFF49gLKRIbz8x6kezFhEe3rM
	wEdKCOW1gwLdCFE43/G1qSw3LbBpJHGscS22hQDsIy9wH/NSSOf3wkAByfGLrCBOmOQiAS8ikJ4
	/tXZS5S6BJxxqLgRT/Rh1rc6aohCEOjD/+QXhQEpsyPddFqqTrCByyAbpT+KUmgn+TS9OQ0kCm2
	uhlAi+KNya0PcAQAS7S9R7ISlnSA64kaGLgCVD+m59kirudPpDqXoFFdTSA1hdHfKNGpRIprE0e
	pT3u0DI6uG90pOR5Gu+qttJgfrEOpT1p7jA==
X-Google-Smtp-Source: AGHT+IE/mQQ1p98yLtyrPNH48eVOtaTFbCpepSsl1LNcKap9p1Kk5AoMBq/16m+Z/G7MPKNWqtM8kw==
X-Received: by 2002:a05:6214:46a0:b0:6fa:cb72:955a with SMTP id 6a1803df08f44-702bc89c845mr25137106d6.4.1751503847478;
        Wed, 02 Jul 2025 17:50:47 -0700 (PDT)
Received: from [127.0.0.1] (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd773145basm108565846d6.116.2025.07.02.17.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 17:50:47 -0700 (PDT)
Date: Wed, 02 Jul 2025 20:50:46 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>
CC: Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
 Boris Gjenero <boris.gjenero@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Paolo Sabatino <paolo.sabatino@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_4/8=5D_dt-bindings=3A_ven?=
 =?US-ASCII?Q?dor-prefixes=3A_Add_Winrise_Technology?=
User-Agent: Thunderbird for Android
In-Reply-To: <5d4dfcb2-cdf5-41d6-a94f-5a116837ee25@kernel.org>
References: <20250629130002.49842-1-jefflessard3@gmail.com> <20250629130002.49842-6-jefflessard3@gmail.com> <c6d0d856-0c49-4ad7-bc6f-1a228dcb2d9d@kernel.org> <0182CF05-6011-479C-A4A2-18A0C60F7710@gmail.com> <5d4dfcb2-cdf5-41d6-a94f-5a116837ee25@kernel.org>
Message-ID: <4B251F88-DC21-4205-BD70-2F2A894E4428@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 2 juillet 2025 16 h 14 min 34 s HAE, Krzysztof Kozlowski <krzk@kernel=2E=
org> a =C3=A9crit=C2=A0:
>On 30/06/2025 15:51, Christian Hewitt wrote:
>>> On 30 Jun 2025, at 4:25=E2=80=AFpm, Krzysztof Kozlowski <krzk@kernel=
=2Eorg> wrote:
>>>
>>> On 29/06/2025 14:59, Jean-Fran=C3=A7ois Lessard wrote:
>>>> Assign vendor prefix "winrise", matching their domain name=2E
>>>>
>>>> Signed-off-by: Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail=2Ecom>
>>>> ---
>>>> Documentation/devicetree/bindings/vendor-prefixes=2Eyaml | 2 ++
>>>> 1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes=2Eyaml=
 b/Documentation/devicetree/bindings/vendor-prefixes=2Eyaml
>>>> index f03ab02afe=2E=2Ea3bf93e5dc 100644
>>>> --- a/Documentation/devicetree/bindings/vendor-prefixes=2Eyaml
>>>> +++ b/Documentation/devicetree/bindings/vendor-prefixes=2Eyaml
>>>> @@ -1711,6 +1711,8 @@ patternProperties:
>>>>     description: Wingtech Technology Co=2E, Ltd=2E
>>>>   "^winlink,=2E*":
>>>>     description: WinLink Co=2E, Ltd
>>>> +  "^winrise,=2E*":
>>>> +    description: Shenzhen Winrise Technology Co=2E, Ltd=2E
>>> Hm? https://winrise=2Ecom/ redirects to https://amdaluminum=2Ecom/ for
>>> fences and other alu products=2E
>>=20
>> According to multiple Chinese chip-buying/trade websites [0],[1] and
>> the internet archive [2] their domain is winrise=2Ecn (not =2Ecom)=2E T=
here
>> is currently no active website despite whois entries showing that the
>> domain registration is still active/alive=2E
>>=20
>> [0] http://www=2E84878=2Etradebig=2Ecom/
>> [1] https://www=2Etradeeasy=2Ecom/supplier/714703/products
>> [2] https://web=2Earchive=2Eorg/web/20160312143416/http://winrise=2Ecn/
>>=20
>> If you=E2=80=99d prefer =E2=80=9CAssign vendor prefix based on their na=
me=E2=80=9D as the
>> patch description? we can change that for the next iteration=2E
>If commit msg says "domain name" as an argument and it turns out it is
>not matching domain name, then that other domain name least needs to be
>in commit msg=2E The rule of domain name comes from US tickers, so only
>=2Ecom should be considered=2E If there is no conflict and no =2Ecom
>manufacturer it is fine to use whatever other name, but the commit msg
>is not then correct=2E
>
>Best regards,
>Krzysztof

Well noted, for v3:
- Will update the commit message (non-ticker/=2Ecom)
- Will avoid generic vendor prefixes (icore)
- Will submit the 4 vendor prefix changes in one patch

Best regards,
Jean-Fran=C3=A7ois Lessard

