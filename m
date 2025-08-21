Return-Path: <linux-leds+bounces-5272-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A31C9B2FE39
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 17:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F7FDA061CE
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 15:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7DF26CE10;
	Thu, 21 Aug 2025 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTjaDLve"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F3526C38C;
	Thu, 21 Aug 2025 15:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755789378; cv=none; b=XaaVGDfEz/dz9i9jcf/24y5SnrXIzy7yMxukhlGUdF0TFpG+l88H6Kqgz8dfFkmhbC0lBxaWJUkZ1TapcczwOfKPPmzCi4LiGyusxeqzUUivS+F2FP7cDXFUf5LYv8kIuPfdaDA++Z+u8imLdEp+JZwEkK8hN2L5YkUzP339UII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755789378; c=relaxed/simple;
	bh=s1jzue1or5APUJYlxcdiclDFJ7VH3CXbbpSaarWZAeg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=pkGfHsAJdl4NEu8OOnD4KZQIbd3Q9SAOq0yoRMvKkWba1TIMB4sKqFJmBDZM7A9ybMt5FoSGMUchw1b9icI3K56sFoitQF3bk4DKV8oBiJO0zQ73IvnVf0A9UXlIBpnjoAxOIqFM77PCQN1DN6sTbbsr2E6INubpposCbaUdQo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTjaDLve; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-8901914cc76so619358241.3;
        Thu, 21 Aug 2025 08:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755789375; x=1756394175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KZGS3wFysJuGQ9geI9RvSpGi9QTUy9oRkJDBgF6Icdg=;
        b=jTjaDLvekOxfUgaC4BgN9mxQUAe3bseS8CKkx3nh/34tmOXgz01TMvyDhM3EGeXH91
         s6bqebu+LvLPEPuxu5hqOmpVFj4XUWfCsisgJcAXFi1TC5E+FrR1s7Sc/XNALvQRZa7n
         ZNCcUwwH4NZkYkO7oRXPWoQfdXa3o5NDZnk3OKxllsajwmBBMRureQnq5UQft5lXXrGp
         SwkBJO/W/J3t0wnCuMqn939m7pL+byANky1X2elnyWv6jtWTiX8SNkHa5yKiP/lsI9S0
         BjPVBwVNg7RbBDsQNjU0yuuJ+1SHmmuIjNHd5xxvE4Nhr15AjmUwpipKUUOhw7Cjs0oN
         6uaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755789375; x=1756394175;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KZGS3wFysJuGQ9geI9RvSpGi9QTUy9oRkJDBgF6Icdg=;
        b=qWuTKjndqzbbnK3+ghzPOuXmUC1/SL3pR4AI89dRV4wCd7ZHX2vpRd6bYlqfI4JmWH
         10WfS7nSd/YMUjPm+MTxOomIUTAOn85+Yau4iOnkkkHGK/VPLKVqWcx9peMsYNwcAB7R
         dybrkm3ERfEpvGHFOGsbMNrtSeHDnBjzAmBceG3IFjMyLBkIWjFa0J/SDA/XKC4sgJzW
         0Z1t8lJbwDiImcTdmD6sVpu0CECGKsA8/0v72VlhJoFBH/4dH4sZAMLgB8/B93Cq68KE
         BrDXxNsvfnY73V5h9CGi1Ws2V3nPs1R192iSjRCMjPZR1MqrMB4McGBQ2AZwWKpGaPSv
         3vAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5j5gsat2G5aVGQmbVk9jHmNtc0HIRhz1kFe4RhEe0PDJRrYhek0NfjMSHCLb5XFRgYNm9X9d/zWgy@vger.kernel.org, AJvYcCVHPpzz0EXSrhS26V+Tj/Ts7O0OX5rmLTNJsbsqrlEYzxJkQkwYOfgoBMTlYkEfH9aq/uz204rAGB46pQ==@vger.kernel.org, AJvYcCWjD0X6KArSJ6GVIYX/4OphraF2Fyp8jsepNKd1TWFCMLiH2W0ld47b6kWxouDQeAXl+L/nqQ21h155IgYe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/oq3iHraV9oxD3RByZ1MmXbHrVKyCmOcvg1vVZGjbZnTx/o4M
	9HCzNwsEEodan2sjCmhnhSOGdeosnIf4zJa4Dj0BEXc5CZDK/c1SXLqj
