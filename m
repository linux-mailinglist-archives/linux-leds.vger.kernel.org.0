Return-Path: <linux-leds+bounces-5317-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4E9B36BE9
	for <lists+linux-leds@lfdr.de>; Tue, 26 Aug 2025 16:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9BE7A03D14
	for <lists+linux-leds@lfdr.de>; Tue, 26 Aug 2025 14:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5250A3570B2;
	Tue, 26 Aug 2025 14:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWQjBBhn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCC4350825;
	Tue, 26 Aug 2025 14:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756219054; cv=none; b=IBY632WTEPRVcjG6cGAU6dGqwkzO0EZD0NjVXrHrNS9kITiskQ8Fn/QTsuGr0WLuL31mg+yd1cNxdl6MM2HkWElfZJlr7d4YNqwDQu2t1qDV9eDpyA829YndY436JHWSqUWpdQRVHkA8hAJkZobonq5UdMQeSA/pR2zj7y2H0Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756219054; c=relaxed/simple;
	bh=sdAcFErMaAvxIj3OAhwQFkrxPJpihi9tsFCYZuFzsvY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=KK0lUYZb11H048A596V/aIsxHzRpex+l7s0NC5/w9eNCnyz3ijJX4ZEf+yfQg5F8wsAc6ogXWjr8umO9qnCBRMi6Q8KZLaJI5UA6befpAil7vYK6dyP+3G4+xuneQQewk8+AkdNufrf96DSXsvNvGdG5vcb964DWWs91JCxBwlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWQjBBhn; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-70d9a65c371so38687286d6.2;
        Tue, 26 Aug 2025 07:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756219051; x=1756823851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ES8UZSAXeLNqh3Lam8d3aYOJAro3fOK+7OrQsDbtpKE=;
        b=IWQjBBhnmTfwkDS4PecwWu+Rg8opzWJWXhxhJIkI7Gt6IGb5r2czVupvnpWSV25tBH
         Ta4qpXRX8in8LS75mjrfSsaQQRybHdxAT8gdPRKKhY4JV52gkgEF2YQqoxt6e2JUqkzl
         a/u2jTAFh7Zic48IXzbh0ECPtlJz/Gu/CYXCx6seZN86AW5fkmVhLubRbLG5X0HMNF0x
         p4W0FVECOPbWbSnyTjI9NiFA4gDd0J8t18wbq0Ud4cjqhkFNypFyz8rye+5/tKrnmC6M
         4LWPJvAQ0GEKjEFeOdg/WS6B5yfOv+/8RtsZ/kfqcPx+qPaJJ+2noE0ItjgA6nLhz3xQ
         158w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756219051; x=1756823851;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ES8UZSAXeLNqh3Lam8d3aYOJAro3fOK+7OrQsDbtpKE=;
        b=khi6GHInb8QdoJb5rA3DPV36Z7sb2UrK1lqvok9CVxuNROv7EAiN9LiEdaMZVTbP7G
         HTnGArcuSrxZR0xmsAZS2f3/HqfsGaSfjGyAuOExdGJ92mhmYdFOeDzns1HbZT4wvXjH
         EJeiZxye0iIitOJcu4mWQbNAOBZ76C2gIFHzuxelX631ue029f6ti/ADaIsRR37/sFD9
         siVg3loOLdqtnNtQe+hkHV2S/9hpDSOtWi106s1UaOyCirGjomyXIUfj9acmgPV3qdwp
         xE6QZ9NHFOg+cWyrmm/jxYRKqY0nEZsp64ZZjtMyXPt5cXhGUPj3uGI16F1W9BXNeW3H
         R4Jg==
X-Forwarded-Encrypted: i=1; AJvYcCU2Q4YnJiNzUGDmBLRF3swvfj3psHpfJcsmgM+VBtv8qfgcWbgh6s72JI3AXiway8EHsNXr3ktofvKp2A==@vger.kernel.org, AJvYcCVCe6i6tdlolTiWAX+cjsJr+WDAf1pRiAQMzcCe8drR7Hd+evh2nq6ZcTYv12eRNI18OSNvXO1RRoN4@vger.kernel.org, AJvYcCWL8v1W5hrxo+O6sypNVjBv/xfYdGscW8j7rj7Qv+CUBgL79+0X5S7H2keT0YgYyE+10RCotlBH+xDjeLQt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8PkdfO1U72iYQ10IMSSaWXb6DIrRUtkoacUlEM95mGGtdQu2b
	T9siY2JhU6SZpEXIYV4aU4lg+tHW830Dew61MUE0e5mTf/WX7469PZkrWYJPODG7
