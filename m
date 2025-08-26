Return-Path: <linux-leds+bounces-5320-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 461C9B3716E
	for <lists+linux-leds@lfdr.de>; Tue, 26 Aug 2025 19:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 280FD1B285C2
	for <lists+linux-leds@lfdr.de>; Tue, 26 Aug 2025 17:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C46530FC2B;
	Tue, 26 Aug 2025 17:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVCtpfVm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38EA2D3732;
	Tue, 26 Aug 2025 17:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756229892; cv=none; b=isJze5Mf57/iKOvr82mZWbwGHsrA6TXZvVEfHKFqvj+nVzm42HHzwUTIJV6dIedh61FEZE6+A+jj6u28oWUij6fiZRQy4e+/uR+bWDlhhCOjspYcPlVssRMLdOoUU06TfoT+yFSXQxh+eEAII4n4Z9Tx2AGOem4MY/yx938WFVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756229892; c=relaxed/simple;
	bh=GLKVCV6q7QQevK0w5EXy+CzhAfxYk6qAfSbG/ESSoKY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=WpcRmp4m5pnBtF/g7tremsciDz2tZEi5QfqKlIR0ps2FTSbQn4cESMeB26LccUkQZzJKnIPs5ikoCmbC687epTbcO4uFPYK47spim47kWlu9zh4DYkcmEofeU4rn8xyEikotuBfcNyuOSohXJZwE6dc1T9DxnktqUl8yV8HeX0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVCtpfVm; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-70ba7aa131fso69893276d6.2;
        Tue, 26 Aug 2025 10:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756229889; x=1756834689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GLKVCV6q7QQevK0w5EXy+CzhAfxYk6qAfSbG/ESSoKY=;
        b=jVCtpfVmWl0GlsS3qN8TthNkuLOF34rL+Y6gemCeM8JVr3ktdwrsmgJ83iO+gnI7FZ
         upZI5WXwy9M4KXShNuJHWQ+Bhv1+YJNa0d68inSxR+fn2pO6qBEavY97T0Qtv4SaJryD
         s9c0LiDtZBnJdE02I5JPsafBeAgUvAyexfSdiIUP1NuyUTSlJpyikaxVa1G5a1y21jtb
         2KESqL3LfiRzzDLD2ZEiDd9ADOYTWUWnoW4IfFSRsJ31ujg2y3Ja+eRW3eL7cPRVHULu
         bO9wp8BKLMpEz530UjrLct9C6bfjfgbSFm+VpAWQgDcq/y5uYzpdrbJnUSDN9AqT/Oj5
         7Aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756229889; x=1756834689;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GLKVCV6q7QQevK0w5EXy+CzhAfxYk6qAfSbG/ESSoKY=;
        b=lvuhEkBrPgfbm7hPPiM5hdZw8vTRn3TqQeA8uPW0Hwg+wQLovcibtp+AuB+pdKk9sF
         r/1yVCrAIKlA0LluzGKPNoi7kQGqIXEp6GyjWUZryhVqd6mVIIIK+AjzNdtJ0hCFibZX
         1Edd95Klc7mGlS/EmBtebTB7TkOb4ga/njTEf38FDjbYirHPWNVC+kmibhxyD4S+LMVi
         zTvEKX4QmyRd2sHm6IexS0P8esetADnzyUScX52nnOf8XzrLAApoe+iUVz7Nx7CLWnzH
         uDNgpKNSNiqQjPzM76h1kMD9rROjtgMqWv0fqz2QLYoKVWX+2W9teK0YP9fzYXpd8bUc
         3IRA==
X-Forwarded-Encrypted: i=1; AJvYcCUKcq8NjAW5fU5c3OTg3I5Zz916IDT5LpdYKJrFnsNITmHfpLtosWsYiMdCSn7H0zptqI+YNbijUZTgRTQC@vger.kernel.org, AJvYcCUgw/lsckntOoM89GJNFNDCObZ1AsYsNFRppJAPmJkKEpzF9vqN8rPWfmNCtphU/U8WRocnUifU8gyJ@vger.kernel.org, AJvYcCVFp2GT9omz9dzyaeDgLlFkMBf6jbw52bki4OzCL3STUM/84NOj+InHffXrbLy9udzdRfOgBXUhZ6tKBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxB5vwlt7rrC0oWH4jNxkM4MFQWslYGPbvrF0loQ6DAUpIUR1Xj
	ihAeELyKeH+D40nxpKjIhEyfLtvXd5Jrz6he9k1F/xjDrby7mk6GCdXi
X-Gm-Gg: ASbGncuV6us7eA9Y/73LevhdY2Gx34dlRwWKvSzfBiBtRWr7qnVcc8gnjBVncHb8zEB
	iBlQOH1MknomxZ2zol5C022kOjkMtG/REgHWfuBUAHH2uWYehh/dFt3B2gim/9L8HrlPhf86uOk
	AAWn66M0a98OE4ZHIX1kmdw4KhYI+NkHnky7BiaDInXBbytuxolwBvlGlQ2fMo/d7XHuXBu5ZNB
	7391/K76oVmiXVaSwdJKasD/ieh9JGm0cf5g1MHAeWqew77PWFRCZy3VuQi2ENb7PvxlONETwba
	GLoOiXTfXkH4KqqAT7BTYoMn01mnSazsP/9fmA4bJSyilOEzebWzPUhyyKxjvvNNaBBrQaP4N6X
	t8m34pyIc3nYKwIJqfL6jLFpifNVdEulq4/C4E5+Tl4pKeMlQvNylTsGZALEruACnqN+0zp0edY
	rY9ZjSh8VLPcCTA/c=
