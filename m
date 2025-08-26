Return-Path: <linux-leds+bounces-5322-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FD1B373C0
	for <lists+linux-leds@lfdr.de>; Tue, 26 Aug 2025 22:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BBD82A8564
	for <lists+linux-leds@lfdr.de>; Tue, 26 Aug 2025 20:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5E82857C7;
	Tue, 26 Aug 2025 20:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wj7lpdZ3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A39430CD8F;
	Tue, 26 Aug 2025 20:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756239667; cv=none; b=J2ZkWZztgMFk/dHKxIYqBBOuT8if7keNVemdSzWuIhVRfrsELVfW4ZEJCuJSgJzwmzF0N2qu8wHD6GxHIfIz49JkSbYg7LJorEHbxCCiEUhriosvvWd3uQZO8X58kxT/CyGAxPHGvmhdCuCzKE9deZiwQUDSPLM89ejmWdM/ZiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756239667; c=relaxed/simple;
	bh=ASsGtAkkS1T312V2TDtSMFpsqkBJsp/o6TDZpWGWgRs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=me8IZ/5ISSisCfUdc2IvxC7TKhNwT64t4wknntSJRjduwJ7Y602LLeYHPMJfSER4gCFWAbd+rMUhJkFckjCKTfABLX1dJGPhcbbLfTBRmNoMhgQU96WlAFGb6ZL69XFDDVz2Zhd4n4KJLY6DOZHRXIc6aolwSk4DiFQ53qrhfl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wj7lpdZ3; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7e86f90d162so30299885a.0;
        Tue, 26 Aug 2025 13:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756239664; x=1756844464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ASsGtAkkS1T312V2TDtSMFpsqkBJsp/o6TDZpWGWgRs=;
        b=Wj7lpdZ3D70KTGrCvn3pCADA8Nh76ZEYdtgfiZ6+xQ3DcGoGP3YYWwhH8B8RA1xobq
         DxOZi6EFLP/pPpMLsUS9LpQPDJZRI0F387bX0gl6TpAOlGZ4ueVZStyR8+SiJsAaxKMb
         Cf0RguqfLhFKuq0+ZALUn4vR81FdxGyelZv39t5tPAGf1avtZN4Irx8k3ocrg7TJi2NW
         oxlhBTAO85Hip5F/Zpmwk52jVruSbok3CX8LuL5wwqM6NBk+CCv/qlPvQpoVaoBZzM7E
         tuQBJol/BFrpeTwaN7e3rd+Sc4EbxoTU5qAAEFe4667cMz83Nh0dDviyVDjQvkarplFI
         5izQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756239664; x=1756844464;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ASsGtAkkS1T312V2TDtSMFpsqkBJsp/o6TDZpWGWgRs=;
        b=oHj1zPjngn6C4O2FVS8fZ3L2yzVF0hRsCEniZI67lYflXCTW6MmMHfejkzZq4HAAE2
         LFSCOqYG6a6rV3e3+BSkB19JA/6+CkfNFxMemxfhifXFoqOMXAGdALJKzOySaBevmscZ
         C9YmYSCPkD30pOsyVn62iWzsrGg2GcBBmLFg/xZkby3sTe2izOJQeLPcNtW5Mgx9ItUF
         8v/RvX+kFu1EPKUxwAFafaUNgEteSBWvDCmajnRlfjADoj7bMw756kH3/a9QDFBQXCmo
         irCYz5Cer3zraivnvjKo1DA5AKrBRfCdpro0lEAEpaOlGzQgI2z24+jj+6yoHa8s+2Na
         FVBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3M+EDGeFSgss5x2Q3MPHVkjUZfI3hFn180HP7Q9wdXKkQml3UxewrdJnd3leK+riJAT1cawSpO8ZB@vger.kernel.org, AJvYcCWkK3W9+fKSaVSl+hfq7JMJuz27W6YhCvfK6O45yr+SdPaFSqMfzd307PByRaoNT7R+X3TWeBAV+SJ9Bviv@vger.kernel.org, AJvYcCXTgZXhaR2FXO9km1nEBLN29gtPO5HGwP46s+IWT0ER8XbM7NVTwq6+T+Olg3Rd3LsLU/V7AV9l7BJuRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTDcgKNWxC5rEEEuMYWmlULCJj+DZXHTmCEl8zAY4lOH3pQUYx
	t5eT3AkdMfd1xcaaeBiP71elmoRhpqFwGXRZl1RT/wIqguIvhplPxmbo
