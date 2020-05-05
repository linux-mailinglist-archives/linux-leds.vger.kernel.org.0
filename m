Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 238FB1C58E7
	for <lists+linux-leds@lfdr.de>; Tue,  5 May 2020 16:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730518AbgEEOTi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 5 May 2020 10:19:38 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:35865 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730509AbgEEOTh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 5 May 2020 10:19:37 -0400
Received: from localhost.localdomain ([149.172.19.189]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MQ5f4-1jj5Pt12Lw-00M5Po; Tue, 05 May 2020 16:19:29 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Bryan Wu <bryan.wu@canonical.com>,
        "G.Shark Jeong" <gshark.jeong@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Dan Murphy <dmurphy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH] leds: lm355x: avoid enum conversion warning
Date:   Tue,  5 May 2020 16:19:17 +0200
Message-Id: <20200505141928.923428-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8c1rln3Kq+ivHGqkg2GjteXs+tFwdFKG9L+pvtz20Yvkk7lUTum
 M25UzVJbdYcq7ohrTpNLAOZIqHtFWqtgc3b4hHiXfauZKeANowG6k+QyVNQCY+5FK+K78S1
 05XCV16fA34XPdn3Tyb+A98U77hSgYpBI2oZoWVL/Y0jR7y7+ntFJicuzGD1mXJiN+Zb7fu
 Xo5eiu66cDyuihcvKu7iw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:phYNzzBjcXE=:Iave2708yJSgJvBUtn6/KT
 JMWiFu6p/CXzgogeRhk5DQyieZ70JW+4w5IF02TuOpm7BcNZjy4W95XrC4i87emqDQf5G4DOS
 kHJh36T96za4u797haipn31pTZZWD++i3ZuvEHcbqEi/O4Lj1CBgaa9bA+xdpZ2FEsTgLZXgb
 l43uRks07wGNsPminHbnhGKPvhi+ta0Tsqb55S1ga6pcb3UIT7PGbpu6bffJtgkSCwUleF2qv
 SZXEdRvLSFLFjwj4bqgAELaDU9bPdB/By4V4urKx3ZGy1NVpVQJ7+XfLK5E8eVsSPdh00h9MA
 TGbID6OUFHeT50i5Zl9SydaoLIhNx2r6kjldIGrsawjoP9shYpcVOMJOGsoUL+XOQxo822uSW
 vRtG0qcvHWGwGoW2cQ6yYd20HCoVPnY1+31GHg5gfPfBsca6zInZOvAsofXJ2RxvKje3yQW/o
 N17AM1PkvKsBye0G9QkCb105cX1FW2y4MrTXPn30bfW8Ntdbt3BJaBVdLWHjNxrR0myOmWOOR
 8H+kx8Xub90nt8dFDf0lIGdnoE/UPQZs0y3n9fNY0JARdaSPnFwvVQVXsNZgziqZBK8DjgSud
 8YA9NgHvz5RRi/jpdbyy5O0eSPEkaO7AQCHVfKBT4AujsNK7MX87KbPOvRC2Ce+30L7luPj8b
 P/U/5WsaLH09Ao69hgPH33YJ3Dt9TXOhwlPV4UTQrWvOtn8GjYAcmZSGlTXiy3IeDQ3zTOAqV
 rRxPf9XbUeaq5uouAzA60SIvdVc5TuLM3sRpPUMotR0rakXgOFQQL5txcTeX/SxzHtiFZz5gF
 617u+Owhm28e42do5nQ2qaBvYfrX9C5YY64zWFIKF9aan8H5KA=
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

clang points out that doing arithmetic between diffent enums is usually
a mistake:

drivers/leds/leds-lm355x.c:167:28: warning: bitwise operation between different enumeration types ('enum lm355x_tx2' and 'enum lm355x_ntc') [-Wenum-enum-conversion]
                reg_val = pdata->pin_tx2 | pdata->ntc_pin;
                          ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
drivers/leds/leds-lm355x.c:178:28: warning: bitwise operation between different enumeration types ('enum lm355x_tx2' and 'enum lm355x_ntc') [-Wenum-enum-conversion]
                reg_val = pdata->pin_tx2 | pdata->ntc_pin | pdata->pass_mode;
                          ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~

In this driver, it is intentional, so add a cast to hide the false-positive
warning. It appears to be the only instance of this warning at the moment.

Fixes: b98d13c72592 ("leds: Add new LED driver for lm355x chips")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/leds/leds-lm355x.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-lm355x.c b/drivers/leds/leds-lm355x.c
index 11ce05249751..b2eb2e1e9c04 100644
--- a/drivers/leds/leds-lm355x.c
+++ b/drivers/leds/leds-lm355x.c
@@ -164,18 +164,19 @@ static int lm355x_chip_init(struct lm355x_chip_data *chip)
 	/* input and output pins configuration */
 	switch (chip->type) {
 	case CHIP_LM3554:
-		reg_val = pdata->pin_tx2 | pdata->ntc_pin;
+		reg_val = (u32)pdata->pin_tx2 | (u32)pdata->ntc_pin;
 		ret = regmap_update_bits(chip->regmap, 0xE0, 0x28, reg_val);
 		if (ret < 0)
 			goto out;
-		reg_val = pdata->pass_mode;
+		reg_val = (u32)pdata->pass_mode;
 		ret = regmap_update_bits(chip->regmap, 0xA0, 0x04, reg_val);
 		if (ret < 0)
 			goto out;
 		break;
 
 	case CHIP_LM3556:
-		reg_val = pdata->pin_tx2 | pdata->ntc_pin | pdata->pass_mode;
+		reg_val = (u32)pdata->pin_tx2 | (u32)pdata->ntc_pin |
+		          (u32)pdata->pass_mode;
 		ret = regmap_update_bits(chip->regmap, 0x0A, 0xC4, reg_val);
 		if (ret < 0)
 			goto out;
-- 
2.26.0

