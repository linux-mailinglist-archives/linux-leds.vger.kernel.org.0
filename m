Return-Path: <linux-leds+bounces-4943-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D892AEDF91
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 15:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34D38189745D
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 13:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1AA825D21A;
	Mon, 30 Jun 2025 13:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpgCiAqZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76BA13B797;
	Mon, 30 Jun 2025 13:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751291488; cv=none; b=WyPiqt3cekcuwrLv1R/YXySNTZwTJv9gFqY11GZxHcjLbbql4wsKvBlcRTTtObR/p9d4KPgwxPxl1DG65NAGYTfvOTZnI85JnSXASBdjArhcD0V1GL8LH/seSoX0gG1GJzxTNk9zbMix791Dv19hrRUZOsXre8Bqqz4XZaM9xdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751291488; c=relaxed/simple;
	bh=uEcFR5R/M5cYPP+qa9FMJnFwy4Ji9f9iAK0fXr1IJn8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ZJs7Kud2BauG9No4rYuEDqRGQAhnpJ2AMlKvP90RHFnPkVxoBNbPIRVb2Xvpij2WXrMY/PtxT/XHaCHsKfbXRxVuMK9bkkPNG4v9+GLb6C8qvjwrrtO99CqUOowzaAvh6OANbgx7kucCCmMKeuZKsKQ6ef+aZyzCooQU0XYxyFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpgCiAqZ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553c31542b1so2440711e87.2;
        Mon, 30 Jun 2025 06:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751291485; x=1751896285; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fx0EoXcaa3GyvxIURzOogqYXAlyQc6Oq26PX4ooVijc=;
        b=JpgCiAqZr7gWmU0nM6lSq0d339of811gTy9zxLA0/mZuXNkzceLBAIIAeQmd3LK7EU
         5QyylMw9WazraOSx3iVsY3g7rZhF+QPHSLc5fuqxKHX5X8Us2mwKrwoakn4tlxXAG3A6
         gfKXVo9hC9Ge3aHXJIUIh3uh+RJl8NHdDHv0rIvc8LuClcVk4fsuq3d7jXIWVuipNPzr
         1uSNlTdira82tfXkzxnmrdbPx3DcsxOp7Y6wL311SxLN15h2ubyA3KFU/9QhLGENYuSc
         eFFG4bNRGaeA3FYZjQsVEil/DTsQOOaHstT/+oNY/zkttF3pwVeqFrmBHZJsMh9fNltZ
         sYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751291485; x=1751896285;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fx0EoXcaa3GyvxIURzOogqYXAlyQc6Oq26PX4ooVijc=;
        b=tUQCnJ36h3N6xkIcsghVbMRG8ypR1sDHUEMLNkoOsd9RjUO1Fr3qWDqwcovpD3EPAu
         w6PmF6A0W3ZKFp3b2gWaAN+78DQI5G5Zz4Nj0rxvLuTQVeTPhussgl3S3RkCbLF8d211
         xeIdSf/aAH24WKhQzhI7Sj+Cic6mm6hVcAwlhsZ4jKf6CqWchid9wFmeXOntcwXQy4ny
         XlaOG0d1zVOPMJMwUAwS8mk60rIJHswQ0olyprQy/y1QVr26Dx7eF7/SKXI7mF4IqJWu
         xzqHb48bpo1SDci21Y9XO7DB6iTiZLih6bhFHqyGrJO5NjG9wIXpWqSc0dSFJSvk+yE5
         zFwg==
X-Forwarded-Encrypted: i=1; AJvYcCU+yE3w3783SUPy4naC5hnqPnBTDvTbq/pPGjOFPO4fafoS2SEhgeKfqaD8h0fRncHDYPpyjNLKOsmBTh+U@vger.kernel.org, AJvYcCWawb5CT5OUgRJif2hO2ON5s0qJSIV8C62K0CR3jTZNUQRUr/UzDov8gJ3oVGnq5DZ3CdagntXWEw2X@vger.kernel.org, AJvYcCXwXdYQQypRxgoqE6tPBqKrEm/18dZkFMbJ4iBjKpNVZJUJsCm36DHyGTDeUMyBa2n4Zj4XyJk++NjrXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzezT0A6TweI55aUEvxkGyuCBOLNbCaCFCgDu8FsjGIWeCSQaoV
	S+phtVIyUxJ1lOJNbrAFhowqQDFhwW9WNsHGHWSsgGXepJ9kLAhe/+ER
