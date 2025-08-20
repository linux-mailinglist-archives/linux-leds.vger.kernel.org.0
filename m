Return-Path: <linux-leds+bounces-5262-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BD3B2E25A
	for <lists+linux-leds@lfdr.de>; Wed, 20 Aug 2025 18:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA3475861DA
	for <lists+linux-leds@lfdr.de>; Wed, 20 Aug 2025 16:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352D8334387;
	Wed, 20 Aug 2025 16:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2s4HehD"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496E2322A1C;
	Wed, 20 Aug 2025 16:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755707492; cv=none; b=TI8wiKrwrpW7p7AHADl4KIRJcKugiUwMmUwiPhs/mckdmQoaR1l59Zaf69cBILVy3phZU7QFXQJFMU8dUYaF23xWe7Ewbhy2S2mHVKeKFi1OtPxr7Uo5frYaV8hsdlOKLm+Y3AVwAvyTCNKmSb4Gc7phaXhHMjG9W8eR7UzaOSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755707492; c=relaxed/simple;
	bh=Von3PjjSJyjQTHSFPdYOZi3hAcQqDoIzsdjQSpTQuHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M47rHhNXzryhAxWwsLz1DMKPgO/f4in/2hbb4fX7sk/tS2FPPwEcZpOe+yHju0adZikZ208ZMVxUBcpoxW52vQ7nPjBZ3c5jRo9OuJFrvCh1RcZR34gLhq9JLahccC4Z/SnKjaN6NxuB6eXr3CQBd0dX601EI0UVXcRx/5XKP6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N2s4HehD; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7e864c4615aso119841385a.1;
        Wed, 20 Aug 2025 09:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755707489; x=1756312289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAwZSi0R2j5en5WCbFrEnUQ0O9ylq9ecPWrmpd6nYHw=;
        b=N2s4HehDzFrKd8CcMSyH/AFtWnKjey5rQBS3sfxGIAjt4/F4MH1FiCV8VCyzf9h575
         FRYLWHSEyWnqy/UgJJhIstw1PKJiaFO+oppPbh9Xb2X93e4ki34fvlVPff1J4il0hFWx
         eQ4kwXIVz2bSxdutcysA5kPnwTxT3hj3N9MDFtZPeJVALA/CSXm0tH8siQtBl0LnXEAM
         7U1WERyCcdSblo4aGVnigxXphJu/wG8M4qgLuSNMgoOofllNzA7q/04bYiLavR6RP0zK
         trOscKialW1Xmfva0APPD9k9x5KL8oDjtnqcU52gxdgr4ugpsWWIebbTD/ZUbvt1wbOt
         0AeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755707489; x=1756312289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MAwZSi0R2j5en5WCbFrEnUQ0O9ylq9ecPWrmpd6nYHw=;
        b=UIsWFPP2eCmoXkPJoDKt6fyVDfINIXQJ4kvNK3fgtmr/SuOO6WFYesgBZJa6kOiGQq
         encSq+kjHDeBVdPjGFx4SlygVUDY9vqxGBXBX56xV4iw8FeUetRLgcVPTYFM6Tde8EKP
         2BzkvjEN5q2mWG4y0emK+918tFiwRSZt2DchkJoboFmriH5HmRvE5pFOxFCllzCvj6ey
         FwUag2fIAdSpCIghvwgW3z/gde7gm+I4NNnlBaWla2IqC4LYHSU0ufGrFXcmVDOJeTYG
         qwfmIpCPbyimzHy7ZGrziU8scYjfSzXW51bItCHbukE0p+MfeObRM7flAR59+fSs0M0Q
         9u5g==
X-Forwarded-Encrypted: i=1; AJvYcCUwMZDWx/XsSJS00stqAlgQjJEYP5sRDxrMOaYwrJcKCkxYWEIp1lWmn4v8OxSJ1L2aFMwL8L7vxfxO/Q==@vger.kernel.org, AJvYcCWQD3U/7I9kvCTV7Ji6c2yX6dosykPg16EQdsUZWoCyh/5XmOg1ZHALWE2DCGiBMkGm0so4K/PiigPj@vger.kernel.org, AJvYcCXE/kNtsrCEq63c9v8YhYY0DmZOFOaoaF8MmO6nVds/fny9tCDkwPPUhYS4K7yiXYPIuu8YBuoBF5suLTis@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0nCCfvj7UhvzYxrBQpCAOr4Mdc/Ni4UPqv4Tt+gTtmOKEaZoi
	8yDDxc9QkSYrklsTpkjc7y2VQSZSZ/3XtzfBxNfBWi+eexbywfYgaA6b
X-Gm-Gg: ASbGncvV/GkqEAhxzRkd42NbZY6IoODAZQ6AsWd1rEqFgxz1p4lt+r2+dutlHB3+14+
	fVVHxQBYdRLARey99Tyf4h4xSd0Ex/BWWnqV+NLUwJ8yxH1UYNCXHv/VrtV3BWxhmCErNeyzLXG
	7PM7fAaokSnwJHGhi7Cc4AXkFjaKS7j+g0+6+41Qg2q3lFpF2gyjjcES6L79nSg5fj3inHGj7dg
	i08HF7sim7ZsTFZ0YvlLox0cAj9I6jZ+8nLJ6gre1CcVBnI89idxmjMgxnDjuBzA7/nt46D932Z
	+Ndcat0RZyh+6MRobOPl/tDvVUHVTpvUxJ+0YCLtrYzjYsCANnfRhjxmWm1RrX201bNOvfxZ3Oa
	k6No56Y5Z9QbCjyWRfPvbcjnoeNFNhhlx6NTPgVxh3vUedDMnKHsaWajsI4zIMM7SRQ3VgrBBjK
	WgiO8=
X-Google-Smtp-Source: AGHT+IGNZAIhfyFqBLRP/OaGacJfil2cCmOQ1auoboLhtrKoumNUaoJC9quip29oNZ5/Ym+GcaL/rQ==
X-Received: by 2002:a05:620a:4146:b0:7e6:9993:b34e with SMTP id af79cd13be357-7ea069ad275mr24027185a.33.1755707489000;
        Wed, 20 Aug 2025 09:31:29 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11de0d731sm84809891cf.40.2025.08.20.09.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 09:31:28 -0700 (PDT)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Boris Gjenero <boris.gjenero@gmail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Paolo Sabatino <paolo.sabatino@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 4/4] MAINTAINERS: Add entry for TM16xx driver
Date: Wed, 20 Aug 2025 12:31:17 -0400
Message-ID: <20250820163120.24997-5-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820163120.24997-1-jefflessard3@gmail.com>
References: <20250820163120.24997-1-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index daf520a13..55afed22f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25402,6 +25402,12 @@ W:	http://sourceforge.net/projects/tlan/
 F:	Documentation/networking/device_drivers/ethernet/ti/tlan.rst
 F:	drivers/net/ethernet/ti/tlan.*
 
+TM16XX-COMPATIBLE LED CONTROLLERS DISPLAY DRIVER
+M:	Jean-François Lessard <jefflessard3@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
+F:	drivers/auxdisplay/tm16xx.c
+
 TMIO/SDHI MMC DRIVER
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
 L:	linux-mmc@vger.kernel.org
-- 
2.43.0


