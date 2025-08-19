Return-Path: <linux-leds+bounces-5248-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B54B2C92D
	for <lists+linux-leds@lfdr.de>; Tue, 19 Aug 2025 18:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7EB91C278C9
	for <lists+linux-leds@lfdr.de>; Tue, 19 Aug 2025 16:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0192BE7BB;
	Tue, 19 Aug 2025 16:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myYiL79O"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1268228031D;
	Tue, 19 Aug 2025 16:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755619830; cv=none; b=YCKH7m4ngUddg9z+PSA4YiHzOoB+CR5ordFiFQRcAUejoSIBLIs2v1WKRn3NyXZBoRilcoSfyiVyyGK+6+RhGsi1a5/cwqZ4ePz2dq6kqdWTtbWTMh5JovsXPNaktkPT2eNVtyT0qbMfS8RDkiLuQiW4u45ta7ZNEnaZDDWonY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755619830; c=relaxed/simple;
	bh=CzEPHfYW8kpRzUwS9bh8iZn//FOUhYLotYEGJ2i4AGY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FKExyx90r47kfuqIPCdq8VlQ3ZhU+okiE38U4RUXsnjYMVKwoqRSNFQcHCUGsi+OWSql71o4J5PLA1F4akOMVSzE9wIuZ0SJFXW8/+S8BZ/7tqJMbVBAZlUPdpOxFGY9NnTbTWMvbrD1ITOJaKoL/oZv7nHyb/VNyHXAxn3YdXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myYiL79O; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24457f3edd4so39873135ad.0;
        Tue, 19 Aug 2025 09:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755619828; x=1756224628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0emXj+oCljrGpKfiPP28TOq/ybIbNfhACDhmudQCAE=;
        b=myYiL79OWEi3cfbUYr/8pVWCggAaeIAqWsbbV4MSdVsbn8UDYCtdpqCrLhOEy/nElI
         6uVQQqtdSPe+Ubd5adFCSLMR4IPQEFSiTGo1UoHRAhiaNM2xWX29rrQNAQ3hAdXIH05O
         IYNbjEX1e96oM2+Mov8+Brj3INW1D2JMjTsmpLzE3ih50YIEjXITBMOEPT5DoohKknzo
         M+4RHBjEU9oPvwk9Aw0KPaDiX+j8yBdMdyk8kPXpFrHWNIF4RbXgjyRbYD87MKSvWV+M
         BIbd2kky0vnZRgQk9xyYJwGsKYJ9I1zQhW6pSzR8rgZBeNjODfJ8W7dSc1+LP38mxc8Z
         u0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755619828; x=1756224628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0emXj+oCljrGpKfiPP28TOq/ybIbNfhACDhmudQCAE=;
        b=CZE78qelJHWFZGj+ana+WB9zjo1e+wCYsk9y8HijOo9bXavo5Y/8nq7d9N9TMBpr6b
         QU+SOtrxaGqlqAZhxdakKVEHeOxXULIYtXuhg2UAoJvUl9yVcT0SCBBghVXkwmrKDCdY
         QaBsD+kr1zX9hk7KAIaP85u/ZOXngMdwXecQ+kcpi9yOQ7WC8Qxq5NJYb6weYiccHfws
         8W3DeccUHjiVBdo0Fr/aaxQzIuVFGAKUZFsePniO/S1uNXcINQChOTU7g9WaPmaUEKcR
         RPOpR0ivOzMivxOWUGzeUPLxFFxMhTvzs6jwSP6WJbzEWXJglY4vvfEq8ebULp96H2ZV
         zCZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUijeMeJRGgJCBObGZqCTHLL+PydldPyUgStSLCx23r/t6v1TLz63WS/nqpMKW6NscQkz2A3j+eje94@vger.kernel.org, AJvYcCUocsDHjon5snWA23F/Epdzgxi2P8Mn+a1+2//CC6PBlSq8+br6tHma5BG/HHXgMmr5VCCGObAoktk+uw==@vger.kernel.org, AJvYcCVhqoI2YOaOwpOdhkN2dPyKZZhRhCP8osc402C88G0xBlruXUcQCFIgCurqMPE2M/1l+5QeukHVo8Ztrf3n@vger.kernel.org, AJvYcCWhzT4SWzGrlGqDhHzWdgbWOou8nYExfBfj+X6winLPyqmCkp4ZPLF9WDHomQK0PEWrzymQLvRQ3jqU@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ10VLU9Jox8T/GzCj3giSUYty0LTPu+/MAWEq2OeNLaDXsEzu
	OlWrEfFJvIRwS2u1oCBqJ0eRpW1Q5ylOAg/SFt1ZEHQU1+4BjUXgiPx3
