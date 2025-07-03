Return-Path: <linux-leds+bounces-4968-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DC4AF66CE
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 02:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFDDA4E6EF7
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 00:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF76717996;
	Thu,  3 Jul 2025 00:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtKQTRH3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14824A94A;
	Thu,  3 Jul 2025 00:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751502806; cv=none; b=adxt8hcYJJKesOD9xgXMOd7ccKHdqtB+UV9VAUQnHTgHYIV6P+D+2xhceC6XdZ9fm0x8KtgL8Cz1MTd0maiUj9K20YcB4GDsBOm32nP9PcF4mjB6rxzZoqM0Ech1IRy0AhLRxPjS4LQ/o32eJ9fUK4VlzZLLapMz/lJ7GLci77E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751502806; c=relaxed/simple;
	bh=2WnJMxcmhnEenC8X3svhHIWBTN1tclP7vz6NQtrtmFU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=pudj8vGphYausPausWnpSrLBHQiBpo5dOuii3RVl8AWhmNzSQxxQaS3kNujTJ7IssIXihjcdTE8S81siPy2tmgSwLLtRu46uM+wlS2JwOMF4eKqEZOSB5aBTMcfVzDbNk0/R6HNz8oVkvHEBBALt/rlcTkay4/oE1X/hTSGJTrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtKQTRH3; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6fad3400ea3so69152656d6.0;
        Wed, 02 Jul 2025 17:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751502804; x=1752107604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9wNqKy0v3kt3m7tjE/fBzir+6rd9yjAnYQGP90HJcv8=;
        b=AtKQTRH3Fb/+ofxY6m4A0g0m6gD1S64EjkfEydKFpfYgm0/IOvLL1J9ysbakHD+VhT
         2xHoioS6b+RW3CnKPWsZnmGzJaO0EWw7FtrfV83Zea7PwVqYPayTYbcrvQsu5cHx50MD
         8XpAdyk7V4tDz3JVfg+6whukxtn4xkcEJ6eRz13p5Y9Mn0VZydQ28q9EfitDI+dT/EfD
         yovFeC3hVdHgYsXsEfcmrWN62rcE2JMqFSweScdLkVrJjMtk3cpYs/IITEA4W/pkIPi2
         LJMoAz/VhszOsj+eLnFcv0PspLHV7gux/EBlla4tw51l7/Bhl5bNLMBnJwdE7KdVPwbw
         iINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751502804; x=1752107604;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9wNqKy0v3kt3m7tjE/fBzir+6rd9yjAnYQGP90HJcv8=;
        b=pPb8Ta7Q55FdLlTPYjD2oti1cAqmwV6VlOrRW4Y4EbdFi6S4PV/xAv0OFSaBTM7dm3
         8zAfOqI2vlloFig7fgIjTxaY2VJOT1LgP17CeGhNF4+EPCpQxGHxBqTTMUHYvxOlKO4X
         G29Ib/Mg7t0LJ3yUIKsIGjYp0Rq2ZFvnX4ne+SX0LRqSp8okX65q5YL8/o0ooy+pgxHh
         uoQjUA3iSZlgD/jBwzgYyfNeqTrIm8cMNcym+qQd+ySGbiBhtOyYBBToCdsZe05AmDB0
         jI8JYQKgSewYpUF/j8lG6Pbjx+QfdFSbqOtLM8BHKYbtoModH62hOghpQR6nCajr16Hm
         mm1g==
X-Forwarded-Encrypted: i=1; AJvYcCUiWZ6gSG0ldQAMMV8vuLtnycGsD6kgWRnwjxsgdaqV4uFOoQtrotxfVLcjUWTrYhK+giB8SIcT82Jm@vger.kernel.org, AJvYcCV6DbOyr761ffZfYEcR6DswUzIhtXPZF1wNwgCRelVMaMz8bNnf+JrHTBzxItsUHHtRKnqKxRiV9WjExLy7@vger.kernel.org, AJvYcCVrII+0xkBEFHdjhH+AtfdeKWDZl1S5VSdOloYHqM2Qi7BorPoLuRIy24aYntLlFLMQlpOHAF2X/WBDkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiexNHS1b5HS+KNgP9XlKT7FrFRTtlrKjCHKnsN8SZWwff0X3E
	ouLYwUGVVoDqY+jrxv5ABw/xxgwFgHroby3wgVhuj8hb28Mty7rpFc0l
