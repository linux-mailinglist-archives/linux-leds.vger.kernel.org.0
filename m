Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5DFF7171F0
	for <lists+linux-leds@lfdr.de>; Wed, 31 May 2023 01:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233987AbjE3Xsr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 May 2023 19:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjE3Xsl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 May 2023 19:48:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA623D9
        for <linux-leds@vger.kernel.org>; Tue, 30 May 2023 16:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685490476;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=7FN5z/Bbo4F41FMSmQdaTAQtO0xV9HpjcxuBSMJEC24=;
        b=RJenlZyMVNnMupvgxxQ71IpL7mmSaYZ+Aur/89B8G+wZqvix4gO5nnFW1nTCqfeoi6zBtz
        zRi7m91uVGTAHk2ZcPcJlwo3yXXp+5LGOgn05QLJ7SotIoPLnCG6U7UNXG/cN3Au6DIUKd
        lqZ0aWuoUoTCKiuE2VnSllse686x334=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134--qC0hNSTPMullbOlifEIdQ-1; Tue, 30 May 2023 19:47:52 -0400
X-MC-Unique: -qC0hNSTPMullbOlifEIdQ-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-62621cdb1f0so16864406d6.0
        for <linux-leds@vger.kernel.org>; Tue, 30 May 2023 16:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685490471; x=1688082471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7FN5z/Bbo4F41FMSmQdaTAQtO0xV9HpjcxuBSMJEC24=;
        b=NlorJt2n24+jU9B6SaipGHVp4Xu6K49rz6BExpwMDqbA4j2+zxdRMSRp8cJ0U6EP4C
         hPYN7sztbTG2C8zMm48tv3fEPsFOopVmgGfCFz+MhwsZqZk1+GSCn/PsSwLCdXt1Nw54
         /nSbAtaEJ02k4zDcUzKFZr0U0RBK3d59se9hailq6BIPUEGXiZ6NTrehc1lEOYhU0zoi
         ZK5Eie3CWO/J1KgYBebcnSYd2JPdintU+vsOH6Qk7IRwG9xMiSwe6ID7uirTofLzhzM7
         EFHrwtRlx/iJbluJCZoxjWf2QgbMuz1w9WjxPYngCmmWvp+s3N9M3vTq8/oLr2uqo3q2
         s71Q==
X-Gm-Message-State: AC+VfDyhtFDN8CwfkG+G129kDiK204DizCOWX1cH3iGL5GpQHXS6GHXe
        Qnwvw6cXrTy/SDx9nkdbMngYjR1rCsk8/Sj4JoQmYP18kKMPlyjbrsfsIyaMaLy8ckjB5XRR6Hp
        Hx5RbYwZZXPPbCrNEyGC5Bg==
X-Received: by 2002:ad4:5ec7:0:b0:625:aa48:fb71 with SMTP id jm7-20020ad45ec7000000b00625aa48fb71mr5034832qvb.59.1685490471705;
        Tue, 30 May 2023 16:47:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ60mXRe5Ihq4KWw1KK9rQ5jhVTVA8tPG2DdnzZJHcMocr84jJ8U/hMSce/y4Cl6rhAuwQUpNw==
X-Received: by 2002:ad4:5ec7:0:b0:625:aa48:fb71 with SMTP id jm7-20020ad45ec7000000b00625aa48fb71mr5034822qvb.59.1685490471480;
        Tue, 30 May 2023 16:47:51 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id e7-20020ad450c7000000b00626234be222sm2320369qvq.57.2023.05.30.16.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 16:47:51 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     pavel@ucw.cz, lee@kernel.org
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] leds: cht-wcove: set function cht_wc_leds_brightness_get storage-class-specifier to static
Date:   Tue, 30 May 2023 19:47:48 -0400
Message-Id: <20230530234748.3641630-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

smatch reports
drivers/leds/leds-cht-wcove.c:144:21: warning: symbol
  'cht_wc_leds_brightness_get' was not declared. Should it be static?

This function is only used in its defining file, so it should be static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/leds/leds-cht-wcove.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-cht-wcove.c b/drivers/leds/leds-cht-wcove.c
index 0cfebee98910..0a5c30e5ed5d 100644
--- a/drivers/leds/leds-cht-wcove.c
+++ b/drivers/leds/leds-cht-wcove.c
@@ -141,7 +141,7 @@ static int cht_wc_leds_brightness_set(struct led_classdev *cdev,
 	return ret;
 }
 
-enum led_brightness cht_wc_leds_brightness_get(struct led_classdev *cdev)
+static enum led_brightness cht_wc_leds_brightness_get(struct led_classdev *cdev)
 {
 	struct cht_wc_led *led = container_of(cdev, struct cht_wc_led, cdev);
 	unsigned int val;
-- 
2.27.0

