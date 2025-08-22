Return-Path: <linux-leds+bounces-5292-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE38B31A47
	for <lists+linux-leds@lfdr.de>; Fri, 22 Aug 2025 15:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6083682475
	for <lists+linux-leds@lfdr.de>; Fri, 22 Aug 2025 13:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C82304BAE;
	Fri, 22 Aug 2025 13:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbqQClYT"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCBE302747;
	Fri, 22 Aug 2025 13:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755870614; cv=none; b=iIEHMYCED8/P69j4Pqr4Mp0BnvJCGdyE+S7M6UpT+8UNSrEkE7o/syqP8i0wRoCFMP7/VFFHHvoO8A3LDkAVPOSPUO7J+jfia7cPVk10zehXad/bdR/xa+XwnmdzEIFDD8gY94/38wzuO4xp54iSGpdHQpDVtW9tco7E14vuZfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755870614; c=relaxed/simple;
	bh=hZlKJ98KgXmJHaXDA06fKKwOuQM8edRZgwMDXHYu7gM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=jd9WgUFQbxzwebUvg7qlTMQ9zzbusFOpnlTu/SHUqUCskOdGOvAt4X0+d+eml4KpUVLM/mzZqwU2lzQhX2Co+DpluC2PdqmSgAwzzZJGxncdYeMqWPs2AEcsXOKLgEG7vYtY66fPd38kFo8YGI13FtHoEWPVYWsWkTVBINc130M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VbqQClYT; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7e87067b15aso243119685a.3;
        Fri, 22 Aug 2025 06:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755870611; x=1756475411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IluoYrUQ+3NQRTHNTAVkkPLNzy3MyswNqTCES/Ri328=;
        b=VbqQClYTXK2wl8xRz/THVykVH4zFFxa8Co/0PyUKz0L0e4rG9JN77Hb1Ibvk1q7ad8
         hEiwqsvtG6dPxWyoo4yQ9xVgAvFmw4q/dXHqjYuRiBwY7EeY4W1/0BafO+TdoQ1to9H0
         WWu258RXnRc5V6CLgh6XWUofPTz37Df93LTfjwnRklS98+1xcWqy3VFiymDhyhRN4EcS
         Ofs7pK6gZbnlGj/2JcQjbSqt9YKxZxDKH/V/UhTRDWk23jX1IBKChy6SaiLo7jPf+zQR
         HOTSVOrqvmSRI2hKI7+yA/2E3/7Wev2TNWETr1tv/t0rvenRV9tpT+CsMD8q4uz65bTf
         HfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755870611; x=1756475411;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IluoYrUQ+3NQRTHNTAVkkPLNzy3MyswNqTCES/Ri328=;
        b=DgdDY1pqCiAEBx6elcGXgF0wd9jVBWIE4RXVWnzNzdCwjUXVXDdIYiJJM9KcsWi9w8
         8FCANKG/NtCi3+9s6rcEOKGs7JgIOuq9+GcG6QDsSShRra51N8E+zIFphnxST+Mzz7DV
         P3A3FnAtL0CqUPGrFLNexoOfJqIScpKrkvmdEKXQTv07g4kg/j3jtwTRcgWY6Si7Ck8P
         qRyaSb9pAINklRWDFNVUgGng2oLgigHXNucYHgrKNELS5tiMyrhWVzKm4uJZBHZU+h1y
         7N1pkEPOplpLGkDM8AmhzTJwldcudp4TZbddVBQv8C4GTNYjBBKObHd08q/H3pnYJV7C
         u82g==
X-Forwarded-Encrypted: i=1; AJvYcCVxPVom38NKjxi04s2r9CC9VmOwE6Y+z+kjhZb31XBs8JZenKTn4vzIn+qVpBW03a1zRP0NTeY0ffDNCaBD@vger.kernel.org, AJvYcCWzxztFXD2kmG5jMEyAXg1gsV39bZFaWIL/Yp+HKvSwESGk/oKx2UvqgBWSwFCDjiQXWs13uLfhWpA6@vger.kernel.org, AJvYcCX1h3239IPm00/zaMsV4zEOkpU9Y4uRbBHxkEv3WVqUtOiZ1HF/+2CemBvsRJszfo3E91rblhykfX8/wQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4FZEhEGSrJOHrz/lbp/3lFgUXtpTxOGoC45+Ws/tdBraI5d6j
	cUH4rtysPLH4i4hDFfYXfnBFIoHGe+iYm61aSV5kbwq/TboF7h/JTmTS