X-Gm-Gg: ASbGncs/1nP2VsBIxV73C3QoG81y079jrziv5bVP6kre0OMzlAJGTtquReFC1n0XPL/
	S9TN8vMmif83v48FzLMg7zR/wQj25jpsn9mVSmQAdab2USCbWm1NlIc0T+XdLvDe7/rloPKQ5sT
	NANmTGFzZbDXjdu6IQWjKQjCfEO/r4PHunbV9f9/lZ1bg5YPieWUCuO4Zg56bFo2wqsA/U+Y0S4
	UUYDqNz/h4Kf/hd9s5Gny4qK7jBhPkGYsAwrk1x3PPZKNgPCsHJUIris+BdD+JTOd3afg9XFSOA
	Ur4h370J0tmqkTFfYv3+Hp+Ys2C9HF1Ke3F93ZQKuY9uQh1pKtqI13RtvK+mj5/aZ8qnklh28E3
	IUwLUMeilXtlCZ5d5uhV6Ot6BIvFHEfIzwQ==
X-Google-Smtp-Source: AGHT+IG6KVA6LBVY09IrRkd3p/5aUF44cHQYg+/Nmwx67yLAQ07S14/IQKykqZeopfJkbIaZcN6aHg==
X-Received: by 2002:a05:6214:cac:b0:6fa:d9de:a3fc with SMTP id 6a1803df08f44-702b1bf2d86mr77281436d6.34.1751502803906;
        Wed, 02 Jul 2025 17:33:23 -0700 (PDT)
