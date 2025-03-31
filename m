Return-Path: <linux-leds+bounces-4381-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA3BA76AE3
	for <lists+linux-leds@lfdr.de>; Mon, 31 Mar 2025 17:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33F80170230
	for <lists+linux-leds@lfdr.de>; Mon, 31 Mar 2025 15:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB172135D0;
	Mon, 31 Mar 2025 15:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nEkXLI48"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DF18BEA;
	Mon, 31 Mar 2025 15:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743435127; cv=none; b=tBuyjR7Oyzh/TmiY37RBcY3KQD3Brw/LDLqpKzaaxNMY+tPa5woKY9UHzAOoWv4PCaPcsF4hH3MDHAAkTNtKD5jOySnA0AP+7bU6CjvP5gfOR2IlFj5zh4/zUvKWDVh9rGCXw/gs4w+w266w+xPqy5ERxvWNND3ptoRYrgV7zbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743435127; c=relaxed/simple;
	bh=8vTWO2waeOhyP15csPigSdUcwOGJzwHFOsIqYQ5lu7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D5LNYl9CV2om5WPV7QgkGQUzGIYMNPcuk+w7jpFmnvlvOeJeKEEAiqxJe7gT8cM/iRryJgaH9R2U2d3n1sS0WAoLrf/OQMrOtvAU5zgcEYRXCyyMRFi7gleIcogvUqIQMMP8qR7o7tRYGWFZ+IlpkAiomOSM1y1nhFb8aVEH630=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nEkXLI48; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso8240583a91.0;
        Mon, 31 Mar 2025 08:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743435125; x=1744039925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HnCNSq0o/FR3ObCI2X9G4SZqwl8SvbhxvoXh9ZLHBBU=;
        b=nEkXLI48UkqcVipDwuGPsnx67HkEzxR0225zTz+kx2YdkuFtiI+VefE4pyn6qccf3F
         6Y1+vOWVcrKcUunj0KgZa4qSNewbQTpA6UJFXLzGjfUIUiCwwaN1PiKFfJPY+Q6iMGsg
         /J9v2daxi0wvEKixwZ8puz+RvLju3qf0wsIO2MoMPIMF57T5JI0AledXXwn8ByLEjn/m
         SdD1vANwcatyb74mEl7F6yVfoDnLLnzwFPkwrGhK3D2CfivSEhiBkTSRuOKkjaXA3cya
         M/Hg2WWafAUoeOmCxTJCYb2gfX9pNp7LqXKFPspR7klpAG9/lvpDJbvu0VL2p9yucXmt
         LC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743435125; x=1744039925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HnCNSq0o/FR3ObCI2X9G4SZqwl8SvbhxvoXh9ZLHBBU=;
        b=kPwY9YVmrUVMzOVOXZeyJtGO1+cl6rQpbyrLemy1R7DZtTFblVauKIBlVtcVUFSaRr
         daVxMNAx+ixBbqRHr82iNMOE0WnbaPy7cZmadn/SsPtwpt079M/NX/hV7DUn55bt6vBz
         8PBmXMjnEx2CkoD67TMyYwIWcq4TVccAVzwOxGBBry2kmlSrziRYxysZnELBR+MvERxO
         e8Lj13RUtuM2XCRTrjVq5WrhmmForfgjC0VYY9leYN62crBInV/yO0u77CMTxnE9BW7d
         V+XZVvLSrXgP8p+qHxyCi/yTMYPr1XZg4lTnG4Lrvd4cXFXyhTlW4jobj5ZgIs0uobj9
         ewlA==
X-Forwarded-Encrypted: i=1; AJvYcCUQZ1/wvgR939DcVma6gfocNJxC/lEB39DtXMA/QC9fzibkbzHUGJ2WHlHfP654cOJjIae+lZu7DmKN@vger.kernel.org, AJvYcCUat3qiJd7wOdYZGMgbPaP4oiuXw5wBoOQVNrvIkZxlwL/QrasSbu8J83Ho3hwbz2a9fEgi7x8qzJAv72Db@vger.kernel.org, AJvYcCVKc2w0aqU/Bar/vDcY1ZCueqH8wOO5Sau46Gr5iy9RsDnT3eITXQjh5Ulm275eaJqYYCA7Rme/D1NKkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkACRPB1nwlYDKthZAzOcqFYGwxC6j/x5cIdsJUg9pTPUTjGxK
	LUhP0GU+bI7BXdCYhty8f8PEO8yXsEzFMEVsOsfnD1IccKN2tymgS4rSkDgb