X-Gm-Gg: ASbGncur8aLijH/hvOIo49eLmYgm6/fgoIz82f2FDL6xA5cRLLucwLDewC7727JFQyo
	R1BUXESLjl9N+Rd3amJyYxhCQ3rA8+YJsltEKbfXfhRFn+Rg6GUGotXrHmxwevBaynsE+MkTeer
	78bP2PkElrBxkBq5VEslNzsK0DWBQrmvzAnjJrLtjFIzOT8g1kB77gy5BX38WCf7bfazq3PQXo5
	vtffsK8pzczw6D7G5QL35ZAIQffNrknRIB21n1G5T4ha5Of9HSfmDMyIjHzg7vmAScCfP/akBdQ
	074Xta5xspSDtPrDLACm6Hqxn1Ru9gUWgEE0WWPxrn9Ph5lHynq3mYqs8l147I/AWXP2D+K8Im5
	bw5p1tqr05XGB/Xk75WezoavFhQwe3V8ytI1CKj/hJAC3Fb+nhqz2VnSJ9l33FHinp3I74Q==
X-Google-Smtp-Source: AGHT+IEbbxxrr4OguXpetCtZgs9NZQXKQKPH4ZU2Atto0l6S0/rLKx603SX7KDJ7VbFhwkRrIQXcIA==
X-Received: by 2002:a05:620a:a211:b0:7e6:50f2:d62d with SMTP id af79cd13be357-7ea10fc7aa2mr290119185a.5.1755870611308;
        Fri, 22 Aug 2025 06:50:11 -0700 (PDT)
