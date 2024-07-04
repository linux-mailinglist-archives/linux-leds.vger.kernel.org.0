Return-Path: <linux-leds+bounces-2183-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28052926D3D
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jul 2024 03:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0DB5282F47
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jul 2024 01:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA6CFC0A;
	Thu,  4 Jul 2024 01:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z18bLMNa"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91702C8CE;
	Thu,  4 Jul 2024 01:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720058157; cv=none; b=m1HxWjv5Xa561k7qzBjZr43MUMQ9o8g1wk9mNDAHM0QmjdomspRzQnaB5PyOJD5tJw+a7GF3x9uwcoDM1L95FxOhiBc4qZXGc57wv+yIRvTzFcwcAQyT7VCzFe675hs+MDuM88puLrW538SHcbXihWGVPjV0Rj9gbcKTS3I1G/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720058157; c=relaxed/simple;
	bh=pGeC0tIcc6RdK4J8gqAtoBjZUtUHrr6aVWLf8iR1ScU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nmwo+ryUNbH0ULkRUyFUPkh4dFfNHp5tZALYs55Q0gXxl+oFuz51pDMopeh5LhT1o23Tnu29mCpY8qaAAO6VjHen3rw4wHaa4H9yGieXdIVvq11rcsxqyDdrcn1ZT2GZ6Y+Kk6UrJJqEVnwVhznPOFUHsu8WTRlhDPkkFdvo5qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z18bLMNa; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3679e9bfb08so21202f8f.1;
        Wed, 03 Jul 2024 18:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720058154; x=1720662954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GmyLG4BAl3sAj48hgtamCgyGJ/9e0NRXPkNH2cJM84=;
        b=Z18bLMNaxEpnGNzeCMKd0OdVda7K1Y2sGh+FX+T37Nrt9QrAw+TRtUXAEsekgyi0EI
         FYJc4iJAYMMDqW2Hskcyc5w+0Qx3qH676+i4fhPMpNFPaqieHWc329kcDAYtkitbTfuZ
         EiiqidHDCqRYd/tdre8O/MsrASyKhRgHtOKuJXx8BRHYmPndT94lwU3am0DxEx+2Pv6j
         dyw9Izlvig16e9PT7OitedMnFodfxZ8xgTDsDVzD28rJC/eZBdkNkp6hNlC1FDbAq49G
         ol4BTJ2MflAeIduLoKbBPEgP3WBqxUDCjVZcdF1b3yVKxRcKJ/OIbLM5jfvOzKGzr9QY
         M6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720058154; x=1720662954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GmyLG4BAl3sAj48hgtamCgyGJ/9e0NRXPkNH2cJM84=;
        b=Zpp+z2AWSh/LB5O1Wof2LUNoqSNLPLlLx4oH7pgdgimno6wYz6waxaeJk7MuGn1V1o
         vpwBYba0CIpd6DRAbe4f7em9XnCsQ2XZbGfmddyKaqrLNhXVVDWC88SvyiRtVqP2KLAy
         4B3+J6s8GVrhQhHg2P9USbbwVsgUlL2QwZkVdcLKg9N6m6dlC804S+ks7Vq85JRlIix7
         4oiVd3BofNfLJ0bvE1egfx7/MXDiVCTfw2eXIGBB8tavNahmXAr7qk4lqbZeVvAP8zxj
         1HCwySCeVnaVxFaZ5Vh1S39M2HUXAmIaJOEDzlsrHZhPUJpn/KqkglRiDOvJJVUzdo3K
         sThg==
X-Forwarded-Encrypted: i=1; AJvYcCWkHjtkfcbdV90/tLIByuGsChrG+VE7TyH5LK1TUT96gtcuZ/srLvuj4Ec5wgPlGCoMQF9QZmBb8bvQlm11dKEtgk63wbmdA9R5vwja9Wd8ZBSB1T+IOpDWTF7Ix/bC3MhXOAdWWCX0SA==
X-Gm-Message-State: AOJu0Yx9ge9XvDEiQZ5zQDeA0QT/qLcmhU2YLvVG/y9RkqwEhN8ZGvxg
	2BCYa9Y/Y4adOvWLyE5xVRLPDM13k3fAy8XeJkUylnN0TWGRQ+NQ
X-Google-Smtp-Source: AGHT+IHtUHqcRVS4WjUjxhBhrPYoD+O48LnlY3W3X+fGDUTBWPmQ6e0z1CS6N1r2SFHj8/ZiBDOnoA==
X-Received: by 2002:a05:6000:1146:b0:362:2af4:43cc with SMTP id ffacd0b85a97d-3679f705228mr22854f8f.19.1720058153993;
        Wed, 03 Jul 2024 18:55:53 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3679744be1fsm1976329f8f.2.2024.07.03.18.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 18:55:53 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 2/3] leds: leds-lp5569: Better handle enabling clock internal setting
Date: Thu,  4 Jul 2024 03:55:41 +0200
Message-ID: <20240704015543.14495-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704015543.14495-1-ansuelsmth@gmail.com>
References: <20240704015543.14495-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Better handle enabling clock internal setting. In further testing it was
notice that internal clock config MUST be set before clock output config
or the LED CHIP might stop working.

This wasn't documented and was actually found on devices that have 2
chip chained where one chip provide clock for the other.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5569.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-lp5569.c b/drivers/leds/leds-lp5569.c
index b7a74d6c19ca..2b4f358bc63a 100644
--- a/drivers/leds/leds-lp5569.c
+++ b/drivers/leds/leds-lp5569.c
@@ -179,20 +179,25 @@ static int lp5569_post_init_device(struct lp55xx_chip *chip)
 
 	val = LP5569_DEFAULT_CONFIG;
 	val |= FIELD_PREP(LP5569_CP_MODE_MASK, chip->pdata->charge_pump_mode);
+	ret = lp55xx_write(chip, LP5569_REG_MISC, val);
+	if (ret)
+		return ret;
 
 	if (chip->pdata->clock_mode == LP55XX_CLOCK_INT) {
+		/* Internal clock MUST be configured before CLK output */
+		ret = lp55xx_update_bits(chip, LP5569_REG_MISC,
+					 LP5569_INTERNAL_CLK,
+					 LP5569_INTERNAL_CLK);
+		if (ret)
+			return ret;
+
 		ret = lp55xx_update_bits(chip, LP5569_REG_IO_CONTROL,
 					 LP5569_CLK_OUTPUT,
 					 LP5569_CLK_OUTPUT);
 		if (ret)
 			return ret;
-
-		val |= LP5569_INTERNAL_CLK;
 	}
 
-	ret = lp55xx_write(chip, LP5569_REG_MISC, val);
-	if (ret)
-		return ret;
 
 	return lp5569_init_program_engine(chip);
 }
-- 
2.45.2


