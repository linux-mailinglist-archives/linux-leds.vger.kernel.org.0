Return-Path: <linux-leds+bounces-5327-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0ECB3C0A3
	for <lists+linux-leds@lfdr.de>; Fri, 29 Aug 2025 18:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3C6B7ADDB6
	for <lists+linux-leds@lfdr.de>; Fri, 29 Aug 2025 16:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7004A322C9B;
	Fri, 29 Aug 2025 16:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9UBvjO+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D11F8F48;
	Fri, 29 Aug 2025 16:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756484783; cv=none; b=PU2vcT9xigo/uAfGoP0XTF9N5mQqTg9tpTdT+TmgqiOJ2rqVhdy55I9l4SRsWjMTg6m9baf2cMUDcFbmPVqQQLN5iix3qsGFThXfCxlhLB2noGDcK8q8+LhQDTfUNfggrhNnasNAdVAGdn6Cu96eJa02otS87lrGvAwiHETAHHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756484783; c=relaxed/simple;
	bh=/mDnpOl/9+isTDDosHQhhnNoZz0Y1LASsQtQyRJIOVU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=FtfZEQ3+PQzzaKVgFf16ltDbsac6/dKRtUjOjyjSf4cMa0XN50HaBdaIsJh8eyTgl6Fg3KWUPgw3yUXSaYRbANB7R4tOHoRSE50v2Q7W+JTQuDY8HNIuR6c1CE1ELkDN8XJemIRPDJWclkmZE81WloaoyMRHrJbmH4BP18ePH9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9UBvjO+; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4b30f73caa3so6196291cf.0;
        Fri, 29 Aug 2025 09:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756484780; x=1757089580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/14Zwbw37B0f5hLQ/tEtyWs9vy4aNBGfPd9hhrfG/9A=;
        b=Z9UBvjO+bm+Ecsp1AM0QbfHxwZLOuBmdRZIBgzJOM1ZEAKdrX0vPxX2tOUcco50mDr
         w6264XnPpj/xmxTUK0JvopZCYaI3et4HsrAL96haAupA7i9pLMftDnJkJZP9jhrTuTlG
         Bn/ccusmxufvhkXfcJ/Toaj3nrGCCtbOB1E46ZQIsWrADFe0/IBp92mTwp2RdyA1xsOZ
         6aKlyy3b1ImoTIh6xJnCGaOaCX2J9XmCsoE3urx71nHPyirjVoozLKgToGJYLgKSl+7k
         Jjb3jL9DfxBN1uvcsjpnmpo6sYW3cqhyfpUrSldZtCg38nnZ/Gq9lbH4k1LTJt3FdN0O
         NbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756484780; x=1757089580;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/14Zwbw37B0f5hLQ/tEtyWs9vy4aNBGfPd9hhrfG/9A=;
        b=ImpUVBn8zIzffVwVtrZ6JGPGUaG+t/wR95oidfIw8jSBE0pvRqSZSkEBS4p52jiht2
         WPCold7NYXRp/YfynV3uqmuUhExe4BT8WMVgNsh7qeP7h3nZD3e++HNeATn+B5tNT8h0
         lmFwIW9EWpcbXxFzItkjIjHOpEfwwozvd9XgYVQHqD2w/RNuhitXLrhq+nvTWSy7s+Uz
         oPIY4dDkcBukT8Ma50xhcXg4T/nT9adbgeOvR+GJkVLkZX87fN2fdcSWz52OCFUJnRai
         o/wN4ztJ5berofOgDM02agsvVxnCOlavudfnlnLTsDSKyEZZ94zoqIW0NL05LTIovJ2O
         8qfw==
X-Forwarded-Encrypted: i=1; AJvYcCUjKauDMizvdDUQXt9y2LY9FOqzqveeBEpF34Bzm5hbw9UMzL681AgtIQKZMWHRgNq9kd8MYT2z0xjI2HGV@vger.kernel.org, AJvYcCXLyCH0RzzD+vOuAPqekFZHjN+Gamk7M+mX0orIN25DU79KO/4jaWy1wT01hQbqbi87mw+aVnFNwoXEWQ==@vger.kernel.org, AJvYcCXk853DK5IcoWNDnpl/GA2Ktfbz6ldpEeMoojshykArw1u7vDJAO8Y1ET10+Zp52mWPVqhCLB+OA3+A@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5wX/fFd2+QqG/tTlAX4a0WZcN/HmUVIGNez7NB4pTBaU67CTP
	fYuZE8TphdL8hfOOdGstlHqicqG46oy9obbofC7hPG5QZMQKedh7mCcw