X-Google-Smtp-Source: AGHT+IEBfe2Wdh9mg0OwLhaEtI2NeZtkg93SYEHY1B9q0FmSOUSiJZKKTAdueLBmwSVebSZocIzT8g==
X-Received: by 2002:ad4:5b85:0:b0:70d:d8e8:c5ad with SMTP id 6a1803df08f44-70dd8e8c716mr24376666d6.50.1756229889460;
        Tue, 26 Aug 2025 10:38:09 -0700 (PDT)
Received: from [127.0.0.1] (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70dc7bf319dsm29125066d6.70.2025.08.26.10.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 10:38:09 -0700 (PDT)
Date: Tue, 26 Aug 2025 13:38:07 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_5/6=5D_auxdisplay=3A_TM16xx=3A?=
 =?US-ASCII?Q?_Add_support_for_I2C-based_controllers?=
User-Agent: Thunderbird for Android
In-Reply-To: <aK3TIVbmFgv1ZiYs@smile.fi.intel.com>
References: <20250825033237.60143-1-jefflessard3@gmail.com> <20250825033237.60143-6-jefflessard3@gmail.com> <aKx-w0QOOQPyy9pW@smile.fi.intel.com> <951E84EF-4ED7-4882-A5E2-6E3CD63E1E07@gmail.com> <aK3TIVbmFgv1ZiYs@smile.fi.intel.com>
Message-ID: <A045103F-1F73-4AC7-9316-1AF906ECDC9E@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 26 ao=C3=BBt 2025 11 h 30 min 41 s HAE, Andy Shevchenko <andriy=2Eshevch=
enko@intel=2Ecom> a =C3=A9crit=C2=A0:
>On Tue, Aug 26, 2025 at 12:01:57AM -0400, Jean-Fran=C3=A7ois Lessard wrot=
e:
>> Le 25 ao=C3=BBt 2025 11 h 18 min 27 s HAE, Andy Shevchenko <andriy=2Esh=
evchenko@intel=2Ecom> a =C3=A9crit=C2=A0:
>> >On Sun, Aug 24, 2025 at 11:32:31PM -0400, Jean-Fran=C3=A7ois Lessard w=
rote:
>
>=2E=2E=2E
>
>> >Can we use regmap for all parts of the driver? Why not?
>>=20
>> These controllers implement custom 2-wire/3-wire protocols that share
>> sufficient commonalities with I2C/SPI to leverage those subsystems, but=
 are not
>> fully compliant with standard register-based access patterns=2E
>>=20
>> Specific regmap incompatibilities:
>>=20
>> I2C protocol:
>> - Dynamic addressing: slave address embedded in command byte (data[0] >=
> 1)
>
>Isn't this called paging? Or actually we have also non-standard
>(non-power-of-2) regmap implementations, perhaps one of them
>(7 + 9) if exists is what you need?
>
>> - Custom message flags: requires I2C_M_NO_RD_ACK for reads
>
>Hmm=2E=2E=2E If we have more than one device like this, we might implemen=
t the
>support in regmap=2E Or, perhaps, the custom regmap IO accessors can solv=
e this=2E
>
>> SPI protocol:
>> - Inter-transfer timing: mandatory TM16XX_SPI_TWAIT_US delay between
>> command/data
>
>One may implement custom regmap IO accessors=2E
>
>> - CS control: requires cs_change =3D 0 to maintain assertion across pha=
ses
>>=20
>> Regmap's I2C/SPI bus implementations use fixed addressing and standard =
transfer
>> patterns without support for these protocol-specific requirements=2E A =
custom
>> regmap bus would internally call these same helper functions without pr=
oviding
>> practical benefit=2E
>
>regmap provides a few benefits on top of the raw implementations=2E First=
 of all,
>it takes care about synchronisation (and as a side effect enables
>configurations of the multi-functional HW, if ever needed in this case)=
=2E It also
>gives a debugfs implementation, and paging support (if it's what we need)=
=2E
>And many more=2E=2E=2E
>
>> The explicit transfer approach better reflects the actual hardware prot=
ocol
>> requirements=2E
>
>That said, please, try to look into it closer=2E
>

I investigated your regmap suggestions thoroughly:

Custom IO accessors:
While technically possible, TM16xx protocols create significant implementa=
tion
challenges:

- TM1650: Commands 0x48 (control) and 0x4F (key read) appear as I2C addres=
ses
but represent completely different operations with different data structur=
es=2E
Custom accessors would need complex command routing logic=2E

- TM1628: Requires coordinated command sequences (mode -> write command ->
control command -> data transfers)=2E A single regmap_write() call can't e=
xpress
this multi-step initialization=2E

Paging/non-standard addressing:
TM1650's 0x68-0x6E digit commands could theoretically map to regmap pages,=
 but
the 0x48/0x4F control/read commands break the model since they're fundamen=
tally
different operations, not register variants=2E

You're correct that regmap provides valuable synchronization, debugfs, and
abstraction benefits=2E However, implementing custom accessors for TM16xx =
would
essentially recreate the existing controller functions while forcing them =
into
register semantics they don't naturally fit=2E

Custom regmap implementation is possible but would add significant complex=
ity
to achieve register abstraction over inherently command-based protocols, w=
hile
the current approach directly expresses the hardware's actual command stru=
cture=2E

