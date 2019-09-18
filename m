Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C13AB5FA2
	for <lists+linux-leds@lfdr.de>; Wed, 18 Sep 2019 10:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729852AbfIRIz2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Sep 2019 04:55:28 -0400
Received: from mout.web.de ([212.227.15.4]:39729 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726668AbfIRIz2 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 18 Sep 2019 04:55:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1568796920;
        bh=7/OQ+XltJv/3aXWwazfLOWyM4nT1ikjlKnPKnIpmHAU=;
        h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
        b=I5kNRVVqiHdlOj3H6FFQeTMduXIAggenhgcMUEaD1ioi1+giPO1xN9PbE6gR/3zQ2
         KJIMM6+heKvu8nEZBpQf+L8ADCtzkFn2IjBpv4QwFCDzExbRmdWhnrGIeDKgHCbHX2
         Lj8E27oF7e1w1igPJI2V/Z8mxyvQopHIRbMomzPI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.2.101]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MZDQ4-1iVLym1JbI-00Kwcl; Wed, 18
 Sep 2019 10:55:20 +0200
To:     linux-leds@vger.kernel.org,
        =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] leds-bcm63xx: Use devm_platform_ioremap_resource() in two
 functions
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Himanshu Jha <himanshujha199640@gmail.com>
Message-ID: <b6ea044c-c483-0de6-67c5-5ea2fa3c85aa@web.de>
Date:   Wed, 18 Sep 2019 10:55:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Y+aBfW9ZYyUwQjioj2Z7wFpVdYoElkY7MOMjMZlll6+9gwgKKgI
 7PWVvkOMBnuWIQ7z9aeGnktK3lgjOene7Hh4i8zh9FfBSPc+lRlDtuL5gR3ZpCHk0EYjK4b
 6wZMnv1dnYpFtfCnDjSysDpbnp6i1bp/vyldNB1NX1M2pJZ3m2aN7v7trVJ8ERlERwmfvFs
 SgVN0rsWPmfaVXvLDMuvw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:btnyV+iT59M=:SEirhLHtu7I2nfFTK9JFgY
 2M316sk5CBSSPW6ah2YPEHacCO1aNXwLzzvsozpWk4+9yRI1QoogncggSgBO5jxn3g/oyQnhA
 pFkc90lYryJpzXAeEOLDb8UTOWs+5IFsqSIcRbHXf03c+Sdt4OoPy6p1JtKoJHFAVfenWiwuL
 5zm5beZam6GNRAQEFQM3KWkmG/jZTttdYYtPtbr7+1eU6XTUf5xvDkkS4NCwhqlu4FCOhtwCc
 MG3lfY9RYfXcaTogdznTfprH/4gXFKz2fXS90N5HoQG5DqZngz7n1rMtvzoZqtaW2QrAtuUP2
 WVhps5Zs4cDYg+Zx9007IsLP6GlG+JXSKiklM5e8QIMJIGOxQqZTENvN1IOAFp3xU7eJqUglu
 4JvULV5CC7maDQKh1wI8Z3PHqB8FhoY/loFTThpqLdTIXJtzBxuBZVZrBAiJ7uyVXmMew2fMk
 TKYlvKHLWGSwXZ6puZpTSp8UcB9CpFo3mEXgpXgziPnG7JLQALAz6E9trg0D8zAkgtAxZYm1g
 JfjsOK3zzWGlwBAiVbnJZdKCC2vwMze4SdeaY+hx9wLQ/ybAZzC2FGAR7agnSP3GqNCc7xRrp
 m6WeD73LIaCR3AwZ0i0ZCp/1yMPMp+VqWzLSNejP0Qu7yPOk4kvAZGv6V6f/k4QJM+KbW3elE
 kXRCbsY0lAZ7U1bbDtbBFprRxMdfp2OEySdB888GYfZAj9rJGFD07rN5f4+GbVcsJqfVnhnAP
 EWk/LMTV/BC2L99mr03TapQWlYjKImlOwPX9MPX4Eb/LSkHrtHbs0QB6IYDZeS3MGxjfSMwGs
 5xgYoqU6Dt6/4f75F+zsZEPMOaO73r0sIe/a6cyZNeQkQ5Qq3WDg/FJFs3rhc9+Ybg68376Y3
 hsLjjkImEuigabPkimsqkEV2fgAxSJpLzqgmD7v4LRQjKhEMsTZzy1y1slkn+qiVf4SvC5wsj
 nthEN5T+gW1+M8XCxmAZ4a7v1AclZW+Pp5dJwhEylQsMvknLgnbY72qAQcthU33vZ42XzJOxT
 iYER574KPw9S8ugF1uyqVYG5/UXmv4mk4+4e4LimjnlgylA2XK+xjroxNgPZGWl+yqIVo1war
 Vg4hzO03pzO2txu7krpTXdxMJivhpdzzI2FUzbWNmQUBxz78BfaL+G9QKqd4bM0x7sGbV0sg2
 AtpM+NXYGrnS90u7lElbCmKfSv+/cIrArGeedt/Rd5X3WR2LUCWstZ5JJj9FZJUyuk+CqYEto
 5oIU2gUzgW3xU+FSjMCrstzw3Y1yRYpXrRsaEU+bwrHANB4VTaTnCJ0Un0aU=
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2019 10:45:24 +0200

Simplify these function implementations by using a known function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/leds/leds-bcm6328.c | 7 +------
 drivers/leds/leds-bcm6358.c | 7 +------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index c50d34e2b098..42e1b7598c3a 100644
=2D-- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -346,16 +346,11 @@ static int bcm6328_leds_probe(struct platform_device=
 *pdev)
 	struct device *dev =3D &pdev->dev;
 	struct device_node *np =3D pdev->dev.of_node;
 	struct device_node *child;
-	struct resource *mem_r;
 	void __iomem *mem;
 	spinlock_t *lock; /* memory lock */
 	unsigned long val, *blink_leds, *blink_delay;

-	mem_r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!mem_r)
-		return -EINVAL;
-
-	mem =3D devm_ioremap_resource(dev, mem_r);
+	mem =3D devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mem))
 		return PTR_ERR(mem);

diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
index aec285fd21c0..94fefd456ba0 100644
=2D-- a/drivers/leds/leds-bcm6358.c
+++ b/drivers/leds/leds-bcm6358.c
@@ -151,17 +151,12 @@ static int bcm6358_leds_probe(struct platform_device=
 *pdev)
 	struct device *dev =3D &pdev->dev;
 	struct device_node *np =3D pdev->dev.of_node;
 	struct device_node *child;
-	struct resource *mem_r;
 	void __iomem *mem;
 	spinlock_t *lock; /* memory lock */
 	unsigned long val;
 	u32 clk_div;

-	mem_r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!mem_r)
-		return -EINVAL;
-
-	mem =3D devm_ioremap_resource(dev, mem_r);
+	mem =3D devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mem))
 		return PTR_ERR(mem);

=2D-
2.23.0

