Return-Path: <linux-leds+bounces-3176-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81ED99B1EBD
	for <lists+linux-leds@lfdr.de>; Sun, 27 Oct 2024 15:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14C98281F9D
	for <lists+linux-leds@lfdr.de>; Sun, 27 Oct 2024 14:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178A916B3B7;
	Sun, 27 Oct 2024 14:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxnAzRD/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C3E15573A;
	Sun, 27 Oct 2024 14:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730039506; cv=none; b=G2HVjqWhGsqcmicjBPmjLZ3o1v/8ckDZlgd1tmZENnh+GoLzXmWZLqzbL6rbMW19hG4cfXA3CeuQjmYRCQHPQEU89KWEmYgWl01d7XQBcYN6a79vAI0EHy1QZdC8loIYu8hbLw7MgVSBopP+uSOfPmElROXIUl70ZKHefirsFvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730039506; c=relaxed/simple;
	bh=camzmMf5Fi5UPFDqxtb+tbNiz4IvdOTVNzJTLFevpcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cwMx4aBwVPoWG92ZkN5p4k18z0jJTo+zUJo4JGcTLg0bVZQJ2QlRDCtPGmcn93AIuHpOpLNJBV0VS16L3q9VnlKeF+Q6kAJiJhoKNb1HU1LRRDbSJ1JC2i+ut48MnTBUPKbLGfB1VnKqlAL2P07OG/uPl7MgXrySvlCmxW6HHGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxnAzRD/; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5cb15b84544so4393128a12.2;
        Sun, 27 Oct 2024 07:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730039502; x=1730644302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ViqwTp0n7slxj0+sutWl11crfN2XQoRXTaxSzJ6qT4c=;
        b=kxnAzRD/PcV8JQzn1xgStsM46e6obxDv3rN36byz5qQ6TeM9yPpJ/wFlQ4uyGbBsSc
         YfRVqOyVEYERUobPgxVVlOtTsK+tLP3fVl3M+JE0ACKQ0zs9xg0u7KuYBM6ThMym8UQZ
         2ep42vWGteA/N4ARFUgn2RPpTPw1Lt9tvrwOlMTIe5WB7MW90vGVHFkQ+wLIN5VcPVmG
         qvjzN/HLEeFXLu5eAqDoGIzjbdqaLb5TXiPqfAQDpMwj1MluIn9cBOaPcBSQVzA2PDa2
         bObvNRB6r2wi/7lxMMT3WlDgikSLmD5tIu7ftInwBI/aJ/HJsS1Po99fFHZK718aQ89W
         Hy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730039502; x=1730644302;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ViqwTp0n7slxj0+sutWl11crfN2XQoRXTaxSzJ6qT4c=;
        b=oCsEZoRvsoNwavjEUQiT32MlRb/0sM6Xjorq3uqXTlm8rf2u71gqUTImMVH8OzEzMw
         4w4/+1Zm0Zjb5yXCKhSXAIj88nFvTgIepqUMrZjYCArm1h2H0EDwWg4L++lRuelhyInh
         ep6ZMWDQ5Uf2ZpY4TL/CBG7kPOxqh3EuOQzsoiZA+Xo/YQF+a4qxiPq8KMmwj8r7ns3Y
         7sCfSHxPKDShKKTj2pcohPF2WZf3QdWUDnp7g83gmsDxGxCeQMPWN+dX/8kmftlSuYGb
         3ckwgS9mhjZzHmuw7YoG2EZP3pEhI4buy26yh1vb2r1UX2m4riNfa5bSZXdUTa/oDo1X
         toHA==
X-Forwarded-Encrypted: i=1; AJvYcCUQrXdlZ33LA237u7Zwb+3DUy6nMOrIovERPp+SJeHMJFW+8tYRLsWOKMrTSTyCQTcsDWKfr9eD7UOxtg==@vger.kernel.org, AJvYcCUgzKgfagxJcKIjWOtQFWr1olG8Tilhl906heQEhNqhRE12j58TTAehV0lRa0SqS95A1Ioe0+ZgbTatL8I5@vger.kernel.org, AJvYcCVSm5gaGDbiImi0CqWolp2zkXFoUrveUCI4XljkqrBo8oJQ6uaw5s0meqCbUXyJe6qxsdWVeFD9Q76H@vger.kernel.org
X-Gm-Message-State: AOJu0YwbmOsNops8QxaAHsnOSKqobrSDepaFqL4Q3T5o/0kSHqllFVmo
	nIe7bpDn/MHr1H6Gm2epqoKW9bKEvIyNyAV3ALlZN/4as/XDE5eJ
