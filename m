Return-Path: <linux-leds+bounces-5312-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8EAB35103
	for <lists+linux-leds@lfdr.de>; Tue, 26 Aug 2025 03:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 035655E8067
	for <lists+linux-leds@lfdr.de>; Tue, 26 Aug 2025 01:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E481D5CE0;
	Tue, 26 Aug 2025 01:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTmQRtLd"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365BF8F58;
	Tue, 26 Aug 2025 01:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756172043; cv=none; b=h40FGEdmZwVn7OeziqzDExn92n7D+vCohbt2Te0d2z8Rlj3jdpzuNP+wMo71DWIBmm2W8feAnPwsRIAwZjbm5enPId3q/3n8ixe/WVM6ynqaMgDomivpeBpDGNZTUxOP3A4qug679tyInNL9hv2h0+cUfvZz/V8Xbwg8GXiSqrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756172043; c=relaxed/simple;
	bh=JljAl9r/j6PbHsICi+x7/AoZ/aU81SB4r7Vb0Z9T7Oo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=GibDuNcOU3uFb4GSmsvm6KtZxQmk1OmHRF9VAqcCbvxfGwuze13zzkDHgB5om1yqgks6tRMrsMdG7pxWbQEZe08GsGxin2dL3NstRrQDkpUmrcxYgEHxg62V3ydIm44uxNLEHCQSGNwMr342Ct8kH4lzcs04Zz1J4ZpbWcw8I+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTmQRtLd; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4b109a95f09so37605651cf.1;
        Mon, 25 Aug 2025 18:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756172040; x=1756776840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PUGk0ZKOd7yqSKxDow7E4tiDM13vj5YXyFH8cIUH+OM=;
        b=CTmQRtLdRc77E4pGUWCB5i5xrDpS6A/Jw/x3w+vwcxRLFjhP419/cbOqcfLfzTPcM2
         wIxfMSJRow3/j1e88tbPjPLT6sNmL9y0uV4mcFYs0yJUJJKOcG61Pv3GsYJNr463yxCQ
         VvMdzd5V4sHDRSLyOQJXqTt7t93TvPERv3Lu9om6DaG/XWl9nlTJycStAoztEdiqLbsp
         Mr7VeV2x+TQ4qokiztFO5WnlWaJRPD8LN7hwkw3KPYp9nU36epXiC7fhkJ/yHq83Wua+
         bAoqDEHobjjOiOm0EIGjHUFh7m4/WCt04x5GWl1Uh4Db1tOl/sy0LoSRE9dVAZbHCsHX
         mLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756172040; x=1756776840;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PUGk0ZKOd7yqSKxDow7E4tiDM13vj5YXyFH8cIUH+OM=;
        b=cxBQNHGWRgOFTdyWcGd+VEoB3wC8F61YqM8rKbl2mKisTUOku3CtOTNOCiVa+06aw+
         TWBGJr/IgV9vzDbDxIqotKrfwh+Nsl8kUaE4G9k0l524dbgjpT3AcW8hWpmE0xoOblNl
         /De13KKXSPjQvIuHcNQYH29r5d92YlOFSeCoQgOitOP9QFVp57YuXhKuASTjoK8ISjUM
         Sq5df0mBHlZuGBrTf4Re3OczsCbbcW5dGxyBFfW8jeepNfs4FRrEkUKVVgMvHTv7m3sK
         lvAwgBOGzE6L3loXJIcgiOeswYASQHBKxtSuTzOq9Ot3+y0PwdmwUIvEo48EizxIG8dO
         PGiw==
