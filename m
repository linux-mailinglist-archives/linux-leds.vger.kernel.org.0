Return-Path: <linux-leds+bounces-4950-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 804C3AEECFF
	for <lists+linux-leds@lfdr.de>; Tue,  1 Jul 2025 05:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87D023B1D7E
	for <lists+linux-leds@lfdr.de>; Tue,  1 Jul 2025 03:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C715319309C;
	Tue,  1 Jul 2025 03:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gt+m4S/N"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9C0F9D6;
	Tue,  1 Jul 2025 03:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751340132; cv=none; b=QL7r5Xq/LSAW9fKxzT9OInbtyYQWkXGqbJA9CfyPRnFiGgwAeUdtH/T20vyMusOdUlqrsrQVOEQt+iOjH0Ma2FUMqVJ1xKqgFCfmxYJWpk1ylvE4sAJ6Iln8xOdfXgg2zJVGNqWUm2H4TM5b83koftXGwkYfTaXlWPfxADUyslY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751340132; c=relaxed/simple;
	bh=Z4cHuTQpKXuEdH9qObUY6DhW9RDpaI12e0hjUZ5e/Sw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=sJVQF67zIKbO52JZooNyl9fVPryP/ngGdjrENADQjOuUoTHW27kHGv7NRhzyeBfD0cP5c/swOeJQes6ANU6GVuaADTXqqqtFgHP9RqcNUt14RwRSn+v92qjkPbJK+KtuP4G7B6RPkEk0givu4JoTlp/sYVrYC+3jCv39UAxfdoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gt+m4S/N; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a8244e897fso13504911cf.1;
        Mon, 30 Jun 2025 20:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751340129; x=1751944929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ONG3LnhEEC/QpDD9RhOmh6twmct2PpDN6Dea3xb/Vns=;
        b=Gt+m4S/NM59hnb8gqVBr1fcYIEdZRcd6GZqMad57Brew+TN4S2kpKZ3zcPAJSsOh99
         mBiIphKUH0uLJxaA0eSegr4yMyqZCYZHbYimPg4jfzeKYNFx4VURbQ2c8I5vP8IUBiUK
         TLBFXRQWYY5VZBnrbO6K5t+7otJgXJLpp8usdFXLlrBnR0z2vicjc5LztQqtK1GTl5QZ
         AiXWFBMDIEqoJ3UhFSiemBZZJdwts2nOrdKkoeTJHSvx5fSVzUliTnvOiih/SlPNKPDx
         Tu78H/FLYmbrcdOnMAhrjKVtXvllEdESVJxEn9XBBnKGu8gnIwCWZX1gf3sPOCwYEsLT
         JSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751340129; x=1751944929;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ONG3LnhEEC/QpDD9RhOmh6twmct2PpDN6Dea3xb/Vns=;
        b=fIEhadMVEDo7N64q1lqwDrTiIq/cVEIRVBmJ+ouJPCYDCCfSBAGcTX3NdRF9j7TVj/
         2t7RFn7+DROzWVLyZN6r4ijRRvrXB5KcscnYQrhcBZN2mRtionjt4J7GYD+lr30jbXQr
         kMtDq9MkpEZa7Ii6ogD683Snk2TKC9XHqezIniqwqy/5WBu9yuOn9oDy5nPJToVBHcC+
         rhZwm0mEHm7nO7lc9oru/E3y8JQlECJlajuc85/m+NUMRUJgz3vvXECYNh3lXMpC3+7n
         iBNu5Acp2h+twv9WugmHqCuWoClcm2P9yklhq1gVfSTQYSr2yjQVOWMvG+lymUra8lOR
         UNLw==
X-Forwarded-Encrypted: i=1; AJvYcCVzYixzBKy9UkU/eP1mVDJtCicvjfCjZo5LfnLrxMWDjb4CWb5e5lvUJWD/J1EsXO6oAl5vZTdUJRoqpg==@vger.kernel.org, AJvYcCWwG9iVJnLOxXNctDF6Nb7Kwbs5fDwTM+EUXe9EeOK3J+vH38k62gNL8HySEg2mWLSe5eYviGqaz9kk@vger.kernel.org, AJvYcCXs5Y5KsVUFm+eyvJfu5luR3ISDN58BHEdqSrUBRAmXX4H0NbpRNnmRMp57OhDreAD213mPLis8Nvf+WGn5@vger.kernel.org
X-Gm-Message-State: AOJu0YxYgHcP0t8RPG9GAs5uWMV893buNWBbEsMMUKY75rLEaJrIT+wz
	peJvWOGo3mFYjM28aJDuFsNkZg6yLgXi3CZxbTD2hzQ5ccaaq+R9xGmA
