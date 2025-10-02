Return-Path: <linux-leds+bounces-5632-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05976BB2689
	for <lists+linux-leds@lfdr.de>; Thu, 02 Oct 2025 04:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E13419E09B3
	for <lists+linux-leds@lfdr.de>; Thu,  2 Oct 2025 02:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071AA285C85;
	Thu,  2 Oct 2025 02:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtM7qcJc"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C69A1A9FAB
	for <linux-leds@vger.kernel.org>; Thu,  2 Oct 2025 02:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759373927; cv=none; b=ZQGQ6TGBlZ/AIlgHlm8Tj6O92ISAoQ9F5/35fwRwyHoR9zT3Q/vyTZR2DtjJawCDW0KMXRG34p9WDzKmhYiJ67JGNnLa0TjxlPNlZjYahz/yVRaenILKmfjowRCVJ0L1IvwnQn7+cMhjGMnl2NaXScFrl47roZO0SsWW0QNOAs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759373927; c=relaxed/simple;
	bh=AFQ0+vnRlDOTQJXWhOhRj0G+nQ+Zs0XRhRjq4A56fVg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=h9bAICoRJB6oN/6QiL19Q1RFK1dYqtJEcPTLgTZuhgzR0r8IlF7oGNXGxEl8uhQvBb9VMYbZXSl1JALDpYazpJPEOawzJOxIgEkj1+dL6b84SbuoGAJ3CIcfwrhZpJSprtjBe4HqWO0Zx2I9lXBrLWUkQmGDbHABWkhyKdWTrqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtM7qcJc; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4b109c6b9fcso5823801cf.3
        for <linux-leds@vger.kernel.org>; Wed, 01 Oct 2025 19:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759373925; x=1759978725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SPDWoBVHdObjAFgVvHKYm/ngzKxCIMKXS+1jqg6D8Pk=;
        b=UtM7qcJckR/kwomrVl6fdY71A+VWx4SbogP+yE746VzeR5Yvw47Q5K9FVSpS3dF4Xt
         vSVaX20GrdIoD6CAN28Q9Fg9sWMMh/UqslKeKa9J11Nq/4srVLsiskyaCsw8Q5pt48b5
         yug9aGZ4jrGA+Ej2Gtq8WW+ACYs/Vni3HxnKu1QPmiKO2FDG2sKjh4VI58usiZ98H+8o
         5y1T8qlD7cgv2bWaoQh24XTyICGkeV7RFfsMASVf93lqYidg3VOY77SvA18/t99Fshke
         5LW7ti2lkumoY8pdfqZqdSdjFeAT4ylJuK4nGc7cXxYorn66IlFAtvJpUbreGtKL43Vs
         dUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759373925; x=1759978725;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SPDWoBVHdObjAFgVvHKYm/ngzKxCIMKXS+1jqg6D8Pk=;
        b=HPuiSab9l9PRFv0c3zkv4irrn1ODy6E5YQiQf06ExHLf2/yVsdENU7U2g6PrCE56AI
         Pf7Rxd052otSEjWEGj+w+6IFUX4Bsno30gI7SHgKk2v5FAdtWRV5Ui9ulcKE6AF8xyvq
         7DGpQZEWpy6laHMyLGgYLUdR6vDwFTkYenLVHfm/UK/frrhnX9CIzl/IyoqE3yt+jDxU
         MV76xLqiMXPQ80HjJom9OxgnqK3nKWFMYFdnaQlPhqq3d6jvAYma09vrHygtogYAIBz1
         E2yAc0BZ/JTsTiIyC/1pCTo5GHyhocXcy/AJptrbonddReRbevhAmpIQEGBcayQMjUnQ
         5sCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0aW/Yu9ui2JEPW6aTHhpv7PUDHXUp3F2EoxgKNerVOpc7op2UULd8/n/61fuIGr9pAgf/++cjtGi2@vger.kernel.org
X-Gm-Message-State: AOJu0YwUBOuTBcaXj++oZve3g3Y7U0mPgoosMYQ/XnWamNE43ZXOfHUP
	ptlojWDXX4TkeFQqASiiqVZl0tkvCN+wH2c9Aux+82EOjj0NcjpALFvh