X-Gm-Gg: ASbGncvrWws0oDJ1vYndPBHjseog10Q9B3cJRLC4LSlaOmBvKvfAtLv6y2p339lqxnP
	xpGT0MP1DVolupph69FtIjG+ubwnymMYyaYCdlrXqV8ZjZti1i29M0rQJEAoOirwkqMuaNGKqkZ
	sBekJXIu7l1eCRWEvOvIgGMhnFfFGGG6fySo5Ao87vePOdnnATXybqZqhj7R4nbc6HvIR9O9ZlQ
	0HxahWorDhenwQJAkRQkaE442zLtj45rPbOCHEdKLjzmqy86C+F4ZxE7uNZxPQxvUz3EK6BIPMA
	4iFvq6jmBiE8CqCd5evt9KPGJsfUuy9iDQzyTyUt6yX/bocofIlvaIUlog==
X-Google-Smtp-Source: AGHT+IEIR5JRCPuV+YKyKJEzyfITyiPiPWZ6P2tjzdTV+yh+2ubxanUM3vLdqFZvvwNlXRdEbu+w1w==
X-Received: by 2002:a17:90b:1f91:b0:2fa:3174:e344 with SMTP id 98e67ed59e1d1-3051c9517dbmr19869593a91.14.1743435125257;
        Mon, 31 Mar 2025 08:32:05 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30516d61799sm7337814a91.23.2025.03.31.08.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 08:32:04 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: krzk+dt@kernel.org
Cc: pavel@kernel.org,
	lee@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: leds: Add LP5812 LED driver
Date: Mon, 31 Mar 2025 22:31:38 +0700
Message-Id: <20250331153138.52539-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <59c3c5f6-98a3-4c02-8622-9bad2a06c6f1@kernel.org>
References: <59c3c5f6-98a3-4c02-8622-9bad2a06c6f1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18 Mar 2025 19:59:51, Krzysztof Kozlowski wrote:

>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/leds/ti,lp5812.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +$ref: /schemas/leds/common.yaml#
>>> +
>>> +title: Linux driver for LP5812 LED from Texas Instruments
>> 
>> Nothing improved.
>> 
>> Nam: Do you mean the title should focus on the LP5812 hardware itself? If so, I will update it accordingly to better describe the device.
>
>No, I mean you should say what this device is, not what the driver is
>for. Bindings are about hardware, not drivers.

Thank you for the clarification.
I will change the title to “TI/National Semiconductor LP5812 LED Drivers”.

>> 
>>> +
>>> +maintainers:
>>> +  - Nam Tran <trannamatk@gmail.com>
>>> +
>>> +description: |
>>> +  The LP5812 is an I2C LED Driver that can support LED matrix 4x3.
>>> +  For more product information please see the link below:
>>> +  https://www.ti.com/product/LP5812#tech-docs
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: ti,lp5812
>>> +
>>> +  reg:
>>> +    maxItems: 1
>> 
>> 
>> This improved... but:
>> 
>>> +
>>> +  "#address-cells":
>>> +    const: 1
>>> +
>>> +  "#size-cells":
>>> +    const: 0
>> 
>> What are these?
>> 
>> Nam: I included the #address-cells and #size-cells properties to resolve a warning encountered when running:
>> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/leds/ti,lp5812.yaml
>> The specific warning was:
>> Documentation/devicetree/bindings/leds/ti,lp5812.example.dts:23.17-30: Warning (reg_format): /example-0/i2c/led-controller@1b:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>
>This makes no sense.
>
>> This warning suggests that the default values for #address-cells and #size-cells in the schema context are not aligned with the LP5812's expected usage. To explicitly define the correct values, I set these properties as mentioned.
>> This ensures that the binding schema validation passes without warnings. If you believe a different approach is more appropriate, I’m happy to adjust the binding accordingly.
>
>I can barely parse your messages. They are neither properly quoting my
>replies, nor wrapped according to email style. Use standard format,
>expressed in countless guides bout netiquette and mailing lists.
>
>You added properties to hide warning, instead of fixing the warning, but
>these properties make nos sense here.

#address-cells is 1 because I only one cell to define address of a child node of LP5812
#size-cells is 0 because I don't need to define size of reg properly of child node.
Reg properly of child node is describe for address only.

>> 
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>> 
>> Nothing improved here.
>> Your previous comment
>> No ref to LED common schema? No other properties? This is too incomplete
>> 
>> Nam: I have chosen not to reference common.yaml in the LP5812 binding because the LP5812 does not fully align with the standard LED properties defined in the common schema. Since the driver does 
>
>That's a no go.
>
>> not use standard properties like function, color, or max-brightness, I believe referencing the common schema would introduce unnecessary constraints.
>
>Driver? Please describe hardware, not driver.
>
>> Currently, I have included compatible and reg as required properties, as they are essential for describing the LP5812 device. Are there additional properties that should be marked as required? Or if you have specific improvements in mind, I would appreciate your guidance.
>
>Look at other bindings and do not re-invent.

I checked other bindings and I will update LP5812 yaml follow multi color led and describe LP5812 hardware in the yaml.
My new yaml will update as below

# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
%YAML 1.2
---
$id: http://devicetree.org/schemas/leds/ti,lp5812.yaml#
$schema: http://devicetree.org/meta-schemas/core.yaml#

