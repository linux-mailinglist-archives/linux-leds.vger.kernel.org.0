Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00A5F162380
	for <lists+linux-leds@lfdr.de>; Tue, 18 Feb 2020 10:38:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbgBRJiO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 18 Feb 2020 04:38:14 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36708 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgBRJiN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 18 Feb 2020 04:38:13 -0500
Received: by mail-wm1-f68.google.com with SMTP id p17so2087844wma.1
        for <linux-leds@vger.kernel.org>; Tue, 18 Feb 2020 01:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=E/6gF09OIYAAYDcV57fzVa8XqTwVQognyAPormZwLXA=;
        b=jkd8MtvSOtVnYifARU89XpBkdqANfqh7MXovx1YKhWkbdiEFirQ4AY8HjQbEX3y7YY
         GEJQ74pSQ0kmhgrj9hbZE0itGIgDUzjxwNZRV3UCA59KkI+T0411iaFtluDGem8FiiIH
         9qXvRlcoYKcpbAw72aInzprRqjTMUWKxQV4g0G1Nn4+MESXG5TwbvBgiy8qeoA3Jxmlv
         h5eImD3MuUy80shHsELOc/zQfVAw9ygS6cdKVQnkoroYvhqKb0YhEAHOZ0jya+22S694
         UZ+Jt5MisOcCZzCV9c2EiRYevgupCLgh3S3uFeBP0JwCsCTZpuJys1el1ucWIU3n9Klm
         Q1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=E/6gF09OIYAAYDcV57fzVa8XqTwVQognyAPormZwLXA=;
        b=hubH0wGCpITxJgr3rkR8CxX/7DKFETsNMlSBixiHzDa9dGMgymz0G3/F2rZdp25sSg
         etl1bpjvYwfpQ9YnXOD2Iw7eP+/vVXsyx+dIVVTJ9AxqRCiA3XnafTQ3DtEDO5LemfR6
         8zwSHMY1rdtkMOzJu7cx5YW9LhfUM+2//CMUoI54xfwddm2Cg8Ic+5sVexqDU7WpCLMe
         OBiK6k43+chQxDBqg06tXcDBr75I5IKFmZjz+ZUnl8tkQQnEWo1GRlA52xkhtr/LQ6X/
         E8mNb1S+Ofo7XXIiSLo5GromgKed40ulw33OC0DkSNWr1+rYQfkXUTCVdTqvFqK4lI7X
         jT9A==
X-Gm-Message-State: APjAAAXQFK6FyfT5i1RmBV1jwOaBs/8WnY5F2M/OPH2wAZsfKLqZldGn
        k1BkBMsrbeNCwYysSWVMARu8AA==
X-Google-Smtp-Source: APXvYqwssAl9cUC7VpPEbfIcYkeAkuUcIj4vu9Jjx1nRTtW9CHByLiZvJnz4DBWx2fM22AzNQnISNw==
X-Received: by 2002:a05:600c:d6:: with SMTP id u22mr2102284wmm.77.1582018691466;
        Tue, 18 Feb 2020 01:38:11 -0800 (PST)
Received: from nbelin-ThinkPad-T470p.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id f127sm2740626wma.4.2020.02.18.01.38.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 18 Feb 2020 01:38:10 -0800 (PST)
From:   Nicolas Belin <nbelin@baylibre.com>
To:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com
Cc:     Nicolas Belin <nbelin@baylibre.com>
Subject: [PATCH 1/3] dt-bindings: Document shiji vendor-prefix
Date:   Tue, 18 Feb 2020 10:37:35 +0100
Message-Id: <1582018657-5720-2-git-send-email-nbelin@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582018657-5720-1-git-send-email-nbelin@baylibre.com>
References: <1582018657-5720-1-git-send-email-nbelin@baylibre.com>
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