X-Gm-Gg: ASbGncutmb0rLnW2vmCOPXZrl1geFnwYGtA9Q8tNg+yQersbHMu9eZCNDuc9L1kGYKo
	rRHCwpGG7j8XX9PWASO56hOnV6u6R/LjhpZxngys49kr4kNUJK0N4Y+1iIgmXHRf7pQ9cuwd9Ub
	PMsjEpeb598RYoxo9nwJYzg7DkzuND+jmUn+mK/WmLF5l0G8tXqBUGWExbk9e3XYDIOIcKm0aoO
	6Vv4lPZ/tznZSvJGxbNrJX7u1DLmlPOF2ajlEuZm4XRonf8RuXzuPZXFSr39cGX6fxKQFV5zt9W
	mmEdFtGSF5Y1AoqJ1AltyhPBuk6objqqcfH/oUiq0gdbJvjwZVhC9xxWsqyKzCVYqF8Fdjh5xqu
	xOtBvt7pGnvlcQiGheEKSqqrwa/d6M07IC6NJI+r0fmFQNA4G4SHBA+G8skLv3SOYfuvVTbYb1p
	jhPXaD
X-Google-Smtp-Source: AGHT+IFhkbvyIvr6q1+Yn2QpSuxFtkr6HhRaTDTmME6KiT+mb1YTq2nsdcHZdwXHuGruZM9V0cM8Kw==
X-Received: by 2002:ad4:5de8:0:b0:70d:c4d7:3731 with SMTP id 6a1803df08f44-70dc4d73853mr68375996d6.34.1756219051181;
        Tue, 26 Aug 2025 07:37:31 -0700 (PDT)