Received: from [127.0.0.1] (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7718e77bsm108372266d6.10.2025.07.02.17.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 17:33:23 -0700 (PDT)
Date: Wed, 02 Jul 2025 20:33:20 -0400
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
In-Reply-To: <B57E9DD6-52F5-4522-AB80-EF0AEEAED5C0@gmail.com>
References: <20250629130002.49842-1-jefflessard3@gmail.com> <20250629130002.49842-8-jefflessard3@gmail.com> <d3d8f72a-e4fe-4f85-8ead-6c104aa32893@kernel.org> <F09B92C5-9FF0-4818-9BF9-EFA4A456399C@gmail.com> <daa343f9-b5eb-4a46-8c3a-f5c07603a9f1@kernel.org> <B57E9DD6-52F5-4522-AB80-EF0AEEAED5C0@gmail.com>
Message-ID: <9133F5BC-7F4E-4732-9649-178E5A698273@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 2 juillet 2025 13 h 30 min 58 s HAE, "Jean-Fran=C3=A7ois Lessard" <jeffl=
essard3@gmail=2Ecom> a =C3=A9crit=C2=A0:
>>>>> +  titanmec,digits:
>>>>> +    description: |
>>>>> +      Array of grid (row) indexes corresponding to specific wiring =
of digits in the display matrix=2E
>>>>
>>>> What is wiring of digits? This and other descriptions don't tell me m=
uch=2E
>>>>
>>>=20
>>> Controllers use a matrix to drive LEDs=2E Terminology used in datashee=
ts is:
>>> - grids: matrix rows
>>> - segments: matrix columns
>>>=20
>>> Board manufacturers wires display panels differently, including LEDs w=
hich are parts of 7-segments:
>>> - =E2=80=9Cdigits=E2=80=9D refers to the ordered list of GRID indices =
wired to the physical 7-segment digit displays (arranged right to left)
>>> - =E2=80=9Csegment-mapping=E2=80=9D defines how each SEGMENT index wit=
hin these grids maps to the standard 7-segment elements (a-g)
>>>=20
>>>> Wrap according to Linux coding style, so at 80=2E
>>>>
>>>>> +      Defines which grid lines are connected to digit elements=2E
>>>>> +    $ref: /schemas/types=2Eyaml#/definitions/uint8-array
>>>>> +    items:
>>>>> +      minimum: 0
>>>>> +      maximum: 7
>>>>> +    minItems: 1
>>>>> +    maxItems: 8
>>>>> +
>>>>> +  titanmec,segment-mapping:
>>>>> +    description: |
>>>>
>>>> Do not need '|' unless you need to preserve formatting=2E
>>>>
>>>>> +      Array of segment (column) indexes specifying the hardware lay=
out mapping used for digit display=2E
>>>>> +      Each entry gives the segment index corresponding to a standar=
d 7-segment element (a-g)=2E
>>>>
>>>> Wrap according to Linux coding style, so at 80=2E
>>>>
>>>> This looks like duplicating the reg property=2E
>>>>
>>>=20
>>> While related, this is not replicating the reg property of led child n=
odes=2E
>>>=20
>>> Each (grid,segment) combination might have a distinct role:
>>> - part of a 7-segment: described using digits and segment-mapping prop=
erties
>>> - individual led: described using led child nodes
>>>=20
>>>>
>>>>> +    $ref: /schemas/types=2Eyaml#/definitions/uint8-array
>>>>> +    items:
>>>>> +      minimum: 0
>>>>> +      maximum: 7
>>>>> +    minItems: 7
>>>>> +    maxItems: 7
>>>>> +
>>>>> +  titanmec,transposed:
>>>>> +    description: |
>>>>> +      Optional flag indicating if grids and segments are swapped co=
mpared to standard matrix orientation=2E
>>>>> +      This accommodates devices where segments are wired to rows an=
d grids to columns=2E
>>>>> +    $ref: /schemas/types=2Eyaml#/definitions/flag
>>>>> +
>>>>> +  "#address-cells":
>>>>> +    const: 2
>>>>> +
>>>>> +  "#size-cells":
>>>>> +    const: 0
>>>>> +
>>>>> +patternProperties:
>>>>> +  "^led@[0-7],[0-7]$":
>>>>
>>>> Why do you have two addresses? It's not used in your example=2E
>>>>
>>>=20
>>> First is for the grid index, second of for the segment index=2E
>>
>>But it is not used=2E I really do not get why this is different than oth=
er
>>matrix LED controllers=2E
>>
>
>You are right, addresses of child led nodes are not used by the driver=2E
>But the 2 cells of the reg property are used by the driver=2E
>Isn't it a common practice to match node addresses the reg property?
>
>I will thoroughly review other matrix LED controllers again to better cap=
ture what I am missing here=2E
>

I have reviewed other matrix LED controllers again and it doesn't not matc=
h=2E
Some controllers linearize the matrix using a single address, but that doe=
sn't fit current usage=2E

However, I see the confusion with the two-address led@x,y nodes used for i=
cons=2E
These are for individual LEDs wired at specific grid/segment pairs (e=2Eg=
=2E WiFi, USB indicators)
while digits are driven as ordered groups=2E

The current bindings use
- "titanmec,digits"
- "titanmec,segment-mapping"
- "titanmec,transposed"
to concisely describe 7-segment digit groups without enumerating each grid=
/segment individually=2E
The idea was to simplify definitions since most displays wire segments con=
sistently across digits=2E

For clarity and extendability, I am considering an alternative bindings st=
ructure like:

auxdisplay@24 {
  compatible =3D "=2E=2E=2E";
  reg =3D <0x24>;

  leds {
    #address-cells =3D <2>;
    #size-cells =3D <0>;

    wifi_led: led@0,1 {
      reg =3D <0 1>;
      function =3D "wifi";
    };
  };

  digits {
    #address-cells =3D <1>;
    #size-cells =3D <0>;

    digit@0 {
      reg =3D <0>;
      segments =3D <1 0>, <1 1>, <1 2>, <1 3>, <1 4>, <1 5>, <1 6>; /* a-g=
 */
    };

    digit@1 {
      reg =3D <1>;
      segments =3D <2 0>, <2 1>, <2 2>, <2 3>, <2 4>, <2 5>, <2 6>; /* a-g=
 */
    };
  };
};

This explicitly separates icons (leds) and 7-segment digit definitions (di=
gits),
avoiding ambiguity with generic LED matrix drivers=2E

Would you prefer this approach for v3?

>>>=20
>>>>> +    $ref: /schemas/leds/common=2Eyaml#
>>>>> +    properties:
>>>>> +      reg:
>>>>> +        description: Grid (row) and segment (column) index in the m=
atrix of this individual LED icon
>>>>
>>>> Missing constraints=2E
>>>>
>>>>> +    required:
>>>>> +      - reg
>>>>> +
>>>=20
>>> Well noted=2E
>>>=20
=2E=2E=2E
>>
>>
>>Best regards,
>>Krzysztof
>
>Thanks for your time, patience and guidance,
>Jean-Fran=C3=A7ois Lessard
>

Thanks for your guidance=2E

Best regards,
Jean-Fran=C3=A7ois Lessard