X-Gm-Gg: ASbGnct1iO+wo599j3OXAokdYXSGRrPtstrFAkUKxm7kHkIwpiGU7KCCAQ+MyMZH/ha
	rUm4KgabtF5UNZByATAx+9NPtDisNp+VD8aBzi3OOHYy+hqEe2ys9VmKbAmfmM2eIb5Fz8tWdR1
	JebLaDdrg+jxHC4dE1Wp2srQd7XaHfzKZSrrgWqyeTYAF+xzMreegyfn7m2+bKIJ8oYgUVRNsYi
	Z+IGDQQql2KN85gLRfrbAF18OBOZ3VeMwn0kyRKHOHmKiLpOQwYlLUmDYxNEGNzboBbZQQqBPNR
	os52gBlR0PtlTI1lM1rLtJkH5fyBQWs71AvSP19KSgF69Kk0zbcQK2nn9UrjWmN1E0zLKGkcvzF
	ggJk24O9cSam27a4WJB40AQI9RTnpmoE0CK2ZDPf/YGBTedbhgMZeBoRefY3WXSekm+aBr6pi0t
	rQ9Km9
X-Google-Smtp-Source: AGHT+IFY+mRz9dQA8jMQ1irRNEIm91ZHuuqvXuYxz2cqfpu9KCJ3nywjlmx51Wx2rnjC2rMIcSuD5g==
X-Received: by 2002:a05:6102:3a0b:b0:4e5:f673:7da4 with SMTP id ada2fe7eead31-51bdf556796mr929422137.8.1755789374928;
        Thu, 21 Aug 2025 08:16:14 -0700 (PDT)