$ref: /schemas/leds/common.yaml#

title: TI/National Semiconductor LP5812 LED Drivers

maintainers:
  - Nam Tran <trannamatk@gmail.com>

description: |
  The LP5812 is an I2C LED Driver that can support LED matrix 4x3.
  For more product information please see the link below:
  https://www.ti.com/product/LP5812#tech-docs

properties:
  compatible:
    const: ti,lp5812

  reg:
    maxItems: 1
    description:
      I2C slave address
      lp5812/12- 0x1b

  "#address-cells":
    const: 1

  "#size-cells":
    const: 0

patternProperties:
  '^multi-led@[0-3]$':
    type: object
    $ref: leds-class-multicolor.yaml#
    unevaluatedProperties: false

    properties:
      reg:
        minItems: 1
        maxItems: 12

      '#address-cells':
        const: 1

      '#size-cells':
        const: 0

    patternProperties:
      "^led@[0-9a-f]+$":
        type: object
        $ref: common.yaml#
        unevaluatedProperties: false

        properties:
          reg:
            maxItems: 1

        required:
          - reg

required:
  - compatible
  - reg

additionalProperties: false

examples:
  - |
    #include <dt-bindings/leds/common.h>

    i2c {
        #address-cells = <1>;
        #size-cells = <0>;

        led-controller@1b {
            compatible = "ti,lp5812";
            reg = <0x1b>;
            #address-cells = <1>;
            #size-cells = <0>;

            multi-led@0 {
              #address-cells = <1>;
              #size-cells = <0>;
              reg = <0x0>;
              color = <LED_COLOR_ID_RGB>;
              led@0 {
                     reg = <0x0>;
                     color = <LED_COLOR_ID_GREEN>;
              };
              led@1 {
                     reg = <0x1>;
                     color = <LED_COLOR_ID_RED>;
              };
              led@2 {
                     reg = <0x2>;
                     color = <LED_COLOR_ID_BLUE>;
              };
            };

            multi-led@1 {
              #address-cells = <1>;
              #size-cells = <0>;
              reg = <0x1>;
              color = <LED_COLOR_ID_RGB>;
              led@3 {
                     reg = <0x3>;
                     color = <LED_COLOR_ID_GREEN>;
              };
              led@4 {
                     reg = <0x4>;
                     color = <LED_COLOR_ID_RED>;
              };
              led@5 {
                     reg = <0x5>;
                     color = <LED_COLOR_ID_BLUE>;
              };
            };
            multi-led@2 {
              #address-cells = <1>;
              #size-cells = <0>;
              reg = <0x2>;
              color = <LED_COLOR_ID_RGB>;
              led@6 {
                     reg = <0x6>;
                     color = <LED_COLOR_ID_GREEN>;
              };
              led@7 {
                     reg = <0x7>;
                     color = <LED_COLOR_ID_RED>;
              };
              led@8 {
                     reg = <0x8>;
                     color = <LED_COLOR_ID_BLUE>;
              };
            };

            multi-led@3 {
              #address-cells = <1>;
              #size-cells = <0>;
              reg = <0x3>;
              color = <LED_COLOR_ID_RGB>;
              led@9 {
                     reg = <0x9>;
                     color = <LED_COLOR_ID_GREEN>;
              };
              led@a {
                     reg = <0xA>;
                     color = <LED_COLOR_ID_RED>;
              };
              led@b {
                     reg = <0xB>;
                     color = <LED_COLOR_ID_BLUE>;
              };
            };
        };
    };

...

>> 
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    i2c {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        led-controller@1b {
>>> +            compatible = "ti,lp5812";
>>> +            reg = <0x1b>;
>>> +        };
>>> +    };
>>> +
>>> +...
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 8e0736dc2ee0..2bd9f5132cab 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -23506,6 +23506,12 @@ S:   Maintained
>>>  F:   Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
>>>  F:   drivers/leds/leds-lp8864.c
>>>
>>> +TEXAS INSTRUMENTS' LP5812 LED DRIVER
>> 
>> Nothing improved.
>> Your previous comment
>> 5 is before 8, so this does not look sorted.
>> 
>> Nam: I have reviewed the sorting order in MAINTAINERS, and I believe the current placement of LP5812 is correct. Since "LB" comes before "LP" alphabetically, "TEXAS INSTRUMENTS' LB8864 LED DRIVER" is correctly listed before "TEXAS INSTRUMENTS' LP5812 LED BACKLIGHT DRIVER".
>
>
>Indeed, existing entry has typo, so code is fine. Is it such a big deal
>to answer to reviewer to his comment?

Thank you for the clarification. I now understand that the existing entry contains a typo.
I will make sure to response to reviewer comments more promtly in the future.
Is it acceptable if I modify MAINTAINERS file to adjust LB8864 to LP8864?

Best regards,
Nam Tran

