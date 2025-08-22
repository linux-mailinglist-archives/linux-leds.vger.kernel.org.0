Return-Path: <linux-leds+bounces-5291-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF68FB319E0
	for <lists+linux-leds@lfdr.de>; Fri, 22 Aug 2025 15:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A22ABB07FA3
	for <lists+linux-leds@lfdr.de>; Fri, 22 Aug 2025 13:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2AA30504F;
	Fri, 22 Aug 2025 13:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkownOw/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30123305044;
	Fri, 22 Aug 2025 13:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755869551; cv=none; b=XplRr4C1VlVukvWThy3CenEx+LeI4hBViEW8TpUamEb5yp0xUWgkbKPSQ3Yrqt5ThJNd6BKq8vUZ4zva1LpFWnFUzhb/M3Y8s94gLkyUZGR7k7o0px4fJfaCphGGHgZyoHNoMQQT113tN8NKjy3bPee+TWhUf9seApb2ynqke9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755869551; c=relaxed/simple;
	bh=hMeLI6sw3gUXDyoKayVnNX/dUnPqtksPtByEZI0A1z8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=sU6aBgdToS7a0n0OZYPPL7ZNdUqJJz7U+09RUVp0e8rBpfBHC/IaDb2sYgezbvhuw2N61D/IHPKSkfs3gWA0jlU+j8F5S0q8sCVFj+tEVT5UUNaj2G/VJ7qDOTjGglkrRmtd/tlmJVcnIR4s7C1IddzM6t9WmEFP+SG3otYYWlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkownOw/; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-70d9f5bdf63so3016236d6.0;
        Fri, 22 Aug 2025 06:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755869549; x=1756474349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XuZlS9CdHDUq6B5dMplRyOq4bbNsojpePygP+1WONy4=;
        b=QkownOw/QLLnJGkHOHiSYH5u4DRTyaIayg3ZRWOBAr9gBsAGs9/Ez2ItNwzq6R0cd1
         qGCUrpOSK9Gz2Md7K1xznWpq4+EfdF4qSjwuQXjuM3WemoL/JszTwypDAWdE20veaYil
         TQi3XnMrC4QpxHKrWLtf4HSZCAuwuyCK3nbF26IDMEtuoeadfB1z1CO1avL0n2fDt9Vo
         svOenfaONKauA4usIy/Rre5yXV2uZd2djR3CW5TX0VDIHzf13N4zi5mhe/B1yQWH4lo/
         8Ycqh3fvniX9mBrNIo06AZe8az3kGNkLcOQ/FcI0/M6ocOFhN8SRQZwmPvrrPdwfJ95W
         2Nvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869549; x=1756474349;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XuZlS9CdHDUq6B5dMplRyOq4bbNsojpePygP+1WONy4=;
        b=pc2zl4dtamY+jK1O/b95ArP3d2B0mGZMPQ6hlmwXM2LDl/5Ok7n+1guozbQonIElWx
         zqtRyCqh21RmKpVlyKdpVITMc/Ow0V3u74An3e9uOMAjvWGLgi1v72idxe9XQGMZzaZH
         BNJ0n7aZBsTSb88uRI+ZCWth+FlmxNZoc+4aCQqjrDh5vItMfwYyWZ9UlNW2lXEom4il
         kt8Vo28ZdJN4+FWFMHP/Ce+k0iyB7980kFTsK7KR4S5rdKFbVe2trK258NLZb6URM93f
         sY5lw+P1AMqGGWXVczF0IXAKIiNE670Awaf2o97riWcC1ad8gzLm/mBZLyWIWyY0kwqv
         49CQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/1vak+wZ1gL9sYUVxPk2pDRqPPB6RvcAnq4SyF3kZ1vPbMwmXIXshzoYydXgeeIRH8zmRXD+KRfat@vger.kernel.org, AJvYcCVdWWc/k+KPxTzhnHtSVeYgRreR3iXxWlAuWljWm7YU+flSGbbQes7b1WzfE4uQEbyKZAmdwxGfq/yK6g==@vger.kernel.org, AJvYcCW9M6CnP8DcX8Vwzj7uO1jc9eC9F03GEs24IRSg6dQLZ7Wq9lfKASUdm+bPlTQPG/nBVxx/QRnTQP2YDmma@vger.kernel.org
