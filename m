Return-Path: <linux-leds+bounces-4454-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EEBA84924
	for <lists+linux-leds@lfdr.de>; Thu, 10 Apr 2025 18:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CAD89A025D
	for <lists+linux-leds@lfdr.de>; Thu, 10 Apr 2025 16:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CCC31EBFEB;
	Thu, 10 Apr 2025 16:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJkB9OOh"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A0E1EB1AB;
	Thu, 10 Apr 2025 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744300814; cv=none; b=ldwiNrqXVQPxJafDJYlp7yNJqB9o/l1hGsudWZSzCBysaikR0qSP4LU8f/Q+ZK2os4lif566q2Y+RgZwscePDQ2juhDg0Xmy/izKBZ51roKXBlDrhv2AcATj59vczAgqYhOnzsJDxyNaU3tIooYebmKXzolATjx7jDoISwNH8rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744300814; c=relaxed/simple;
	bh=TH+d9hezgrqAFx9vO1PjGm3lSkgDKjlYKtHHy1XWlO0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Iv6MrileTZEenYj3JaSMLHWfvoE9kscoZqRxFqWN6WX9Em62o9MGPyhbng19whWfTpLPZrXlmQwA8cBQI6/59h5bBXiAqOh/3oQI5hESLDXprqCZGBqfCOJt3wvstQPsWt+5NRxn0ZZrR1PddQwZOyJ5PUqnclIC27k8rKHcrsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJkB9OOh; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-301c4850194so839807a91.2;
        Thu, 10 Apr 2025 09:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744300812; x=1744905612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZZ9LtkWLqgoGZShzAWjYQkJAaC5SlTy4iIUDO3ICyo=;
        b=lJkB9OOhQ+wHBpJERvEgNTNu5WzuudCQlCJD3diVYkdvAxqwHw6uBf03AFfFzH6H1l
         lzm/8F6b2ZdovPYWahZ21Raryp4MczB9H72tmbNT6M91zgiL0gOlkUp9iAo3zzjHTRW0
         DlPIHmsfxLIIUAtbDgXMj/B66aDFZA/c8FJYN4aDFy1fgY39/csT9VN+p3BwI1x9VK3N
         wVz0J8pvPwvlYwbaISujgqGdtFzTdr0M+vN8iKbtRqA1JviWFbhGNPlrookk1BQGxHYR
         ylAj0AU7Qn5SBINdLFrO2vkZOY2tBt+ddJ0ZXMB3hquDAlDSPzv6Mo1GNJlk/ze3BGaG
         lwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744300812; x=1744905612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZZ9LtkWLqgoGZShzAWjYQkJAaC5SlTy4iIUDO3ICyo=;
        b=CtOqu2KieDQdzZaV9XMnS/wG+dFif1AuxHyrYB1MtsBooYgnez01j6TJwEuZ5ev6ag
         KtTlLTc3sZKmAos0jrylEbUGcZqHFDkYtY30EOsbnBAraLaMNSjp4es4k8CzaQ9+rroO
         VtCjK9k1gpYNbl+7cl08ZQknYCGIrL1RYnyoj+QuS6eSULIfBdX2zQ4kZabfTY1fRK8y
         KSa2ZHvqhFfGBEsk7NjhSmk4YrNC99ulgauXHbVJ6fPxKqdA3XGB9PE5mxLlAA9oB7ue
         jOSX+0KXgI3Ntl71L320q9kAjMlwc91ZwSjDOakIgHEjERIIUfeUgsa3hqdT05IhZbch
         nkzw==
X-Forwarded-Encrypted: i=1; AJvYcCUUtdkZ9L2Kmn/lSLQ9ya5OzNtUb0W0eQMkFECwFf07pIjGrMqVF7oB000suyZUGxCM2wvBnwIW8HGTMT/3@vger.kernel.org, AJvYcCWkbsxT1tkxuP9gzkm4O2hbRayuKBks8019UGfZb2d0LCm1KFnjg7Updn0qiWaetc5Mdkip7a1Wu1ae@vger.kernel.org, AJvYcCX93WgwWZAsOxMHtSgeSAH7hPsa7kE6wF43tDD/10mBXpbZsCewXx7AR5xMaWmQxCJ4PpwdjESTib6DBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXf864DbsxmzOzqlzQ1L0jvwgZ6RgVP/8rSyL1e8cGXQdAK3xq
	ocJw+T51jYQIp9mB4yuVcoa2NgP7uKl5EoUN0aDRGcricsxOA3RXu+7jm2aw
