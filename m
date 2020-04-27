Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE27B1B98A4
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 09:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgD0Hbp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 03:31:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:35472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726507AbgD0Hbp (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 27 Apr 2020 03:31:45 -0400
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.30.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A1F0A2078E;
        Mon, 27 Apr 2020 07:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587972704;
        bh=SP8aLjy9l4P/fkjE4Dozlhxl5z9646o52s6YgA7cBHc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0C6XeUyNg6YZJHHn9hnpBRZSaZp4t0vkz/pLHBmSXFNBNzGqiReNP8+Gm/aO3eFVw
         N/Q4Sqs64q1H8m/bG+ibxtwVGAFQ3q5etv8UVWuNivr7lI+nRENcMeJoQOiep+Sgt+
         w1E2YF7rrRXQpI1i9l5RPkiIx06ltj0btviqS0q0=
Received: by wens.tw (Postfix, from userid 1000)
        id 78BA35FD54; Mon, 27 Apr 2020 15:31:42 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: rockchip: rk3328-roc-cc: Set dr_mode to "host" for OTG
Date:   Mon, 27 Apr 2020 15:31:32 +0800
Message-Id: <20200427073132.29997-4-wens@kernel.org>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200427073132.29997-1-wens@kernel.org>
References: <20200427073132.29997-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

The board has a standard USB A female port connected to the USB OTG
controller's data pins. Set dr_mode in the OTG controller node to
indicate this usage, instead of having the implementation guess.

Fixes: 2171f4fdac06 ("arm64: dts: rockchip: add roc-rk3328-cc board")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts b/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
index 8d553c92182a..56e79ce9101b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
@@ -334,6 +334,7 @@ &uart2 {
 };
 
 &usb20_otg {
+	dr_mode = "host";
 	status = "okay";
 };
 
-- 
2.26.0

