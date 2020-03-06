Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D207117BF48
	for <lists+linux-leds@lfdr.de>; Fri,  6 Mar 2020 14:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbgCFNkv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 6 Mar 2020 08:40:51 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:32824 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726887AbgCFNkv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 6 Mar 2020 08:40:51 -0500
Received: by mail-wm1-f66.google.com with SMTP id a25so9450373wmm.0
        for <linux-leds@vger.kernel.org>; Fri, 06 Mar 2020 05:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=E/6gF09OIYAAYDcV57fzVa8XqTwVQognyAPormZwLXA=;
        b=R6V+2BssLDKIwIQo4cQgyU6yIRe9UfLS08WujK48X+C7VGSQBAqjKnkarNeqwMCiMW
         jF639ahQFVkwlVgzDnqnNg/tMsGAKjbHvdd8ZDNi7aq0yqGE+R8Wbq5AIkgV6Qh56CBK
         hJQoYMXlT5pN9Q7KXn7NhRM2vVXqDXWiJs9LqNniwHRfE4L21K0nAfsYvkUpHJFcGavT
         iy9wOPPjefvBcoW8ZZ7gsApK+1vwUXCIb86rvjn7Ggk4FBawo/HlFNC9aN3i4Lbpwl6z
         9nmZw6CFGtsu1GNT15BqtJ9s9mUl4nbvEACcgfLIgj9NfxmQxkVcYy2caf29NzmLCeEE
         eMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=E/6gF09OIYAAYDcV57fzVa8XqTwVQognyAPormZwLXA=;
        b=NIZ6hg31UMGO/tb9U8EpJiNMlCEUT8H73H67ri6HlZRm7l9quMf7gCTIJK6FuFQwBd
         Czgt0b/uJ7p6UXNdHW2fFB5HpA8l0vTHQtJzVOQ59nbKL/Vi3qLa0v062gK32Oo8M1Xm
         iqCvA1EHJvDsRno8YZN/+0VfNIa6s88+Hfjvsh4QAJTRVkHUsJhlE34w3+rEjpg3Ha8W
         hIqZwaHLY0BOhskQW+JpFnWwxdj9E9cKpbMUE3ZqlbagYN+3JT33K5XaOlUWd28HiP2m
         4Zuyykek0ksmtiZqZ6aNuXOx1Y6v7suflxjlpD91dY7DGuLWV5w9sJLZ4faoRLU+I2Cd
         lRBg==
X-Gm-Message-State: ANhLgQ1pVroQDeybW5HtIqeSTCQ5q0kuxHX52drhEIFjwZlonTO97aWF
        /aJrUU8/von03Ni8HfiocTDbxQ==
X-Google-Smtp-Source: ADFU+vuUka/yk6YbdJy0yvjTDbB0XaMlyHi/ejIC+Xp7ZZ4NB0EVk8gIlOV2hfAqBcbExLEOdfhv7g==
X-Received: by 2002:a05:600c:230d:: with SMTP id 13mr4062292wmo.11.1583502049670;
        Fri, 06 Mar 2020 05:40:49 -0800 (PST)
Received: from localhost.localdomain (89-82-119-43.abo.bbox.fr. [89.82.119.43])
        by smtp.gmail.com with ESMTPSA id g7sm47178086wrm.72.2020.03.06.05.40.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 06 Mar 2020 05:40:49 -0800 (PST)
From:   Nicolas Belin <nbelin@baylibre.com>
To:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        devicetree@vger.kernel.org
Cc:     baylibre-upstreaming@groups.io, Nicolas Belin <nbelin@baylibre.com>
Subject: [PATCH v3 1/3] dt-bindings: Document shiji vendor-prefix
Date:   Fri,  6 Mar 2020 14:40:08 +0100
Message-Id: <1583502010-16210-2-git-send-email-nbelin@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583502010-16210-1-git-send-email-nbelin@baylibre.com>
References: <1583502010-16210-1-git-send-email-nbelin@baylibre.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Shenzhen Shiji Lighting Co.,Ltd is a LED manufacturer.

Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9e67944bec9c..a463286c3960 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -863,6 +863,8 @@ patternProperties:
     description: SGX Sensortech
   "^sharp,.*":
     description: Sharp Corporation
+  "^shiji,.*":
+    description: Shenzhen Shiji Lighting Co.,Ltd
   "^shimafuji,.*":
     description: Shimafuji Electric, Inc.
   "^si-en,.*":
-- 
2.7.4