X-Gm-Gg: ASbGnct+qnwS8zFkQbQPsLQM/bXi80qpIq0fDmc6sDl3ZnzLlWXfJcFeoQsJa/gW33C
	pQo3RSblNL9p1g4uDuXPMomZGwCgvEycDOpjeaqHVJx25gHkJvX6joQhEiFNoB5jcN41/vj+sFy
	n1BuVAlljVYP1pUvYZ5jTOmkamhMkSVmo7Dpj+jsbm4m9EKREIfq2TeDvd5Tz6zhW1Rcm6Evw5s
	T1BoFK8D/pt1KreauTkcPJjg9ohmmlvAp7mqC4dG5/UDS8Hw/oIhuh7GJNc987rtX/4MhuyRQui
	yAriVWE3Ea3rosQJJ9XkjnxPKLTmJhSDtPuWXuNLbFYV6hwasqEbxBSuHd0bI4tBDdGj738ce+O
	TO2TFo6eXtyOt9XHUEll+7rbyXeOfrgfmtl9IYP00HwR21iiOnwX1HwqZjqtIP64ZmjTkoPDJc9
	wShpao
X-Google-Smtp-Source: AGHT+IGcak+f4/com89YkKS2YGVVllEdU4AW9WXUgI0Hnrp2CVmjeKxeY4P7nD/rVZi6Pp4rBup57Q==
X-Received: by 2002:a05:620a:4016:b0:7e8:2048:625d with SMTP id af79cd13be357-7f58d941c96mr282729585a.18.1756239664328;
        Tue, 26 Aug 2025 13:21:04 -0700 (PDT)