X-Forwarded-Encrypted: i=1; AJvYcCW5bD/zMok3sv74rEYzTfZSISOTeN3AHAas+ungeW9DbP4kz8P+cESyLGqzCf39duT9bUgEzIsEMb7J@vger.kernel.org, AJvYcCX23CTGUc3epmlh1t9O9Uq2BIJ+s+hLZfklPGnIt3X6PFPejrStqpsz5rVbBpZGFKWceRGa4ueeIYuJ2xXg@vger.kernel.org, AJvYcCXAEBz7/7nrhXnk/QaUYZBfJ2BArZRM2czaW2azkpAIeInS5dTOJRZ0Vc7PhIEgg7NgoF6LZ8+jdXS2tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxQ7K300ISe3WOxq5mQUzSwKmoJTNWwbH2MR8kwI88vUKVkoGC
	fivVLX42/i71utm+NwT0tsVeTA8IxgQrDGVQz+fXQ8jDdE8AVP+5ldMl
X-Gm-Gg: ASbGncvNDsHey4JbCyEweI8DVbnILEc7KRJglEFe+Zl3MVcO+a1Q4zlYBpF7HD58UIG
	bdvkokW1T3fBMmpjLceSUOUa2Ciq7abeQ8AuoATgKZqCiXuXkt5O+Lfivn+rikQM88LE8TlmwKf
	9ZUjOidfymZcTEGmrEFC5e8E9TWUuYnfNKrObebjQh1+/p7OFid5gB3aKAfYEP4DqGaJGtMmOZq
	7CSCB+Sj6asFSILqqk6WHqAc1nTVx/PAib1SG/3OSvAh8z++eVcNDYcdYPQ5+iutmw51npDLy0Z
	TeqDbWdBtqBHj0Gnmr/4Ic+OOXBdUW8JxV4ePEyfrnvuK4ioJOnr6yUaxdYtyCE/FlwZZaedMk9
	Cnd+4Y92rQxewmMVwmfke03aSIYZzWbMqaXX+GicztB5l02525qB9Pi/1a2xRAvoJaxo+a3MdAL
	Vs9e4V
X-Google-Smtp-Source: AGHT+IEJ4VbJhoJzyBjM8Y4MejTnzUP08csRL+Oh7OcJFfST3HfSmnxPn7t6z1okavMnvmfcWjLJdQ==
X-Received: by 2002:ac8:5703:0:b0:4b0:71e9:1f95 with SMTP id d75a77b69052e-4b2aaa40e53mr151318591cf.10.1756172039706;
        Mon, 25 Aug 2025 18:33:59 -0700 (PDT)
