Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9270B8FE2
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2019 14:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbfITMkd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Sep 2019 08:40:33 -0400
Received: from mout.web.de ([212.227.15.4]:50819 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726276AbfITMkd (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 20 Sep 2019 08:40:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1568983226;
        bh=ICllt23EDlAXp0ZD2T14az/Ixb5oynPLqxBTWxzBQOA=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=LIdeEt4UUUC5pdjjfA2+/Y2czYz3KAQqgcCTqaEuBB4BWTVRH7eVq6whFh8pGte0n
         3iNWkui4SNeb/ihrtFhgcfkbEFa5TMgCtWBr1RDSmLJDi3ZJ4drhJfx9OIkhuoiswr
         T1U4NvVaX0zvqeg57UqtCAIhiwQE5vg2h25i1YVM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.117.22]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MDxSJ-1iQT131OvP-00HNWp; Fri, 20
 Sep 2019 14:40:26 +0200
Subject: [PATCH v2] leds-bcm6328: Use devm_platform_ioremap_resource() in
 bcm6328_leds_probe()
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
Message-ID: <bd063a0e-d541-b95f-add1-90edde0acf50@web.de>
Date:   Fri, 20 Sep 2019 14:40:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <658bd05d-376d-adfd-64a5-e20f83d7b90a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RHnbqsOlm3xcH1RayjvghUe7cW515Z/Q+qe9QxCcwNz6+7fyQzk
 RbMnFVwK5wC/O92V4TOk2HUNedx5qlry6TeEHns3EANzUL1/WK0gha1HHHrJFV9KmVYz75y
 0gMJ1tDa50dvY1xy0C8SqlZB503maNHeYA2i5OtESnzPelU15n1R4I4njR5Mg4f9sx4HRnb
 pR6YJpOGSdA2bCVeJK4Lg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VNwMEYDc2Pk=:9uqeraGyMZ6/NMYDE5M5P0
 K2NZzLrww39WejQ7JjdGePxt/F0GBPemIHvziNZginE0d5qrUOcT9OCnoXPskwhY6bhc96nnw
 Tw1yWVnXJB9Ildfy3xxxy71UMQsh4lRMGmcJT2N6r2ZS9E/vtcYWb7+EkEMP5dnBopl4ygTrN
 Iac3QjwJaB2sOtz2AnWGWxqCwBF5Upna/f5jLSFP4W4z8F4HM5B822KL7ufE3Vm/15zMcoAGr
 LZWJ2AqToPezeSPDTt/cWyYnvfgfHfL8jPJY1yoMfY7ZWHs1+t07e1d0dxhBOBQ/Cn1iNDfEE
 vJzL52wC4NVs/5zlMX6hQ9X6ge+GwXVlInPUgJmsqgkFX68sqJW59hPUmerM88CP0fPFkA6mE
 3ATzby0VydlM5PGDUJUtkHiO9JskFhmtjeuUdEGKlR65a7sH+cisg3gqzx+W3pwqAULmEgmcP
 n59aUDF7sS/4Bdmg1+ruI4D3+jSIHhF4mXGx3xJ09HjxjW/fyxTEqbMAxX/mR0/hA2crkYwYO
 JT2pzNF2GhZeLvw/cZFbmOz0gX4SGaZEM4EZAFwKlZI70ow8XxHqLR2UZdXCf8ViiT1KG1YtW
 R+blkw70JEUUJ718fCPYcMo/cQTCn8ZUUyr2C5gqUkd7Nm5lw7/PVjM08V1GUxfnwgADpy3UB
 Zd0ILxnSQpxAlNIbGww/kbHM+kL/hrhCU8IXBkOmnebqOSJrrlq+zbGYTgIb3ANM7ovw4Wrwv
 o8/ntBeN1SWvont/Fc5fWW641H/97uJ+fccMXDMKNvaUwAl3W2aSdCwA3xNZ9vXDLFOx+NWar
 CH5hu5IuYLNkuz6FouSRDhvzjkapWcNP7EX8lFKTjaGQYDm2DVUg1CYfMUJvXze7aSju9k0RY
 wiDBNm3eGIpuIUqJGGm8Vz2ZwKzNYO+yymGkhXHnMp8NWeG9iR0TcCc2JfY8Ug56xoUEMvZbW
 A87Dnr+qYzB+gEp8FLbS/fLonKU7erSJEAFVvlmGZop0NkNPfYx8YKd0eYbXFftj4SRwGzrT0
 B/FivRPZIelfy4THS7eGcAozGPzEgVZFSwaJoUz4aRM2qhhHJP166erkwXCKvkAPafhppLyfh
 aRco4M/A+60HuiteF30dkXU+MY/BNfx7oVNEZvoAcRrd7u0pAhbFHB9Hq5XblZL6JZwVOO3UN
 nsmwMj3dPm7WWC8KXEUFuYM322vQKirRp1GYvlIUFPh0fo1VV2VoK2grr8A6GT9PbGZcqnMXX
 cCele0tkF98350QasKxitECejKIHeLFIi319TjelJDIeC9XKJ+3Id0w9o2X0=
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Sep 2019 14:30:31 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--


v2:

Jacek Anaszewski requested to split updates for two modules

into a separate patch for each driver.

https://lore.kernel.org/r/658bd05d-376d-adfd-64a5-e20f83d7b90a@gmail.com/



 drivers/leds/leds-bcm6328.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

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

=2D-
2.23.0

