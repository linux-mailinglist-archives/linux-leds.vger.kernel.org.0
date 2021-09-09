Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 874A9405EDC
	for <lists+linux-leds@lfdr.de>; Thu,  9 Sep 2021 23:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347518AbhIIVcl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 17:32:41 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:45030 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347384AbhIIVch (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 17:32:37 -0400
Received: by mail-oi1-f178.google.com with SMTP id c79so4429583oib.11;
        Thu, 09 Sep 2021 14:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S09DONJ4lcwRKCzXlF4Hu+KGIQds8gxD/iFwoouakjk=;
        b=zv52TAuLY8S0oQZzQV6FbojrTw63wKFO/yPK6wJNZEYu/kwVWU61swxNVwbLqcvZ+o
         mNTehG6/TBsRDRSiyUCVZKo/f1w3AQtq3vozJvOxSVGD/VfM6ysNYbhFBX+80G6ISqh4
         j5MC8/vamP+sznn9YcPZZ3DHQ4gPaV9tLcOI4GAsD8R3fk9R1CqggAYDdZWkYxQQIQmz
         qx5+6RY+bPMoMrm2ioy/7+mstOA0oGqx9baLEhYXan+BSBxRBmMReSi6Ba1etbuV0FXd
         60zHvJDQE3HqDPwjW8FsXPJ5GzsPT6RO8rqRvkJli3xXj+YGd4N4cgNszAghoGIdzE3J
         OJpw==
X-Gm-Message-State: AOAM530ie/UxwX3E5YpRy3Xnn7MRNwmZuEGmm0jPb/B6zpHQW0liNQTO
        7xqgcCSd1Wf0mIfJkG0JWYbRinvukQ==
X-Google-Smtp-Source: ABdhPJyYiumRzyOgSV4gb40juvqihQ9IVjd3+b/5xi5YfdPHOCxPG3qmDS2NB/suNl/6nDWyD/Mv0g==
X-Received: by 2002:a05:6808:1414:: with SMTP id w20mr1521659oiv.17.1631223087014;
        Thu, 09 Sep 2021 14:31:27 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id m24sm694929oie.50.2021.09.09.14.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 14:31:26 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH 5/8] clk: versatile: clk-icst: Support 'reg' in addition to 'vco-offset' for register address
Date:   Thu,  9 Sep 2021 16:31:15 -0500
Message-Id: <20210909213118.1087083-6-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909213118.1087083-1-robh@kernel.org>
References: <20210909213118.1087083-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The ICST binding now also supports 'reg' in addition to 'vco-offset' for
the VCO register address. Add support to the driver to get the VCO
address from 'reg'.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/clk/versatile/clk-icst.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/versatile/clk-icst.c b/drivers/clk/versatile/clk-icst.c
index fdd6aa3cb1fc..77fd0ecaf155 100644
--- a/drivers/clk/versatile/clk-icst.c
+++ b/drivers/clk/versatile/clk-icst.c
@@ -501,7 +501,8 @@ static void __init of_syscon_icst_setup(struct device_node *np)
 		return;
 	}
 
-	if (of_property_read_u32(np, "vco-offset", &icst_desc.vco_offset)) {
+	if (of_property_read_u32(np, "reg", &icst_desc.vco_offset) &&
+	    of_property_read_u32(np, "vco-offset", &icst_desc.vco_offset)) {
 		pr_err("no VCO register offset for ICST clock\n");
 		return;
 	}
-- 
2.30.2

