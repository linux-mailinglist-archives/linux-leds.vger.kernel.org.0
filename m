Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D84F71F8179
	for <lists+linux-leds@lfdr.de>; Sat, 13 Jun 2020 09:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbgFMHPM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 13 Jun 2020 03:15:12 -0400
Received: from mout.web.de ([217.72.192.78]:43509 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725771AbgFMHPL (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 13 Jun 2020 03:15:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1592032507;
        bh=Wn0TcJTLOvcMCPEK0H61Ng8tSXPjgw06CRztlul9HKo=;
        h=X-UI-Sender-Class:From:Subject:To:Cc:Date;
        b=bMrg8eeYkser4/x1cFQV/q35xFajUAEGH/KM5iZOOzbmte+2VB0QnhVznqY1bSfjn
         iGVEX6pvRexru1omIVZ2ArGsKY2aioKyphzDoKduTZtxDrPRqLyu3feG7s76bvvOHb
         6c9X0pHPLqUkwTZ0a+Yzo9UEAQApKxAzHQMEigrQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.53.180]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LnSGg-1jGxwy3QUA-00hc6l; Sat, 13
 Jun 2020 09:15:06 +0200
From:   Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] leds: trigger: gpio: Avoid warning on update of inverted
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <d560d3eb-774d-8d9f-a8e3-09c371fc03eb@web.de>
Date:   Sat, 13 Jun 2020 09:15:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xpFqAP5WXe8SS1xh8j9G22FYOD9O4fTL1TMljsgwhIjz8vxjFmS
 iF+JildECzoCaCSVZANky5fD9L2T4VUbh6CPYtFhLd5xoU8d6kQWLKKoVEtyzrIPCOmSPD7
 bjRZCvXPziOPZ3y9rU1kH9/msl/LeGAw3RdaG4SHrNz1pc8uOaJY1lI1m0uJ8waVdORP6V/
 lhXN7E9O4cDZaO8Oppvbg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:psmXihd+lFI=:w9UwbDep2d5jJg9nCxOwh5
 NMC/5LBDiltF6VKBWcoydKzIgIgBdDuT56fA5AERaD9MenE96yotNQlnuFn6f6heuUCQImXHa
 W2H9RMYYj9nQCfOyVuDv/GxK37eQdgi69sq2MN1+wlP2lMwgxYdOepUhlCqwDfOH5aTfv+uyc
 4qTsB4Vi69QlkaiT87kDUnZ46/TfrDxOnKrYFg3tgyoTPBpZ4kpihsg/X+kFxVf9Qc3V7ELCb
 dgEAUUMRjOyGt1DfJjm1AwoKyKi3Oh61cslJgQdlcM+9gnfUW+CPaoB86eeCOfKicunsXNRKd
 YHzjXstJ/PdU39T3sF+2WW4EQ7YB/2HbU5Clqw9YDaQxcIhCYOcnypTs0WGe523t2XGYuNqZW
 XGP7lUrN52vpDJVUGevzNU1spCHO2nqu/gzQnxeo69G8XAdcLYZrOnGaSY4zfQyh53HZCDsl+
 HZd+rljSP39gc9yKT3EN5SIu7BrQbkYvBZ7/0j8h8w/lXci6aQPdWkS44EvdQTWB7EqXACTpR
 zEp/LGnfhjQ+A+lJLoOI1qw9r4bwxlsNhY7fy8vsRnNaRBRef0Cog4ZEG5QpQYQH0Huo7KBey
 DRZq2c2uXGbFI8Oa3V/t5c5sfDoEe/fXlYIbX3i4Jy0ld2gkVq4hhItIKjFroDUvDa3o0C0qx
 uvV52ncLDUTi3O1C5VXnCjFJHH+IpWXkXTw32/yO4idpo52F93NimnnUQ6qo6cBBJae/eGhtG
 /xAZQTe8kbci/y9aiUqqxoXvkNfq70U/Dq1NSNf6KAEHPCW0nqq3wby6pAT1LSzbX83NWLU0O
 nLtsMAHLbnu/LHSVzUY75G6d8g6tVJku3mikGqojpA4i/lQXBkOBxqo7tLgDWdzxQrDFvDJVE
 P5UvlUW51ayRv2uiOk6nuiAW6Z2YRXecZTKRvv6Q3YujNZs4oyQiUL4LcaRHKRJUPzqZdX6Ql
 j/RriK35fMsDZ4IHeGKnlcBKgt/+/iM0XURWOrcviQ3I/ER3EHHX8f2w1zFryxQRa4O9wbEBv
 isN9oUEDNaM5FlNDwHJXk5X/DhktHn+f1gvmUPyloUG38eAd4vSlMq8UPEUQkPxtUCNDFspa9
 GHG5o8rJ5ctRXcOMLVH0Idhn7FsEo4SRL7GFfd24Wk79rgTT6bpD6cGomdAJD3WX1jErH6V/g
 oDE6nLrFsFR0gqEpaJbD2mqcsN6LmIP7SRsUyUlfB5fGZbb9AECauLL51RCtR/0KdLKnqviUB
 5/CWZ3v+sDdX797KE
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Jan Kiszka <jan.kiszka@siemens.com>

If the GPIO has not been configured yet, writing to inverted will raise
a kernel warning.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
=2D--
 drivers/leds/trigger/ledtrig-gpio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-gpio.c b/drivers/leds/trigger/le=
dtrig-gpio.c
index dc64679b1a92..0120faa3dafa 100644
=2D-- a/drivers/leds/trigger/ledtrig-gpio.c
+++ b/drivers/leds/trigger/ledtrig-gpio.c
@@ -99,7 +99,8 @@ static ssize_t gpio_trig_inverted_store(struct device *d=
ev,
 	gpio_data->inverted =3D inverted;

 	/* After inverting, we need to update the LED. */
-	gpio_trig_irq(0, led);
+	if (gpio_is_valid(gpio_data->gpio))
+		gpio_trig_irq(0, led);

 	return n;
 }
=2D-
2.26.2
