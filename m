Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B280A3226F9
	for <lists+linux-leds@lfdr.de>; Tue, 23 Feb 2021 09:18:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbhBWISR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Feb 2021 03:18:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231827AbhBWISQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 23 Feb 2021 03:18:16 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F847C061574;
        Tue, 23 Feb 2021 00:17:36 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id l12so21610043wry.2;
        Tue, 23 Feb 2021 00:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qX9/JFWP+z63SqGu8u1Vp5nniYXwqIoOSTuI8qvDgxI=;
        b=PKhYP6hJtYW5hK7DjOmDr+mPeanvIMJf87VoklhpkTcVJf33KKJOPUb5wQ79DS86Vn
         aTlI+IfVUQMTNoC+5LG+hm5yqS2YXSWWspQJUZUXUuGjeJ7S8kP3Itj98LdD7FG0mtCj
         5rLzq4gEHywHboo3eHqcaiSC+lGTDojd0PPnL+JtqyF06TBDlQS3gzCWSUpkaBUPyu3b
         AMbz9Dsx2Q0j/sKDthN5k1M2atn8Mywhycr5qyqoGcCsCNhX9oKZ9ZvENsawuP4M6vHS
         fh8X+/03nRMoibs8BXnmH16hTbw1Aei8pAI941lGAutLPpvj0STaOn+DUZk8jRR8+ScU
         G4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qX9/JFWP+z63SqGu8u1Vp5nniYXwqIoOSTuI8qvDgxI=;
        b=Yee2Pv0SCORP1VwcOyYbKp1+2AnZ15AajkvFTWYEqsWUT+8d4Xhi2oEx49dQ+FvCm6
         8l18ioDQP5B/z1HIZv7dPmcU4kfUOLzzpCQx+gjV0Oh+Hm1Wh5fLXdsUc2aH6ai+E0+5
         E23u0e/MNxN39bt4JcJe6xTpiQWDsuTKyj72rtkpwABTTILVAOk+onj00smMPJt4x0eH
         BaIDizmAQ7xbeH/u1/6GHfacFOzOT3P709Kmn/+BvITr2QMER8qyNwHWqRLxyV+9D+hY
         2G8k4fL6TXA4YQUsEEufuID3zWYxIUZecJvsKJ5hXqH7q62YMX7pDHEruIOpxUr7Uuxn
         /xsg==
X-Gm-Message-State: AOAM533zKcv7pA3i9grB3ohbf5n+T4pZu21st4SghZTlt/XlmixAEFNB
        vSIEOX+gSSpY5YyCSMOrPAE=
X-Google-Smtp-Source: ABdhPJxYraP99JiduAivhrMWK1jn464PFoGwakBOYo/nz7l2xlOQAT7jHQ8EfF5SdVTbAFXFxtucvw==
X-Received: by 2002:a5d:6951:: with SMTP id r17mr24401867wrw.279.1614068255112;
        Tue, 23 Feb 2021 00:17:35 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id b83sm1903753wmd.4.2021.02.23.00.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 00:17:34 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 0/2] leds: bcm63x8: improve read and write functions
Date:   Tue, 23 Feb 2021 09:17:30 +0100
Message-Id: <20210223081732.9362-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This code is proven to work in BMIPS BE/LE and ARM BE/LE.
See bcm2835-rng and bcmgenet.c:
https://github.com/torvalds/linux/blob/3b9cdafb5358eb9f3790de2f728f765fef100731/drivers/char/hw_random/bcm2835-rng.c#L42-L60
https://github.com/torvalds/linux/blob/3b9cdafb5358eb9f3790de2f728f765fef100731/drivers/net/ethernet/broadcom/genet/bcmgenet.c#L71-L88

Álvaro Fernández Rojas (2):
  leds: bcm6328: improve write and read functions
  leds: bcm6358: improve write and read functions

 drivers/leds/leds-bcm6328.c | 25 +++++++++++++------------
 drivers/leds/leds-bcm6358.c | 25 +++++++++++++------------
 2 files changed, 26 insertions(+), 24 deletions(-)

-- 
2.20.1

