Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECCFB8FFD
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2019 14:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfITMul (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Sep 2019 08:50:41 -0400
Received: from mout.web.de ([212.227.15.14]:32841 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726223AbfITMul (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 20 Sep 2019 08:50:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1568983836;
        bh=kEx851ItGCqytQT37a7Mq3kVPSQnaFF1ENrLg9m1LCI=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=GC+hXvEkYtsEpokQhD/AKNHxFAva4d0maGXSd+TAUUvWqFPZDHjIcSgmML0vlDjHH
         ffLi3xiRDBfOXYOXGRHK2XmupJI0KVx2ZCZXof31rx0Nqk1FHkCylS63fzXwu+1I7m
         fjDgvCsxw8DrzRvNWFE4mPBnbfNeSNN/rCZzfNWg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.117.22]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lrrva-1i3y693aYw-013afw; Fri, 20
 Sep 2019 14:50:35 +0200
Subject: [PATCH v2] leds-bcm6358: Use devm_platform_ioremap_resource() in
 bcm6358_leds_probe()
To:     linux-leds@vger.kernel.org,
        =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
References: <b6ea044c-c483-0de6-67c5-5ea2fa3c85aa@web.de>
 <658bd05d-376d-adfd-64a5-e20f83d7b90a@gmail.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <45982431-f597-29fb-abef-fb2952296f39@web.de>
Date:   Fri, 20 Sep 2019 14:50:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <658bd05d-376d-adfd-64a5-e20f83d7b90a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CUtzK7SzSSzi+k31lRuFx8QcQXp8c3me6I2s0TfFdWYmIL7uUMv
 x7XmGKpX8hJW6//eg3hTrkOuHZk/Yv7Y8s0T2iQya//Oc5465VLlokk+CVu8NIq2rQw3/K5
 qu2b/8x1jFuflv9QUQirEK2Qp3tlWhyuLBuVSvClOWl8zEpEbKccgwLnfeB+uQFrRCbaLcH
 B2JbpQ1droi7O43l1rmLQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:J53LgZh2STs=:esznt7HvmkiY7U5arsmdof
 UCLq6lSQxOOdaWivhNOEXerTqqjhubaaDc6zteYfpEcx/qPIz8TZsY+hHLzndJS6oBXs2GDwN
 oCv2F7n1geNKEcchAydDidb4Zu331S6v1B13Wpoj4hKMQLb3nSIm9K5JPEHBP9IVIKPqRDUxX
 nDVGJVFPFh+iIiqxhKaj83qdaB5MJsJVy45apyazUOCrRuxrIBWbSZZr0qiyY7hN+z1CXHyiG
 3Mw7Y1K5gm3ZZpueCNdPGQ9QWOUPzAzK7f7spDPWN82aPjLpfBauDx96C831pV99ZfqKawwZH
 h3QznRKIBd9TNZioGzKIgO09FRewheXrx0iT6QaZJN3I5VYN8+BQ9wJadR+pnBhDqGJv3nj9f
 kJqUvP//LtqXdTheqXLdzJUwAF3vfQ43g9qumV77EWFooeVccdLrfGjwYyQOGL1FQ0g3uXTsS
 ONODnrAiPZgOnH7T2wiorH0Wbqz9nsOX3AgTd8Q+wBo8+XxNIYdeWwMiUqbRk1QMPwNAhqZtM
 RkRgW4NcZfx95YRT9pxVs+BMCX/nHfxmSclD1sfSJomYAAoLosR9hFkZGJuNTx7O0hFxgAkkc
 CBBjlvHdOY+x9XMK0Y83WbYxOmrxpF0k8lsCvBxmevTWq+IvOzf4w2JXcYhW74+B5umJAZ3Tq
 pt/j9ALV/2BSlYKLUXZ7q8cwZok9gp0VtqR8v3QqXETmjuzLXdO90zx+RcS6XP9pIOQCuwHOp
 PVWf7jxtpwqeqcAEz2TWUvghFne7aQsqwKS4ayJr2TflXlg+xCrqVmUc94CEQpPlCe+Vtz2zj
 nhVzg/mzSyrp/+SkjIdUuPEaXkJqdOK/xtlAot/2DBIGAXVZSXe6SYHMqwzQ6oKEgNYYxqc1w
 9dOaEpgOXk6Bm1RBO4lE0QYX5bRCkcEe+KdLf4mLvNbNd8oAcB5wMxuk68OhZIRyYyt0UoAfe
 Cmj9Prg5O8GAAqY2ZdTMfbLB+4S7HG/h/fq3DPMNp/RX+vHBNTb1I89lNAJWBqm2YQE7LItev
 LvHdopoXllzMMbHERCr2YQrPDsd+ZcSBeAQbsw9ps/l922EjCfOBJyr+ta1C9ofezwJzL8h5w
 ozDGq3bGYCb3n4ciB7Aneb+XC5iylPG6O1Ed6UsdYxc0g1EqUPynZegaSHrxV7CW63fvG1CDC
 wDwPD4wYqP+Eed6H7CRha4QMR28EBPa7tyYO0exx09NBwIOep5VXppBob61uMMT3nITkwptPb
 j06tFUId/HH7Uj0bscyRoxTMWouCBt1vPnrmlIVFX3NGkVCfWRpr5hPUfZd4=
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Sep 2019 14:44:06 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--


v2:
Jacek Anaszewski requested to split updates for two modules
into a separate patch for each driver.
https://lore.kernel.org/r/658bd05d-376d-adfd-64a5-e20f83d7b90a@gmail.com/


 drivers/leds/leds-bcm6358.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

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