Received: from [127.0.0.1] (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8e1e07bsm60811151cf.41.2025.08.25.18.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 18:33:59 -0700 (PDT)
Date: Mon, 25 Aug 2025 21:33:58 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Rob Herring <robh@kernel.org>
CC: Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_2/6=5D_dt-bindings=3A_auxdisp?=
 =?US-ASCII?Q?lay=3A_add_Titan_Micro_Electronics_TM16xx?=
User-Agent: Thunderbird for Android
In-Reply-To: <20250825182521.GA4157069-robh@kernel.org>
References: <20250825033237.60143-1-jefflessard3@gmail.com> <20250825033237.60143-3-jefflessard3@gmail.com> <20250825182521.GA4157069-robh@kernel.org>
Message-ID: <44C925EA-73CF-46C3-86C4-BD8ECD33AE00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 25 ao=C3=BBt 2025 14 h 26 min 57 s HAE, Rob Herring <robh@kernel=2Eorg> =
a =C3=A9crit=C2=A0:
>On Sun, Aug 24, 2025 at 11:32:28PM -0400, Jean-Fran=C3=A7ois Lessard wrot=
e:
>> Add documentation for TM16xx-compatible 7-segment LED display controlle=
rs
>> with keyscan=2E
>>=20
>> Signed-off-by: Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail=2Ecom>
>> ---
>>=20
>> Notes:
>>     The 'segments' property is intentionally not vendor-prefixed as it
>>     defines a generic hardware description concept applicable to any
>>     7-segment display controller=2E The property describes the fundamen=
tal
>>     grid/segment coordinate mapping that is controller-agnostic and cou=
ld
>>     be reused by other LED matrix display bindings=2E Similar to how 'g=
pios'
>>     describes GPIO connections generically, 'segments' describes segmen=
t
>>     connections in a standardized way using uint32-matrix format=2E
>>=20
>>  =2E=2E=2E/bindings/auxdisplay/titanmec,tm16xx=2Eyaml  | 477 ++++++++++=
++++++++
>>  MAINTAINERS                                   |   5 +
>>  2 files changed, 482 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/auxdisplay/titanm=
ec,tm16xx=2Eyaml
>>=20
>> diff --git a/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16=
xx=2Eyaml b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx=2E=
yaml
>> new file mode 100644
>> index 000000000=2E=2Ec94556d95
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx=2Eya=
ml
>> @@ -0,0 +1,477 @@
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

In reference to max-brightness, I'll replace with:

Maximum brightness and grid/segment indices are controller-specific=2E Con=
troller-specific maximum are validated in the driver=2E

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
>> +  The controller node exposes a logical LED-like control for the aggre=
gate
>> +  display brightness=2E Child nodes describe individual icons and 7-se=
g digits=2E
>> +  The top-level control supports only label and brightness-related pro=
perties
>> +  and does not support other common LED properties such as color or fu=
nction=2E
>> +  Child LED nodes use the standard LED binding=2E
>> +
>> +  Optional keypad scanning is supported when both 'linux,keymap' and
>> +  'poll-interval' properties are specified=2E
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - fdhisi,fd628
>> +              - princeton,pt6964
>> +              - wxicore,aip1628
>> +          - const: titanmec,tm1628
>> +      - items:
>> +          - enum:
>> +              - wxicore,aip1618
>> +          - const: titanmec,tm1618
>> +      - items:
>> +          - enum:
>> +              - fdhisi,fd650
>> +              - wxicore,aip650
>> +          - const: titanmec,tm1650
>> +      - enum:
>> +          - fdhisi,fd620
>> +          - fdhisi,fd655
>> +          - fdhisi,fd6551
>> +          - titanmec,tm1618
>> +          - titanmec,tm1620
>> +          - titanmec,tm1628
>> +          - titanmec,tm1638
>> +          - titanmec,tm1650
>> +          - winrise,hbs658
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  label:
>> +    description:
>> +      The label for the top-level LED=2E If omitted, the label is take=
n from the
>> +      node name (excluding the unit address)=2E It has to uniquely ide=
ntify a
>> +      device, i=2Ee=2E no other LED class device can be assigned the s=
ame label=2E
>> +    $ref: /schemas/leds/common=2Eyaml#/properties/label
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
>> +    $ref: /schemas/leds/common=2Eyaml#/properties/max-brightness
>
>These 2 $ref's should be at the node level=2E The clue is you=20
>copied-n-pasted the whole description=2E
>

I'll add:

allOf:
  - $ref: /schemas/leds/common=2Eyaml#

at the node level and constrain inapplicable LED properties (color, functi=
on)
using properties: false since this auxdisplay device integrates with LED
subsystem for brightness control=2E

>What you need here is some constraints=2E What's the max value?
>

Maximum brightness varies by controller:
- TM1618/TM1628/TM1638 support levels 0-8
- TM1650 supports levels 0-8
- TM1620 supports levels 0-3
I'll set the schema maximum to 8:

max-brightness:
  maximum: 8  # Maximum across all TM16xx controllers

with the top-level description note that actual limits are controller-depe=
ndent
and are enforced by the driver=2E

>> +
>> +  default-brightness:
>> +    description:
>> +      Brightness to be set if LED's default state is on=2E Used only d=
uring
>> +      initialization=2E If the option is not set then max brightness i=
s used=2E
>> +    $ref: /schemas/types=2Eyaml#/definitions/uint32
>
>This needs to first go into leds/common=2Eyaml=2E
>

Given its specific relevance to this auxdisplay use case rather than gener=
al LED
behavior, I am not sure it's worth adding default-brightness to LEDs/commo=
n=2Eyaml
If broader LED subsystem adoption is wanted, I am willing to submit a sepa=
rate
patch to this series to add it=2E

Otherwise, existing precedent in backlight/common=2Eyaml and leds/leds-pwm=
=2Eyaml
would advocate for defining it locally=2E

>> +
>> +  digits:
>> +    type: object
>> +    description: Container for 7-segment digit group definitions
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      "#address-cells":
>> +        const: 1
>> +      "#size-cells":
>> +        const: 0
>> +
>> +    patternProperties:
>> +      "^digit@[0-9]+$":
>> +        type: object
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          reg:
>> +            description: Digit position identifier
>
>Position is right to left (0 on right)? Please clarify=2E
>=20

I'll clarify: digit positions are numbered sequentially left-to-right,=20
with reg=3D0 representing the leftmost digit position as displayed to the =
user=2E

>> +            maxItems: 1
>> +
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
>
>Can't you do an array instead and make the array index be the grid or=20
>segment index?
>

Original design was array-based:
- titanmec,digits: array of grid indices
- titanmec,segment-mapping: array of segment indices for a,b,c,d,e,f,g
- titanmec,transposed: boolean for matrix-transposed cases

The current explicit coordinate approach was adopted based on v2 feedback =
and
handles both standard and transposed wiring patterns effectively, where
manufacturers swap grid/segment relationships:
- Standard: digit segments use same grid, different segments =20
- Transposed: digit segments use same segment, different grids
It also future-proofs potential irregular wiring patterns where individual
digits might have different grid/segment relationships=2E

Unless you have strong objections, I prefer to keep this approach to avoid
further churn, as it's proven to handle all the real-world board layouts
encountered=2E

See=20
ttps://lore=2Ekernel=2Eorg/linux-devicetree/9133F5BC-7F4E-4732-9649-178E5A=
698273@gmail=2Ecom/

>> +            minItems: 7
>> +            maxItems: 7
>> +
>> +        required:
>> +          - reg
>> +          - segments
>> +
>> +  leds:
>> +    type: object
>> +    description: Container for individual LED icon definitions
>> +    additionalProperties: false
>> +
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
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          reg:
>> +            description:
>> +              Grid and segment indices as <grid segment> of this indiv=
idual LED icon
>> +
>> +        required:
>> +          - reg
>> +
>> +allOf:
>> +  - $ref: /schemas/input/input=2Eyaml#
>> +  - $ref: /schemas/input/matrix-keymap=2Eyaml#
>> +
>> +dependencies:
>> +  poll-interval:
>> +    - linux,keymap
>> +  linux,keymap:
>> +    - poll-interval
>> +  autorepeat:
>> +    - linux,keymap
>> +    - poll-interval
>> +
>> +# SPI controllers require 3-wire (combined MISO/MOSI line)
>> +if:
>
>Move this under the allOf=2E
>

Well received=2E

>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - fdhisi,fd620
>> +          - fdhisi,fd628
>> +          - princeton,pt6964
>> +          - titanmec,tm1618
>> +          - titanmec,tm1620
>> +          - titanmec,tm1628
>> +          - titanmec,tm1638
>> +          - wxicore,aip1618
>> +          - wxicore,aip1628
>> +then:
>> +  allOf:
>
>Drop allOf=2E
>

Well received=2E

>> +    - $ref: /schemas/spi/spi-peripheral-props=2Eyaml#
>> +  properties:
>> +    spi-3wire: true
>
>Drop 'properties'
>

Well received=2E

>> +  required:
>> +    - spi-3wire
>> +
>> +required:
>
>Order should be 'dependencies', 'required', 'allOf'=2E
>

I'll reorder the schema sections accordingly=2E

>> +  - compatible
>> +  - reg
>> +
>> +unevaluatedProperties: false
>> +
=2E=2E=2E
>> --=20
>> 2=2E43=2E0
>>=20


Thanks for your time and your feedback,

Best Regards
Jean-Fran=C3=A7ois Lessard

