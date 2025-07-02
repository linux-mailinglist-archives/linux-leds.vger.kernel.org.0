Return-Path: <linux-leds+bounces-4966-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAA1AF6009
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jul 2025 19:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55FC016CD6C
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jul 2025 17:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5E41BEF8C;
	Wed,  2 Jul 2025 17:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtBWkuFb"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9112F50B2;
	Wed,  2 Jul 2025 17:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751477462; cv=none; b=VozDvwLoHqNLl2+cLGik4qnvASVY4/VqaUYYcnp69T0Su09ye3vC8FD2xj29U52bKL9hDeKMqBdHU8gPmcjRSsQZEfvvQOB/yb6pWmF6hou0f8rsVvtpD4Ib28kfogLt0WU1r6JIwKp3EGgVNxhFrI8PUTBzjHEg5XuzvDhrqh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751477462; c=relaxed/simple;
	bh=C1LdBC4LuD44d7hUjwdY9EEGR+6QJnAke1i5MtV8vxw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ssFy2g+67OFVwVS3blPwVZfp10WgTO/1HuvGG5ZICtrG6VHlZqpHuCfaR9iPt47Km1NzmzO5ePid0dX+Z11PiTyhliR2PUMPCUfITxiUN+J5pB1Df4WTDRUhXllmhba34lBCsD78RD8VgK8wzoqqWdvwsP/ISUR/alCMBGR3dcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtBWkuFb; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7d098f7bd77so21202885a.0;
        Wed, 02 Jul 2025 10:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751477459; x=1752082259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ndYKiAKVjPYkXSpFmsCIucQmR2rCJ8etf0jAyQI2Hww=;
        b=dtBWkuFb9JNMFWya8g04hxMe/g6OH9kTcT8gBljLjJ83iQR9z6ejpclhiEZi65Zx9f
         Z9GT/sdmfhF4SQZYLDvFOQ+ghVidbOCmSjyDK320zsiEgj5L/RTmh922wlbK15WZwawp
         lo+GXYAlHY+MZTspnCuhbANLyVQ2NwhwGWKZkSsmeol24N86W8WEhaExNuF/gHGS+14S
         2RBwFTDtdAduM5bN0hfzbOm/6NSROsgTxj1VujFOOBtiI3wBttuwl33+wzpCQiIjCEau
         GE7SqAXaK+376Ol018HQt9LhrMqQuukOtuOCPLZD5dIpRvjZ6doAwi7e0E5dGW6uKR6R
         9tEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751477459; x=1752082259;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ndYKiAKVjPYkXSpFmsCIucQmR2rCJ8etf0jAyQI2Hww=;
        b=YNvXlKLeKEISgRDaf8gLKS1xzYMV/CK3cQ6VP/wE1oIfqmFAHOfkqUMrW0MxOah1wK
         6r8SpJFXCreXuh85GDEq2qM+tBO//7kA6ChbXiRbcVy2utQvbITyBMcyVcEBXUvl1HA2
         UwtmPKKNBTe+3wvz9QEC8Q1efGfjsKAO1CZgkf+gHPo5oDfvPAmM2EHBVWa4tgTJeYiq
         qS/wMOZyOU41i3nVXeiAZHWPz3bsOa7ORPDgSRvh/TY5gS8/srn+LXposQB3vSUF5hPu
         WIKqxfrY50CUlMLSs/Z1huvTWwNlP1Jpk0EWFdcN2If0A08jZjd9G1mVdlaM6KkXjDYY
         QHJw==
X-Forwarded-Encrypted: i=1; AJvYcCVHC276rAAlM364Dq3cPppVFtVy+B0jcJJ0h5mKshadJb4Uywv1di7/jdVeTDyeEVcb4KyLL+2Z10CgZw==@vger.kernel.org, AJvYcCVnMnOFQH6U+/pXFIkpRNNJWvBSqRrbWT+eJQ/JTgqO8kpGs+ZCFvXr/uRwgn1TR6RgTISs15AqhEy3tPJK@vger.kernel.org, AJvYcCX2EJ6HjPxHCM+25QoV6WU36OPXFpCsCFklhLBcWmJEDmrkit4adE6Q5C0Y1MjRMnqOsHrXIgFaMShp@vger.kernel.org
X-Gm-Message-State: AOJu0YwaY/JUmRq636gesPkmfUyoUJsiDJQONNngcYyXK1ziLdUyjAHE
	AzvV2yVwjXz5gfrEw9yZIbLG+/RwcRTjU1y9ChcRS8EHht7cdZ9l/U6b