Received: from [127.0.0.1] (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da72cc195sm65283496d6.63.2025.08.26.07.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 07:37:30 -0700 (PDT)
Date: Tue, 26 Aug 2025 10:37:28 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Rob Herring <robh@kernel.org>
CC: Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_2/6=5D_dt-bindings=3A_auxdisp?=
 =?US-ASCII?Q?lay=3A_add_Titan_Micro_Electronics_TM16xx?=
User-Agent: Thunderbird for Android
In-Reply-To: <44C925EA-73CF-46C3-86C4-BD8ECD33AE00@gmail.com>
References: <20250825033237.60143-1-jefflessard3@gmail.com> <20250825033237.60143-3-jefflessard3@gmail.com> <20250825182521.GA4157069-robh@kernel.org> <44C925EA-73CF-46C3-86C4-BD8ECD33AE00@gmail.com>
Message-ID: <B53D4113-91EE-4B64-AD74-F8F8BF8EFB25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 25 ao=C3=BBt 2025 21 h 33 min 58 s HAE, "Jean-Fran=C3=A7ois Lessard" <je=
fflessard3@gmail=2Ecom> a =C3=A9crit=C2=A0:
>Le 25 ao=C3=BBt 2025 14 h 26 min 57 s HAE, Rob Herring <robh@kernel=2Eorg=
> a =C3=A9crit=C2=A0:
>>On Sun, Aug 24, 2025 at 11:32:28PM -0400, Jean-Fran=C3=A7ois Lessard wro=
te:
>>> Add documentation for TM16xx-compatible 7-segment LED display controll=
ers
>>> with keyscan=2E
>>>=20
>>> Signed-off-by: Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail=2Ecom>
>>> ---
>>>
=2E=2E=2E
>>>  =2E=2E=2E/bindings/auxdisplay/titanmec,tm16xx=2Eyaml  | 477 +++++++++=
+++++++++
>>>  MAINTAINERS                                   |   5 +
>>>  2 files changed, 482 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/auxdisplay/titan=
mec,tm16xx=2Eyaml
>>>=20
>>> diff --git a/Documentation/devicetree/bindings/auxdisplay/titanmec,tm1=
6xx=2Eyaml b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx=
=2Eyaml
>>> new file mode 100644
>>> index 000000000=2E=2Ec94556d95
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx=2Ey=
aml
>>> @@ -0,0 +1,477 @@
>>> +# SPDX-License-Identifier: (GPL-2=2E0-only OR BSD-2-Clause)
>>> +%YAML 1=2E2
>>> +---
>>> +$id: http://devicetree=2Eorg/schemas/auxdisplay/titanmec,tm16xx=2Eyam=
l#
>>> +$schema: http://devicetree=2Eorg/meta-schemas/core=2Eyaml#
>>> +
>>> +title: Auxiliary displays based on TM16xx and compatible LED controll=
ers
>>> +
=2E=2E=2E
>>> +
>>> +  digits:
>>> +    type: object
>>> +    description: Container for 7-segment digit group definitions
>>> +    additionalProperties: false
>>> +
>>> +    properties:
>>> +      "#address-cells":
>>> +        const: 1
>>> +      "#size-cells":
>>> +        const: 0
>>> +
>>> +    patternProperties:
>>> +      "^digit@[0-9]+$":
>>> +        type: object
>>> +        unevaluatedProperties: false
>>> +
>>> +        properties:
>>> +          reg:
>>> +            description: Digit position identifier
>>
>>Position is right to left (0 on right)? Please clarify=2E
>>=20
>
>I'll clarify: digit positions are numbered sequentially left-to-right,=20
>with reg=3D0 representing the leftmost digit position as displayed to the=
 user=2E
>
>>> +            maxItems: 1
>>> +
>>> +          segments:
>>> +            $ref: /schemas/types=2Eyaml#/definitions/uint32-matrix
>>> +            description: |
>>> +              Array of grid/segment coordinate pairs for each 7-segme=
nt position=2E
>>> +              Each entry is <grid segment> mapping to standard 7-segm=
ent positions
>>> +              in order: a, b, c, d, e, f, g
>>> +
>>> +              Standard 7-segment layout:
>>> +                 aaa
>>> +                f   b
>>> +                f   b
>>> +                 ggg
>>> +                e   c
>>> +                e   c
>>> +                 ddd
>>> +            items:
>>> +              items:
>>> +                - description: Grid index
>>> +                - description: Segment index
>>
>>Can't you do an array instead and make the array index be the grid or=20
>>segment index?
>>
>
>Original design was array-based:
>- titanmec,digits: array of grid indices
>- titanmec,segment-mapping: array of segment indices for a,b,c,d,e,f,g
>- titanmec,transposed: boolean for matrix-transposed cases
>
>The current explicit coordinate approach was adopted based on v2 feedback=
 and
>handles both standard and transposed wiring patterns effectively, where
>manufacturers swap grid/segment relationships:
>- Standard: digit segments use same grid, different segments =20
>- Transposed: digit segments use same segment, different grids
>It also future-proofs potential irregular wiring patterns where individua=
l
>digits might have different grid/segment relationships=2E
>
>Unless you have strong objections, I prefer to keep this approach to avoi=
d
>further churn, as it's proven to handle all the real-world board layouts
>encountered=2E
>
>See=20
>ttps://lore=2Ekernel=2Eorg/linux-devicetree/9133F5BC-7F4E-4732-9649-178E5=
A698273@gmail=2Ecom/
>

Diving deeper on your suggestion of using arrays, would this revised desig=
n be
acceptable?

properties:
  digits:
    patternProperties:
      "^digit@[0-9]+$":
        properties:
          reg:
            maxItems: 1
           =20
          grids:
            $ref: /schemas/types=2Eyaml#/definitions/uint32-array
            description: Grid indices for segments a,b,c,d,e,f,g in order
            minItems: 7
            maxItems: 7
           =20
          segments:
            $ref: /schemas/types=2Eyaml#/definitions/uint32-array =20
            description: Segment indices for segments a,b,c,d,e,f,g in ord=
er
            minItems: 7
            maxItems: 7

This approach:
- Uses arrays as you suggested, indexed by segment position
- Maintains flexibility for both standard and transpose layouts
- Keeps the semantic clarity that Krzysztof requested

Example usage would be:

digit@0 {
    reg =3D <0>;
    grids =3D <4 4 4 4 4 4 4>;     // Standard: all segments use same grid
    segments =3D <3 4 5 0 1 2 6>;   // Different segment indices
};

// vs transpose case:
digit@0 {
    reg =3D <0>;
    grids =3D <0 1 2 3 4 5 6>;     // Transpose: different grids
    segments =3D <3 3 3 3 3 3 3>;   // Same segment index
};

Would this better align with your preference for array-based approaches?

If so, the remaining question is if these needs to be vendor prefixed
or if they are still generic enough hardware description concept
applicable to any 7-segment display controller=2E

>>> +            minItems: 7
>>> +            maxItems: 7
>>> +
>>> +        required:
>>> +          - reg
>>> +          - segments
>>> +
=2E=2E=2E

Best Regards
Jean-Fran=C3=A7ois Lessard


