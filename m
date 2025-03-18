Return-Path: <linux-leds+bounces-4311-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E017A675B8
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 14:58:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90F4E18936EF
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 13:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378D820D50F;
	Tue, 18 Mar 2025 13:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnjLK9uD"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C0E20D4FE;
	Tue, 18 Mar 2025 13:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742306233; cv=none; b=OJ96MWkwKdnLb45KjR1saTMBYOiuBr9NgTxQSCKLXUt74t77Yhr1qv05wQNmlIUlP8JsyB3CHxObOB+W3GtTfL7Tu0l3ta35SjSRQK3II/CWlikBXr+/n5t6+0agxZLQ2pWpaFoJ2d/vv6Uy/txMT+DDlSKmod1l1ZKJqHiRVew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742306233; c=relaxed/simple;
	bh=KoQjw20l5TLX3D1r2V6mhC4XoLgKtXuBGbYHh1PEbpc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EVArwuYIcwSs62JWPfNu/bvMzroUbDj7K/8Iw+b/FVYcI706BZXIMWarYDZKCuuMCihYBoQYUHFwdCTrVrz9vrQXrAJ/HyisNlSmYMPvk4+K0L8yUWrrEqYX9u1E5FIsiS9veGoVOHGbSht2S1/klxxhKbHp4dlPz9aV7UL1/28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnjLK9uD; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-226185948ffso41785415ad.0;
        Tue, 18 Mar 2025 06:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742306227; x=1742911027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUu9BBrIY7rKfnbxTc+pIw+zfT33rnNVtuhkLSBgY1M=;
        b=ZnjLK9uDDJQ9aAmGkkfWDnvtWiUakztzMfWTY3zzoOoTtyRK7mM9BknXSuVOQHmTTl
         tJCk/+xqPWQblNyZsrMocjA/rSAiZZKCEcyyGo4Q3ZXdMAwmyOFeHCym+nyRhWsWatWj
         kY4XF1heFo8lCmG7+G33hqGSBFWbwtnMsB0R9VWhlW3QitMYouhwwRnvnUptCmnxaKF3
         hKaFHeX78VYUNbECjuKX1egxNKvydfuEU8wWdG9cCnOUfh+ylqbZbHLRBoXwVDWRsWDc
         nJKjXBm8/sql42lmZf2z6fBB9k9m3IOpo33j51rGtFuU0L9LmrXMOww4K1KFvV+LgWB6
         lI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742306227; x=1742911027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUu9BBrIY7rKfnbxTc+pIw+zfT33rnNVtuhkLSBgY1M=;
        b=MD01yKMN/bDqOZwfRFb4d3XJxMwg/8AJf7ahUOI/Z/G1h7PpN3bzlQq9GWkDPevekJ
         OgOrSDfVDTBjJaclN1grjZ+gKAsKKZAbp+VIiZJ71rJ8J9kUlCjWjqecLwHPkB9/tPy5
         /s4FlR8nNcVs7cOZqlIGvx1bSIJS6c8UNWvIhxFmR9LHvK4EV1AXWbDfuh5Wa2Vv1O4t
         TyIO9Ao8zeXlP65DPajFAM6amAmRZ6ZsAuEq5n1JLtxMwZv+OTPDVFBwIbBQCKE1JiKr
         y8nGj7mlXpEuiPLYfSjTSa8MuPokv42pe/fbYkTvFlUN30NZyFDDoI5C+stBMcd4wWqC
         2Dyw==
X-Forwarded-Encrypted: i=1; AJvYcCUDb8+4y3Lpjq9tGU59qu4jhmyBPNOYLwOQwptw9IKu+PBkp87Fmlx6FN+mxDsMeXaSvOKFPCzGCV/6wclb@vger.kernel.org, AJvYcCX+ewaEUajsg/nNAjiXXiLJ0i9cCWWZSGtCNz4BBrfHRn9fpO/SEKK3zKxjZo1+itUfkgLayzy7Ppcb@vger.kernel.org, AJvYcCXNVxf8qIiATgd3jXmFruIYEbOy/qkfl0xnpQeemJNn+Pp6Dn9EsEoTN40KC7e9FElBDNRsvBFHfq7HeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqtXMASx5pAM4InYyn8UJdGoE9xI/gjzYtuzVy/qgwCJdSGY1H
	8UcreE+BtFjRYNOAfExN0Ek9Awc8F49eclBIMyrXpfk27S500jP3yp+jzLIv
X-Gm-Gg: ASbGnctUEliCiNXpewYAPRrbzQ+cYAq60smpOrxt6GCoM2QI8N0fmOJ8Ezr/233qY8n
	20rcOpORyEEai2ldpKOwSGPmpFtOxGzzQg8hpYqBFJjjiIBiSCv0nTVmrSJ8UrWCX2hK08snOzq
	M8LIygvvslD7w5I7PE7CM9r445nSLNFygw+X8LYN+fyIbxeGz5CRKCDqQay0AhBkKpNt/+sTAXM
	6umWJEpMJ7CYzIGfOLkRfDrs3/iSeue2RvTexO1ifqDVfIc7SebIootTBsiPpr1YYQvbC5Jn9Hu
	Rx1vkgkn3BmJstNrJDNrsms6bKvbtE9dQITDCjc7DjcyagUgHWyr9/RwZSw+V0VSsRDl
