Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04A896957A
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jul 2019 16:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390503AbfGOO6J (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Jul 2019 10:58:09 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:43121 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391312AbfGOO5q (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Jul 2019 10:57:46 -0400
Received: from orion.localdomain ([95.118.111.244]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MVeDq-1huptI1LbY-00RWI9; Mon, 15 Jul 2019 16:57:40 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        linux-leds@vger.kernel.org
Subject: [PATCH 6/6] leds: apu: add pr_fmt prefix for better log output
Date:   Mon, 15 Jul 2019 16:57:33 +0200
Message-Id: <1563202653-20994-7-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1563202653-20994-1-git-send-email-info@metux.net>
References: <1563202653-20994-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:dvNEXR3nJ5M7BCSfYoQdZovrfkqeX42wK8txoX2QiVsZw4v0ojD
 GvRCZvXyi/SWPv5kRIVAcaVKgoSoeOjSEYuqh1dhzbgRecDzho/8Whr2T1vlMZdCDZnPI80
 Lwkw2bRvZWrH3Wj8P8VB+YcI5+8BOxx1zZXEz1jtesdpQKiMqV+tvOOgKXRKRT80cw4zql6
 H1GTfXZUWAx09cYAlc+8A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TlIn6jNuJL4=:fUio/z846Lpvo5IOrKnzqR
 jPWd397kDHA/tygxIXWuBp9KC+X+ePX6NtDZjuCARpkVQ6Y2hZZcXCzkNnmSNH+fxToxze0eH
 jYhVeNsJVZw7RBT98rSoWYTeP8EvPl5tlLK51KxKPY4AELNqlHSxK7XIrKctRi0UK/be9C9+5
 CfQ0uyt/w19OBJaIsnm04QIgbf51ZD5NTqTSTTux/usZAA1c+hiH8P9QYutE6HkkeLuvfauh2
 BEeyg7VXSCi6E7xN+Pqpr/A1POREzDbPhhxxm9GpGgYR35aJBu/TJeMLXxmvIBZdCqFuUP930
 JXJr4KLZgXqkwiLp/MIwS1/jcvlsLtkVNvpV+lSpr9EuvC01en1Pu4ngFqBNy2U2bw9DlWgFf
 IdAeau8gG8HKX6l9Ub4WpMJQL7MhcrcHrUuZHofKH31On4sS9CUVbBDas9R/V7Etj0qEc5MBW
 y8Zd7qfL6It9qzcwTXSoGTtQgbj4R4aGevtsJxWBviKG0JV9+hQZ5+zMar2Y7fzi+eQVp5oON
 DL+NN5QRmGJ4csFRpRQEyja2VHzFPstPIAtAaWIt6+WtEQVr0xZ2FA98nRQ1Jgy12UYMVILMX
 i3INQEIn7kBkl3cCSbZz7E45eWBpEFFfwyt1j4Zjq6cuYjVLRnpgPSYVz6Tg+pvHWQZOWKTIK
 CYkcuT9Gbva8xJff9LT+zkFzr0augZdT0pPAi6Q3WqmsZZLTVvso9TvQ1OHAozaNoMfvY0aCg
 g0MM/bc4fC/4ik0QMpOx89PYQ+tIVfAYfbudWw==
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Define pr_fmt() macro for prefixing the module name to all
pr_*() outputs, in order to increase log message clarity.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/leds/leds-apu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/leds-apu.c b/drivers/leds/leds-apu.c
index 892fea7..fd8a41d 100644
--- a/drivers/leds/leds-apu.c
+++ b/drivers/leds/leds-apu.c
@@ -31,6 +31,8 @@
  * POSSIBILITY OF SUCH DAMAGE.
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/init.h>
-- 
1.9.1