X-Gm-Gg: ASbGnctvu1btDm0ZvMBgdy1V6kBmk4zg00rcmHeLnf58WwNN3Ee0wPWf/al0Nk6/fTv
	zk2+FfuBfsyDl1HNiP7EILHLS0wUYsZsrhFSiv2yKOfnASt8P0AjIPi5sDyzgYkQO5GX5EqXVcs
	Vr3/6jroOJfn0y2TrBXOuGf7eFmG96IgqZt14pnJ7UmIdM0tYFq6b+3p9gC3ClYXKLszEqKO2jE
	mPi45DQGk/7GmEATNAGBH841q947REV5qe4GW2fhy9osICm8Zm84IYUZAoJwOqgBTJYcDqp5Xmv
	HZ4z1Igs3mobJx6tIfCUejHwO5gxWZY7wAipakKU3dqhfho0pHZqOENLH2GjVpG8dkgqCriKIhg
	G+k0HI93bphRDMQLxJQphimCRmot8jOrirlFXg0KL6qU3
X-Google-Smtp-Source: AGHT+IGzaTQxZ+DF/IULZGqoiRjTkZx1hCJiOj5vHSZz9L36d0wwSQgSCuZ4I9pfGxIAUuxXmKeS/A==
X-Received: by 2002:a17:903:3848:b0:240:968f:4d64 with SMTP id d9443c01a7336-245e0465d7cmr44677755ad.11.1755619828148;
        Tue, 19 Aug 2025 09:10:28 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.116.199.205])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed549261sm953595ad.168.2025.08.19.09.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 09:10:27 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: robh@kernel.org
Cc: lee@kernel.org,
	pavel@kernel.org,
	rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH v13 RESEND 1/4] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Tue, 19 Aug 2025 23:10:20 +0700
Message-Id: <20250819161020.230107-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <175548430728.3642063.6873272310272616172.robh@kernel.org>
References: <175548430728.3642063.6873272310272616172.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 17 Aug 2025, Rob Herring (Arm) wrote:

> On Mon, 18 Aug 2025 08:26:51 +0700, Nam Tran wrote:
> > The LP5812 is a 4x3 RGB LED driver with an autonomous animation
> > engine and time-cross-multiplexing (TCM) support for up to 12 LEDs
> > or 4 RGB LEDs. It supports both analog (256 levels) and PWM (8-bit)
> > dimming, including exponential PWM for smooth brightness control.
> > 
> > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  .../devicetree/bindings/leds/ti,lp5812.yaml   | 229 ++++++++++++++++++
> >  MAINTAINERS                                   |   6 +
> >  2 files changed, 235 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> 
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250818012654.143058-2-trannamatk@gmail.com
>

I do not see any errors/warnings here.

> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.

I followed the guideline and ran make dt_binding_check with the latest
dt-schema installed (pip3 install dtschema --upgrade). I don’t see any
errors or warnings for my ti,lp5812.yaml schema.

When I unset DT_SCHEMA_FILES and run the full check against all examples,
I do get errors/warnings - but they come from other existing schemas, not
from my patch, e.g.:

Documentation/devicetree/bindings/net/nfc/ti,trf7970a.yaml: properties:ti,rx-gain-reduction-db: '$ref' should not be valid under {'const': '$ref'}
Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml: maintainers:0: 'Not Me.' does not match '@'
Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml: properties:audio-gain-db: '$ref' should not be valid under {'const': '$ref'}
Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml: properties:fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: '$ref' should not be valid under {'const': '$ref'}

My schema (ti,lp5812.yaml) passes cleanly without any issues.

Best regards,
Nam Tran

