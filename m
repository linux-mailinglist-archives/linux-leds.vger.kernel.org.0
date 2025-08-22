Return-Path: <linux-leds+bounces-5284-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3F9B30BD7
	for <lists+linux-leds@lfdr.de>; Fri, 22 Aug 2025 04:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9A02AC252E
	for <lists+linux-leds@lfdr.de>; Fri, 22 Aug 2025 02:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17AF41B4F0F;
	Fri, 22 Aug 2025 02:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhMtXngP"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BD71B4233;
	Fri, 22 Aug 2025 02:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755830125; cv=none; b=WdbeZQC7D6YXMEvAAkhQw4CTPauzwTkiG3srVKthFlLdv9i0Qjiutu5QvSexEJZLRJgNLKTic/wr962QqRTezY0HdWHaJeYkihlOBhG80uRYlCkC10wBCT8RViuDuwjHCc3HBQe1sRyrss02xtfxTetxkPhP69UOSKStp5599oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755830125; c=relaxed/simple;
	bh=55wcjvh8VNmeVowew2rfJ67nefFQjcfFr8r3Gn9Cp1U=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=OiReunSkp1s3jUyXD3gUAt5LFJwUjRdwSP+C42IEHvL72eKPbYk7Dj772xsqR3fAdlb3Qaq0Uo9X2exam4dYLPwLGeVLDkwmBxTxExr5shGO24O2xAbuxnzJQ7zCr7l9c7czw7qS361FGNGYiz0PROVmrHLs1DTEcWcVU/MAfXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhMtXngP; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7e86faa158fso237952785a.1;
        Thu, 21 Aug 2025 19:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755830121; x=1756434921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oXgtDQMr88cNLcr2LXTmLEYmfjO4ZyHKdD11kWAABQ4=;
        b=MhMtXngPIDu0lzxsJG/XrWbz37MfpL9pq5XODE36eVVinXVl8WjRuDiN7v06Tl2S+3
         Wz1d8MR4Xv7LvldiGDEZqysuzb0VGNE4iDrc4fGpQdDt75/7EMuv1PHeFJWzQuAl2II8
         P69mlmJPyOaRfxTAE5bxMdOtlstcn0+OUT1QZo7R1aUUJ1YUv6MIa/LcBSEx3mcn2RzH
         QJnGUb/VnWfOAUmK+vLBPJSH8T9KtecYh+KSt7nJjLzfm685uAQs8lksL+AmLcFnrmG2
         dAJ8hBcGNlxI02NJO7/lzetXyInG5zlZa/V3y3ZSweybr0xvrN2FlHlatBYh0mLD9QHE
         UFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755830121; x=1756434921;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oXgtDQMr88cNLcr2LXTmLEYmfjO4ZyHKdD11kWAABQ4=;
        b=uT3eYe17NkimWEwEj8hvdon8/DLoET2WX3jQdlvqRDzE7xmCfBQS2Zbtf1rv4f8vVI
         qYdJtVYX5C/yVL48jBN/qzQCjc60uX1grutguoCmMwuHMmhSEcpmmMUe969mzAmMe+z6
         F760DFYrk5V1o+mPp41X1wrS5duhvwjej7AWZDQufYEcJ5vrIpxewiCDMRPRMQAyuyfc
         qirmI5ihOnxUwlVn1m4HnLy4qSHB3jT4WoQbKHHuYma0UDHwfPrRxkcPpBMIoN4DeICE
         zyM1wJy1g4rTT9FUlD7J8C7ZcE2Lkcbvb4QKQl5KE1NWBROCh/iLoKsC9Lks5IVOfl0t
         CLIg==
X-Forwarded-Encrypted: i=1; AJvYcCUERfaae+u/ZYvRSHc4qK+OrF6DgDQ5pUncltOHMlS9BiGpT+kcfW+Fpm6u8zaoLTsUldvOAt3pT4S8@vger.kernel.org, AJvYcCUMAhu09M1e+wC9qIjwE0fo2hgTEj5D/tWsE1MyRhoMy3NEtD1rEd8822XK72a3cOm/2L6YIQ+diyrZpDyt@vger.kernel.org, AJvYcCX78d2BI5IffZ3ZvDNDZ2eehNdHbU/0DQJ04b5ShP0BfB3fdjB4fX7P4ddKQMTtEVvf4VZGVZsByZrWLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSf5dEW8BLdlMBVz++ZIOl78lA0FnOFkGk4Oa33TwIafvmpnWx
	y8VMYF/5lSZCoVcsrEor2JO4ngMRuWbNBAqh4g1jfJXD8czXIyjwEKcfRULEq8oa
X-Gm-Gg: ASbGncvDAd0SaWuZ2PE77x6r2ZhwsXx2rGOlIQvrHS4MyMV8VLJ8mgyJ2IT5UXggI9g
	lNWVlMLAmrGKfARu9zvc08WRMxpqETZYUalU60BfX3JsHVJwYQwZlH2E9lUpRPOe8MTugASMbd+
	N4rcunKxO487uxcSzzvj3BU0mPFJ4DRcJiW4tyUf/mTrYg/xwVjx7urATBXKKdUtz+BwyKggoxW
	X1RL8TQyeyHvmGRQNQPCwO0ocVDd9SdqUUndiwiEGZabri82xk60xh4JV+TGgeQa33h12U31Q/X
	BJ9GCJWCiQt2CLxqNjecZjsoLLLCbO3capmfh4b9KF24gjriiEAVgYI2j0NxdXNyr5pELsL14pb
	7qzqgq05HC6v2dzz7FcnweltmBU7k8OmWLDSUbi5JlArOPcqWlogenBUABPsJo0XDmAFmxQygsl
	FdslKN