X-Google-Smtp-Source: AGHT+IGThw74/e04YOIKvgL3EKIEnqOHiGdb2Vg4qxOeUo9n0KY+sTpx4a7nBMxnPOu52UWqi2WM5Q==
X-Received: by 2002:a17:907:9727:b0:a9a:230b:ff2c with SMTP id a640c23a62f3a-a9de5f2226dmr540944766b.30.1730039501952;
        Sun, 27 Oct 2024 07:31:41 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb634737fsm2407562a12.82.2024.10.27.07.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Oct 2024 07:31:40 -0700 (PDT)
Message-ID: <84dcf231-df5d-7503-f61c-10a30d092287@gmail.com>
Date: Sun, 27 Oct 2024 15:31:38 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/3] dt-bindings: leds: Add LED1202 LED Controller
Content-Language: en-US
To: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
 pavel@ucw.cz, lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <Zx0AqwUUchl4M6po@admins-Air>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <Zx0AqwUUchl4M6po@admins-Air>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vicentiu,

On 10/26/24 16:46, Vicentiu Galanopulo wrote:
> The LED1202 is a 12-channel low quiescent current LED driver with:
>    * Supply range from 2.6 V to 5 V
>    * 20 mA current capability per channel
>    * 1.8 V compatible I2C control interface
>    * 8-bit analog dimming individual control
>    * 12-bit local PWM resolution
>    * 8 programmable patterns
> 
> If the led node is present in the controller then the channel is
> set to active.
> 
> Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
> ---
> 
> Changes in v3:
>    - remove active property
> Changes in v2:
>    - renamed label to remove color from it
>    - add color property for each node
>    - add function and function-enumerator property for each node
> 
>   .../devicetree/bindings/leds/st,led1202.yml   | 103 ++++++++++++++++++
>   1 file changed, 103 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/st,led1202.yml
> 
> diff --git a/Documentation/devicetree/bindings/leds/st,led1202.yml b/Documentation/devicetree/bindings/leds/st,led1202.yml
> new file mode 100644
> index 000000000000..f64273599181
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/st,led1202.yml
> @@ -0,0 +1,103 @@
> +patternProperties:
> +    "^led@[0-9a-f]+$":
> +    type: object
> +    $ref: common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +        reg:
> +        minimum: 0
> +        maximum: 11
> +
> +    required:
> +        - reg
> +
> +additionalProperties: false
> +
> +examples:
> +    - |
> +        #include <dt-bindings/leds/common.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        led-controller@58 {
> +            compatible = "st,led1202";
> +            reg = <0x58>;
> +            address-cells = <1>;
> +            size-cells = <0>;
> +
> +            led@0 {
> +                reg = <0>;
> +                label = "led1";
> +                function = LED_FUNCTION_STATUS;
> +                color = <LED_COLOR_ID_RED>;
> +                function-enumerator = <1>;

You should use devm_led_classdev_register_ext() to let LED core create
LED class device name basing on the above three properties.
'label' property will be useless in that case, so please drop it and
avoid constructing LED name in the driver.

> +            };
> +
> +            led@1 {
> +                reg = <1>;
> +                label = "led2";
> +                function = LED_FUNCTION_STATUS;
> +                color = <LED_COLOR_ID_GREEN>;
> +                function-enumerator = <2>;
> +            };
> +
> +            led@2 {
> +                reg = <2>;
> +                label = "led3";
> +                function = LED_FUNCTION_STATUS;
> +                color = <LED_COLOR_ID_BLUE>;
> +                function-enumerator = <3>;
> +            };
> +
> +            led@3 {
> +                reg = <3>;
> +                label = "led4";
> +                function = LED_FUNCTION_STATUS;
> +                color = <LED_COLOR_ID_RED>;
> +                function-enumerator = <4>;
> +            };
> +
> +            led@4 {
> +                reg = <4>;
> +                label = "led5";
> +                function = LED_FUNCTION_STATUS;
> +                color = <LED_COLOR_ID_GREEN>;
> +                function-enumerator = <5>;
> +            };
> +
> +            led@5 {
> +                reg = <5>;
> +                label = "led6";
> +                function = LED_FUNCTION_STATUS;
> +                color = <LED_COLOR_ID_BLUE>;
> +                function-enumerator = <6>;
> +            };
> +
> +            led@6 {
> +                reg = <6>;
> +                label = "led7";
> +                function = LED_FUNCTION_STATUS;
> +                color = <LED_COLOR_ID_RED>;
> +                function-enumerator = <7>;
> +            };
> +
> +            led@7 {
> +                reg = <7>;
> +                label = "led8";
> +                function = LED_FUNCTION_STATUS;
> +                color = <LED_COLOR_ID_GREEN>;
> +                function-enumerator = <8>;
> +            };
> +
> +            led@8 {
> +                reg = <8>;
> +                label = "led9";
> +                function = LED_FUNCTION_STATUS;
> +                color = <LED_COLOR_ID_BLUE>;
> +                function-enumerator = <9>;
> +            };
> +        };
> +    };

-- 
Best regards,
Jacek Anaszewski

