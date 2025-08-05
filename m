Return-Path: <linux-leds+bounces-5200-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D99AB1B420
	for <lists+linux-leds@lfdr.de>; Tue,  5 Aug 2025 15:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6A5F18A2287
	for <lists+linux-leds@lfdr.de>; Tue,  5 Aug 2025 13:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541A2274656;
	Tue,  5 Aug 2025 13:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7GxOmVS"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2875A2B9B7;
	Tue,  5 Aug 2025 13:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754399393; cv=none; b=FfjQTXDPHvpIzN6jtgTjtX+VBZgCpenDLkpKLyD0zeE/mZZqsN4kImqEF6qMGp3iRNAzWrzhwIacY4+35OeFOA/DVgMdcFr+sOyDe6cXPcoPczUrhWVJn8Mo5TiHiW1N25nO/6U+Kc2NgQCD69o6wo1pLY/bBAHezHZTeu302h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754399393; c=relaxed/simple;
	bh=t+sWXRf3aOSnZSbG3popf7O5jm6HgLRtEitNREh/jGw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BDgjvKA0qbXOHJrZENH1MgxOX9hacXwAsjTLlhIa/zYWDFhLHbvjR5qLgrorOys84V9h7VHqELGKbzaAKcfh6QcEZn8WZMdgiseNSwcoreAdPcpILi2cXh07uC2prEuro37PXRV28yGJlbxVec6bgvhYqOy41X0/H6h6gjj78jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L7GxOmVS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF6AC4CEF7;
	Tue,  5 Aug 2025 13:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754399392;
	bh=t+sWXRf3aOSnZSbG3popf7O5jm6HgLRtEitNREh/jGw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L7GxOmVS8S0MzIgrznfFnygm96KdNeQwAUQRk/7VZDTvP4h/ZhjQgR5EbhSVP+BVx
	 2jwpIigAKCY9T2h6sNpHIm7bEOvEoGG6uYzv6TQO3SBTQScNR/jGp+plsIzZm98GML
	 keLAJNJwth/t8zH1+Fewy3ptl2MOMSYtVmpHeJePSbjsjTXwhyqAhV/imcs+HgXFJM
	 133mEwVztdZQLkxxyzcAbNQAKOs+32vcQopllMZVzC6xoAttJ5wJkiVarLtwWQP+OB
	 kOj456A6wbtZCjqIlBNg22qfKsykVIXQdRc+pDtTv90Sg3qCJEoTuEs7B7r9B0lOrO
	 IvEGd2VWh7MMw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Johan Adolfsson <johan.adolfsson@axis.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	pavel@kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-5.10] leds: leds-lp50xx: Handle reg to get correct multi_index
Date: Tue,  5 Aug 2025 09:08:38 -0400
Message-Id: <20250805130945.471732-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250805130945.471732-1-sashal@kernel.org>
References: <20250805130945.471732-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit

From: Johan Adolfsson <johan.adolfsson@axis.com>

[ Upstream commit 2e84a5e5374232e6f356ce5c079a5658d7e4af2c ]

mc_subled used for multi_index needs well defined array indexes,
to guarantee the desired result, use reg for that.

If devicetree child nodes is processed in random or reverse order
you may end up with multi_index "blue green red" instead of the expected
"red green blue".
If user space apps uses multi_index to deduce how to control the leds
they would most likely be broken without this patch if devicetree
processing is reversed (which it appears to be).

arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts has reg set
but I don't see how it can have worked without this change.

If reg is not set, an error is returned,
If reg is out of range, an error is returned.
reg within led child nodes starts with 0, to map to the iout in each bank.

Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Link: https://lore.kernel.org/r/20250617-led-fix-v7-1-cdbe8efc88fa@axis.com
Signed-off-by: Lee Jones <lee@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit is a clear candidate for backporting to stable kernel trees.
Here's my extensive analysis:

## Bug Fix Nature

The commit fixes a **real bug** where LED ordering could be incorrect
when device tree child nodes are processed in random or reverse order.
Looking at the code changes:

1. **Before the fix** (line 487 in original):
  ```c
  mc_led_info[num_colors].color_index = color_id;
  ```
  The code was using `num_colors` as the array index, which simply
  increments for each LED found, regardless of the intended order.

2. **After the fix**:
  ```c
  mc_led_info[multi_index].color_index = color_id;
  ```
  The code now correctly uses the `reg` property value as the index,
  ensuring deterministic LED ordering.

## Impact on Users

This bug has **significant user-visible impact**:
- User space applications relying on `multi_index` to control LEDs would
  break if device tree processing order changes
- The commit message explicitly states: "If user space apps uses
  multi_index to deduce how to control the leds they would most likely
  be broken"
- Could result in "blue green red" ordering instead of expected "red
  green blue"

## Fix Characteristics

The fix meets stable tree criteria:
1. **Small and contained**: Only ~13 lines of actual logic change
2. **No new features**: Simply ensures correct array indexing
3. **Low regression risk**: Adds proper validation (bounds checking for
   `multi_index`)
4. **Clear bug fix**: Not a refactoring or optimization

## Additional Safety

The patch adds important safety checks:
- Requires `reg` property to be set (returns -EINVAL if missing)
- Validates `reg` is within bounds (`< LP50XX_LEDS_PER_MODULE` which is
  3)
- These checks prevent array out-of-bounds access

## Real-world Impact

The commit message mentions that `arch/arm/boot/dts/aspeed/aspeed-bmc-
facebook-fuji.dts` has reg set but wouldn't work correctly without this
fix, indicating this affects real hardware in production.

## Stable Tree Rules Compliance

This fix adheres to stable kernel rules:
- Fixes a real bug affecting users
- Minimal change with clear boundaries
- No architectural changes
- Confined to a single driver subsystem (leds-lp50xx)
- Adds necessary error checking that was missing

The bug could cause unpredictable LED behavior depending on device tree
parsing order, which is exactly the type of issue stable kernels should
address.

 drivers/leds/leds-lp50xx.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 02cb1565a9fb..94f8ef6b482c 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -476,6 +476,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 			return -ENOMEM;
 
 		fwnode_for_each_child_node(child, led_node) {
+			int multi_index;
 			ret = fwnode_property_read_u32(led_node, "color",
 						       &color_id);
 			if (ret) {
@@ -483,8 +484,16 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 				dev_err(priv->dev, "Cannot read color\n");
 				return ret;
 			}
+			ret = fwnode_property_read_u32(led_node, "reg", &multi_index);
+			if (ret != 0) {
+				dev_err(priv->dev, "reg must be set\n");
+				return -EINVAL;
+			} else if (multi_index >= LP50XX_LEDS_PER_MODULE) {
+				dev_err(priv->dev, "reg %i out of range\n", multi_index);
+				return -EINVAL;
+			}
 
-			mc_led_info[num_colors].color_index = color_id;
+			mc_led_info[multi_index].color_index = color_id;
 			num_colors++;
 		}
 
-- 
2.39.5