Received: from [127.0.0.1] (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8c885e4sm78531311cf.13.2025.08.26.13.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 13:21:03 -0700 (PDT)
Date: Tue, 26 Aug 2025 16:21:01 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_5/6=5D_auxdisplay=3A_TM16xx=3A?=
 =?US-ASCII?Q?_Add_support_for_I2C-based_controllers?=
User-Agent: Thunderbird for Android
In-Reply-To: <CAHp75Veb_tQ3QYybDqYvNDrfX36Ft_RM6LwwCie2qYdoZGZOQw@mail.gmail.com>
References: <20250825033237.60143-1-jefflessard3@gmail.com> <20250825033237.60143-6-jefflessard3@gmail.com> <aKx-w0QOOQPyy9pW@smile.fi.intel.com> <951E84EF-4ED7-4882-A5E2-6E3CD63E1E07@gmail.com> <aK3TIVbmFgv1ZiYs@smile.fi.intel.com> <A045103F-1F73-4AC7-9316-1AF906ECDC9E@gmail.com> <CAHp75Veb_tQ3QYybDqYvNDrfX36Ft_RM6LwwCie2qYdoZGZOQw@mail.gmail.com>
Message-ID: <81E65D49-79BD-4F61-A32F-D01494D22C1B@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 26 ao=C3=BBt 2025 14 h 26 min 37 s HAE, Andy Shevchenko <andy=2Eshevchen=
ko@gmail=2Ecom> a =C3=A9crit=C2=A0:
>On Tue, Aug 26, 2025 at 8:38=E2=80=AFPM Jean-Fran=C3=A7ois Lessard
><jefflessard3@gmail=2Ecom> wrote:
>> Le 26 ao=C3=BBt 2025 11 h 30 min 41 s HAE, Andy Shevchenko <andriy=2Esh=
evchenko@intel=2Ecom> a =C3=A9crit :
>> >On Tue, Aug 26, 2025 at 12:01:57AM -0400, Jean-Fran=C3=A7ois Lessard w=
rote:
>> >> Le 25 ao=C3=BBt 2025 11 h 18 min 27 s HAE, Andy Shevchenko <andriy=
=2Eshevchenko@intel=2Ecom> a =C3=A9crit :
>> >> >On Sun, Aug 24, 2025 at 11:32:31PM -0400, Jean-Fran=C3=A7ois Lessar=
d wrote:
>
>=2E=2E=2E
>
>> >> >Can we use regmap for all parts of the driver? Why not?
>> >>
>> >> These controllers implement custom 2-wire/3-wire protocols that shar=
e
>> >> sufficient commonalities with I2C/SPI to leverage those subsystems, =
but are not
>> >> fully compliant with standard register-based access patterns=2E
>> >>
>> >> Specific regmap incompatibilities:
>> >>
>> >> I2C protocol:
>> >> - Dynamic addressing: slave address embedded in command byte (data[0=
] >> 1)
>> >
>> >Isn't this called paging? Or actually we have also non-standard
>> >(non-power-of-2) regmap implementations, perhaps one of them
>> >(7 + 9) if exists is what you need?
>> >
>> >> - Custom message flags: requires I2C_M_NO_RD_ACK for reads
>> >
>> >Hmm=2E=2E=2E If we have more than one device like this, we might imple=
ment the
>> >support in regmap=2E Or, perhaps, the custom regmap IO accessors can s=
olve this=2E
>> >
>> >> SPI protocol:
>> >> - Inter-transfer timing: mandatory TM16XX_SPI_TWAIT_US delay between
>> >> command/data
>> >
>> >One may implement custom regmap IO accessors=2E
>> >
>> >> - CS control: requires cs_change =3D 0 to maintain assertion across =
phases
>> >>
>> >> Regmap's I2C/SPI bus implementations use fixed addressing and standa=
rd transfer
>> >> patterns without support for these protocol-specific requirements=2E=
 A custom
>> >> regmap bus would internally call these same helper functions without=
 providing
>> >> practical benefit=2E
>> >
>> >regmap provides a few benefits on top of the raw implementations=2E Fi=
rst of all,
>> >it takes care about synchronisation (and as a side effect enables
>> >configurations of the multi-functional HW, if ever needed in this case=
)=2E It also
>> >gives a debugfs implementation, and paging support (if it's what we ne=
ed)=2E
>> >And many more=2E=2E=2E
>> >
>> >> The explicit transfer approach better reflects the actual hardware p=
rotocol
>> >> requirements=2E
>> >
>> >That said, please, try to look into it closer=2E
>> >
>>
>> I investigated your regmap suggestions thoroughly:
>>
>> Custom IO accessors:
>> While technically possible, TM16xx protocols create significant impleme=
ntation
>> challenges:
>>
>> - TM1650: Commands 0x48 (control) and 0x4F (key read) appear as I2C add=
resses
>> but represent completely different operations with different data struc=
tures=2E
>> Custom accessors would need complex command routing logic=2E
>
>So, to me it sounds like mutli-functional I=C2=B2C device with two client=
s,
>hence would be two drivers under the same umbrella=2E
>
>> - TM1628: Requires coordinated command sequences (mode -> write command=
 ->
>> control command -> data transfers)=2E A single regmap_write() call can'=
t express
>> this multi-step initialization=2E
>
>I believe we have something like that done in a few cases in the
>kernel, but I don't remember for sure=2E
>
>> Paging/non-standard addressing:
>> TM1650's 0x68-0x6E digit commands could theoretically map to regmap pag=
es, but
>> the 0x48/0x4F control/read commands break the model since they're funda=
mentally
>> different operations, not register variants=2E
>
>Paging can be partial=2E
>
>> You're correct that regmap provides valuable synchronization, debugfs, =
and
>> abstraction benefits=2E However, implementing custom accessors for TM16=
xx would
>> essentially recreate the existing controller functions while forcing th=
em into
>> register semantics they don't naturally fit=2E
>>
>> Custom regmap implementation is possible but would add significant comp=
lexity
>> to achieve register abstraction over inherently command-based protocols=
, while
>> the current approach directly expresses the hardware's actual command s=
tructure=2E
>
>Okay, if you still think regmap doesn't fit this case, please provide
>a summary in the cover letter to describe all your discoveries and
>thoughts=2E
>

Understood=2E I'll provide a summary of the regmap evaluation and design
decisions in the cover letter of the next submission=2E