X-Gm-Gg: ASbGncu0H0fnDPvI8qPvYbgs4TfaIMSoZSherTpjSvQEeOw/bNjyfn4sStX/kafAK3c
	sE44zBrmVVPKuR2K2rs+xgWmkgZsTHI5yIkc9K/q3Duz97Ku8svdY8dr3MmPa42JHoVwfh+6k+V
	9iPY5Y4ELgM/BEHCVXpluNa/Jo7hM0gHnmeZ3KjQK8gG43Zgyt7wWykQ0PKRCR+Rb9gfECPs27k
	jcOV6gBIxePW81DN9tXBLcch0+JfQheDkLiTz2bnOhfc+xJYEWsLdjRp1mix2UkxzkygRwCLlm/
	C6tPE4yj0XdI9d6NzW6doFZMCZJJ8ek0wfkOsi3HxsfLfm4w4XyjlDsHLfeIJu6v83oO/WEU3U8
	lhPRlMcPYAhhJbORmpSxvvX8fRW7wKJXT1iVZKM40lvfWk3kCPGml2kmUpYDW8Q9YvhIJAzgvzi
	4K5XMQs/vN30h63a9i
X-Google-Smtp-Source: AGHT+IFh9wwoiuIfBUtcmBE/MpgX0wFBvsa3BftJZ0n2FPns/DGyzm8H2RX6nDg9CtbWInaln5/RdA==
X-Received: by 2002:a05:622a:5c99:b0:4b0:da5c:e250 with SMTP id d75a77b69052e-4b2aab1ce03mr365938191cf.59.1756484779764;
        Fri, 29 Aug 2025 09:26:19 -0700 (PDT)