Received: from [127.0.0.1] (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11de55b61sm118197211cf.56.2025.08.22.06.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 06:50:10 -0700 (PDT)
Date: Fri, 22 Aug 2025 09:50:08 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_3/4=5D_auxdisplay=3A_Add_TM16xx_7-?=
 =?US-ASCII?Q?segment_LED_matrix_display_controllers_driver?=
User-Agent: Thunderbird for Android
In-Reply-To: <CAHp75VcpJzMUtrN2kBhWs90G3n6_NWTBhw3MX2WpuhsDt7zmjQ@mail.gmail.com>
References: <20250820163120.24997-1-jefflessard3@gmail.com> <20250820163120.24997-4-jefflessard3@gmail.com> <CAHp75VfG7p+YYV1b9f6i_o-VrLhMh_=TaLdZTVRWHa8ky-G8Zg@mail.gmail.com> <D21AECF9-85D7-4846-9DE6-8B9DD912339D@gmail.com> <CAHp75Vcdp5fHPNAy=_iEFR6Fa5PEE4U++T5owE1mW_H2-y3ijA@mail.gmail.com> <D0111A5F-5FA1-4405-A86A-C0D772FDAAEA@gmail.com> <CAHp75VcpJzMUtrN2kBhWs90G3n6_NWTBhw3MX2WpuhsDt7zmjQ@mail.gmail.com>
Message-ID: <13102F25-B59B-46CA-B0DC-F6F5724E4974@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 22 ao=C3=BBt 2025 02 h 08 min 42 s HAE, Andy Shevchenko <andy=2Eshevchen=
ko@gmail=2Ecom> a =C3=A9crit=C2=A0:
>On Fri, Aug 22, 2025 at 5:20=E2=80=AFAM Jean-Fran=C3=A7ois Lessard
><jefflessard3@gmail=2Ecom> wrote:
>> Le 21 ao=C3=BBt 2025 16 h 19 min 23 s HAE, Andy Shevchenko <andy=2Eshev=
chenko@gmail=2Ecom> a =C3=A9crit :
>> >On Thu, Aug 21, 2025 at 10:04=E2=80=AFPM Jean-Fran=C3=A7ois Lessard
>> ><jefflessard3@gmail=2Ecom> wrote:
>> >> Le 21 ao=C3=BBt 2025 04 h 08 min 51 s HAE, Andy Shevchenko <andy=2Es=
hevchenko@gmail=2Ecom> a =C3=A9crit :
>> >> >On Wed, Aug 20, 2025 at 7:32=E2=80=AFPM Jean-Fran=C3=A7ois Lessard
>> >> ><jefflessard3@gmail=2Ecom> wrote:
>
>=2E=2E=2E
>
>> >> >> +#define TM16XX_DRIVER_NAME "tm16xx"
>
>> >> The TM16XX_DRIVER_NAME macro is standard practice for consistent str=
ing usage
>> >> in registration and module macros=2E
>> >> If helpful, I can add a leading /* module name */ header comment=2E
>> >
>> >Instead of an unneeded comment it seems better to use explicit string
>> >literal in all cases (two?)=2E
>>
>> I'm surprised by this preference since driver name macros are very comm=
on
>> practice, but I'll use explicit string literals to align on this prefer=
ence=2E
>
>Usually we put a macro to something which (theoretically) might
>change=2E The driver name is part of an ABI and I prefer it to be
>explicit as we do not break an ABI=2E Once introduced it can't be
>modified or removed=2E Also it's better to see clearly exactly at the
>place in use in the code the name as it's easier to (git) grep for
>something similar=2E With a macro I would need to grep at least twice to
>see the users=2E
>

Well received=2E I'll use explicit string literals=2E

>=2E=2E=2E
>
>> >> >> +       keypad->state =3D devm_bitmap_zalloc(display->dev, nbits,=
 GFP_KERNEL);
>> >> >> +       keypad->last_state =3D devm_bitmap_zalloc(display->dev, n=
bits, GFP_KERNEL);
>> >> >> +       keypad->changes =3D devm_bitmap_zalloc(display->dev, nbit=
s, GFP_KERNEL);
>> >> >> +       if (!keypad->state || !keypad->last_state || !keypad->cha=
nges) {
>> >> >> +               ret =3D -ENOMEM;
>> >
>> >> >> +               goto free_keypad;
>> >
>> >(Hit send too early that time=2E=2E=2E) This goto is bad=2E It means
>> >misunderstanding of the devm concept=2E See below=2E
>>
>> I can assure I understand the devm paradigm=2E The keypad probe is opti=
onal,
>> failure doesn't fail the main driver probe but only generates a warning=
=2E The
>> cleanup code prevents memory from staying allocated until device remova=
l
>> in this specific optional failure case=2E However, if you insist, I'll =
remove the
>> cleanup and let devm handle it normally=2E
>
>Assume you have a separate feature, let's say keypad driver for some
>complex HW, like this one, and you have even a separate (library)
>driver for it=2E Then you want to introduce some kind of library
>functions to probe and remove the only keypad part, here are two
>options:
>- follow the library pattern with plain (non-devm) k*alloc() in probe
>and kfree in remove
>- use driver pattern with devm
>
>If you choose the second one, it will be weird to call devm_kfree()=2E
>The rule of thumb the devm_$FREE_MY_RESOURSE() *must* be *well*
>justified=2E Because it's exceptional=2E Losing 1kb memory or so is not
>enough to justify=2E
>

Understood=2E I'll remove the cleanup gotos for this scenario given that
devm is generally preferred and that losing 1kb memory or so is not
enough to justify=2E

>> >> >> +       }
>> >> >> +
>> >> >> +       input =3D devm_input_allocate_device(display->dev);
>
>> >> >> +free_bitmaps:
>> >> >> +       devm_kfree(display->dev, keypad->state);
>> >> >> +       devm_kfree(display->dev, keypad->last_state);
>> >> >> +       devm_kfree(display->dev, keypad->changes);
>> >> >> +free_keypad:
>> >> >> +       devm_kfree(display->dev, keypad);
>> >> >> +       return ret;
>> >
>> >No way=2E We don't do that, If required it signals about exceptional
>> >case (0=2E01% probability) or misunderstanding of devm:
>> >- managed resources are managed by core, no need to call for free
>> >- using managed resources in the contexts when object lifetime is
>> >short is incorrect, needs to be switched to the plain alloc (nowadays
>> >with __free() from cleanup=2Eh to have RAII enabled)
>> >
>> >Choose one of these and fix the code accordingly=2E
>>
>> Same as above=2E
>

=2E=2E=2E

>> >I stopped here, I believe it's enough for now (and I would wait for
>> >the smaller changes per patch, perhaps 2 DT bindings patch + common
>> >part (basic functionality) + spi driver + i2c driver + keyboard,
>> >something like 6+ patches)=2E

I know it's a lot to review ~1800 lines at once and that the split into mu=
ltiple
files will require a review anyway, but feel free to share additional feed=
back
on any other obvious issues you may observe, so I can fix these for v4=2E

Thanks again for your time and thorough feedback,
Jean-Fran=C3=A7ois Lessard

