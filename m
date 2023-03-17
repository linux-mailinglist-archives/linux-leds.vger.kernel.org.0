Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D74686BF18D
	for <lists+linux-leds@lfdr.de>; Fri, 17 Mar 2023 20:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjCQTPA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 17 Mar 2023 15:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbjCQTO7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Mar 2023 15:14:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F4F9E1FFF
        for <linux-leds@vger.kernel.org>; Fri, 17 Mar 2023 12:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679080427;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=ztGk+FDLapVOGmVmFaxYJiKEGt8g1pDCbQl/HqGei0o=;
        b=GKrYeD4TSeVGfLLHQ+BFagnKB9bQ731Aj+V3sJZnrrCeHg6Sr/nb+FyB2TdW1g0fUm6bNV
        j2ef5X3kJakljc8I99ShGUF58YRO9tjxgBnTu33veyD7mQvQbzy2GIYBwP1/HjYK7smWv5
        3FU6+lx11yJ6J2irYprV6kiPMlTeeWA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-TKG0ZT8fPxmqGF14GtTpZA-1; Fri, 17 Mar 2023 15:13:46 -0400
X-MC-Unique: TKG0ZT8fPxmqGF14GtTpZA-1
Received: by mail-qt1-f200.google.com with SMTP id c11-20020ac85a8b000000b003bfdd43ac76so2999682qtc.5
        for <linux-leds@vger.kernel.org>; Fri, 17 Mar 2023 12:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679080425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztGk+FDLapVOGmVmFaxYJiKEGt8g1pDCbQl/HqGei0o=;
        b=i24Izje4lMUjJG9/EZNgmPJ8qfmL5m6LnO05vsFb5VtSPJ8MaLhK7lkMmljk9ngbKj
         YL+xSN/QFth+pcs5zO9omhQNyDMPoDPBBJb4loyxTCoDilPr65isxN8F/Iog3Ew5x1W+
         TYgTfJdfoOUoYEPWVAZpu6p+hz4foItXho56zl3KksF481wydr5e46ZaRRzkV7CvVDKT
         3G5sRX9wYO4ALimdLInU05oiSeQys2eTAbnKEYrlHQm1jqSYNtapn33WctRUXSBj4lGD
         n0QOwo3OlYV9hBQ95Q8F/L6DgtTmsS9+Q4+9P7gm/sN/TGR/sfaQ27OyTJ6Ad++GKjaV
         9mpw==
X-Gm-Message-State: AO0yUKVaL/YEuyMRqCY57iYPMNWJQ91XKddVaVctNFRHictthI4DER8c
        F3Dvn7PJJKDIPjvxSBk6aUXt7tr5RZmxU5VF8HwsFtO9KuTUqEmJQqG558VLPuz9oKO8h5CZlk3
        P7zLU7SfEAEyEO4v5zTGrZw==
X-Received: by 2002:ac8:7d0c:0:b0:3d7:b045:d39 with SMTP id g12-20020ac87d0c000000b003d7b0450d39mr12113673qtb.62.1679080425621;
        Fri, 17 Mar 2023 12:13:45 -0700 (PDT)
X-Google-Smtp-Source: AK7set9jusCj+LruNqU0NMMLlDwg/wMopjnFU5EEIhYBjZu9tyVtWiiTtf7DPciJ3H1xhigYUlMWBQ==
X-Received: by 2002:ac8:7d0c:0:b0:3d7:b045:d39 with SMTP id g12-20020ac87d0c000000b003d7b0450d39mr12113637qtb.62.1679080425373;
        Fri, 17 Mar 2023 12:13:45 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id m17-20020ac84451000000b003c03b33e6f5sm1698622qtn.90.2023.03.17.12.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 12:13:45 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     pavel@ucw.cz, lee@kernel.org, quic_fenglinw@quicinc.com
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] leds: flash: set varaiables mvflash_3,4ch_regs storage-class-specifier to static
Date:   Fri, 17 Mar 2023 15:13:41 -0400
Message-Id: <20230317191341.1670660-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

smatch reports
drivers/leds/flash/leds-qcom-flash.c:103:18: warning:
  symbol 'mvflash_3ch_regs' was not declared. Should it be static?
drivers/leds/flash/leds-qcom-flash.c:115:18: warning:
  symbol 'mvflash_4ch_regs' was not declared. Should it be static?

These variables are only used in leds-qcom-flash.c,
so it should be static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/leds/flash/leds-qcom-flash.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
index 406ed8761c78..90a24fa25a49 100644
--- a/drivers/leds/flash/leds-qcom-flash.c
+++ b/drivers/leds/flash/leds-qcom-flash.c
@@ -100,7 +100,7 @@ enum {
 	REG_MAX_COUNT,
 };
 
-struct reg_field mvflash_3ch_regs[REG_MAX_COUNT] = {
+static struct reg_field mvflash_3ch_regs[REG_MAX_COUNT] = {
 	REG_FIELD(0x08, 0, 7),			/* status1	*/
 	REG_FIELD(0x09, 0, 7),                  /* status2	*/
 	REG_FIELD(0x0a, 0, 7),                  /* status3	*/
@@ -112,7 +112,7 @@ struct reg_field mvflash_3ch_regs[REG_MAX_COUNT] = {
 	REG_FIELD(0x4c, 0, 2),                  /* chan_en	*/
 };
 
-struct reg_field mvflash_4ch_regs[REG_MAX_COUNT] = {
+static struct reg_field mvflash_4ch_regs[REG_MAX_COUNT] = {
 	REG_FIELD(0x06, 0, 7),			/* status1	*/
 	REG_FIELD(0x07, 0, 6),			/* status2	*/
 	REG_FIELD(0x09, 0, 7),			/* status3	*/
-- 
2.27.0

