Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 331FB64861
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2019 16:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbfGJOap (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 10 Jul 2019 10:30:45 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:40557 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbfGJOap (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 10 Jul 2019 10:30:45 -0400
Received: by mail-ua1-f68.google.com with SMTP id s4so943323uad.7
        for <linux-leds@vger.kernel.org>; Wed, 10 Jul 2019 07:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=logitech-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=3ZzAXO5i2+gxuy4kt7UDXzQqhSydebA9q1kIRUUGl1M=;
        b=BEBTmdFz7uAipCN9jvJkw1YuCIutogumH8z2B8hux+JXye1n8llp/mgR1PviH3/9MB
         NJ1V5j6KowxzBgo7S1K9zEzmYTo25IeNQFKR+01nqVB/cRZZQ5D1NSsv7oevO3p4Wv4T
         NuQF+M2EvWmhYX8PcAUfTBHlr6kSLbmMwbWMrzgDy/N/VFVxN3pn7K9pDWoXDCi+ix+x
         Kn1ohYegiXIiUbvENyl65QFbOJk4d6vYjX1qnu65WUGV3vbef0BVURsJcPJT75G0UOUG
         Cknaq90IMMLLZR1Hgx1n2oqrHaY108EHTbP273KZco3b8lrlA/T1HX1L7Pflon4vnIM9
         4mqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=3ZzAXO5i2+gxuy4kt7UDXzQqhSydebA9q1kIRUUGl1M=;
        b=HR81QIO9+5beQ6sPMkFZjwoEQVeLvvvm3DLYvXe8MvXW2lpwETUePXAMGbRhMHFX5J
         U51nJgv747Dhz7ZvrUBKpteR8GNP/qFYKpDV8KzIJ4g4eycEEw91UF9p1eS3IJqFq6Xt
         Om5wjML8fejBBotPNYAuMD5sl9GcovLRUhcWH/XPGyln7YCVBgzhEggNOj6PTmh3ssle
         LCZM2zcsDxtO5kP75w4YQlbXnHYfcs74Ce0po83DpQmCe7AhMKMSvwM+cN5ntMGcLb7a
         npP2CECRe5PVxiPXYnYVp2AedBCHnXD4dLD7ehWDCRWvuyZFvMlBMbQuPARxxvH4q1Il
         uPFg==
X-Gm-Message-State: APjAAAWCwmGGGeVUiqoshRvEE9ZERA1ipWCQd7cGWGsmLEd5143fseIR
        CWO7ilEQDoFcZsD17dE+sOH4O3R2nMAxSWF7LF09MSl/y8c=
X-Google-Smtp-Source: APXvYqyVXqQ6ARKSQjPYjC+VW6+awH7/lzO6aSWKo25wz1+slzK0h84lmGPvO5E+FAQraFp8WXhlFTn9Msh/J/CxF5o=
X-Received: by 2002:a9f:25e9:: with SMTP id 96mr18292129uaf.95.1562769042143;
 Wed, 10 Jul 2019 07:30:42 -0700 (PDT)
MIME-Version: 1.0
From:   Nick Stoughton <nstoughton@logitech.com>
Date:   Wed, 10 Jul 2019 07:30:31 -0700
Message-ID: <CACpbN90YPxnsm1Py4t2-npk0b8A06+OZTtc8kom_smMDUyFEVw@mail.gmail.com>
Subject: [PATCH] leds: leds-lp5562 allow firmware files up to the maximum length
To:     linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
@@ -260,7 +260,11 @@ static void lp5562_firmware_loaded(struct
lp55xx_chip *chip)
 {
        const struct firmware *fw = chip->fw;

-       if (fw->size > LP5562_PROGRAM_LENGTH) {
+        /*
+         * the firmware is encoded in ascii hex character, with 2 chars
+         * per byte
+         */
+       if (fw->size > (LP5562_PROGRAM_LENGTH * 2)) {
                dev_err(&chip->cl->dev, "firmware data size overflow: %zu\n",
                        fw->size);
                return;
-- 
Nick Stoughton
