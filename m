Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6272C37987A
	for <lists+linux-leds@lfdr.de>; Mon, 10 May 2021 22:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbhEJUlL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 May 2021 16:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbhEJUlK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 10 May 2021 16:41:10 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB8BAC061574
        for <linux-leds@vger.kernel.org>; Mon, 10 May 2021 13:40:03 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id u25-20020a0568302319b02902ac3d54c25eso15673491ote.1
        for <linux-leds@vger.kernel.org>; Mon, 10 May 2021 13:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=tV+VD/4Pl4+jrBIn2amExX03Gw+l8ID4AwgW/IDmTGI=;
        b=NUulgV6j2KbLk1yKXVqXxZ44G513+q0isyXTToR84+/+CROt1DsR6EY2Vs4BLkYriP
         KzP8bquPfj/jJPRAdOCudCnFn+stvMuUwO9Z4hGeZ8vd41uOQHC0Anw2QgcWyIxRfJh8
         kLIJt4HzKSOmaUh/5zDBUfAi3rSiQUIDb0EI/nV1JIyoIp8IbPAV2ehJjYyjZqB2cMKj
         eElB0GOy3lSKBLWqaW+j7Xy2Hia3Onjkc87cN/bjpLCBPXOUD/2zDq7H2sB0BpKPMMgP
         lpySwsemEdOBmkjqkTNylHITE8KcTKbhwILSJVinh41DhlnJI6a/tNqANIas5OWLsBN9
         w6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=tV+VD/4Pl4+jrBIn2amExX03Gw+l8ID4AwgW/IDmTGI=;
        b=UAYSfJTkrTdN1Ud0Ghfh3dPZyyFEPfhLtmbgRL0FvmEBjU5RTNeyqeVUHj6mnfBkm4
         zRlIgkV8BE4ImXv+3IWKKS8c3fyCNRZK/mYG8VQ6sFqIDTBvUYKitFhn4ZnvdDeVFbCD
         An/WTA4o43HtvYCHOYN7hMkQ1h01Z4TtRDOsIWjfICJi70YXsY6d515NgczFB1a1i21g
         f8LOOgdysWK1YNcMLpyao9jArsMiaYIpYXXEP0v/Z9tG5QSc918YoExWOJTgCd6oODGT
         EKTHvvJr8Rdtx/I79gIlLyy7wP+Jii3YoFnWxMQDn7fiBjhMp+gsfXrvWPhbvqj3+/B2
         o4YA==
X-Gm-Message-State: AOAM533B7CP0Dvssy8By4i1G9Vj5zaOH86ULM4dKEe4P3RtBpjT/NlJu
        LKmtLqB/Np5Nu05AlqjMPcNUH1iCb0sA6Ld2
X-Google-Smtp-Source: ABdhPJyIsn4Cb+feXCAQfeXorF9sbqXSGyTMEOIHL2clVRq8m/6PHQuTy2ttHJErcZeTXKjW3XzGng==
X-Received: by 2002:a05:6830:15d2:: with SMTP id j18mr22998816otr.89.1620679202928;
        Mon, 10 May 2021 13:40:02 -0700 (PDT)
Received: from odessy ([76.232.4.205])
        by smtp.gmail.com with ESMTPSA id l186sm2786837oih.55.2021.05.10.13.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 13:40:02 -0700 (PDT)
Date:   Mon, 10 May 2021 15:40:00 -0500
From:   Doug Zobel <dougdev334@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>
Subject: [PATCH] leds: lp55xx: Initialize enable GPIO direction to output
Message-ID: <20210510204000.GA3714758@odessy>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The "Convert to use GPIO descriptors" commit changed the
initialization of the enable GPIO from GPIOF_DIR_OUT to
GPIOD_ASIS.  This breaks systems where the GPIO does not
default to output.  Changing the enable initialization
to GPIOD_OUT_LOW.

Signed-off-by: Doug Zobel <dougdev334@gmail.com>
---
 drivers/leds/leds-lp55xx-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 81de1346bf5d..d1657c46ee2f 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -694,7 +694,7 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 	of_property_read_u8(np, "clock-mode", &pdata->clock_mode);
 
 	pdata->enable_gpiod = devm_gpiod_get_optional(dev, "enable",
-						      GPIOD_ASIS);
+						      GPIOD_OUT_LOW);
 	if (IS_ERR(pdata->enable_gpiod))
 		return ERR_CAST(pdata->enable_gpiod);
 
-- 
2.20.1

