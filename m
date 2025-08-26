Return-Path: <linux-leds+bounces-5314-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 432B4B351F6
	for <lists+linux-leds@lfdr.de>; Tue, 26 Aug 2025 04:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2867F1B24EA7
	for <lists+linux-leds@lfdr.de>; Tue, 26 Aug 2025 02:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2C32BCF41;
	Tue, 26 Aug 2025 02:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SCMhViO6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7336029CB2D;
	Tue, 26 Aug 2025 02:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756177077; cv=none; b=GFq8Z4ZVJSNAhQt8Ga6oU7SA2nkD6kKVlxl+HE84gd1uo5q/e8gJLBbK3NBd6M2vuWEksOtgQKMw/3u+18oJwLNRP5DVPInlgltrvaEteWfBhaGEbYzJ4PZM5ivKOcCisF7aeWq8vSEzXNVZlLTdGUWP5ezjAxaYonQ3WzZwbW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756177077; c=relaxed/simple;
	bh=xMx0Id4rv1yLlQ9CuK02yc7ArZoLdXrgx6DQ1v2q8fM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=LSV66T3rQkFVjWQ6/E1huTjbB0or+0jnlJ9Pk2SlO9xKtZxaZo8pbrQmP+aQwiEdwv7tXnaWwquQbOSPnSlNUqM7jCWfnapF/KRvws3Is5UeqHA11yVMzbc+yWKzOJfOO3Rrdev/es11YNCPL6WEWC6BIySeWz3VI2vpyToyoaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SCMhViO6; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4b2cf656e4fso18357391cf.0;
        Mon, 25 Aug 2025 19:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756177073; x=1756781873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xMx0Id4rv1yLlQ9CuK02yc7ArZoLdXrgx6DQ1v2q8fM=;
        b=SCMhViO6evlp86zWT3ewrx7NOkCtQsqSj2rBSpdZcEBehKLkTCHsI9I+5qOIcd6Mhd
         5Qbc4cnteo9LFRsuCTOxgmqF/6Hv21Zyg5WnHhjKZy2bmwmDO5m9ocayzhTKzS/vv3k6
         iP2+Lf+CfAxF2QRRSw2jc+HVW+iQmoebOZaHOFTEl+0HvCaVswRudST6Wr907+Xx2Wjs
         h3lW5S14mlg2X1rcqy79frAS0igpQwJ9aJmOOTbriCuFestEa/Cbc9BDbsRgibMM4cMx
         yECCQgMpo3qXs4C+VF645TxxqkzVhcV7iNP+5RjEpaeDrZcjvy2k6Vop+sQ1mMw4wmXc
         vGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756177073; x=1756781873;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xMx0Id4rv1yLlQ9CuK02yc7ArZoLdXrgx6DQ1v2q8fM=;
        b=RqenpFWsmuWHG6wAyDwkYnz5DSP2lDJR+M9D31TRUUnnuDN7wWsqu5qbTTs8k4jNPa
         C/8KsYj6W+TNMqhXbbks6mjRwi+ixxtxc5vp4YnFnLTxjag74pWaTAsTaulcY/dJH0sU
         Mjh0Qz/3+2BZcNNuzyj2Sxml8T5marGemRaqhFn6j1RNTpn3/aGMqBSFJxCF+Na5Omri
         IYH+/0P47NPcWSJP/wqj/TNiCHAPSbWT7YHwP2gqqSBnjNclhLHxIxnus+9oq/fM7IoP
         HEPey9Rco6y2vT7i5xuMN0lEPAtGpvP+5gq6fYm9+5d0Mt2X/SFJkpPS+oiPykDpyxEK
         rPdg==
X-Forwarded-Encrypted: i=1; AJvYcCUtmJU2F+p5nNk5osk3O8cy+amEcZdVTj0RevAHHhBvCHpD2lZy1NB07bHnGQ5qQrpPLHxHWdN5v8Mm@vger.kernel.org, AJvYcCVVS158cvb/4QXhVRrVWvs28tuwH0U1UfOg58M9PQhjQicnAyT9I8OA6aIrsJO+qbw0hQqDOltF9UI0kk+Q@vger.kernel.org, AJvYcCVlkORBttYUKQSpzJ1/bOnJlvG+CcRXttMXIbSFALcALa3hMEUJvSJgbDessE2T4liwhkJCj5N21uJZ5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLDvLF/142BuAQaCayczkstDwVH0jod7BlEzNyrmVsickA/Psw
	tgiUfZMSAcD7bi1OJ1Uv2pal1akXvStNtTsX1Ykqm+UpSAcGELMfj5WS