X-Gm-Gg: ASbGncsWdobdaAz9CSE+XrjQhWTbbB6/pOb1ROZaSF/kR+z01KuLiTfuV76VTud3i4B
	fU4DSF7wGf3jKZsQ1gFEltdv3rH5KeFZrgNAe/tIMnNwf/blW/VZpxMYLw+Vl9zSqk0f2RCpV87
	q7E9APCd2y5q7uQOHBK5+cBbEseNSCGO51FCL0LdmIMVREZVpUG8qS4mDpZuD70y34ocVaIcU3L
	9Jc90brt/wr0FQAlFWi1941hT4C0/YWe6L1SmqRValpmg76PV874wMEbxasYm5x7ylONUAzZIzD
	I/h1ItHhoWRYe6zGgb0GaRkMpbOSH1cto/0UD2bfPJ9rlGSXS/sf6TAXz8DkAtclkdJUQf4ZTro
	jtSNpwOPVv5A68++BanFMKzTd/QpCVsuKVRJcrtyNP4R0
X-Google-Smtp-Source: AGHT+IFeBeCsAvCm7OWIOr/ru6PvpbXoVJiRauB+HqtIkykPzfXtjGL6cF3HtgJRd/+a2aB+REX1/g==
X-Received: by 2002:a05:620a:1999:b0:7cf:5cdb:7b68 with SMTP id af79cd13be357-7d5d13900b4mr53222785a.0.1751477459088;
        Wed, 02 Jul 2025 10:30:59 -0700 (PDT)
