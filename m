Return-Path: <linux-leds+bounces-3237-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5069B9954
	for <lists+linux-leds@lfdr.de>; Fri,  1 Nov 2024 21:21:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CB4D282336
	for <lists+linux-leds@lfdr.de>; Fri,  1 Nov 2024 20:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7811D8DE8;
	Fri,  1 Nov 2024 20:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="KHiRrpBW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E031D12E6
	for <linux-leds@vger.kernel.org>; Fri,  1 Nov 2024 20:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730492461; cv=none; b=rAkSF3M1tVIUdakjMXyvGqkqSS1heAlGp6vS+LDT+9vNkdszDfX6eRdWer8syIljdpk6d/7pXiO8vDtZj2A26k0gQseqZn8DFDIXbwtP9QYeiHGEYxUNuMS6195CplWrclFXr8lhX0j/AxwvNdb6BHYNbEMB3T2dLIqZ8s80b6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730492461; c=relaxed/simple;
	bh=hLBZaD7SVJavMk1MGe8MRKFFx2mzme/hPFN55ULHPxE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b8z6EzAL5YjminmJsqGS+BvPZFSR49urykPEoKj9NFsxTq/9vxCfkYHcyWMRIW+MSFX7LCRmrM7KNuF5xOSM81Ci2gZkll6O113l2NzBN47uZ+CYkctCE91p/MInwKp1yN09c/w7uxR6RxbFL7UWa43DrqDdeRSrWmzJz1DT9vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=KHiRrpBW; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a998a5ca499so293094166b.0
        for <linux-leds@vger.kernel.org>; Fri, 01 Nov 2024 13:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1730492455; x=1731097255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IQWiyfioc9urBIu02WbY9S03DrBVStMJjpCBwosNYEk=;
        b=KHiRrpBWULQhObsdFjnIIw+oW0ECgr/fZfpidTbIvZH3+siYkW2DJ9A19F5vyA8VJM
         0BreKQ4etzyoWe3cs0ebmxUQB4HfLw8F0N1v6dOJRKsx5TJ1m92bKyIVCoW5MRx+iy+9
         JMNtjBowHuQdJ8GONMBuGRFpR1dei4ySpZjhwSjbUnf4iHq9QyXc8oFxioS270+xG6fW
         MJfvvkOoe7J5By3GCaqtyqhqpH/ONUCDembssZ8yafyIpFd0EzM8bBnxQ3iB1cJMOHZz
         XoLbPcONyE6ovSsMnYFy7sLAbW2KSpb3NpGkEf4K1hREb+EHS3krgEKLUNrA63OvCmXd
         JOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730492455; x=1731097255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQWiyfioc9urBIu02WbY9S03DrBVStMJjpCBwosNYEk=;
        b=PxeYZdwI7qI9U/jMTzSMOcNasKnJQp0nfNgJccPG24Jd1FhpKKXYV9s2OcfhCDUfUS
         aaK882IillgTZ2/UW3xTb8AbVYYo+ceCjo8PKcS+6ziWcU8ssKWG5Sab4THq3Dnjj9/E
         kHrM+/IhV4m1ISua+kNJ/mIXFpIWf8xHQCS4tJGymhhFo31LxeLS+jZXnYh9DRSVJRV9
         h+Cq0Jquk5O7L23b+DGYaM22dNL2p+FRJONx1mt8xouzwEhf5J7WN5jXZ1OjYRgAq/Sd
         +orcW0+ih6uUDERwRT5Ks2OjMfqWPP3JZ/x22Q+QI1MJDaOt4DE/i95q4CDn4ik87PEW
         B1Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVzr9KBRr2pf3+b6uBphbGYq4+7CMPTgky4Lbk+t6BQI1qCyfF64yQfXpjykPfQz7wAfcgn5yZBGbWo@vger.kernel.org
X-Gm-Message-State: AOJu0YxdE+jlvHINJyyUJe2R5EBikeRuARwP5S18rJeBYgFOmatF4K24
	dHKaQKz3J0t4BJ7x7+O3ZlCgf5eEUB2qtT4ac0S6xvpBfmCybBDrMqAxVbEY0pUVlIhAKKt5PFb
	ZwkZtAWIuP5X0CgOorTamxr2dIBHjkaHuxoF5dbp6EOwfN5FItXKGMdIryusmeLVPjpWf+f83vl
	SwqVmF4fu9fj2gd4auqzzmVxni
X-Google-Smtp-Source: AGHT+IHOHwxDzaRlenq1un4qpUrUFg3epXzTXu7OrIyaZ/Xsy+AFJs7RXlAeD6tZmM163tp45lL6OA==
X-Received: by 2002:a17:907:9409:b0:a9a:dfa5:47d2 with SMTP id a640c23a62f3a-a9e657fd8dfmr433103966b.59.1730492455355;
        Fri, 01 Nov 2024 13:20:55 -0700 (PDT)
