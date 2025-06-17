Return-Path: <linux-leds+bounces-4832-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC951ADD86C
	for <lists+linux-leds@lfdr.de>; Tue, 17 Jun 2025 18:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F6E54A593C
	for <lists+linux-leds@lfdr.de>; Tue, 17 Jun 2025 16:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E082F5491;
	Tue, 17 Jun 2025 16:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyWLjUQP"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC3C2ECE8F;
	Tue, 17 Jun 2025 16:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750177794; cv=none; b=ddglvLKDnuMS9NjPGrDoJjwovZrZYxjVkGxN2JhY4eNSaTxLUUNG8a68CxknYokho505EYGxxt8psX0dSRPYdHUCf2qSQUIyaMoBt8olSQmfaHbjaD0a/l7BPBG2sBtuPBic68AGZcW0hjTfyGfbXkaIa7rO68jUHLy2+DWS2AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750177794; c=relaxed/simple;
	bh=BIZcQX5YRy6ssm0zujrXB+jqtT/oMGZrC0HZbgZIkG0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g2TM3sDUmuOTwTjpuZ+HkhhN/1rgSfjuVvv9GynvstN6R0wzQNhbHaI5KMc9GoIlD3cl71swz9MQSGVlkNPq1b78+rk2kQEAS9TQpoYp1xDjZKBnGqd3OyGvOBD/axZij7+Zu85pn2ZylPbBfIXyP83J2ObBzYvnLsLctNe0vUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyWLjUQP; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2360ff7ac1bso41928995ad.3;
        Tue, 17 Jun 2025 09:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750177792; x=1750782592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+E2gtTaXhJT0UsOBNtcPlSHb/04hccrQEaoXRrSURg=;
        b=gyWLjUQPSnpKYAlgKhkpZ3pvuHPjfSMivqgOetNGT87jMZpAPJiW0Yp2UnN6olvTbw
         +4CYfyuR8DfxR9BooEF6eB9QtNuZapxFnRqyoG4HyfkXzC7h1qfz4f+bk6jxoPN94Vvz
         zgTcpP8WnnTKGQDGJVdmxDDIfj3JhYQb9JP9vG/WQxFy3pGUoGoSH87fbckmR6X0WNUy
         4yV6MI9lES2ghRAwIubzfZDGxMS3U3Tfpj2KbqaCsy9tReiaHLl8eGiloh4QUIrGjztt
         eN0QvcGCT3YUoM12G2XLEDJdN6K4LEaQefXyntIol/XXtLrSYfg9pszYx+Q5b72/YBBU
         hJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750177792; x=1750782592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+E2gtTaXhJT0UsOBNtcPlSHb/04hccrQEaoXRrSURg=;
        b=nB77NKcmgvhXCB3QqCPZpwkSTYXIJ93bNNpCnLHpmnWad9eaWn12nJ5a6qjtoC4xkW
         8Zcin/F7X5yRw9czQzdv/eboAErisMlxD9DcP+cU6asTGeFGxTqrUn+YskQjWw4cFPiW
         pLL6TYeG1GU/JwuneG69B7y8UlllFgKWzi8NG38jwS2v0EiynEF51cK2Dh70ozMgvRrN
         Eekof1DRZdvSvY+ltKxhSLsOUTP+xD8RKb6mWfDKiMkQoJA12Geg1FS8tbmL/FVK6n6q
         CjoEGC2HzbbZYQNUv2WNbq8DLSreChwRGfxvh0TlnpBCcrZYn9+NrS1i7RxiDg+ueP60
         vy7A==
X-Forwarded-Encrypted: i=1; AJvYcCUoKHcRlANx2hWPWaiazWsAV7BNTsE1GJjk2TcwzR8RdX1cUfWtYxyuHpy25A1yqTECFJfZreMTMpFO@vger.kernel.org, AJvYcCUzOH8QJ0HyvUpV88l2+pgNYw6SOyu2GMonZPrj0LYg0I3EkW2yew6GREd9ky8Q4kSiQaCqDONcb/ni@vger.kernel.org, AJvYcCVNM4bL2CJtNWDK2nHtGnuhw6enIoWobP14uAiGSkFpL713Uc/qkSVPe5zb09I6yYaITZdBmPfIy2N7hT3x@vger.kernel.org, AJvYcCWWVYcu9kN/QWJQRqjEmugR8uQaR5/A+D8dIkmGUr34gWDqkRdkV5oFjor7/TwAS/Us4eCJXxFaGQw/3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEBBONcnWdX/MbkTC46tUkLr86QXN0B1nKHR61ncAgpygLbyZr
	OAa4IfSl13zDyisZP4PAfUmB3QBBPtAwBMm6aic4XEvj+zCZXa3/UrzGY58v2g==