X-Gm-Gg: ASbGncvW1jnN3EQGHOiVJt4pXP7AI1+/HMjrvsbzCm89EaDa7r32LhZx6shvo2ujGKg
	umDTSTTNLRKFMSTLV+1Li+DYGAQmvcqnBmbqaErjNk0AyiIkbOHfvKH9ULjN9S5/8I+ElfH4R/3
	GeN/Im0aelYGYkyk/0D1OhOWhl9HTsqpTTiRgTbsf+oT32Gv/Egi0aRhg9P56P2vizCe7HyzZEW
	EUy1qJf1bMcZftAwXDAMbwZ3YgDRm0yxrGuFBEw3uWyj1gAfUfbi5sqG/PHJLa2feqgp14yiBit
	XCwtllXrZBoZaI1tbuQdaHsMt1N/gGtDBGoZY95ZtIsQQiCsvGorjoQFwGmKcH+yYbTg1VOEsT1
	G+QFJoyxuuVltZJIGxYETLdtj6U1BHAEARw35HQFqItRE
X-Google-Smtp-Source: AGHT+IG0t+XQWSHuIjtEx82iZVZCO9lJ3LrVf6fyVEylXNaP1XlN4AKPEcz17MXEG+FeO7yQERmiiw==
X-Received: by 2002:a05:622a:58c8:b0:4a6:c5ee:6ced with SMTP id d75a77b69052e-4a7fc9d5233mr284481761cf.4.1751340129363;
        Mon, 30 Jun 2025 20:22:09 -0700 (PDT)
