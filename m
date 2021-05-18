Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8E64387C01
	for <lists+linux-leds@lfdr.de>; Tue, 18 May 2021 17:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344955AbhERPKd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 18 May 2021 11:10:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:49438 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243464AbhERPK2 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 18 May 2021 11:10:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F25B61360;
        Tue, 18 May 2021 15:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621350550;
        bh=cG8d0SVSR9AemukQMBOciLYjz3JmBKqR6Q8YNsgQ+pU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Zvq7IFzz55ZAepPag+foeRSI7S5lyllxIhf8LpyXdETrQPhxigTqxrJBqSRxBdxZH
         8yeDHst5qwEsgWkPSA6BrkwbrBL+RDI3k77senxvQatiiFjyUxlqA5mebVJFPP/l+r
         V/O+yy3b5SydNKoTA+n9MiWc3emFhaEBWNXNV6+hr7Tu4JufH85crllbgsv2DzflFX
         Fa77tXvxAuSS39E9ReBg6JzdqrgVxgWJHvKYJwptO9XLLt9A8g2xtHGdR6lCd7cfew
         hJ7dfz2G6PsL6uAy50fiBh2Wnf+Gkz47dJWw/EV/3QQe2C1LMiPitsHEvsc9a04fVZ
         ZNfRq8+SljN4g==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lj1LI-007HOc-FK; Tue, 18 May 2021 17:09:08 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: [PATCH v2 11/17] leds: leds-nuc: get rid of an unused variable
Date:   Tue, 18 May 2021 17:09:00 +0200
Message-Id: <f2469dbc2e9d590efdaeff46c8899ed9436985d2.1621349814.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621349813.git.mchehab+huawei@kernel.org>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

	drivers/staging/nuc-led/nuc-wmi.c: In function ‘nuc_nmi_cmd’:
	drivers/staging/nuc-led/nuc-wmi.c:242:6: warning: variable ‘size’ set but not used [-Wunused-but-set-variable]
	  242 |  int size, ret;
	      |      ^~~~

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/leds/leds-nuc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/leds-nuc.c b/drivers/leds/leds-nuc.c
index a5eb625d7b51..e2517e1a367f 100644
--- a/drivers/leds/leds-nuc.c
+++ b/drivers/leds/leds-nuc.c
@@ -239,7 +239,7 @@ static int nuc_nmi_cmd(struct device *dev,
 	struct acpi_buffer input;
 	union acpi_object *obj;
 	acpi_status status;
-	int size, ret;
+	int ret;
 	u8 *p;
 
 	input.length = NUM_INPUT_ARGS;
@@ -281,8 +281,6 @@ static int nuc_nmi_cmd(struct device *dev,
 		goto err;
 	}
 
-	size = NUM_OUTPUT_ARGS + 1;
-
 	if (output_args) {
 		memcpy(output_args, p + 1, NUM_OUTPUT_ARGS);
 
-- 
2.31.1