X-Gm-Message-State: AOJu0YxZpPOz6zbBP2fZhpwFFswzG6TOv+aGvB3CMaN1MiJzgIOTuZhH
	g9aIwW1XgTgiCIqlQ1YDWbrgiTvPZ3zdL6ks0xGn2f2LERo4XEy7kJ0H
X-Gm-Gg: ASbGncukG0D18tKWbXdcV7t6gmCnPuhptYZGbRzLUqBQ1RvivWGJfIO+GsL8DoUbFMP
	v6t2dDZdOGA3qENgr40nDz84BaA0vPj9EHJ+n0GNTamFWJuazSnh3z2eMlXbQtZ4g010DdN40sq
	fSGDd+XDfi2RxCoQlEVJpoF0ZJpVVsMXKEn7Pra5q4IEt/UgOouQN82trgYGLNe2uKYai/xI7el
	Iyw0b6vI5bCBgH3j49IcpcM/NE2HtqEFaDmlX1i0kBThftvoV+1ROISU5QofVO/ETe7lCh2b2ZF
	HpW0F7LPid9VqON4LCKAD2xDol0gxMv91dOSfDugYzamXBQ96zdfxCuRNfA2BfJClpBAIXYORN+
	CEi+Z9YVc3jyIrjlqZ7tmbf667w83kSeTKcq64WhRczha46rnxRqAtvtMeJvtr6hp0smeHA==
X-Google-Smtp-Source: AGHT+IEjadA/NQ4eTXrSAMGW+6h4cl/2RbaQhY90jc9D/bpRGmD57y852aiTXAQFMmPR61h2M5NXRA==
X-Received: by 2002:a05:6214:d0e:b0:70d:857c:a1c9 with SMTP id 6a1803df08f44-70d97350721mr37311346d6.62.1755869547857;
        Fri, 22 Aug 2025 06:32:27 -0700 (PDT)