Received: from [127.0.0.1] (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc13aa95sm68708501cf.19.2025.06.30.20.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 20:22:09 -0700 (PDT)
Date: Mon, 30 Jun 2025 23:22:04 -0400
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
In-Reply-To: <d3d8f72a-e4fe-4f85-8ead-6c104aa32893@kernel.org>
References: <20250629130002.49842-1-jefflessard3@gmail.com> <20250629130002.49842-8-jefflessard3@gmail.com> <d3d8f72a-e4fe-4f85-8ead-6c104aa32893@kernel.org>
Message-ID: <F09B92C5-9FF0-4818-9BF9-EFA4A456399C@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 30 juin 2025 02 h 19 min 11 s HAE, Krzysztof Kozlowski <krzk@kernel=2Eor=
g> a =C3=A9crit=C2=A0:
>On 29/06/2025 14:59, Jean-Fran=C3=A7ois Lessard wrote:
>> Add documentation for Titanmec TM16XX and compatible LED display contro=
llers=2E
>>=20
>> This patch is inspired by previous work from Andreas F=C3=A4rber and He=
iner Kallweit=2E
>
>Please wrap commit message according to Linux coding style / submission
>process (neither too early nor over the limit):
>https://elixir=2Ebootlin=2Ecom/linux/v6=2E4-rc1/source/Documentation/proc=
ess/submitting-patches=2Erst#L597
>
>Please do not use "This commit/patch/change", but imperative mood=2E See
>longer explanation here:
>https://elixir=2Ebootlin=2Ecom/linux/v5=2E17=2E1/source/Documentation/pro=
cess/submitting-patches=2Erst#L95
>
>>=20
>> Co-developed-by: Andreas F=C3=A4rber <afaerber@suse=2Ede>
>> Co-developed-by: Heiner Kallweit <hkallweit1@gmail=2Ecom>
>> Signed-off-by: Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail=2Ecom>
>> ---
>>  =2E=2E=2E/bindings/auxdisplay/titanmec,tm16xx=2Eyaml  | 210 ++++++++++=
++++++++
>>  1 file changed, 210 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/auxdisplay/titanm=
ec,tm16xx=2Eyaml
>>=20
>> diff --git a/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16=
xx=2Eyaml b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx=2E=
yaml
>> new file mode 100644
>> index 0000000000=2E=2E65c43e3ba4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx=2Eya=
ml
>> @@ -0,0 +1,210 @@
>> +# SPDX-License-Identifier: (GPL-2=2E0-only OR BSD-2-Clause)
>> +%YAML 1=2E2
>> +---
>> +$id: http://devicetree=2Eorg/schemas/auxdisplay/titanmec,tm16xx=2Eyaml=
#
>
>Why isn't this in leds directory? Everything below describes it as LED
>controller=2E
>

TM16XX controllers are commonly used as auxiliary display drivers in consu=
mer Android-based TV boxes for driving 7-segment and icon displays, rather =
than for generic LEDs=2E

Previous attempts to place TM1628 drivers under LED subsystem were NAK=E2=
=80=99ed by LED maintainers, with Pavel Machek recommending drivers/auxdisp=
lay instead (see https://lore=2Ekernel=2Eorg/linux-devicetree/2020022613030=
0=2EGB2800@duo=2Eucw=2Ecz/)=2E

Bindings examples emphasize LED properties due to verbosity, but the core =
purpose is describing the display wiring configuration=2E

As a side note, many TM16XX-alike controllers also support key scanning, w=
hich could be eventually implemented in a future extension=2E

In a previous TM1628 drivers attempt, Robin Murphy initially expressed con=
cern on having no room to support the additional=20
keypad functionality in future and concluded that matrix-keymap helpers an=
d common "linux,keymap" property was OK:
https://lore=2Ekernel=2Eorg/linux-devicetree/586f6f11-fb29-7f76-200a-d73a6=
53f9889@arm=2Ecom/
https://lore=2Ekernel=2Eorg/linux-devicetree/695be0af-b642-af0c-052a-f4c05=
df7424f@arm=2Ecom/

>> +$schema: http://devicetree=2Eorg/meta-schemas/core=2Eyaml#
>> +
>> +title: Auxiliary displays based on TM16xx and compatible LED controlle=
rs
>> +
>> +maintainers:
>> +  - Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail=2Ecom>
>> +
>> +description: |
>> +  TM16xx controllers manage a matrix of LEDs organized in grids (rows)=
 and segments (columns)=2E
>> +  Each grid or segment can be wired to drive either a digit or individ=
ual icons, depending on the
>
>Wrap according to Linux coding style, so at 80=2E
>

Well noted

>> +  board design=2E
>> +
>> +  Typical display example:
>> +
>> +  =C2=A0  =C2=A0 =C2=A0 =C2=A0 --- =C2=A0 =C2=A0--- =C2=A0 =C2=A0 =C2=
=A0 --- =C2=A0 =C2=A0---
>> +    WIFI =C2=A0| =C2=A0 | =C2=A0| =C2=A0 | =C2=A0- =C2=A0| =C2=A0 | =
=C2=A0| =C2=A0 | =C2=A0USB =C2=A0PLAY
>> +     =C2=A0 =C2=A0 =C2=A0 --- =C2=A0 =C2=A0--- =C2=A0 =C2=A0 =C2=A0 --=
- =C2=A0 =C2=A0---
>> +    LAN =C2=A0 | =C2=A0 | =C2=A0| =C2=A0 | =C2=A0- =C2=A0| =C2=A0 | =
=C2=A0| =C2=A0 | =C2=A0BT =C2=A0 PAUSE
>> +  =C2=A0 =C2=A0 =C2=A0  =C2=A0 --- =C2=A0 =C2=A0--- =C2=A0 =C2=A0 =C2=
=A0 --- =C2=A0 =C2=A0---
>> +
>> +  The controller itself is agnostic of the display layout=2E The speci=
fic arrangement
>> +  (which grids and segments drive which digits or icons) is determined=
 by the board-level
>> +  wiring=2E Therefore, these bindings describe hardware configuration =
at the PCB level
>> +  to enable support of multiple display implementations using these LE=
D controllers=2E
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - titanmec,tm1618
>> +      - titanmec,tm1620
>> +      - titanmec,tm1628
>> +      - titanmec,tm1650
>> +      - fdhisi,fd620
>> +      - fdhisi,fd628
>> +      - fdhisi,fd650
>> +      - fdhisi,fd6551
>> +      - fdhisi,fd655
>> +      - icore,aip650
>> +      - icore,aip1618
>> +      - icore,aip1628
>> +      - princeton,pt6964
>> +      - winrise,hbs658
>
>Several devices are compatible, so express it here and drop redundant
>entries in the driver=2E
>

I understand the concern=2E I would appreciate your guidance since these a=
re not always direct aliases=2E E=2Eg=2E:
- tm1620 and fd620 varies on which bit is used for the 8th segment=20
- fd655 and fd650 have no titanmec counterpart
- hbs658 is similar to tm1628, yet distinct

We could keep only known distinct implementations, that would yield to:
      - titanmec,tm1618
      - titanmec,tm1620
      - titanmec,tm1628
      - titanmec,tm1650
      - fdhisi,fd620
      - fdhisi,fd650
      - fdhisi,fd6551
      - fdhisi,fd655
      - winrise,hbs658

Which would be inconsistent for cases where vendors appear for another var=
iant=2E
e=2Eg=2E fdhisi,fd628 now being aliased by titanmec,tm1628 while other fdh=
isi variants are listed=2E

Therefore I would suggest to keep fdhisi,fd628 even if implementation is t=
he same as titanmec,tm1628=2E

icore and princeton could be dropped in favor of titanmec equivalents, at =
least for the variants I am aware of=2E Specific implementation for other v=
ariants can be let for future extension, if ever needed=2E

How would you approach this?

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  titanmec,digits:
>> +    description: |
>> +      Array of grid (row) indexes corresponding to specific wiring of =
digits in the display matrix=2E
>
>What is wiring of digits? This and other descriptions don't tell me much=
=2E
>

Controllers use a matrix to drive LEDs=2E Terminology used in datasheets i=
s:
- grids: matrix rows
- segments: matrix columns

Board manufacturers wires display panels differently, including LEDs which=
 are parts of 7-segments:
- =E2=80=9Cdigits=E2=80=9D refers to the ordered list of GRID indices wire=
d to the physical 7-segment digit displays (arranged right to left)
- =E2=80=9Csegment-mapping=E2=80=9D defines how each SEGMENT index within =
these grids maps to the standard 7-segment elements (a-g)

>Wrap according to Linux coding style, so at 80=2E
>
>> +      Defines which grid lines are connected to digit elements=2E
>> +    $ref: /schemas/types=2Eyaml#/definitions/uint8-array
>> +    items:
>> +      minimum: 0
>> +      maximum: 7
>> +    minItems: 1
>> +    maxItems: 8
>> +
>> +  titanmec,segment-mapping:
>> +    description: |
>
>Do not need '|' unless you need to preserve formatting=2E
>
>> +      Array of segment (column) indexes specifying the hardware layout=
 mapping used for digit display=2E
>> +      Each entry gives the segment index corresponding to a standard 7=
-segment element (a-g)=2E
>
>Wrap according to Linux coding style, so at 80=2E
>
>This looks like duplicating the reg property=2E
>

While related, this is not replicating the reg property of led child nodes=
=2E

Each (grid,segment) combination might have a distinct role:
- part of a 7-segment: described using digits and segment-mapping properti=
es
- individual led: described using led child nodes

>
>> +    $ref: /schemas/types=2Eyaml#/definitions/uint8-array
>> +    items:
>> +      minimum: 0
>> +      maximum: 7
>> +    minItems: 7
>> +    maxItems: 7
>> +
>> +  titanmec,transposed:
>> +    description: |
>> +      Optional flag indicating if grids and segments are swapped compa=
red to standard matrix orientation=2E
>> +      This accommodates devices where segments are wired to rows and g=
rids to columns=2E
>> +    $ref: /schemas/types=2Eyaml#/definitions/flag
>> +
>> +  "#address-cells":
>> +    const: 2
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +patternProperties:
>> +  "^led@[0-7],[0-7]$":
>
>Why do you have two addresses? It's not used in your example=2E
>

First is for the grid index, second of for the segment index=2E

>> +    $ref: /schemas/leds/common=2Eyaml#
>> +    properties:
>> +      reg:
>> +        description: Grid (row) and segment (column) index in the matr=
ix of this individual LED icon
>
>Missing constraints=2E
>
>> +    required:
>> +      - reg
>> +

Well noted=2E

>> +required:
>> +  - compatible
>> +  - reg
>> +  - titanmec,digits
>> +  - titanmec,segment-mapping
>> +
>> +additionalProperties: true
>
>No, this cannot be true=2E Look at any other binding, look at example-sch=
ema=2E
>

I got misled by "spi-3wire" which is not defined in spi-peripheral-props=
=2Eyaml but only as a child node property of spi-controller=2Eyaml=2E

I wasn't sure how to implement this correctly=2E I have reviewed existing =
examples and will replace with:

if:
  properties:
    compatible:
      contains:
        enum:
          - titanmec,tm1618
          - titanmec,tm1620
          - titanmec,tm1628
          - fdhisi,fd620
          - fdhisi,fd628
          - winrise,hbs658
then:
  allOf:
    - $ref: /schemas/spi/spi-peripheral-props=2Eyaml#
  properties:
    spi-3wire: true
  required:
    - spi-3wire

unevaluatedProperties: false

>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/leds/common=2Eh>
>> +
>> +    i2c {
>> +      #address-cells =3D <1>;
>> +      #size-cells =3D <0>;
>> +
>> +      display-controller@24 {
>> +        reg =3D <0x24>;
>> +        compatible =3D "fdhisi,fd655";
>> +        titanmec,digits =3D [01 02 03 04];
>> +        titanmec,segment-mapping =3D [03 04 05 00 01 02 06];
>> +        #address-cells =3D <2>;
>> +        #size-cells =3D <0>;
>> +
>> +        led@0,0 {
>> +          reg =3D <0 0>;
>> +          function =3D LED_FUNCTION_ALARM;
>> +        };
>> +
>> +        led@0,1 {
>> +          reg =3D <0 1>;
>> +          function =3D LED_FUNCTION_USB;
>> +        };
>> +
>> +        led@0,2 {
>> +          reg =3D <0 2>;
>> +          function =3D "play";
>> +        };
>> +
>> +        led@0,3 {
>> +          reg =3D <0 3>;
>> +          function =3D "pause";
>> +        };
>> +
>> +        led@0,4 {
>> +          reg =3D <0 4>;
>> +          function =3D "colon";
>> +        };
>> +
>> +        led@0,5 {
>> +          reg =3D <0 5>;
>> +          function =3D LED_FUNCTION_LAN;
>> +        };
>> +
>> +        led@0,6 {
>> +          reg =3D <0 6>;
>> +          function =3D LED_FUNCTION_WLAN;
>> +        };
>> +      };
>> +    };
>> +
>> +  - |
>> +    #include <dt-bindings/leds/common=2Eh>
>> +
>> +    spi {
>> +      #address-cells =3D <1>;
>> +      #size-cells =3D <0>;
>> +
>> +      display-controller@0 {
>> +        reg =3D <0x0>;
>> +        compatible =3D "fdhisi,fd628";
>> +        titanmec,transposed;
>> +        titanmec,digits =3D [00 01 02 03];
>> +        titanmec,segment-mapping =3D [00 01 02 03 04 05 06];
>> +        spi-3wire;
>> +        spi-lsb-first;
>> +        spi-rx-delay-us =3D <1>;
>> +        spi-max-frequency =3D <500000>;
>> +        #address-cells =3D <2>;
>> +        #size-cells =3D <0>;
>> +
>> +        led@4,0 {
>> +          reg =3D <4 0>;
>> +          function =3D "apps";
>> +        };
>> +
>> +        led@4,1 {
>> +          reg =3D <4 1>;
>> +          function =3D "setup";
>> +        };
>> +
>> +        led@4,2 {
>> +          reg =3D <4 2>;
>> +          function =3D LED_FUNCTION_USB;
>> +        };
>> +
>> +        led@4,3 {
>> +          reg =3D <4 3>;
>> +          function =3D LED_FUNCTION_SD;
>> +        };
>> +
>> +        led@4,4 {
>> +          reg =3D <4 4>;
>> +          function =3D "colon";
>> +        };
>> +
>> +        led@4,5 {
>> +          reg =3D <4 5>;
>> +          function =3D "hdmi";
>> +        };
>> +
>> +        led@4,6 {
>> +          reg =3D <4 6>;
>> +          function =3D "video";
>> +        };
>> +      };
>> +    };
>
>
>Best regards,
>Krzysztof

Thanks,

Jean-Fran=C3=A7ois Lessard

