Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAF10EA479
	for <lists+linux-leds@lfdr.de>; Wed, 30 Oct 2019 20:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbfJ3T6F (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Oct 2019 15:58:05 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55706 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbfJ3T6E (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Oct 2019 15:58:04 -0400
Received: by mail-wm1-f65.google.com with SMTP id g24so3419463wmh.5;
        Wed, 30 Oct 2019 12:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=uJHxujovfFJ9h5r77MUYV3oU68SO0pgD7skhSfMTwQQ=;
        b=CCrrh5U9JnxqTkLCAf0T7LsAyB2pDTxTIkiZFhLRaCwnqMwQbc2XRW5WDfmNhyA/PE
         xqyA2L4QbZeo4CUKiIPW3gYOY5tIWKgrGRpMtRqkD+TDZ8M44xxBlOr0BSaZMnYikCPc
         R5+Qel5ioiHEf8ZDP5Et+LInXH9j9rqj4mA4oTsLKZBGLndfUD3i8BI+JlZbxGBc7NII
         YbZjjZ/YB7Afhhbt5Q2qu9YaLClDW49h4QuKrzQ1d4sL4reDDu+A8gBtVP/XhRzHOh2q
         HOOVm9xCkubtHo3qfQzEPyiF5yTjXGSa8mI9OL0XGoE08Jae15XMCz96XtYbSgDHreBO
         oYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=uJHxujovfFJ9h5r77MUYV3oU68SO0pgD7skhSfMTwQQ=;
        b=QswqXXo4PnnoOIxusA1mhYLZcsQPhAQU3CTlbCatT8un3ElRKFbHNvLUdN04f0WYW9
         ansXx2uGvH1t16q9NiHIJP+ZMyhcUvKaakY5DRgr3LbUcxwtQNteLzsAViTGg5CuZqyR
         EeYe3gtLphJyFLAYJItQFGoj1v90r4w6kvC4OQcNMa0r7Mjs/Y7E74e/DnuQVY+3YLHc
         Plfgmm5fxYERgE3d1mupvHbjRhUISO1hY+hZSMPXC4f9m5zmDDxFUhuD5qSEO+r5PdIn
         z05uk5nPXVT2qKTpWrfpfPVHrD7VnETlcBLeWO3k4+x2DuSzKuawrDFqiV73tqXawgZG
         rBmQ==
X-Gm-Message-State: APjAAAUwkY5gz2e8wDMj1QrSQ4vYHOliR/3BRIqeORiK7dxFyKdyMTdb
        izgKvhCvfuP0PZX1zg3Fy4x33gOv
X-Google-Smtp-Source: APXvYqzkp6jTCzQD+qf30/iLJkKIhNzdF1FbQwIwOVtCurQOe3VJ6QIT4IB8D5At7B6YszwgGiLW4A==
X-Received: by 2002:a1c:4c09:: with SMTP id z9mr1107999wmf.33.1572465481289;
        Wed, 30 Oct 2019 12:58:01 -0700 (PDT)
Received: from [192.168.1.19] (bkv74.neoplus.adsl.tpnet.pl. [83.28.189.74])
        by smtp.gmail.com with ESMTPSA id b196sm1228119wmd.24.2019.10.30.12.57.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Oct 2019 12:58:00 -0700 (PDT)
Subject: Re: [PATCH v15 06/19] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
To:     Dan Murphy <dmurphy@ti.com>, kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191028183629.11779-7-dmurphy@ti.com>
 <201910302027.2hNdR993%lkp@intel.com>
 <bb3473ba-ddfc-2b51-4a75-c23c5bf3bc62@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <075c9330-a9b5-1360-4447-71a4797553a9@gmail.com>
Date:   Wed, 30 Oct 2019 20:57:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bb3473ba-ddfc-2b51-4a75-c23c5bf3bc62@ti.com>
Content-Type: multipart/mixed;
 boundary="------------A18F7105DE67FD7CD77E8C5B"
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This is a multi-part message in MIME format.
--------------A18F7105DE67FD7CD77E8C5B
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Dan,

On 10/30/19 5:41 PM, Dan Murphy wrote:
> Hello
> 
> On 10/30/19 7:07 AM, kbuild test robot wrote:
>> Hi Dan,
>>
>> I love your patch! Yet something to improve:
>>
>> [auto build test ERROR on j.anaszewski-leds/for-next]
>> [also build test ERROR on v5.4-rc5 next-20191029]
> 
> I went to both these references and I do not see this patchset on either
> of these.

This branch is temporarily created by build bot by applying patch sets
from lists on top of linux-leds for-next branch.

>> [if your patch is applied to the wrong git tree, please drop us a note
>> to help
>> improve the system. BTW, we also suggest to use '--base' option to
>> specify the
>> base tree in git format-patch, please see
>> https://stackoverflow.com/a/37406982]
>>
>> url:   
>> https://github.com/0day-ci/linux/commits/Dan-Murphy/Multicolor-Framework/20191030-144320
>>
> It appears here though
>> base:  
>> https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git
>> for-next
> 
> Does not appear here
> 
> Finally not sure why the MIPS compiler is complaining about this but the
> ARM and x86 is not

Compilation breaks also for ARM.

This is not architecture specific but language specific thing.

If you enter this error message got Google you will get an answer
to why this happens in the first result.

You need to patch your driver with the attached one.

-- 
Best regards,
Jacek Anaszewski

--------------A18F7105DE67FD7CD77E8C5B
Content-Type: text/x-patch;
 name="fix_lp50xx_struct_initialization.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="fix_lp50xx_struct_initialization.patch"

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 76ca5cc1347c..52246565f15d 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -336,7 +336,7 @@ enum lp50xx_model {
  * @reset_reg: device reset register
  */
 struct lp50xx_chip_info {
-	const struct regmap_config lp50xx_regmap_config;
+	const struct regmap_config *lp50xx_regmap_config;
 	int model_id;
 	u8 max_modules;
 	u8 num_leds;
@@ -357,7 +357,7 @@ static const struct lp50xx_chip_info lp50xx_chip_info=
_tbl[] =3D {
 		.bank_brt_reg =3D LP5012_BNK_BRT,
 		.bank_mix_reg =3D LP5012_BNKA_CLR,
 		.reset_reg =3D LP5012_RESET,
-		.lp50xx_regmap_config =3D lp5012_regmap_config,
+		.lp50xx_regmap_config =3D &lp5012_regmap_config,
 	},
 	[LP5012] =3D {
 		.model_id =3D LP5012,
@@ -368,7 +368,7 @@ static const struct lp50xx_chip_info lp50xx_chip_info=
_tbl[] =3D {
 		.bank_brt_reg =3D LP5012_BNK_BRT,
 		.bank_mix_reg =3D LP5012_BNKA_CLR,
 		.reset_reg =3D LP5012_RESET,
-		.lp50xx_regmap_config =3D lp5012_regmap_config,
+		.lp50xx_regmap_config =3D &lp5012_regmap_config,
 	},
 	[LP5018] =3D {
 		.model_id =3D LP5018,
@@ -379,7 +379,7 @@ static const struct lp50xx_chip_info lp50xx_chip_info=
_tbl[] =3D {
 		.bank_brt_reg =3D LP5024_BNK_BRT,
 		.bank_mix_reg =3D LP5024_BNKA_CLR,
 		.reset_reg =3D LP5024_RESET,
-		.lp50xx_regmap_config =3D lp5024_regmap_config,
+		.lp50xx_regmap_config =3D &lp5024_regmap_config,
 	},
 	[LP5024] =3D {
 		.model_id =3D LP5024,
@@ -390,7 +390,7 @@ static const struct lp50xx_chip_info lp50xx_chip_info=
_tbl[] =3D {
 		.bank_brt_reg =3D LP5024_BNK_BRT,
 		.bank_mix_reg =3D LP5024_BNKA_CLR,
 		.reset_reg =3D LP5024_RESET,
-		.lp50xx_regmap_config =3D lp5024_regmap_config,
+		.lp50xx_regmap_config =3D &lp5024_regmap_config,
 	},
 	[LP5030] =3D {
 		.model_id =3D LP5030,
@@ -401,7 +401,7 @@ static const struct lp50xx_chip_info lp50xx_chip_info=
_tbl[] =3D {
 		.bank_brt_reg =3D LP5036_BNK_BRT,
 		.bank_mix_reg =3D LP5036_BNKA_CLR,
 		.reset_reg =3D LP5036_RESET,
-		.lp50xx_regmap_config =3D lp5036_regmap_config,
+		.lp50xx_regmap_config =3D &lp5036_regmap_config,
 	},
 	[LP5036] =3D {
 		.model_id =3D LP5036,
@@ -412,7 +412,7 @@ static const struct lp50xx_chip_info lp50xx_chip_info=
_tbl[] =3D {
 		.bank_brt_reg =3D LP5036_BNK_BRT,
 		.bank_mix_reg =3D LP5036_BNKA_CLR,
 		.reset_reg =3D LP5036_RESET,
-		.lp50xx_regmap_config =3D lp5036_regmap_config,
+		.lp50xx_regmap_config =3D &lp5036_regmap_config,
 	},
 };
=20
@@ -716,7 +716,7 @@ static int lp50xx_probe(struct i2c_client *client,
 	i2c_set_clientdata(client, led);
=20
 	led->regmap =3D devm_regmap_init_i2c(client,
-					&led->chip_info->lp50xx_regmap_config);
+					led->chip_info->lp50xx_regmap_config);
 	if (IS_ERR(led->regmap)) {
 		ret =3D PTR_ERR(led->regmap);
 		dev_err(&client->dev, "Failed to allocate register map: %d\n",

--------------A18F7105DE67FD7CD77E8C5B--
