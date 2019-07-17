Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87B6B6C2D6
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jul 2019 23:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727610AbfGQV4W (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Jul 2019 17:56:22 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46437 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbfGQV4W (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Jul 2019 17:56:22 -0400
Received: by mail-pl1-f194.google.com with SMTP id c2so12650382plz.13
        for <linux-leds@vger.kernel.org>; Wed, 17 Jul 2019 14:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=logitech-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zzSwC//VI3FLBdZYqoWGMm28EyletIcYgHWgMoUb3+g=;
        b=G+48v8F+qnGB7qERcGRmNv+qH6zVZ3fj2H6ArQloScSLQ4+Z4Xb3x3N/KJOx2mKESM
         mrs6k4l9+eJ/m1UQxQlVwkzfAb4hdM9h9BNxoFmg5nW/oIMXgbGYAcvGa6M4llAYTA1A
         4EtIRC2txiVUqn49joQEfqkUWVTyHduifMbQfSY8nQVHjH+ImMFMVlDuEdrmxG58zsw+
         kvfCDBJ0s3Y/ZRYywdxwOIzvgB+8fDl2cenjKiHI3RPTj2KJMLqh7LdqBDZRU5ZaVSuD
         QI758myrxAZEAYutu0dZ3MebrhbtyfV35mnVbjo6LZZWI9x7Z0c3hvwcEUQluHdtzkqv
         Gbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zzSwC//VI3FLBdZYqoWGMm28EyletIcYgHWgMoUb3+g=;
        b=pSwA0E5Dx+bsxgs108aOxJK7ibrwe+BgnVBF0VedsIVE6JfohB9GuJwt0//FWsNekd
         Qzn7ZNJBg0Mf4htwxqLVq4L64sycTMl2emgJpO4cS5cH9lOrlVVfbgvZd4XpqUzfgxXj
         lpxBySvtpnbPML89a1A5uS8uYoDiGI9uaajdMa/Fk5nCKocgvXuLif1nVfpVv07o72TO
         x+VQZQ3MlW8cNDuu2SrWTrlEcNrIrpbMT1SD4flGuB5pW1jDCFLGrh6E2L7UV2ueN0v8
         VBVPQc8f654VMQa1HvkQk/IwE0M8JEwVt6lKKSZ0el53hnyVZ9C8FRbpPnZx886/JaHp
         Pk5g==
X-Gm-Message-State: APjAAAVx+uqFDMok9feY2UCUQLpMV8XVCHxIR6FhK2oB6NnzgZV/OWMU
        UIGulKhccO2GivDTfJKGUTkiJT/E3asCR1moMMto5MX9BRyujVgT5csY+Dtw7BK6IrFTnyYDscB
        s9ipcG13zVQmoVjBbA5F5FKj72fcyk5h/ewl/jrCCA1Ss/AjSB94BKI+4UcidxXCj28csNWeoNq
        W3
X-Google-Smtp-Source: APXvYqxFCJ8HrKou9IFTKTtdm6ri+czLQAiVvGldvHEgdAv+YAQjkJ+9R+T2Rk+drMUy7FiFJfaa7Q==
X-Received: by 2002:a17:902:bd94:: with SMTP id q20mr34976635pls.307.1563400581178;
        Wed, 17 Jul 2019 14:56:21 -0700 (PDT)
Received: from nick-dell.logitech.com ([204.77.216.18])
        by smtp.gmail.com with ESMTPSA id q7sm32571258pff.2.2019.07.17.14.56.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 17 Jul 2019 14:56:20 -0700 (PDT)
From:   Nick Stoughton <nstoughton@logitech.com>
To:     linux-leds@vger.kernel.org
Cc:     Nick Stoughton <nstoughton@logitech.com>
Subject: [PATCH 1/1] leds: leds-lp5562 allow firmware files up to the maximum length
Date:   Wed, 17 Jul 2019 14:56:06 -0700
Message-Id: <20190717215606.3053-2-nstoughton@logitech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190717215606.3053-1-nstoughton@logitech.com>
References: <20190717215606.3053-1-nstoughton@logitech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Firmware files are in ASCII, using 2 hex characters per byte. The
maximum length of a firmware string is therefore

16 (commands) * 2 (bytes per command) * 2 (characters per byte) = 64

Signed-off-by: Nick Stoughton <nstoughton@logitech.com>
---
 drivers/leds/leds-lp5562.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index 37632fc63741..e00117e3b50d 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -260,7 +260,11 @@ static void lp5562_firmware_loaded(struct lp55xx_chip *chip)
 {
 	const struct firmware *fw = chip->fw;
 
-	if (fw->size > LP5562_PROGRAM_LENGTH) {
+        /*
+         * the firmware is encoded in ascii hex character, with 2 chars
+         * per byte
+         */
+	if (fw->size > (LP5562_PROGRAM_LENGTH * 2)) {
 		dev_err(&chip->cl->dev, "firmware data size overflow: %zu\n",
 			fw->size);
 		return;
-- 
Nick Stoughton

