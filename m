Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3169DD919E
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2019 14:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389769AbfJPMyf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Oct 2019 08:54:35 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44485 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbfJPMyf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Oct 2019 08:54:35 -0400
Received: by mail-pg1-f195.google.com with SMTP id e10so10261090pgd.11;
        Wed, 16 Oct 2019 05:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8a9HNA2BKGzGwxQrVAzjlpqsmr7lfX1r2QUJLnuq4M8=;
        b=ZUUc212azMCOIP56SZCnXe9tI35MmHs9g8a+tqb/WMJmGQ1dJKa83hOdA91+Mav88U
         8MpozPbLu0g3jY80UGoIFAy+AT9ljM5Nyl3fD5UaAtWWNHm0GRvP5QvAFPNfTvM5wOOL
         /UaUEo07Zx5U3olsTfM38GliySpyAt5iZum+AdKo7EC38tgQBT+NO5UCZXGzsDnytyF2
         AgRp02Ei2cmQT3AAJlzdvPx6o0EUlorvm2QV1tuYqwzppzuWRAMv6U460znOzKsHn1WH
         69q25o8g8+sixoJuNZPVeIYyDRLLABE2cdBIxvO7mwLFn/NarAzZl6OUNVAvqiwk69r/
         yK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8a9HNA2BKGzGwxQrVAzjlpqsmr7lfX1r2QUJLnuq4M8=;
        b=AZ2KmnnAQ3Eq+wAbI6DxKepcinF67gGfc/W5Jy/YQwGyvg3qU544/7zVxkL6LJejhF
         Y7hbDBr/P5pg5BJaLZOY6TxcEU46t9e/n1pBKUcPlP2GLth+ZD3SLKr4oitRPFcApV1V
         7nq0rIb8Y0pVEAEBDERLlPt0hkaKB/uwhJISIvW/TA8cHCa4O6n63OPH/iMbs+WzvfdM
         cF9BOx1Bs6WWu0Xoy1MBbaedO5hmgC7HOw70WHOeexNb0RmuJkCU130mHDhCikHLT1lj
         FnAy9mQHuN5QwcRmTujsTzY0TOkC7dz4uXL7XF5IYgtD5kq1f/2dZqURZitUaUyD2Vju
         o+iQ==
X-Gm-Message-State: APjAAAXC0F59cDR5w/XmXp29BeFLF40lYB5P6NEMbXSaTot0lXIt3ySb
        I91/jD8QYtJtxFBS6JGb+VI=
X-Google-Smtp-Source: APXvYqwkSyOIiNgoq7akH/I2XecLVnJJ7aw3IKPENmDImEh16Pi/oo9zVzBOZnn1TMawcSuoq5EWZQ==
X-Received: by 2002:aa7:8b4d:: with SMTP id i13mr45697833pfd.226.1571230468438;
        Wed, 16 Oct 2019 05:54:28 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
        by smtp.gmail.com with ESMTPSA id r18sm19049233pgm.31.2019.10.16.05.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 05:54:27 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH v2] leds: an30259a: add a check for devm_regmap_init_i2c
Date:   Wed, 16 Oct 2019 20:54:03 +0800
Message-Id: <20191016125403.23359-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

an30259a_probe misses a check for devm_regmap_init_i2c and may cause
problems.
Add a check and print errors like other leds drivers.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v2:
  - Use goto exit instead of return to destroy the mutex when failed.

 drivers/leds/leds-an30259a.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/leds/leds-an30259a.c b/drivers/leds/leds-an30259a.c
index 250dc9d6f635..82350a28a564 100644
--- a/drivers/leds/leds-an30259a.c
+++ b/drivers/leds/leds-an30259a.c
@@ -305,6 +305,13 @@ static int an30259a_probe(struct i2c_client *client)
 
 	chip->regmap = devm_regmap_init_i2c(client, &an30259a_regmap_config);
 
+	if (IS_ERR(chip->regmap)) {
+		err = PTR_ERR(chip->regmap);
+		dev_err(&client->dev, "Failed to allocate register map: %d\n",
+			err);
+		goto exit;
+	}
+
 	for (i = 0; i < chip->num_leds; i++) {
 		struct led_init_data init_data = {};
 
-- 
2.20.1