X-Google-Smtp-Source: AGHT+IES8oqd2Jhaf6CO+MMWozPhkNJTig+HNdDLUhuoP0vLj61C3EXNqK1rFV/3MilBQNWHf4fGLA==
X-Received: by 2002:a05:6a21:329c:b0:1f5:86f2:a674 with SMTP id adf61e73a8af0-1fa43fa9f3dmr4677114637.12.1742306226709;
        Tue, 18 Mar 2025 06:57:06 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea04078sm7525138a12.41.2025.03.18.06.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:57:06 -0700 (PDT)
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
Date: Tue, 18 Mar 2025 20:56:40 +0700
Message-Id: <20250318135640.8596-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250306172126.24667-2-trannamatk@gmail.com>
References: <20250306172126.24667-2-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Nam Tran <trannamatk@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org> Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

Sorry for being unprofessional. I will make sure to properly address your concerns.

On Fri, Mar 07, 2025 at 12:21:24AM +0700, Nam Tran wrote:
> This documentation ensures proper integration of the LP5812
> in Device Tree-based systems.

No changelog, no improvements in commit msg. You got comment at v1 to
which you did not respond. Then you send v2 and I asked the same.

Please respond to the comment at v1 so acknowledge that you understood it.

Your previous comment
Your commit msg is totally redundant - you just said what Devicetree binding is. I asked to change it: describe the hardware instead.

Nam: I apologize for not responding to your v1 feedback. I appreciate your patience and will ensure that I acknowledge all review comments moving forward.
I now understand your request regarding the commit message. Instead of providing a generic description of Device Tree bindings, I will update the commit message in the next patch to describe the LP5812 hardware itself.

>
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> ---
>  .../devicetree/bindings/leds/ti,lp5812.yaml   | 50 +++++++++++++++++++
>  MAINTAINERS                                   |  6 +++
>  2 files changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
>
> diff --git a/Documentation/devicetree/bindings/leds/ti,lp5812.yaml b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> new file mode 100644
> index 000000000000..9a203da4f272
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/ti,lp5812.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +$ref: /schemas/leds/common.yaml#
> +
> +title: Linux driver for LP5812 LED from Texas Instruments

Nothing improved.

Nam: Do you mean the title should focus on the LP5812 hardware itself? If so, I will update it accordingly to better describe the device.

> +
> +maintainers:
> +  - Nam Tran <trannamatk@gmail.com>
> +
> +description: |
> +  The LP5812 is an I2C LED Driver that can support LED matrix 4x3.
> +  For more product information please see the link below:
> +  https://www.ti.com/product/LP5812#tech-docs
> +
> +properties:
> +  compatible:
> +    const: ti,lp5812
> +
> +  reg:
> +    maxItems: 1


This improved... but:

> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

What are these?

Nam: I included the #address-cells and #size-cells properties to resolve a warning encountered when running:
make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/leds/ti,lp5812.yaml
The specific warning was:
Documentation/devicetree/bindings/leds/ti,lp5812.example.dts:23.17-30: Warning (reg_format): /example-0/i2c/led-controller@1b:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
This warning suggests that the default values for #address-cells and #size-cells in the schema context are not aligned with the LP5812's expected usage. To explicitly define the correct values, I set these properties as mentioned.
This ensures that the binding schema validation passes without warnings. If you believe a different approach is more appropriate, I’m happy to adjust the binding accordingly.

> +
> +required:
> +  - compatible
> +  - reg
> +

Nothing improved here.
Your previous comment
No ref to LED common schema? No other properties? This is too incomplete

Nam: I have chosen not to reference common.yaml in the LP5812 binding because the LP5812 does not fully align with the standard LED properties defined in the common schema. Since the driver does not use standard properties like function, color, or max-brightness, I believe referencing the common schema would introduce unnecessary constraints.
Currently, I have included compatible and reg as required properties, as they are essential for describing the LP5812 device. Are there additional properties that should be marked as required? Or if you have specific improvements in mind, I would appreciate your guidance.

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        led-controller@1b {
> +            compatible = "ti,lp5812";
> +            reg = <0x1b>;
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8e0736dc2ee0..2bd9f5132cab 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23506,6 +23506,12 @@ S:   Maintained
>  F:   Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
>  F:   drivers/leds/leds-lp8864.c
>
> +TEXAS INSTRUMENTS' LP5812 LED DRIVER

Nothing improved.
Your previous comment
5 is before 8, so this does not look sorted.

Nam: I have reviewed the sorting order in MAINTAINERS, and I believe the current placement of LP5812 is correct. Since "LB" comes before "LP" alphabetically, "TEXAS INSTRUMENTS' LB8864 LED DRIVER" is correctly listed before "TEXAS INSTRUMENTS' LP5812 LED BACKLIGHT DRIVER".
It seems there is a typo in the MAINTAINERS file, should it be LB8864 or LP8864?

Best regards,
Nam Tran