X-Google-Smtp-Source: AGHT+IHkK/tg3rJmfFjTLc3/6xnAjd1klyvyr896Gs+P2Pcb9E2Ybv6FMS2UQDGYluCkrSRgyrAbNQ==
X-Received: by 2002:a05:620a:1aa2:b0:7ea:888:8d6f with SMTP id af79cd13be357-7ea1155e773mr171355085a.12.1755830120733;
        Thu, 21 Aug 2025 19:35:20 -0700 (PDT)
Received: from [127.0.0.1] (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e1c0d56sm1243082085a.56.2025.08.21.19.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 19:35:20 -0700 (PDT)
Date: Thu, 21 Aug 2025 22:35:18 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Conor Dooley <conor@kernel.org>
CC: Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
 Boris Gjenero <boris.gjenero@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Paolo Sabatino <paolo.sabatino@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_1/4=5D_dt-bindings=3A_vendor-prefixes=3A_?=
 =?US-ASCII?Q?Add_fdhisi=2C_titanmec=2C_princeton=2C_winrise=2C_wxicore?=
User-Agent: Thunderbird for Android
In-Reply-To: <20250821-contour-debtor-9e3196a724b9@spud>
References: <20250820163120.24997-1-jefflessard3@gmail.com> <20250820163120.24997-2-jefflessard3@gmail.com> <20250820-wired-deserve-421d76bdd1c9@spud> <6A80188C-5108-4DE0-9D69-F492FD7E6B8E@gmail.com> <20250821-contour-debtor-9e3196a724b9@spud>
Message-ID: <3D77E083-4E06-4769-AB67-947B9FEF66D6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 21 ao=C3=BBt 2025 16 h 13 min 44 s HAE, Conor Dooley <conor@kernel=2Eorg=
> a =C3=A9crit=C2=A0:
>On Thu, Aug 21, 2025 at 03:35:51PM -0400, Jean-Fran=C3=A7ois Lessard wrot=
e:
>> Le 20 ao=C3=BBt 2025 16 h 08 min 01 s HAE, Conor Dooley <conor@kernel=
=2Eorg> a =C3=A9crit=C2=A0:
>> >On Wed, Aug 20, 2025 at 12:31:14PM -0400, Jean-Fran=C3=A7ois Lessard w=
rote:
>> >> Add vendor prefixes:
>> >> - fdhisi: Fuzhou Fuda Hisi Microelectronics Co=2E, Ltd=2E
>> >> - titanmec: Shenzhen Titan Micro Electronics Co=2E, Ltd=2E
>> >> - princeton: Princeton Technology Corp=2E
>> >> - winrise: Shenzhen Winrise Technology Co=2E, Ltd=2E
>> >> - wxicore: Wuxi i-Core Electronics Co=2E, Ltd=2E
>> >>=20
>> >> The titanmec prefix is based on the company's domain name titanmec=
=2Ecom=2E
>> >> The remaining prefixes are based on company names, as these manufact=
urers either
>> >> lack active =2Ecom domains or their =2Ecom domains are occupied by u=
nrelated
>> >> businesses=2E
>> >>=20
>> >> The fdhisi and titanmec prefixes were originally identified by Andre=
as F=C3=A4rber=2E
>> >>=20
>> >> CC: Andreas F=C3=A4rber <afaerber@suse=2Ede>
>> >> Signed-off-by: Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail=2Ecom>
>> >
>> >Acked-by: Conor Dooley <conor=2Edooley@microchip=2Ecom>
>>=20
>> Thanks for your acknowledgement, I will include it in the v4 submission=
=2E
>>=20
>> >but some reason why all these are being added together would be nice=
=2E
>>=20
>> Do you mean repeating this cover letter v3 changelog note in this patch=
:
>>=20
>> v3:
>> - Update vendor prefixes with documented rationale, in a single patch,
>>   per maintainer feedback
>>=20
>> See https://lore=2Ekernel=2Eorg/linux-devicetree/491ec8dd-8ca5-45bb-b5f=
4-dfd08a10e8de@kernel=2Eorg/#t
>>=20
>> Or do you mean the relationship between these vendors being added here,
>> such as replacing the fist line of the commit message to:
>
>Ye, this=2E The relation between the vendors=2E
>

Well received=2E I will update the commit message accordingly in v4=2E

>>=20
>> Add vendor prefixes of chip manufacturers supported by the TM16xx 7-seg=
ment
>> LED matrix display controllers driver:
>> - fdhisi=2E=2E=2E
>>=20
>> >
>> >> ---
>> =2E=2E=2E
>>=20
>> Best regards,
>> Jean-Francois Lessard
>>=20