Received: from admins-Air ([2a02:810d:aec0:2a54:f9c7:16ae:6aa2:8c48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56645dcbsm227758066b.177.2024.11.01.13.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 13:20:54 -0700 (PDT)
Date: Fri, 1 Nov 2024 21:20:49 +0100
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: leds: Add LED1202 LED Controller
Message-ID: <ZyU4IWLBRKHZeHhh@admins-Air>
References: <Zx0AqwUUchl4M6po@admins-Air>
 <56dut7eh7w75uz3mvl446uc5qpvyuogbyz55clmdaqez5noo6i@mtl43zjfkqtd>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56dut7eh7w75uz3mvl446uc5qpvyuogbyz55clmdaqez5noo6i@mtl43zjfkqtd>

 
> > Changes in v3:
> >   - remove active property
> > Changes in v2:
> >   - renamed label to remove color from it
> >   - add color property for each node
> >   - add function and function-enumerator property for each node
> 
> Where is the rest of the patches? I commented previously that you send
> them in some odd way messing with reviewers MUAs and lists.

I think I finally understood. I cannot correct the previous ones, but
I can add the links here in this thread in the form:

v1: https://lore.kernel.org/lkml/ZnCnnQfwuRueCIQ0@admins-Air/T/
v2: https://lore.kernel.org/all/ZniNdGgKyUMV-hjq@admins-Air/T/
v3: https://lore.kernel.org/all/ZniNdGgKyUMV-hjq@admins-Air/T/

will this work?
 
> It seems nothing improved. Follow submitting-patches and use git
> format-patch or b4, where both handle it correctly.
> 

Reply in thread is fixed, the test results you ask for in v2 are
here:

$ make dt_binding_check DT_SCHEMA_FILES=leds
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/dtc/dtc.o
  HOSTCC  scripts/dtc/flattree.o
  HOSTCC  scripts/dtc/fstree.o
  HOSTCC  scripts/dtc/data.o
  HOSTCC  scripts/dtc/livetree.o
  HOSTCC  scripts/dtc/treesource.o
  HOSTCC  scripts/dtc/srcpos.o
  HOSTCC  scripts/dtc/checks.o
  HOSTCC  scripts/dtc/util.o
  LEX     scripts/dtc/dtc-lexer.lex.c
  YACC    scripts/dtc/dtc-parser.tab.[ch]
  HOSTCC  scripts/dtc/dtc-lexer.lex.o
  HOSTCC  scripts/dtc/dtc-parser.tab.o
  HOSTLD  scripts/dtc/dtc
  HOSTCC  scripts/dtc/libfdt/fdt.o
  HOSTCC  scripts/dtc/libfdt/fdt_ro.o
  HOSTCC  scripts/dtc/libfdt/fdt_wip.o
  HOSTCC  scripts/dtc/libfdt/fdt_sw.o
  HOSTCC  scripts/dtc/libfdt/fdt_rw.o
  HOSTCC  scripts/dtc/libfdt/fdt_strerror.o
  HOSTCC  scripts/dtc/libfdt/fdt_empty_tree.o
  HOSTCC  scripts/dtc/libfdt/fdt_addresses.o
  HOSTCC  scripts/dtc/libfdt/fdt_overlay.o
  HOSTCC  scripts/dtc/fdtoverlay.o
  HOSTLD  scripts/dtc/fdtoverlay
  CHKDT   Documentation/devicetree/bindings
  LINT    Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/leds/leds-rt4505.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/leds-rt4505.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/rohm,bd71828-leds.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/rohm,bd71828-leds.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/richtek,rt8515.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/richtek,rt8515.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/leds-pwm.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/leds-pwm.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/issi,is31fl319x.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/issi,is31fl319x.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/irled/gpio-ir-tx.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/irled/gpio-ir-tx.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/irled/ir-spi-led.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/irled/ir-spi-led.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/leds-lp50xx.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/leds-lp50xx.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/regulator-led.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/regulator-led.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/leds-max77650.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/leds-max77650.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/rohm,bd2606mvv.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/rohm,bd2606mvv.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/nxp,pca995x.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/nxp,pca995x.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/trigger-source.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/trigger-source.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/onnn,ncp5623.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/onnn,ncp5623.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/common.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/common.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/maxim,max77693.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/maxim,max77693.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/qcom,pm8058-led.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/qcom,pm8058-led.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/leds-bcm6328.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/leds-bcm6328.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/nxp,pca953x.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/nxp,pca953x.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/register-bit-led.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/register-bit-led.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/leds-class-multicolor.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/leds-class-multicolor.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/leds-bcm63138.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/leds-bcm63138.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/kinetic,ktd202x.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/kinetic,ktd202x.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/backlight/lp855x-backlight.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/backlight/lp855x-backlight.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/backlight/common.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/backlight/common.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/backlight/led-backlight.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/backlight/led-backlight.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/backlight/kinetic,ktd2801.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/backlight/kinetic,ktd2801.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/backlight/ti,lm3509.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/backlight/ti,lm3509.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/backlight/pwm-backlight.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/backlight/pwm-backlight.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/backlight/gpio-backlight.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/backlight/gpio-backlight.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/backlight/qcom-wled.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/backlight/qcom-wled.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/leds-group-multicolor.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/leds-group-multicolor.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/panasonic,an30259a.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/panasonic,an30259a.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/leds-gpio.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/leds-gpio.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/leds-pwm-multicolor.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/leds-pwm-multicolor.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/leds-aw2013.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/leds-aw2013.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/ti,tca6507.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/ti,tca6507.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/leds-mt6360.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/leds-mt6360.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/leds-qcom-lpg.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/leds-qcom-lpg.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/st,led1202.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/st,led1202.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/leds-lp55xx.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/leds-lp55xx.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/silergy,sy7802.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/silergy,sy7802.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/ti.lm36922.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/ti.lm36922.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/skyworks,aat1290.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/skyworks,aat1290.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/nxp,pca963x.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/nxp,pca963x.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/kinetic,ktd2692.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/kinetic,ktd2692.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/awinic,aw200xx.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/awinic,aw200xx.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/leds-sgm3140.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/leds-sgm3140.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/leds-lgm.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/leds-lgm.example.dtb
  DTEX    Documentation/devicetree/bindings/leds/sprd,sc2731-bltc.example.dts
  DTC [C] Documentation/devicetree/bindings/leds/sprd,sc2731-bltc.example.dtb 

> > 
> >  .../devicetree/bindings/leds/st,led1202.yml   | 103 ++++++++++++++++++
> >  1 file changed, 103 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/st,led1202.yml
> 
> OK, so you just ignored entire previous feedback?
> 
> NAK.

Sorry, for some reason, I kept sending a truncated version of the
yaml file from v2, which did not had the review changes. 
 

The LED1202 is a 12-channel low quiescent current LED driver with:
  * Supply range from 2.6 V to 5 V
  * 20 mA current capability per channel
  * 1.8 V compatible I2C control interface
  * 8-bit analog dimming individual control
  * 12-bit local PWM resolution
  * 8 programmable patterns

If the led node is present in the controller then the channel is
set to active.

v1: https://lore.kernel.org/lkml/ZnCnnQfwuRueCIQ0@admins-Air/T/
v2: https://lore.kernel.org/all/ZniNdGgKyUMV-hjq@admins-Air/T/
v3: https://lore.kernel.org/all/ZniNdGgKyUMV-hjq@admins-Air/T/

Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
---
Changes in v4:
  - remove label property, use devm_led_classdev_register_ext instead
  - use as base patch the v3  
Changes in v3:
  - remove active property
Changes in v2:
  - renamed label to remove color from it
  - add color property for each node
  - add function and function-enumerator property for each node

 .../devicetree/bindings/leds/st,led1202.yaml  | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/st,led1202.yaml

diff --git a/Documentation/devicetree/bindings/leds/st,led1202.yaml b/Documentation/devicetree/bindings/leds/st,led1202.yaml
new file mode 100644
index 000000000000..7e49e6464d41
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/st,led1202.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/st,led1202.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST LED1202 LED controllers
+
+maintainers:
+  - Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
+
+description: |
+  The LED1202 is a 12-channel low quiescent current LED controller
+  programmable via I2C; The output current can be adjusted separately
+  for each channel by 8-bit analog and 12-bit digital dimming control.
+  Datasheet available at
+  https://www.st.com/en/power-management/led1202.html
+
+properties:
+  compatible:
+    const: st,led1202
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+    
+patternProperties:
+  "^led@[0-9a-f]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 11
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@58 {
+            compatible = "st,led1202";
+            reg = <0x58>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                reg = <0x0>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_RED>;
+                function-enumerator = <1>;
+            };
+
+            led@1 {
+                reg = <0x1>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_GREEN>;
+                function-enumerator = <2>;
+            };
+
+            led@2 {
+                reg = <0x2>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_BLUE>;
+                function-enumerator = <3>;
+            };
+
+            led@3 {
+                reg = <0x3>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_RED>;
+                function-enumerator = <4>;
+            };
+
+            led@4 {
+                reg = <0x4>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_GREEN>;
+                function-enumerator = <5>;
+            };
+
+            led@5 {
+                reg = <0x5>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_BLUE>;
+                function-enumerator = <6>;
+            };
+
+            led@6 {
+                reg = <0x6>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_RED>;
+                function-enumerator = <7>;
+            };
+
+            led@7 {
+                reg = <0x7>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_GREEN>;
+                function-enumerator = <8>;
+            };
+
+            led@8 {
+                reg = <0x8>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_BLUE>;
+                function-enumerator = <9>;
+            };
+        };
+    };
+...
-- 
2.39.3 (Apple Git-145)