X-Gm-Gg: ASbGncsI/yZpxoMaLsw1SvPigbS+PI0gRqCuK/HFWY6va7P4kpVogj+C0MYQpfqvuqL
	0Vhl6QWTJJ4467Ps+2EqxvFyKSlaHtn8F5IDgZ7lo4bc9X9Ey/FTc/JaQip3ffWYHscrSqUKzig
	+xiQZ6uPWVE+w0ZDwnPuny7OgbN5wscrsGk6qNlIDlp/Y5JOuM+DYxvWph9+3f2S2W2QTmX4Qv1
	h7+WHplBLk1xcGaSduve1VQABtTsdJbKdma3P9ZOgWvDQQadsblsUrNggee0LyRpn67XV9bxESz
	G4cT02kmF2YLQZzuNH3CMxTTqm+5YCLpOJO+ZI3s5tDjF/YiQKB4/TrSj47DobjKdlwxzgxsSw6
	jDQNpmiKHK8bzqIN6vPfpfE1sSwykcisNIWxUZeJpAZzbvZJdBINS65QI1PQyI5+wEsOXHA4cHr
	ioNqR3CwKeTbnTiHawWjm8F/vnhg/TuA==
X-Google-Smtp-Source: AGHT+IHEiTChiNkm3rqtjGx8pAiTWZdt9TSl9GKNVJqXH4NffSUcy5+ncXc/xlWZubwQRixrbAWhyQ==
X-Received: by 2002:ac8:5fcd:0:b0:4db:db96:15d3 with SMTP id d75a77b69052e-4e41cc0ce72mr76524281cf.31.1759373924633;
        Wed, 01 Oct 2025 19:58:44 -0700 (PDT)
Received: from ehlo.thunderbird.net (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55c9e77bcsm12172451cf.24.2025.10.01.19.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 19:58:43 -0700 (PDT)
Date: Wed, 01 Oct 2025 22:58:38 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Rob Herring <robh@kernel.org>
CC: Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_3/7=5D_dt-bindings=3A_auxdisp?=
 =?US-ASCII?Q?lay=3A_add_Titan_Micro_Electronics_TM16xx?=
User-Agent: Thunderbird for Android
In-Reply-To: <20251002024431.GA2926696-robh@kernel.org>
References: <20250926141913.25919-1-jefflessard3@gmail.com> <20250926141913.25919-4-jefflessard3@gmail.com> <20251002024431.GA2926696-robh@kernel.org>
Message-ID: <A137AD5E-2D4E-4C1E-8A71-EF90E60D8F14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 1 octobre 2025 22 h 44 min 31 s HAE, Rob Herring <robh@kernel=2Eorg> a =
=C3=A9crit=C2=A0:
>On Fri, Sep 26, 2025 at 10:19:04AM -0400, Jean-Fran=C3=A7ois Lessard wrot=
e:
>> Add documentation for TM16xx-compatible 7-segment LED display controlle=
rs
>> with keyscan=2E
>>=20
=2E=2E=2E
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
>
>Unit addresses are typically hex, so: [0-9a-f]+
>

Acknowledged=2E Will change to hex pattern=2E

>> +        type: object
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          reg:
>> +            description:
>> +              Digit position identifier numbered sequentially left-to-=
right,
>> +              with reg=3D0 representing the leftmost digit position as=
 displayed
>> +              to the user=2E
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
>
>Again, hex please=2E
>

Acknowledged=2E Will change to hex pattern=2E

>I assume this is <grid>,<segment>? Please add a description for the=20
>node and say that=2E
>

Yes this is <grid>,<segment>=2E Will add description=2E

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
>> +dependencies:
>> +  poll-interval:
>> +    - linux,keymap
>> +  linux,keymap:
>> +    - poll-interval
>> +  autorepeat:
>> +    - linux,keymap
>> +    - poll-interval
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +allOf:
>> +  - $ref: /schemas/leds/common=2Eyaml#
>> +    properties:
>> +      color: false
>> +      function: false
>> +      function-enumerator: false
>> +  - $ref: /schemas/input/input=2Eyaml#
>> +  - $ref: /schemas/input/matrix-keymap=2Eyaml#
>> +  # SPI controllers require 3-wire (combined MISO/MOSI line)
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - fdhisi,fd620
>> +              - fdhisi,fd628
>> +              - princeton,pt6964
>> +              - titanmec,tm1618
>> +              - titanmec,tm1620
>> +              - titanmec,tm1628
>> +              - titanmec,tm1638
>> +              - wxicore,aip1618
>> +              - wxicore,aip1628
>> +    then:
>> +      $ref: /schemas/spi/spi-peripheral-props=2Eyaml#
>> +      properties:
>> +        spi-3wire: true
>
>You can drop properties=2E
>

The issue is spi-3wire is defined in the child node of spi/spi-controller=
=2Eyaml,
not in spi-peripheral-props=2Eyaml=2E

Removing properties did not pass dt validation=2E Am I missing something?

>> +      required:
>> +        - spi-3wire
>
>With those nits fixed,
>
>Reviewed-by: Rob Herring (Arm) <robh@kernel=2Eorg>
>

Thank you!

