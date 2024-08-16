Return-Path: <linux-leds+bounces-2445-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF51954DAE
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 17:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE1D7B2170F
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 15:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84631BDA93;
	Fri, 16 Aug 2024 15:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DJ5a4QOX"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3451DDF5
	for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 15:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723822318; cv=none; b=JW8WCbYsC8KV564i0m5Uxc3oF+e+nMQfZv7dc5ysCPQxecTywUH3KmmqqsnX7cbOFfWjHWXgnrlpVxSDQOvATiQSQ8c/Zf7gVb3BkwhzGmzn3b5sHVJyDyzHNq11TdabJ/Q/aMU6eF1ydPh8dBdjtRBqh4/6BBU6XQAK3Azjl+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723822318; c=relaxed/simple;
	bh=vPETBZPAFSUrChmKOPA1zhCE04APeQPcK73ZidPqOh0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u6+IrMtHuuh7933Xw0AfS7oIppEoRl9uSzX3kshrQuGSjm4S1qmxhkuthMmS9unBq+GHWlZqOwo/LZtbYmZb+Qrg8e4zc+c0mVmWWsCzW7zNoyfFfrznw7Dbw5588vRVZLHBtBQfPly2Sq88gM2J2mkjyZntaKloTbBB0CnpWUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DJ5a4QOX; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3717ff2358eso1125658f8f.1
        for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 08:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822314; x=1724427114; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MHQ6C9YAPTB9bZgAEs3xu71MVSTPq6FS5mdvsNvOcFw=;
        b=DJ5a4QOX3D//+Lfb5SdqTLB1OAYJEt5zBcELdfea5ckJJs0rBNZgjz0peOXVTHds/y
         x1T+ZEiSNMhoK7YA7LjKjtkpBtPGqo3h/rJzVkRvaJTkexaXsLn8yoQMC9BAF9u0l7YK
         mOmG9ICohRhUgubqRDSrJJ/KC3GMt+Hn8OKlYR+wHIZnbOxP8wWcw+HXyQ03GdO/hEgt
         DZGQ3bkBOHAkbGUTUFcblb9kRD1I5kwVJz6MTFS9MUorEma1TzG5Ua6TF24S6RVwhcpY
         EfgZxs9I7qpoqaGvSslabJli0MkUnxrTdgxWwcGTTRdS4tR3QwBzgxpPHI31v8hmkoYP
         6g7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822314; x=1724427114;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHQ6C9YAPTB9bZgAEs3xu71MVSTPq6FS5mdvsNvOcFw=;
        b=R+XpxAQZi7CWqCgII/gKJWUgZ9I45h+R/RZOveM9jfWqqpEwN6ZJF7M1Us8V0RfKBY
         nAOMd8I+kTUIFhLOp1C9jbXnOWu0KK3g/6KQ/dv+179Q26WsXyzugBZuM2ltESB8m9/h
         paeuw46OUeI2OzM0ax7hvauHJw6jbU5k75HruA8nli5hj8kv/o8VE6+EHj4mp1WXfe5U
         UrmWWeas10WtOFs95y+QnrcXnk8PfaE+gkTlZ/7Jfg2mS6R/LjXKN8lNPygCbFNtZm3c
         62i56atkMotU9m4vVJL6qGYWjWVJKsseDgbdDrqRWXxb5rRcCDVqZMECCjWY29mfcfpl
         y/CA==
X-Gm-Message-State: AOJu0Yz8y7a27wic1Bru9qyXsGmOktihbnjlMfiIoadL2Ufs2fK1Cwad
	1IIR7cBuegWWEkHsRT6bQ92CNlFVvi/qYtKUWQEcyh2fO/l9+mMbhFofO70Y/mU=
X-Google-Smtp-Source: AGHT+IEJXIL/v689+CCwET62EtuJhvPdXX0bjxeXiDpExl+dQXshRR93P6h1RVyaR5NPA9hqYGuwQQ==
X-Received: by 2002:adf:f80e:0:b0:371:82ec:206e with SMTP id ffacd0b85a97d-37194314e2cmr2149706f8f.5.1723822314242;
        Fri, 16 Aug 2024 08:31:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:31:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/17] leds: Use scoped device node handling to simplify
 error paths