X-Gm-Gg: ASbGnctrbXFKVWCq4IAWSTprbro5oLroFn9MSoeTfCntFIaP/O933XB7VbzJd+4P+Vu
	ln0Kz92AAmSVetWbaA+hdlo8CdBgYkaf8TmzDeMlrpGFaQf+25JXlbg3+4nkGEThuAIZvCyvXyf
	xcNn7dNWEgVeME2cwkw4deER6eZt1Zcs+sbNNDVW70rtxcvi/UdQKw3mLdQtsG45f2lccqjNmRR
	r+d+jTD9gYeYgLhhy3RhGEP75WJCkaNnqlt+P9eO0RYu07z6wwluKyDVPErutKiJcaK8AqKySVr
	shZUKBAQBM+BRInxoPMo2VtnGufeMBSuuJbLD/Uf16u52xJEf3uujFaWha1Movz7TRnsc/vZ6Dr
	iiT9xrsSS1fA=
X-Google-Smtp-Source: AGHT+IEWaCxaid4AupL5w+VxTnu5YpAH/Q8WF1kgdqZvwMviraTRfRFYDArZk/pHMcisev21iHl9Aw==
X-Received: by 2002:a05:6512:3da2:b0:553:26a7:70ec with SMTP id 2adb3069b0e04-5550b79db9cmr4255937e87.0.1751291484596;
        Mon, 30 Jun 2025 06:51:24 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b240145sm1453114e87.9.2025.06.30.06.51.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:51:24 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v2 4/8] dt-bindings: vendor-prefixes: Add Winrise
 Technology
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <c6d0d856-0c49-4ad7-bc6f-1a228dcb2d9d@kernel.org>
Date: Mon, 30 Jun 2025 17:51:09 +0400
Cc: =?utf-8?Q?Jean-Fran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>,
 Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Boris Gjenero <boris.gjenero@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Paolo Sabatino <paolo.sabatino@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0182CF05-6011-479C-A4A2-18A0C60F7710@gmail.com>
References: <20250629130002.49842-1-jefflessard3@gmail.com>
 <20250629130002.49842-6-jefflessard3@gmail.com>
 <c6d0d856-0c49-4ad7-bc6f-1a228dcb2d9d@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)

> On 30 Jun 2025, at 4:25=E2=80=AFpm, Krzysztof Kozlowski =
<krzk@kernel.org> wrote:
>=20
> On 29/06/2025 14:59, Jean-Fran=C3=A7ois Lessard wrote:
>> Assign vendor prefix "winrise", matching their domain name.
>>=20
>> Signed-off-by: Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail.com>
>> ---
>> Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>> 1 file changed, 2 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml =
b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> index f03ab02afe..a3bf93e5dc 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> @@ -1711,6 +1711,8 @@ patternProperties:
>>     description: Wingtech Technology Co., Ltd.
>>   "^winlink,.*":
>>     description: WinLink Co., Ltd
>> +  "^winrise,.*":
>> +    description: Shenzhen Winrise Technology Co., Ltd.
> Hm? https://winrise.com/ redirects to https://amdaluminum.com/ for
> fences and other alu products.

According to multiple Chinese chip-buying/trade websites [0],[1] and
the internet archive [2] their domain is winrise.cn (not .com). There
is currently no active website despite whois entries showing that the
domain registration is still active/alive.

[0] http://www.84878.tradebig.com/
[1] https://www.tradeeasy.com/supplier/714703/products
[2] https://web.archive.org/web/20160312143416/http://winrise.cn/

If you=E2=80=99d prefer =E2=80=9CAssign vendor prefix based on their =
name=E2=80=9D as the
patch description? we can change that for the next iteration.

CH.=