Received: from [127.0.0.1] (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e0204ddsm1133544185a.10.2025.08.21.08.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 08:16:14 -0700 (PDT)
Date: Thu, 21 Aug 2025 11:16:15 -0400
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
In-Reply-To: <20250821-funny-hasty-poodle-582053@kuoka>
References: <20250820163120.24997-1-jefflessard3@gmail.com> <20250820163120.24997-3-jefflessard3@gmail.com> <20250821-funny-hasty-poodle-582053@kuoka>
Message-ID: <7CD0DD74-EB4A-414B-B22E-E9248ECF8CBC@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 21 ao=C3=BBt 2025 03 h 48 min 21 s HAE, Krzysztof Kozlowski <krzk@kernel=
=2Eorg> a =C3=A9crit=C2=A0:
>On Wed, Aug 20, 2025 at 12:31:15PM -0400, Jean-Fran=C3=A7ois Lessard wrot=
e:
>> Add documentation for TM16xx-compatible 7-segment LED display controlle=
rs with
>> keyscan=2E
>
>Here and other patches - this is not wrapped=2E
>
>Please wrap commit message according to Linux coding style / submission
>process (neither too early nor over the limit):
>https://elixir=2Ebootlin=2Ecom/linux/v6=2E4-rc1/source/Documentation/proc=
ess/submitting-patches=2Erst#L597
>

Well received=2E Will wrap at 75 instead of 80 for commit messages=2E

>>=20
>> Signed-off-by: Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail=2Ecom>
>> ---
>>=20
>> Note: The 'segments' property is intentionally not vendor-prefixed as i=
t defines
>> a generic hardware description concept applicable to any 7-segment disp=
lay
>> controller=2E The property describes the fundamental grid/segment coord=
inate
>> mapping that is controller-agnostic and could be reused by other LED ma=
trix
>> display bindings=2E Similar to how 'gpios' describes GPIO connections g=
enerically,
>> 'segments' describes segment connections in a standardized way using
>> uint32-matrix format=2E
>>=20
>>  =2E=2E=2E/bindings/auxdisplay/titanmec,tm16xx=2Eyaml  | 471 ++++++++++=
++++++++
>>  1 file changed, 471 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/auxdisplay/titanm=
ec,tm16xx=2Eyaml
>>=20
>> diff --git a/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16=
xx=2Eyaml b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx=2E=
yaml
>> new file mode 100644
>> index 000000000=2E=2Eb563c6e1e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx=2Eya=
ml
>> @@ -0,0 +1,471 @@
>> +# SPDX-License-Identifier: (GPL-2=2E0-only OR BSD-2-Clause)
>> +%YAML 1=2E2
>> +---
>> +$id: http://devicetree=2Eorg/schemas/auxdisplay/titanmec,tm16xx=2Eyaml=
#
>> +$schema: http://devicetree=2Eorg/meta-schemas/core=2Eyaml#
>> +
>> +title: Auxiliary displays based on TM16xx and compatible LED controlle=
rs
>> +
>> +maintainers:
>> +  - Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail=2Ecom>
>> +
>> +description: |
>> +  LED matrix controllers used in auxiliary display devices that drive =
individual
>> +  LED icons and 7-segment digit groups through a grid/segment addressi=
ng scheme=2E
>> +  Controllers manage a matrix of LEDs organized as grids (columns/bank=
s in
>> +  vendor datasheets) and segments (rows/bit positions in vendor datash=
eets)=2E
>> +  Maximum grid and segment indices are controller-specific=2E
>> +
>> +  The controller is agnostic of the display layout=2E Board-specific L=
ED wiring is
>> +  described through child nodes that specify grid/segment coordinates =
for
>> +  individual icons and segment mapping for 7-segment digits=2E
>> +
>> +  The bindings use separate 'leds' and 'digits' containers to accommod=
ate
>> +  different addressing schemes:
>> +  - LEDs use 2-cell addressing (grid, segment) for matrix coordinates
>> +  - Digits use 1-cell addressing with explicit segment mapping
>> +
>> +  Optional keypad scanning is supported when both 'linux,keymap' and
>> +  'poll-interval' properties are specified=2E
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      # Controllers with titanmec,tm1628 fallback
>
>Drop comment, obvious=2E Schema tells that=2E
>

Well received=2E

>> +      - items:
>> +          - enum:
>> +              - fdhisi,fd628
>> +              - princeton,pt6964
>> +              - wxicore,aip1628
>> +          - const: titanmec,tm1628
>> +      - const: titanmec,tm1628
>
>This is part of one enum
>
>> +      # Controllers with titanmec,tm1618 fallback
>> +      - items:
>> +          - enum:
>> +              - wxicore,aip1618
>> +          - const: titanmec,tm1618
>> +      - const: titanmec,tm1618
>
>Enum=2E=2E=2E
>
>> +      # Controllers with titanmec,tm1650 fallback
>> +      - items:
>> +          - enum:
>> +              - fdhisi,fd650
>> +              - wxicore,aip650
>> +          - const: titanmec,tm1650
>> +      - const: titanmec,tm1650
>> +      # Canonical standalone controllers
>
>Drop
>
>> +      - const: fdhisi,fd620
>> +      - const: fdhisi,fd655
>> +      - const: fdhisi,fd6551
>> +      - const: titanmec,tm1620
>> +      - const: titanmec,tm1638
>> +      - const: winrise,hbs658
>
>This is one enum
>

Well received=2E I followed the older style and will adopt the modern appr=
oach:

properties:
  compatible:
    items:
      - enum:
          - fdhisi,fd628
          - princeton,pt6964
          - wxicore,aip1628
          - wxicore,aip1618
          - fdhisi,fd650
          - wxicore,aip650
          - fdhisi,fd620
          - fdhisi,fd655
          - fdhisi,fd6551
          - titanmec,tm1620
          - titanmec,tm1638
          - winrise,hbs658
      - enum:
          - titanmec,tm1628
          - titanmec,tm1618
          - titanmec,tm1650
    minItems: 1
    maxItems: 2

Fallback relationships will be documented explicitly in the binding=E2=80=
=99s description=2E

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  label:
>> +    description: Name of the entire device
>> +    default: display
>
>Huh? Why do you need label? Are you sure auxdisplays have labels?
>
>

Display integrates with the LED subsystem (/sys/class/leds), where label i=
s
a standard property per leds/common=2Eyaml=2E It ensures predictable LED c=
lass
device naming when multiple display instances are present, following estab=
lished
LED subsystem conventions rather than general DT naming rules=2E

If helpful, I can add a $ref to /schemas/leds/common=2Eyaml#/properties/la=
bel
or include its description explicitly=2E

>> +
>> +  default-brightness:
>> +    description:
>> +      Brightness to be set if LED's default state is on=2E Used only d=
uring
>> +      initialization=2E If the option is not set then max brightness i=
s used=2E
>> +    $ref: /schemas/types=2Eyaml#/definitions/uint32
>> +
>> +  max-brightness:
>> +    description:
>> +      Normally the maximum brightness is determined by the hardware an=
d this
>> +      property is not required=2E This property is used to put a softw=
are limit
>> +      on the brightness apart from what the driver says, as it could h=
appen
>> +      that a LED can be made so bright that it gets damaged or causes =
damage
>> +      due to restrictions in a specific system, such as mounting condi=
tions=2E
>> +    $ref: /schemas/types=2Eyaml#/definitions/uint32
>> +
>> +  linux,keymap:
>> +    $ref: /schemas/input/matrix-keymap=2Eyaml#/properties/linux,keymap
>> +
>> +  poll-interval:
>> +    $ref: /schemas/input/input=2Eyaml#/properties/poll-interval
>> +
>> +  autorepeat:
>> +    $ref: /schemas/input/input=2Eyaml#/properties/autorepeat
>
>You rather miss some reference to input or touchscreen=2E
>

Well received=2E I will replace the individual references with:

allOf:
  - $ref: /schemas/input/input=2Eyaml#
  - $ref: /schemas/input/matrix-keymap=2Eyaml#

>> +
>> +  digits:
>> +    type: object
>> +    description: Container for 7-segment digit group definitions
>
>additionalProperties go here
>
>and blank line
>
>> +    properties:
>> +      "#address-cells":
>> +        const: 1
>> +      "#size-cells":
>> +        const: 0
>> +
>> +    patternProperties:
>> +      "^digit@[0-9]+$":
>> +        type: object
>
>unevaluatedProperties
>
>Blank line
>
>> +        properties:
>> +          reg:
>> +            description: Digit position identifier
>> +            maxItems: 1
>
>Blank line
>

Well received=2E

>> +          segments:
>> +            $ref: /schemas/types=2Eyaml#/definitions/uint32-matrix
>> +            description: |
>> +              Array of grid/segment coordinate pairs for each 7-segmen=
t position=2E
>> +              Each entry is <grid segment> mapping to standard 7-segme=
nt positions
>> +              in order: a, b, c, d, e, f, g
>> +
>> +              Standard 7-segment layout:
>> +                 aaa
>> +                f   b
>> +                f   b
>> +                 ggg
>> +                e   c
>> +                e   c
>> +                 ddd
>> +            items:
>> +              items:
>> +                - description: Grid index
>> +                - description: Segment index
>> +            minItems: 7
>> +            maxItems: 7
>> +        required:
>> +          - reg
>> +          - segments
>> +        unevaluatedProperties: false
>> +
>> +    additionalProperties: false
>> +
>> +  leds:
>> +    type: object
>> +    description: Container for individual LED icon definitions
>> +    properties:
>> +      "#address-cells":
>> +        const: 2
>> +      "#size-cells":
>> +        const: 0
>> +
>> +    patternProperties:
>> +      "^led@[0-9]+,[0-9]+$":
>> +        type: object
>> +        $ref: /schemas/leds/common=2Eyaml#
>> +        properties:
>> +          reg:
>> +            description:
>> +              Grid and segment indices as <grid segment> of this indiv=
idual LED icon
>> +        required:
>> +          - reg
>> +        unevaluatedProperties: false
>> +
>> +    additionalProperties: false
>
>Best regards,
>Krzysztof
>

Thanks for your detailed feedback=2E

Best regards,
Jean-Fran=C3=A7ois Lessard