Received: from ehlo.thunderbird.net (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e647b187dsm18496356d6.73.2025.08.29.09.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 09:26:19 -0700 (PDT)
Date: Fri, 29 Aug 2025 12:26:17 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Rob Herring <robh@kernel.org>
CC: Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_2/6=5D_dt-bindings=3A_auxdisp?=
 =?US-ASCII?Q?lay=3A_add_Titan_Micro_Electronics_TM16xx?=
User-Agent: Thunderbird for Android
In-Reply-To: <20250829152613.GA795028-robh@kernel.org>
References: <20250825033237.60143-1-jefflessard3@gmail.com> <20250825033237.60143-3-jefflessard3@gmail.com> <20250825182521.GA4157069-robh@kernel.org> <44C925EA-73CF-46C3-86C4-BD8ECD33AE00@gmail.com> <20250829152613.GA795028-robh@kernel.org>
Message-ID: <DDA3E474-F020-454C-ACCC-E340424BA9C0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 29 ao=C3=BBt 2025 11 h 26 min 13 s HAE, Rob Herring <robh@kernel=2Eorg> =
a =C3=A9crit=C2=A0:
>On Mon, Aug 25, 2025 at 09:33:58PM -0400, Jean-Fran=C3=A7ois Lessard wrot=
e:
>> Le 25 ao=C3=BBt 2025 14 h 26 min 57 s HAE, Rob Herring <robh@kernel=2Eo=
rg> a =C3=A9crit=C2=A0:
>> >On Sun, Aug 24, 2025 at 11:32:28PM -0400, Jean-Fran=C3=A7ois Lessard w=
rote:
>> >> Add documentation for TM16xx-compatible 7-segment LED display contro=
llers
>> >> with keyscan=2E
>> >>=20
>> >> Signed-off-by: Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail=2Ecom>
>> >> ---
>> >>=20
>> >> Notes:
>> >>     The 'segments' property is intentionally not vendor-prefixed as =
it
>> >>     defines a generic hardware description concept applicable to any
>> >>     7-segment display controller=2E The property describes the funda=
mental
>> >>     grid/segment coordinate mapping that is controller-agnostic and =
could
>> >>     be reused by other LED matrix display bindings=2E Similar to how=
 'gpios'
>> >>     describes GPIO connections generically, 'segments' describes seg=
ment
>> >>     connections in a standardized way using uint32-matrix format=2E
>> >>=20
>> >>  =2E=2E=2E/bindings/auxdisplay/titanmec,tm16xx=2Eyaml  | 477 +++++++=
+++++++++++
>> >>  MAINTAINERS                                   |   5 +
>> >>  2 files changed, 482 insertions(+)
>> >>  create mode 100644 Documentation/devicetree/bindings/auxdisplay/tit=
anmec,tm16xx=2Eyaml
>> >>=20
>> >> diff --git a/Documentation/devicetree/bindings/auxdisplay/titanmec,t=
m16xx=2Eyaml b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx=
=2Eyaml
>> >> new file mode 100644
>> >> index 000000000=2E=2Ec94556d95
>> >> --- /dev/null
>> >> +++ b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx=
=2Eyaml
>> >> @@ -0,0 +1,477 @@
>> >> +# SPDX-License-Identifier: (GPL-2=2E0-only OR BSD-2-Clause)
>> >> +%YAML 1=2E2
>> >> +---
>> >> +$id: http://devicetree=2Eorg/schemas/auxdisplay/titanmec,tm16xx=2Ey=
aml#
>> >> +$schema: http://devicetree=2Eorg/meta-schemas/core=2Eyaml#
>> >> +
>> >> +title: Auxiliary displays based on TM16xx and compatible LED contro=
llers
>> >> +
>> >> +maintainers:
>> >> +  - Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail=2Ecom>
>> >> +
>> >> +description: |
>> >> +  LED matrix controllers used in auxiliary display devices that dri=
ve individual
>> >> +  LED icons and 7-segment digit groups through a grid/segment addre=
ssing scheme=2E
>> >> +  Controllers manage a matrix of LEDs organized as grids (columns/b=
anks in
>> >> +  vendor datasheets) and segments (rows/bit positions in vendor dat=
asheets)=2E
>> >> +  Maximum grid and segment indices are controller-specific=2E
>>=20
>> In reference to max-brightness, I'll replace with:
>>=20
>> Maximum brightness and grid/segment indices are controller-specific=2E =
Controller-specific maximum are validated in the driver=2E
>>=20
>> >> +
>> >> +  The controller is agnostic of the display layout=2E Board-specifi=
c LED wiring is
>> >> +  described through child nodes that specify grid/segment coordinat=
es for
>> >> +  individual icons and segment mapping for 7-segment digits=2E
>> >> +
>> >> +  The bindings use separate 'leds' and 'digits' containers to accom=
modate
>> >> +  different addressing schemes:
>> >> +  - LEDs use 2-cell addressing (grid, segment) for matrix coordinat=
es
>> >> +  - Digits use 1-cell addressing with explicit segment mapping
>> >> +
>> >> +  The controller node exposes a logical LED-like control for the ag=
gregate
>> >> +  display brightness=2E Child nodes describe individual icons and 7=
-seg digits=2E
>> >> +  The top-level control supports only label and brightness-related =
properties
>> >> +  and does not support other common LED properties such as color or=
 function=2E
>> >> +  Child LED nodes use the standard LED binding=2E
>> >> +
>> >> +  Optional keypad scanning is supported when both 'linux,keymap' an=
d
>> >> +  'poll-interval' properties are specified=2E
>> >> +
>> >> +properties:
>> >> +  compatible:
>> >> +    oneOf:
>> >> +      - items:
>> >> +          - enum:
>> >> +              - fdhisi,fd628
>> >> +              - princeton,pt6964
>> >> +              - wxicore,aip1628
>> >> +          - const: titanmec,tm1628
>> >> +      - items:
>> >> +          - enum:
>> >> +              - wxicore,aip1618
>> >> +          - const: titanmec,tm1618
>> >> +      - items:
>> >> +          - enum:
>> >> +              - fdhisi,fd650
>> >> +              - wxicore,aip650
>> >> +          - const: titanmec,tm1650
>> >> +      - enum:
>> >> +          - fdhisi,fd620
>> >> +          - fdhisi,fd655
>> >> +          - fdhisi,fd6551
>> >> +          - titanmec,tm1618
>> >> +          - titanmec,tm1620
>> >> +          - titanmec,tm1628
>> >> +          - titanmec,tm1638
>> >> +          - titanmec,tm1650
>> >> +          - winrise,hbs658
>> >> +
>> >> +  reg:
>> >> +    maxItems: 1
>> >> +
>> >> +  label:
>> >> +    description:
>> >> +      The label for the top-level LED=2E If omitted, the label is t=
aken from the
>> >> +      node name (excluding the unit address)=2E It has to uniquely =
identify a
>> >> +      device, i=2Ee=2E no other LED class device can be assigned th=
e same label=2E
>> >> +    $ref: /schemas/leds/common=2Eyaml#/properties/label
>> >> +
>> >> +  max-brightness:
>> >> +    description:
>> >> +      Normally the maximum brightness is determined by the hardware=
 and this
>> >> +      property is not required=2E This property is used to put a so=
ftware limit
>> >> +      on the brightness apart from what the driver says, as it coul=
d happen
>> >> +      that a LED can be made so bright that it gets damaged or caus=
es damage
>> >> +      due to restrictions in a specific system, such as mounting co=
nditions=2E
>> >> +    $ref: /schemas/leds/common=2Eyaml#/properties/max-brightness
>> >
>> >These 2 $ref's should be at the node level=2E The clue is you=20
>> >copied-n-pasted the whole description=2E
>> >
>>=20
>> I'll add:
>>=20
>> allOf:
>>   - $ref: /schemas/leds/common=2Eyaml#
>>=20
>> at the node level and constrain inapplicable LED properties (color, fun=
ction)
>> using properties: false since this auxdisplay device integrates with LE=
D
>> subsystem for brightness control=2E
>>=20
>> >What you need here is some constraints=2E What's the max value?
>> >
>>=20
>> Maximum brightness varies by controller:
>> - TM1618/TM1628/TM1638 support levels 0-8
>> - TM1650 supports levels 0-8
>> - TM1620 supports levels 0-3
>> I'll set the schema maximum to 8:
>>=20
>> max-brightness:
>>   maximum: 8  # Maximum across all TM16xx controllers
>>=20
>> with the top-level description note that actual limits are controller-d=
ependent
>> and are enforced by the driver=2E
>>=20
>> >> +
>> >> +  default-brightness:
>> >> +    description:
>> >> +      Brightness to be set if LED's default state is on=2E Used onl=
y during
>> >> +      initialization=2E If the option is not set then max brightnes=
s is used=2E
>> >> +    $ref: /schemas/types=2Eyaml#/definitions/uint32
>> >
>> >This needs to first go into leds/common=2Eyaml=2E
>> >
>>=20
>> Given its specific relevance to this auxdisplay use case rather than ge=
neral LED
>> behavior, I am not sure it's worth adding default-brightness to LEDs/co=
mmon=2Eyaml
>> If broader LED subsystem adoption is wanted, I am willing to submit a s=
eparate
>> patch to this series to add it=2E
>>=20
>> Otherwise, existing precedent in backlight/common=2Eyaml and leds/leds-=
pwm=2Eyaml
>> would advocate for defining it locally=2E
>
>The type for a property should really only be set in 1 place=2E Otherwise=
,=20
>it is easy to define different types for the same property (which we=20
>have and have to deal with some)=2E=20
>
>Given we now have 2 cases for LEDs, it should at least be in=20
>leds/common=2Eyaml=2E Should there be 1 definition for both backlight and=
=20
>LEDs, yes=2E But I can live with 2 definitions in common bindings for now=
=2E
>

Understood=2E I'll add default-brightness definition to leds/common=2Eyaml=
=2E

>> >> +
>> >> +  digits:
>> >> +    type: object
>> >> +    description: Container for 7-segment digit group definitions
>> >> +    additionalProperties: false
>> >> +
>> >> +    properties:
>> >> +      "#address-cells":
>> >> +        const: 1
>> >> +      "#size-cells":
>> >> +        const: 0
>> >> +
>> >> +    patternProperties:
>> >> +      "^digit@[0-9]+$":
>> >> +        type: object
>> >> +        unevaluatedProperties: false
>> >> +
>> >> +        properties:
>> >> +          reg:
>> >> +            description: Digit position identifier
>> >
>> >Position is right to left (0 on right)? Please clarify=2E
>> >=20
>>=20
>> I'll clarify: digit positions are numbered sequentially left-to-right,=
=20
>> with reg=3D0 representing the leftmost digit position as displayed to t=
he user=2E
>>=20
>> >> +            maxItems: 1
>> >> +
>> >> +          segments:
>> >> +            $ref: /schemas/types=2Eyaml#/definitions/uint32-matrix
>> >> +            description: |
>> >> +              Array of grid/segment coordinate pairs for each 7-seg=
ment position=2E
>> >> +              Each entry is <grid segment> mapping to standard 7-se=
gment positions
>> >> +              in order: a, b, c, d, e, f, g
>> >> +
>> >> +              Standard 7-segment layout:
>> >> +                 aaa
>> >> +                f   b
>> >> +                f   b
>> >> +                 ggg
>> >> +                e   c
>> >> +                e   c
>> >> +                 ddd
>> >> +            items:
>> >> +              items:
>> >> +                - description: Grid index
>> >> +                - description: Segment index
>> >
>> >Can't you do an array instead and make the array index be the grid or=
=20
>> >segment index?
>> >
>>=20
>> Original design was array-based:
>> - titanmec,digits: array of grid indices
>> - titanmec,segment-mapping: array of segment indices for a,b,c,d,e,f,g
>> - titanmec,transposed: boolean for matrix-transposed cases
>>=20
>> The current explicit coordinate approach was adopted based on v2 feedba=
ck and
>> handles both standard and transposed wiring patterns effectively, where
>> manufacturers swap grid/segment relationships:
>> - Standard: digit segments use same grid, different segments =20
>> - Transposed: digit segments use same segment, different grids
>> It also future-proofs potential irregular wiring patterns where individ=
ual
>> digits might have different grid/segment relationships=2E
>>=20
>> Unless you have strong objections, I prefer to keep this approach to av=
oid
>> further churn, as it's proven to handle all the real-world board layout=
s
>> encountered=2E
>
>2 arrays would not be an improvement=2E So leave it as you have it=2E
>

Acknowledged=2E I'll keep segments as uint32-matrix=2E=20

Thank you,
Jean-Fran=C3=A7ois Lessard