Date: Fri, 16 Aug 2024 17:31:32 +0200
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANRwv2YC/x3MQQrDIBBG4auEWXdARUrpVUoWQ/ytA0VFk1AIu
 Xsky2/x3kEdTdHpPR3UsGvXkgfsY6IlSf6CNQyTM86bl33y8oPkrXLiEjmXAK7byrs0hvcuuiB
 WYGn0tSHq/35/5vO8ADzhSsRrAAAA
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Riku Voipio <riku.voipio@iki.fi>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2458;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vPETBZPAFSUrChmKOPA1zhCE04APeQPcK73ZidPqOh0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3DWkLz00DPYD8biGX01dG1yR9zLzcUK7/uv6
 6afN8fm09yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w1gAKCRDBN2bmhouD
 197FEACbc85PRN3+9lFao/L3mAVNDQNRS/WrqRBp38LHkAnWKc7LRgi5nYg5KB1EFA5h8jdqAip
 wQu5JfN0Uq6UVg2pni9gYeAd+u0b2ixjIpXBbU0aCIc2KHYzvRI+9pOqdi/2DAU75yq6uqTdkJz
 A1jyUxXiCXUbuA+O00JBPquyPzDSdxAi2jFBr87A1F8FhkSNlVWJNC8FRrYBsFgHPM/ERUA5cvr
 H2U9FWuVB0OoxIrFXoxu4JjXrg8kXvY0k6gp7B88QA8GdoLD9QGNWVDdB2/NB1pBxZJX8Pf3+N/
 7L9qQCYj0SqGuPxCDYrbOUt/ntOfqWSw5I4uAwl6jMtgoIhe5VFJnhMujghF8e0UqW32nr2kk+i
 Psdzb61R1XKtHmsE5h5/CUp+EU5mm0K1NolzVKiPfu3P7IBVeOzWHxnWScFcpyrQqSEfY4Dsdjx
 eZKnmL2+dYljL/kl5mpO6jS3ltK/EOv85b2MzeRq4kgO7r9636O2Rxepa+QvKRcgq9tImKDuDst
 YCj14VVhOERncMmEmSoBrqGVTKuMKLBPYaeG+CAyd6fObIt3srxCVN0e6JPBB3+pPibLOU/Icay
 ybDu8w6Go/RZ4uzbeWWhTJpkof0ZfxuBxuqvQvwR+aNNZi6VrmD53WIbbNqiBqP6OjWp1PQnUbG
 0Lkw1H+khOJc1Zg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Hi,

Make code a bit smaller/simpler, with less of_node_put() thanks to
cleanup.h.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (17):
      leds: aat1290: Use scoped device node handling to simplify error paths
      leds: ktd2692: Use scoped device node handling to simplify error paths
      leds: max77693: add missing of_node_get for probe duration
      leds: max77693: Simplify with scoped for each OF child loop
      leds: 88pm860x: Simplify with scoped for each OF child loop
      leds: aw2013: Simplify with scoped for each OF child loop
      leds: bcm6328: Simplify with scoped for each OF child loop
      leds: bcm6358: Simplify with scoped for each OF child loop
      leds: is31fl32xx: Simplify with scoped for each OF child loop
      leds: lp55xx: Simplify with scoped for each OF child loop
      leds: mc13783: Use scoped device node handling to simplify error paths
      leds: mt6323: Simplify with scoped for each OF child loop
      leds: netxbig: Simplify with scoped for each OF child loop
      leds: pca9532: Simplify with scoped for each OF child loop
      leds: sc27xx: Simplify with scoped for each OF child loop
      leds: turris-omnia: Simplify with scoped for each OF child loop
      leds: qcom-lpg: Simplify with scoped for each OF child loop

 drivers/leds/flash/leds-aat1290.c  | 14 ++++++--------
 drivers/leds/flash/leds-ktd2692.c  | 15 +++++++--------
 drivers/leds/flash/leds-max77693.c | 20 ++++++++++----------
 drivers/leds/leds-88pm860x.c       |  5 ++---
 drivers/leds/leds-aw2013.c         |  8 +++-----
 drivers/leds/leds-bcm6328.c        |  7 ++-----
 drivers/leds/leds-bcm6358.c        |  7 ++-----
 drivers/leds/leds-is31fl32xx.c     | 14 ++++----------
 drivers/leds/leds-lp55xx-common.c  |  7 ++-----
 drivers/leds/leds-mc13783.c        | 24 +++++++++++-------------
 drivers/leds/leds-mt6323.c         | 22 +++++++---------------
 drivers/leds/leds-netxbig.c        | 19 ++++++++-----------
 drivers/leds/leds-pca9532.c        |  7 ++-----
 drivers/leds/leds-sc27xx-bltc.c    | 12 ++++--------
 drivers/leds/leds-turris-omnia.c   |  8 +++-----
 drivers/leds/rgb/leds-qcom-lpg.c   | 14 ++++----------
 16 files changed, 77 insertions(+), 126 deletions(-)
---
base-commit: 2d9e88b1a66c6b9a76fb16141ad3c6fb59334c5a
change-id: 20240816-cleanup-h-of-node-put-var-e442f2da1ae1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