X-Gm-Gg: ASbGncv/JX3erSCID6cMGONsitZefbcWFlmkeY4c4ghEkAaTmXjfmTJWQaNDynl0C1S
	E+yf60SHxwOMNbJYPFQG3l2JP3LFZA/3fpP6ZJ4QDDkKxIX4AO/yXIIiuSf7uQ5g3Spgvd6QEZr
	N0cAzHHbeMJW2kFe4ByzskRnqSE00JQYPyl5xlJX+bGs3AQomXjCyZ17F95faaaPF/sRKx6DYD0
	8KNKh0k/ttZOQIHkLLGSTq//rWsK8DXJRZBHaLBIuCOEIGYM3gQY1OeCdwzzUC5AtMyY/qiL5oJ
	iwuRoEYC6L4Ka7rBumxD0MeWczl2NEJu3Q4BSNmhnywl0a5MPS9UJ4uRoS0N41TBUZdBOPQo0Za
	a95sezbuc4OSAvPESFLgPDeLJ88TCNAse3mV3uwoY7b4S+YSNKFWm6miI44l/HUpqhId53A==
X-Google-Smtp-Source: AGHT+IFSL1BU14escbQl5XZwWz93ijRjNvJS5a/oKopT8JoqYxc5CsMDiOw3dlE6ZXiime4ghGEOmw==
X-Received: by 2002:a05:622a:1114:b0:4af:202e:8089 with SMTP id d75a77b69052e-4b2e3c0deb6mr8075061cf.20.1756177073129;
        Mon, 25 Aug 2025 19:57:53 -0700 (PDT)
Received: from [127.0.0.1] (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebed79a712sm600006885a.17.2025.08.25.19.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 19:57:52 -0700 (PDT)
Date: Mon, 25 Aug 2025 22:57:53 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_1/6=5D_dt-bindings=3A_vendor-prefixes=3A_?=
 =?US-ASCII?Q?Add_fdhisi=2C_titanmec=2C_princeton=2C_winrise=2C_wxicore?=
User-Agent: Thunderbird for Android
In-Reply-To: <aKxq4ngaMDxBdMh7@smile.fi.intel.com>
References: <20250825033237.60143-1-jefflessard3@gmail.com> <20250825033237.60143-2-jefflessard3@gmail.com> <aKxq4ngaMDxBdMh7@smile.fi.intel.com>
Message-ID: <4250A35F-C778-4213-AC21-D1B1D145AD62@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 25 ao=C3=BBt 2025 09 h 53 min 38 s HAE, Andy Shevchenko <andriy=2Eshevch=
enko@intel=2Ecom> a =C3=A9crit=C2=A0:
>On Sun, Aug 24, 2025 at 11:32:27PM -0400, Jean-Fran=C3=A7ois Lessard wrot=
e:
>> Add vendor prefixes of chip manufacturers supported by the TM16xx 7-seg=
ment
>> LED matrix display controllers driver:
>> - fdhisi: Fuzhou Fuda Hisi Microelectronics Co=2E, Ltd=2E
>> - titanmec: Shenzhen Titan Micro Electronics Co=2E, Ltd=2E
>> - princeton: Princeton Technology Corp=2E
>> - winrise: Shenzhen Winrise Technology Co=2E, Ltd=2E
>> - wxicore: Wuxi i-Core Electronics Co=2E, Ltd=2E
>>=20
>> The titanmec prefix is based on the company's domain name titanmec=2Eco=
m=2E
>> The remaining prefixes are based on company names, as these manufacture=
rs
>> either lack active =2Ecom domains or their =2Ecom domains are occupied =
by
>> unrelated businesses=2E
>>=20
>> The fdhisi and titanmec prefixes were originally identified by
>> Andreas F=C3=A4rber=2E
>
>=2E=2E=2E
>
>> CC: Andreas F=C3=A4rber <afaerber@suse=2Ede>
>
>Not a big issue in _this_ case, but I would suggest to keep the Cc: list =
after
>the '---' line=2E This will have same effect except being removed from th=
e commit
>messages where it would be an unneeded noise=2E The actual list will be a=
vailable
>via lore archive in emails=2E
>

Acknowledged=2E Will move to the notes section on the next submission=2E