Received: from [127.0.0.1] (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44313926asm969692485a.22.2025.07.02.10.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 10:30:58 -0700 (PDT)
Date: Wed, 02 Jul 2025 13:30:58 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
 Boris Gjenero <boris.gjenero@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Paolo Sabatino <paolo.sabatino@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_6/8=5D_dt-bindings=3A_auxdisp?=
 =?US-ASCII?Q?lay=3A_add_Titan_Micro_Electronics_TM16XX?=
User-Agent: Thunderbird for Android
In-Reply-To: <daa343f9-b5eb-4a46-8c3a-f5c07603a9f1@kernel.org>
References: <20250629130002.49842-1-jefflessard3@gmail.com> <20250629130002.49842-8-jefflessard3@gmail.com> <d3d8f72a-e4fe-4f85-8ead-6c104aa32893@kernel.org> <F09B92C5-9FF0-4818-9BF9-EFA4A456399C@gmail.com> <daa343f9-b5eb-4a46-8c3a-f5c07603a9f1@kernel.org>
Message-ID: <B57E9DD6-52F5-4522-AB80-EF0AEEAED5C0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 2 juillet 2025 11 h 02 min 11 s HAE, Krzysztof Kozlowski <krzk@kernel=2E=
org> a =C3=A9crit=C2=A0:
>On 01/07/2025 05:22, Jean-Fran=C3=A7ois Lessard wrote:
>> Le 30 juin 2025 02 h 19 min 11 s HAE, Krzysztof Kozlowski <krzk@kernel=
=2Eorg> a =C3=A9crit=C2=A0:
>>> On 29/06/2025 14:59, Jean-Fran=C3=A7ois Lessard wrote:
>>>> Add documentation for Titanmec TM16XX and compatible LED display cont=
rollers=2E
>>>>
>>>> This patch is inspired by previous work from Andreas F=C3=A4rber and =
Heiner Kallweit=2E
>>>
>>> Please wrap commit message according to Linux coding style / submissio=
n
>>> process (neither too early nor over the limit):
>>> https://elixir=2Ebootlin=2Ecom/linux/v6=2E4-rc1/source/Documentation/p=
rocess/submitting-patches=2Erst#L597
>>>
>>> Please do not use "This commit/patch/change", but imperative mood=2E S=
ee
>>> longer explanation here:
>>> https://elixir=2Ebootlin=2Ecom/linux/v5=2E17=2E1/source/Documentation/=
process/submitting-patches=2Erst#L95
>>>
>>>>
>>>> Co-developed-by: Andreas F=C3=A4rber <afaerber@suse=2Ede>
>>>> Co-developed-by: Heiner Kallweit <hkallweit1@gmail=2Ecom>
>>>> Signed-off-by: Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail=2Ecom>
>>>> ---
>>>>  =2E=2E=2E/bindings/auxdisplay/titanmec,tm16xx=2Eyaml  | 210 ++++++++=
++++++++++
>>>>  1 file changed, 210 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/auxdisplay/tita=
nmec,tm16xx=2Eyaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/auxdisplay/titanmec,tm=
16xx=2Eyaml b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx=
=2Eyaml
>>>> new file mode 100644
>>>> index 0000000000=2E=2E65c43e3ba4
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx=2E=
yaml
>>>> @@ -0,0 +1,210 @@
>>>> +# SPDX-License-Identifier: (GPL-2=2E0-only OR BSD-2-Clause)
>>>> +%YAML 1=2E2
>>>> +---
>>>> +$id: http://devicetree=2Eorg/schemas/auxdisplay/titanmec,tm16xx=2Eya=
ml#
>>>
>>> Why isn't this in leds directory? Everything below describes it as LED
>>> controller=2E
>>>
>>=20
>> TM16XX controllers are commonly used as auxiliary display drivers in co=
nsumer Android-based TV boxes for driving 7-segment and icon displays, rath=
er than for generic LEDs=2E
>>=20
>> Previous attempts to place TM1628 drivers under LED subsystem were NAK=
=E2=80=99ed by LED maintainers, with Pavel Machek recommending drivers/auxd=
isplay instead (see https://lore=2Ekernel=2Eorg/linux-devicetree/2020022613=
0300=2EGB2800@duo=2Eucw=2Ecz/)=2E
>
>OK, it's fine=2E If you want to avoid the same question at v3, v4 and v5,
>please mention this in the patch changelog=2E
>

Well noted=2E Will mention for next submissions=2E

>=2E=2E=2E
>
>>>> +  compatible:
>>>> +    enum:
>>>> +      - titanmec,tm1618
>>>> +      - titanmec,tm1620
>>>> +      - titanmec,tm1628
>>>> +      - titanmec,tm1650
>>>> +      - fdhisi,fd620
>>>> +      - fdhisi,fd628
>>>> +      - fdhisi,fd650
>>>> +      - fdhisi,fd6551
>>>> +      - fdhisi,fd655
>>>> +      - icore,aip650
>>>> +      - icore,aip1618
>>>> +      - icore,aip1628
>>>> +      - princeton,pt6964
>>>> +      - winrise,hbs658
>>>
>>> Several devices are compatible, so express it here and drop redundant
>>> entries in the driver=2E
>>>
>>=20
>> I understand the concern=2E I would appreciate your guidance since thes=
e are not always direct aliases=2E E=2Eg=2E:
>> - tm1620 and fd620 varies on which bit is used for the 8th segment=20
>> - fd655 and fd650 have no titanmec counterpart
>> - hbs658 is similar to tm1628, yet distinct
>
>You did not get the point=2E I did not ask to make incompatible devices a=
s
>compatible=2E I asked to make compatible devices compatible=2E
>

I apologize for misunderstanding your original ask=2E Let me retry=2E

>Also wrap your emails to mailing list style=2E It's very difficult to rea=
d
>and respond to them=2E
>

Well noted

>
>>=20
>> We could keep only known distinct implementations, that would yield to:
>>       - titanmec,tm1618
>>       - titanmec,tm1620
>>       - titanmec,tm1628
>>       - titanmec,tm1650
>>       - fdhisi,fd620
>>       - fdhisi,fd650
>>       - fdhisi,fd6551
>>       - fdhisi,fd655
>>       - winrise,hbs658
>
>I do not see compatibility expressed=2E You need front compatible and
>fallback=2E
>

Is this better representing your ask?

compatible:
  oneOf:
    - items:
        - const: fdhisi,fd628
        - const: titanmec,tm1628
    - items:
        - const: icore,aip1628
        - const: titanmec,tm1628
    - items:
        - const: titanmec,tm1628
    - items:
        - const: winrise,hbs658
    # =2E=2E=2Erepeat for each variant/alias/fallback

Then the driver would drop fdhisi,fd628 from the OF device table
as it would fallback to titanmec,tm1628

>>=20
>> Which would be inconsistent for cases where vendors appear for another =
variant=2E
>> e=2Eg=2E fdhisi,fd628 now being aliased by titanmec,tm1628 while other =
fdhisi variants are listed=2E
>
>I don't understand what that means=2E I don't understand what aliased
>means=2E There is no such term in DT bindings=2E
>

If my understanding is now correct, the problem still applies but differen=
tly=2E
Some variants do not have a titanmec fallback=2E

For example, fdhisi,fd620 would be:
compatible:
  oneOf:
    - items:
        - const: fdhisi,fd620
        # no titanmec fallback

So compatible DT of fd620 would be:
compatible =3D "fdhisi,fd620";

While fd628 would be:
compatible =3D "fdhisi,fd628", "titanmec,tm1628";

Which is inconsistent in its application=2E

>>=20
>> Therefore I would suggest to keep fdhisi,fd628 even if implementation i=
s the same as titanmec,tm1628=2E
>
>I don't understand the problem=2E

My suggestion would be to not define fallbacks for manufacturers which hav=
e any front variant

For example:

compatible:
  oneOf:
   - items:
        - const: fdhisi,fd620
    - items:
        - const: fdhisi,fd628
        # no fallback for fdhisi, documented as front
    - items:
        - const: icore,aip1628
        - const: titanmec,tm1628
    - items:
        - const: titanmec,tm1628
    - items:
        - const: winrise,hbs658

>
>>=20
>> icore and princeton could be dropped in favor of titanmec equivalents, =
at least for the variants I am aware of=2E Specific implementation for othe=
r variants can be let for future extension, if ever needed=2E
>
>No clue what you are saying here=2E
>

Only manufacturers that have existing fallback for all variants supported =
by the driver
would be documented as fallback=2E
Then only icore and princeton manufacturers would fallback to titanmec var=
iants=2E

>>=20
>> How would you approach this?
>
>You have compatible devices, yes?  If so, you drop irrelevant entries in
>device ID tables and use fallbacks in the bindings, just like roughly
>80% of devices in the bindings=2E
>
>>=20
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  titanmec,digits:
>>>> +    description: |
>>>> +      Array of grid (row) indexes corresponding to specific wiring o=
f digits in the display matrix=2E
>>>
>>> What is wiring of digits? This and other descriptions don't tell me mu=
ch=2E
>>>
>>=20
>> Controllers use a matrix to drive LEDs=2E Terminology used in datasheet=
s is:
>> - grids: matrix rows
>> - segments: matrix columns
>>=20
>> Board manufacturers wires display panels differently, including LEDs wh=
ich are parts of 7-segments:
>> - =E2=80=9Cdigits=E2=80=9D refers to the ordered list of GRID indices w=
ired to the physical 7-segment digit displays (arranged right to left)
>> - =E2=80=9Csegment-mapping=E2=80=9D defines how each SEGMENT index with=
in these grids maps to the standard 7-segment elements (a-g)
>>=20
>>> Wrap according to Linux coding style, so at 80=2E
>>>
>>>> +      Defines which grid lines are connected to digit elements=2E
>>>> +    $ref: /schemas/types=2Eyaml#/definitions/uint8-array
>>>> +    items:
>>>> +      minimum: 0
>>>> +      maximum: 7
>>>> +    minItems: 1
>>>> +    maxItems: 8
>>>> +
>>>> +  titanmec,segment-mapping:
>>>> +    description: |
>>>
>>> Do not need '|' unless you need to preserve formatting=2E
>>>
>>>> +      Array of segment (column) indexes specifying the hardware layo=
ut mapping used for digit display=2E
>>>> +      Each entry gives the segment index corresponding to a standard=
 7-segment element (a-g)=2E
>>>
>>> Wrap according to Linux coding style, so at 80=2E
>>>
>>> This looks like duplicating the reg property=2E
>>>
>>=20
>> While related, this is not replicating the reg property of led child no=
des=2E
>>=20
>> Each (grid,segment) combination might have a distinct role:
>> - part of a 7-segment: described using digits and segment-mapping prope=
rties
>> - individual led: described using led child nodes
>>=20
>>>
>>>> +    $ref: /schemas/types=2Eyaml#/definitions/uint8-array
>>>> +    items:
>>>> +      minimum: 0
>>>> +      maximum: 7
>>>> +    minItems: 7
>>>> +    maxItems: 7
>>>> +
>>>> +  titanmec,transposed:
>>>> +    description: |
>>>> +      Optional flag indicating if grids and segments are swapped com=
pared to standard matrix orientation=2E
>>>> +      This accommodates devices where segments are wired to rows and=
 grids to columns=2E
>>>> +    $ref: /schemas/types=2Eyaml#/definitions/flag
>>>> +
>>>> +  "#address-cells":
>>>> +    const: 2
>>>> +
>>>> +  "#size-cells":
>>>> +    const: 0
>>>> +
>>>> +patternProperties:
>>>> +  "^led@[0-7],[0-7]$":
>>>
>>> Why do you have two addresses? It's not used in your example=2E
>>>
>>=20
>> First is for the grid index, second of for the segment index=2E
>
>But it is not used=2E I really do not get why this is different than othe=
r
>matrix LED controllers=2E
>

You are right, addresses of child led nodes are not used by the driver=2E
But the 2 cells of the reg property are used by the driver=2E
Isn't it a common practice to match node addresses the reg property?

I will thoroughly review other matrix LED controllers again to better capt=
ure what I am missing here=2E

>>=20
>>>> +    $ref: /schemas/leds/common=2Eyaml#
>>>> +    properties:
>>>> +      reg:
>>>> +        description: Grid (row) and segment (column) index in the ma=
trix of this individual LED icon
>>>
>>> Missing constraints=2E
>>>
>>>> +    required:
>>>> +      - reg
>>>> +
>>=20
>> Well noted=2E
>>=20
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - titanmec,digits
>>>> +  - titanmec,segment-mapping
>>>> +
>>>> +additionalProperties: true
>>>
>>> No, this cannot be true=2E Look at any other binding, look at example-=
schema=2E
>>>
>>=20
>> I got misled by "spi-3wire" which is not defined in spi-peripheral-prop=
s=2Eyaml but only as a child node property of spi-controller=2Eyaml=2E
>>=20
>> I wasn't sure how to implement this correctly=2E I have reviewed existi=
ng examples and will replace with:
>>=20
>> if:
>>   properties:
>>     compatible:
>>       contains:
>>         enum:
>>           - titanmec,tm1618
>>           - titanmec,tm1620
>>           - titanmec,tm1628
>>           - fdhisi,fd620
>>           - fdhisi,fd628
>>           - winrise,hbs658
>> then:
>>   allOf:
>>     - $ref: /schemas/spi/spi-peripheral-props=2Eyaml#
>
>Why is this conditional? Are these devices with entirely different
>programming model? Then they usually should not be in the same binding,
>although depends on differences=2E
>

These are 3-wire SPI chips=2E The other ones are 2-wires I2C=2E

>>   properties:
>>     spi-3wire: true
>>   required:
>>     - spi-3wire
>

I can update to top-level "allOf" which contains the "if" as you suggested=
=2E

But additional "if" would be required for spi-3wire property to apply only=
 to SPI chips=2E

I thought top-level "if" containing "allOf" and properties/required would =
be DRY
as it would be the same exact condition and this syntax passes dt validati=
on=2E

Let me know your preference and I will adjust accordingly=2E

>
>
>Best regards,
>Krzysztof

Thanks for your time, patience and guidance,
Jean-Fran=C3=A7ois Lessard