Received: from [127.0.0.1] (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba906706esm124241126d6.17.2025.08.22.06.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 06:32:27 -0700 (PDT)
Date: Fri, 22 Aug 2025 09:32:24 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_2/4=5D_dt-bindings=3A_auxdisp?=
 =?US-ASCII?Q?lay=3A_add_Titan_Micro_Electronics_TM16xx?=
User-Agent: Thunderbird for Android
In-Reply-To: <68ff2e14-19db-4d4c-8390-8fd2ec9e2c48@kernel.org>
References: <20250820163120.24997-1-jefflessard3@gmail.com> <20250820163120.24997-3-jefflessard3@gmail.com> <20250821-funny-hasty-poodle-582053@kuoka> <7CD0DD74-EB4A-414B-B22E-E9248ECF8CBC@gmail.com> <68ff2e14-19db-4d4c-8390-8fd2ec9e2c48@kernel.org>
Message-ID: <B4F3471D-5227-4D8A-8C18-AB0676845985@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 22 ao=C3=BBt 2025 02 h 44 min 26 s HAE, Krzysztof Kozlowski <krzk@kernel=
=2Eorg> a =C3=A9crit=C2=A0:
>On 21/08/2025 17:16, Jean-Fran=C3=A7ois Lessard wrote:
>>>
>>>> +      # Controllers with titanmec,tm1650 fallback
>>>> +      - items:
>>>> +          - enum:
>>>> +              - fdhisi,fd650
>>>> +              - wxicore,aip650
>>>> +          - const: titanmec,tm1650
>>>> +      - const: titanmec,tm1650
>>>> +      # Canonical standalone controllers
>>>
>>> Drop
>>>
>>>> +      - const: fdhisi,fd620
>>>> +      - const: fdhisi,fd655
>>>> +      - const: fdhisi,fd6551
>>>> +      - const: titanmec,tm1620
>>>> +      - const: titanmec,tm1638
>>>> +      - const: winrise,hbs658
>>>
>>> This is one enum
>>>
>>=20
>> Well received=2E I followed the older style and will adopt the modern a=
pproach:
>>=20
>> properties:
>>   compatible:
>>     items:
>>       - enum:
>>           - fdhisi,fd628
>>           - princeton,pt6964
>>           - wxicore,aip1628
>>           - wxicore,aip1618
>>           - fdhisi,fd650
>>           - wxicore,aip650
>>           - fdhisi,fd620
>>           - fdhisi,fd655
>>           - fdhisi,fd6551
>>           - titanmec,tm1620
>>           - titanmec,tm1638
>>           - winrise,hbs658
>>       - enum:
>>           - titanmec,tm1628
>>           - titanmec,tm1618
>>           - titanmec,tm1650
>>     minItems: 1
>>     maxItems: 2
>>=20
>> Fallback relationships will be documented explicitly in the binding=E2=
=80=99s description=2E
>
>Sorry, but what? I commented under specific lines=2E Why are you changing
>other things?
>
>

I apologize for misunderstanding=2E I hope this fits your specific comment=
s:

properties:
  compatible:
    oneOf:
      - items:
          - enum:
              - fdhisi,fd628
              - princeton,pt6964
              - wxicore,aip1628
          - const: titanmec,tm1628 =20
      - items:
          - enum:
              - wxicore,aip1618
          - const: titanmec,tm1618
      - items:
          - enum:
              - fdhisi,fd650
              - wxicore,aip650
          - const: titanmec,tm1650
      - enum:
          - titanmec,tm1628
          - titanmec,tm1618
          - titanmec,tm1650
          - fdhisi,fd620
          - fdhisi,fd655
          - fdhisi,fd6551
          - titanmec,tm1620
          - titanmec,tm1638
          - winrise,hbs658

>>=20
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  label:
>>>> +    description: Name of the entire device
>>>> +    default: display
>>>
>>> Huh? Why do you need label? Are you sure auxdisplays have labels?
>>>
>>>
>>=20
>> Display integrates with the LED subsystem (/sys/class/leds), where labe=
l is
>> a standard property per leds/common=2Eyaml=2E It ensures predictable LE=
D class
>> device naming when multiple display instances are present, following es=
tablished
>> LED subsystem conventions rather than general DT naming rules=2E
>
>You want to say that top level node is like LED? Then probably it misses
>common=2Eyaml reference=2E Although I am still puzzled=2E=2E=2E you have =
sub nodes
>for actual LEDs, no?
>

The top-level device node is registered as a pseudo-LED device to control =
the
entire display (brightness 0-7, digits) via /sys/class/leds/{label}=2E
Individual LED icons are separate LED devices at
/sys/class/leds/{label}::{function} with on/off status control (brightness=
 0-1)=2E

However, the top-level pseudo-LED shouldn't support all LED properties
(no color, function, trigger-sources, etc=2E), so I'll reference specific
properties from leds/common=2Eyaml rather than the entire schema:

  label:
    $ref: /schemas/leds/common=2Eyaml#/properties/label
  max-brightness:
    $ref: /schemas/leds/common=2Eyaml#/properties/max-brightness

This approach provides LED subsystem consistency while avoiding inappropri=
ate=20
properties for the entire display=2E

>>=20
>> If helpful, I can add a $ref to /schemas/leds/common=2Eyaml#/properties=
/label
>> or include its description explicitly=2E
>>=20

Best Regards,
Jean-Fran=C3=A7ois Lessard