X-Gm-Gg: ASbGncvmDlHPpBYcFAZRAtjBhQDM61nQPXNVaHkEyGldT1vqK1OBRRBrOCr15Um+V+u
	r1edVxvhKY07WMkOaoUjffpkGI3kdifSNKy2IElG2/ZpnSDfruXP3n0dgg+pky0GgFRbXQzT8bi
	lFldA+KPbl4gpvmxAVZWZchx8wpKsfPWAf3UH4WPjRpQ3uvM37rUZdZglOgtdmu5DGA1KmDXMom
	Tr3c0eHZzjrLt4x3v9Gxhp1BhvJltAP95pnuBd/VTBV2l0uIYHjKhCBaa2pslBMo2cfl+F+uGzi
	lxbuxILnm0nOHm8jAwrXBAhRkm2YDUY3Zd8k3KRNWQie1qqqKvdTGw==
X-Google-Smtp-Source: AGHT+IErKLgYkZk8hYVyWgWlBgksOmyT8lnwolamcvoiGnEIZEcDUfV7ekNqqnjyb/6MMLmruop1Fg==
X-Received: by 2002:a17:90a:c105:b0:2ee:aa28:79aa with SMTP id 98e67ed59e1d1-30718b67f03mr4861727a91.6.1744300811898;
        Thu, 10 Apr 2025 09:00:11 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7badb19sm32281255ad.106.2025.04.10.09.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:00:11 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: krzk+dt@kernel.org
Cc: pavel@kernel.org,
	lee@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Thu, 10 Apr 2025 22:59:46 +0700
Message-Id: <20250410155946.5326-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <eac877d0-2fd3-44cf-8917-910042cdcec9@kernel.org>
References: <eac877d0-2fd3-44cf-8917-910042cdcec9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 6 Apr 2025, Krzysztof Kozlowski wrote:

> On 05/04/2025 20:32, Nam Tran wrote:
> > +properties:
> > +  compatible:
> > +    const: ti,lp5812
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description:
> > +      I2C slave address
> > +      lp5812/12- 0x1b
> 
> Drop description, redundant.

I will drop it.

> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^led@[0-9a-b]$":
> > +    type: object
> > +    $ref: common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      reg:
> > +        minimum: 0
> > +        maximum: 0xb
> > +
> > +      chan-name:
> > +        $ref: /schemas/types.yaml#/definitions/string
> > +        description: LED channel name
> 
> Isn't this existing label property? Or node name? You don't need this
> and instead whatever currently LED subsystem is expecting (label got
> discouraged so maybe there is something else now).

It isn't common led and multi-led. LP5812 is new 4x3 matrix leds on mainline.
Therefore, it isn't same as existing led driver common.

> There is no multi-led support in the device? Datasheet this can work as
> matrix and as direct drive of 4 LEDs, so binding looks incomplete. Not
> sure what you exactly miss here - check other recent devices with
> similar features.

My device doesn't support multi-led. Leds are controlled by the control register index directly.
I will list more D0 - D3 leds. However, the maximum of leds are 12 LEDS.
It depends on the operation mode that the end user selects.

> > +
> > +    required:
> > +      - reg
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/leds/common.h>
> > +
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        led-controller@1b {
> > +            compatible = "ti,lp5812";
> > +            reg = <0x1b>;
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            led@0 {
> > +                    reg = <0x0>;
> > +                    chan-name = "a0";
> 
> Mixed up indentation.

I will fix the indentation.

Thanks for your detailed review.
Appreciate your time and feedback!

Best regards,
Nam Tran

