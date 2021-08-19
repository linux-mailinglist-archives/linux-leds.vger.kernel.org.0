Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9BF3F109E
	for <lists+linux-leds@lfdr.de>; Thu, 19 Aug 2021 04:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235911AbhHSCvp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Aug 2021 22:51:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235853AbhHSCvo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Aug 2021 22:51:44 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F6BAC0613CF;
        Wed, 18 Aug 2021 19:51:09 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id l36-20020a0568302b24b0290517526ce5e3so6808882otv.11;
        Wed, 18 Aug 2021 19:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sHJ6xIxDt3XA246U2lV+K6FnAovAAMr3EploK9JC5Ks=;
        b=a7KK94iCAmI+6eXFYg75GNAI0bmgDA59ZXccCeX+9omBlPmR2885dUYbm5qktM9uMU
         wjKBRRBv/sPXB1EQVOQAxTFj1949ZxnF1OI0d3xHzYW+4liJVf2Y7LVdYPBPSdh9f4zy
         SGe+JhLOjC/JrkHOgW7ibBlf56WxpCmi8BtX+eiG8pKDzshXPXFfPU1woigl34w9G/bK
         7sh0st3vvQdWpkqX7NfVvRz6dQEtx6KUp8m5rz1tOLxuEBpW6HZHKdvKM7jiLfu4mlBs
         NkV4i5iuYuOaLponvku/SuqrQ1cStxcFpkqV8Vyod9nNykVXz/T4Q2PanWAU0jUqJq1w
         jt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sHJ6xIxDt3XA246U2lV+K6FnAovAAMr3EploK9JC5Ks=;
        b=BEgNMwBlJ8c4QVpKWJ+nY5bflJSbLyynVv5SGaBz8opNY4M9tK3BnVYMoiUN0hcTtP
         uoyWKdafXJn/RTqgv0tgMkjylGuadQEI6un2zuV4UGqPwJTiS10bFWS+QNjh29rNxKBZ
         /oI7D99hlqcXucA7lqOIn+PQY2xZ1MYBODSEsU/QhF5yg/x1CdDuxFXg4G8BUAlTaZaU
         kxqA7OBlbzOqNOfYE7CN+5/hFTPi/QGQX8as13/ibfOv2j8adm1hllsuaoBOdXLcYlVW
         4FKLxzkt4rgXpjUtRAfFbRz0Cj9kWj7pj+BOEQTTluRm/ksnkMUKUmbgAcbK7pqoBcOc
         Trng==
X-Gm-Message-State: AOAM532RX8D9zsU9Gt6ZWbsvpyNWikXTrl2u6JR4SAE+cUuFg2cZwcLu
        X5dT4Z+sf3nNxOaw2cav0cG+HfC6Gm1UPlA/
X-Google-Smtp-Source: ABdhPJyI82d41Fqs8kmor5RQK8H67itumoTrNSJPEf/KsY05snzSy/2jpn8MtLGyho0JZPUGQA/4sw==
X-Received: by 2002:a9d:2de1:: with SMTP id g88mr9980024otb.84.1629341468225;
        Wed, 18 Aug 2021 19:51:08 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id w15sm156792oiw.19.2021.08.18.19.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 19:51:07 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, kabel@kernel.org,
        linux-kernel@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: [RFC PATCH v3 06/18] block: Add LED trigger pointer to struct gendisk
Date:   Wed, 18 Aug 2021 21:50:41 -0500
Message-Id: <20210819025053.222710-7-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819025053.222710-1-arequipeno@gmail.com>
References: <20210819025053.222710-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Needed by ledtrig_blkdev_disk_cleanup(), which removes all monitoring of a
block device by the blkdev LED trigger when the device is removed

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 include/linux/genhd.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index b26bbf2d9048..66e2760702cb 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -168,6 +168,9 @@ struct gendisk {
 #endif	/* CONFIG_BLK_DEV_INTEGRITY */
 #if IS_ENABLED(CONFIG_CDROM)
 	struct cdrom_device_info *cdi;
+#endif
+#ifdef CONFIG_LEDS_TRIGGER_BLKDEV
+	struct ledtrig_blkdev_disk *ledtrig;
 #endif
 	int node_id;
 	struct badblocks *bb;
-- 
2.31.1

