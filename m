Return-Path: <linux-leds+bounces-4483-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DCEA898C2
	for <lists+linux-leds@lfdr.de>; Tue, 15 Apr 2025 11:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE0EC3B435F
	for <lists+linux-leds@lfdr.de>; Tue, 15 Apr 2025 09:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26EEA288CB7;
	Tue, 15 Apr 2025 09:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8b3qWxF"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968392820D0;
	Tue, 15 Apr 2025 09:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710867; cv=none; b=soqajfzSsVtp0uYRp7iYhCqSUhlg66Qbze8VP08OLqjM04SYH0tJRQejy/DyM30zk9VIHRWWB9pEQRzLpKN1dmZ5WkjEVF09jA358vrUXEubM8c4Q0Rk3DD1sQcDOA/XwHlzugbMIcpsro5lbNcX9B2CWgc7/el4uKuVk+DP4bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710867; c=relaxed/simple;
	bh=lK37py1zOsfETjH0W+RywbZi9Hhk9oH0kO5ktf/YyEc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GlEEyPDArVq5uCAoTtwCNDGZ8euOBcyaEgilsO9lOqmv3w+yA5zNMLVPczzq5diVAckYeiMiKhmypwnhkENAdq3bfMzeSo+7Iz+p1RXpXKijjF6lUCOm/J8IrIGZvahPzIBpaBHn99CP/nkLVkuyRbiEyqZpn5P5F9ganCLjB88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8b3qWxF; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736b350a22cso4467869b3a.1;
        Tue, 15 Apr 2025 02:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744710865; x=1745315665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYpGhwmmgnLY8txDgIEQRH5jdUdNpNJ3RHDmtFvhBCk=;
        b=m8b3qWxFJHpIekW8/0L/S6uaaoqhB1HwoZo+KtH3WIT0bsurI5UsKhGjNqr54VH/AD
         pYoXrI1A5F6Zfu4W0J0TQGnH8i5KuUy7Y/lBq9cQQh08nnYW373AuqIPR53alvfQtGEw
         PzSX832pQ26YKbekAW++zGsXcCA9q6r4b+3gF/EomJ8qhamC0/Z0ZaeQMnvrf/+xBeGx
         G5oRdbabl2rHG6kbniS9ZKUJZyji1MBhCKgvqoYPQAItC3UxGCU/4q+cE6/ZQslfCFh6
         SklmANm2FYTvlaYpR2JIXqfNFPszrDGtI+P+CmqsPJ0HE+rm5+BRsdPlXgDKf5i2O0h8
         THKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710865; x=1745315665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYpGhwmmgnLY8txDgIEQRH5jdUdNpNJ3RHDmtFvhBCk=;
        b=BAyHCc6Ac7uTx0vPcowphD0wo0IegwEZKNWZ5wX4+RWdsyik71YLhjJhruodHmrzH+
         EApLfE0gw03jWsyPDXkR4Ueo2LpwhXaJWoyGYB6jLCX/JnI7WmcBYQiltv1JuFt6BqKC
         FfO6W3cmtI72m6PPL13f/tKUknSGmC7MEI0+/TMdmfEcZzfoYgDrrktGI54psFoVHE5u
         QcSFabhyG9U+L+B3ma5ymTV9ox/3LfolGXl8Kq6BZ2uh7MmdksK9++gmE+m+5dHU2JEb
         aw2sfVMIb/1QQTpd+2FesaVGWTp/qtdXvTe3yIgzZQoQ8DnTQP7EFCyzycxZ4lBXRd5K
         ChDw==
X-Forwarded-Encrypted: i=1; AJvYcCU1jtYjoQADk6k6jPJ9TO5RrIBzw5ahgQ6Nk1E7ZuSgIzrHcsIsCRyiaCl2zrP/QSHidBPB1Ak0S3YxKgPH@vger.kernel.org, AJvYcCU4opwbDLi1JYWTYnNTEEa5KNS5DPSDopL5gn3S/V8+akUh3zBHOcusRQTyAKuJRXSjG1fZ4lql1FaX@vger.kernel.org, AJvYcCXDW9sX6fwpg45ZtZOmgAPqVKQ66oVKVH6pmBn/qhX0Mb/IsbOtCyZ9XKIlfANt+y136IrJuj3/dH1rqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYkb7FyX3s9DXJQuCRlRzGwRMGsCLDoUYSswH8sv3CrmUrto3m
	IysB8YgdnLzguatdkQdDtX63u0ZwXWQmx3FIxSbUG1auwmuEYQue7pD3FA==
X-Gm-Gg: ASbGnctBNITVCIw9gO75h+zrRSOFY8NuITVUhBEMCL7LRm9CBhpRHVBdo70iV/Jld6x
	Ee32cwemDfVs+vVMIx7FDxIy4UVXOKmuglW+BKgTx7iutnZVipBq7bULTaxLfIi1ME4v6LRVchI
	gMI+L5A7jj9l8o8ptkBlsttzvReWlyxiuJX8WVfSO1DjjZsDwPiX3kebAOFwFno2hMgZlJKTnxT
	LMuA+rY/aK+ZlCnZiwQNVXY9rpcIBSgSQXToSkWQ4j5wsVYvGMDX880vBVmGKDKXKrg/DUpvdnI
	1R3+Xl7EO9ijMS6UbQ20L4havxfK+ada5bx5HusCML0gVoYPmJo22OM=
X-Google-Smtp-Source: AGHT+IFjNHbcTufXh8fFzrFcTeMoEjvYjAzqkO8JWy4aZMguP6+TutUuL10puZf3uD4t34dThiEozg==
X-Received: by 2002:a05:6a00:4fc7:b0:737:9b:582a with SMTP id d2e1a72fcca58-73bd12b3127mr24417976b3a.24.1744710864577;
        Tue, 15 Apr 2025 02:54:24 -0700 (PDT)
Received: from localhost.localdomain ([116.106.96.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c335asm8335575b3a.50.2025.04.15.02.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:54:24 -0700 (PDT)
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
Subject: Re: [PATCH v5 1/5] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Tue, 15 Apr 2025 16:53:58 +0700
Message-Id: <20250415095358.8044-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2badc360-9bfa-400a-acca-ab82f8cc5a95@kernel.org>
References: <2badc360-9bfa-400a-acca-ab82f8cc5a95@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 14 Apr 2025, Krzysztof Kozlowski wrote:

> On 14/04/2025 16:57, Nam Tran wrote:
> > +
> > +description: |
> > +  The LP5812 is an I2C LED Driver that can support LED matrix 4x3.
> > +  For more product information please see the link below:
> > +  https://www.ti.com/product/LP5812#tech-docs
> > +
> > +properties:
> > +  compatible:
> > +    const: ti,lp5812
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> 
> No need for supply?

Since the hardware uses an external power supply,
we decide not to include the supply property in the binding.

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
> My comment stay valid. I don't think LEDs have channels, datasheet also
> has nothing about channels, so again - use existing properties. Or
> better drop it - I don't see any point in the name. The reg already
> defines it.

The channel was named for the output channel to each LED, not the LED channels.
They are not required properties because we can control entirely the LEDs of LP5812 through the indexes (regs property),
but the person who wants to develop LP5812's matrix-related features can use the "channels" for easy mapping.

> 
> However after dropping this, your example has nodes with only reg -
> what's the point of them? Why no properties from common.yaml are
> applicable? If they are not applicable, then the entire subnode should
> be dropped - you don't need them to describe the hardware.

Actually, the "color" property can be applied, but the LP5812 is a matrix LED,
so specifying a particular LED color is not necessary when developing LP5812 features.

Best regards,
Nam Tran