X-Gm-Gg: ASbGncsmbmxpZ+BzE7Gy6LYm9azpwTDUwJ5j+v1cdNrD4GuX2MqWCFBO4VLDJdyqu1c
	rZYdqPNUCzki0Ic4xoO16B/3vTvyHUA6DU03IjEW/D9jphBLnoriCjxx0uFijDjoZORHG7Q6its
	C6VNbBeKBr7jZ/Jhc1v0+EaFAV5+BQAhskL/WQXIYBZBxTk+VUy6uK5bHXRNBeoa4pfsxiCPicq
	6wu00WpcwGe6r25EzdLA5jAPc095Opw0rnvy9UeUVQHBNEE4RMyDUEQyUb/YQr8lIKHDXFuVB0X
	rCR1RVOngQU46rMk8rz+FgG36Nf/reRQHDJ9TpN+AgC0n1bGVfrOR5BJqesM0pBqh3mF4wuC
X-Google-Smtp-Source: AGHT+IFdOM7O7ou6xz9Xrae18AbOgPrQOugiO//m9L8wPjj8dcDLjoaFQt2yYXP5Ysc+kkcQe7SSmA==
X-Received: by 2002:a17:903:943:b0:234:cc7c:d2e2 with SMTP id d9443c01a7336-2366afc485bmr209412625ad.1.1750177792108;
        Tue, 17 Jun 2025 09:29:52 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.113.163.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de782e2sm81706485ad.103.2025.06.17.09.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:29:51 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: krzk+dt@kernel.org
Cc: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 1/4] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Tue, 17 Jun 2025 23:29:47 +0700
Message-Id: <20250617162947.16955-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250611-nimble-archetypal-raptor-eadcb6@kuoka>
References: <20250611-nimble-archetypal-raptor-eadcb6@kuoka>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 11 Jun 2025, Krzysztof Kozlowski wrote:

> > +patternProperties:
> > +  "^led@[0-3]$":
> > +    type: object
> > +    $ref: common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      led-cur:
> > +        $ref: /schemas/types.yaml#/definitions/uint8
> > +        description: |
> > +          LED current in 0.1 mA steps (e.g., 150 = 15.0 mA; 0 if not connected)
> > +        minimum: 0
> > +        maximum: 255
> > +
> > +      max-cur:
> > +        $ref: /schemas/types.yaml#/definitions/uint8
> > +        description: Maximum allowed current in 0.1 mA steps
> > +
> > +      reg:
> > +        minimum: 0
> > +        maximum: 3
> 
> Place properties according to DTS coding style.

Got it! I'll update the property order accordingly.

> > +  '^multi-led@[4-7]$':
> > +    type: object
> > +    $ref: leds-class-multicolor.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      reg:
> > +        minimum: 4
> > +        maximum: 7
> > +
> > +      '#address-cells':
> 
> Don't mix quotes. Either ' or "

I'll use consistent ".

> > +        const: 1
> > +
> > +      '#size-cells':
> > +        const: 0
> > +
> > +    patternProperties:
> > +      "^led@[4-9a-f]$":
> > +        type: object
> > +        $ref: common.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          led-cur:
> > +            $ref: /schemas/types.yaml#/definitions/uint8
> 
> No, use existing led common properties. Also observe the units - this is
> not uint8 but a defined type for microamp, see property-units in
> dtschema.
> 
> > +            description: |
> > +              LED current in 0.1 mA steps (e.g., 150 = 15.0 mA; 0 if not connected)
> > +            minimum: 0
> > +            maximum: 255
> > +
> > +          max-cur:
> > +            $ref: /schemas/types.yaml#/definitions/uint8
> 
> No, use existing led common properties. Same everywhere.

I'll replace max-cur with the standard led-max-microamp.
I'll remove led-cur as there's no equivalent LED common property to represent it.
The LED current can be configured runtime via the led_current sysfs.

> > +examples:
> > +  - |
> > +    #include <dt-bindings/leds/common.h>
> > +
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        led-controller@1b {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            compatible = "ti,lp5812";
> > +            reg = <0x1b>;
> > +            vcc-supply = <&vdd_3v3_reg>;
> > +
> > +            led@0 {
> > +              reg = <0x0>;
> 
> 
> Messed/mixed indentation.

I'll fix it.

> BTW, such significant binding change at v9, invalidting reviews and
> rewriting the binding completely, is surprising.

Understood. I restructured the binding in v9 to align with leds-class-multicolor.yaml
and better represent the LP5812 hierarchy.
I'll make sure to highlight such major changes more clearly in future revisions.

Appreciate your time and feedback.

Best regards,
Nam Tran

