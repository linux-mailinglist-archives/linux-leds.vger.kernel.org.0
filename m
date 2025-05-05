Return-Path: <linux-leds+bounces-4577-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5ADAAA20A
	for <lists+linux-leds@lfdr.de>; Tue,  6 May 2025 00:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B50DF1A85219
	for <lists+linux-leds@lfdr.de>; Mon,  5 May 2025 22:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9CA2D3FBE;
	Mon,  5 May 2025 22:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLrMek3K"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0055E2D3FB3;
	Mon,  5 May 2025 22:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483646; cv=none; b=hL8CagBVUyx9GnqYUsGoOlx3JuUjyRbaVhdpZs/H7h7lFHcSjxdxBerAZlzePgQ80kBw/IQwNL1r1wBEP8sfbB+9qCOYGAC6gLKfINp62lYH1c+d+27eItYf4ib49ZH6lZiZEktUbiFG0O1UIXsW1Y+VZBgu/2aAkY5qWvgI63A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483646; c=relaxed/simple;
	bh=FzkpaZBex9eLiv80aistErotSyM4GacvIqRXkFUGRR4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mrtlbW4Nd9K0XwmYz4ySpv69VgytjOMyYMXaOFwO8pbJ4VmRi+Fct1PGQ8Jv3uXdkF4Q4W4W54PRfWBhC2Km0TQCLG7c3JdfRZVjlSZWMzmzJkP974hgOSTloYgrf05RiS7N2LEfXEXKnupVsnDuuCn2KES/AhanJbP03PuE+xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLrMek3K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 128F4C4CEED;
	Mon,  5 May 2025 22:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483645;
	bh=FzkpaZBex9eLiv80aistErotSyM4GacvIqRXkFUGRR4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KLrMek3K+p4qw0WJMRnqyuBr3SkzPHU/IjNFohUVtar6PQNm4Bncsygjxh3yY0/RP
	 aJdmZWubs1sSTsJxmYbjDUAIKE2bqUXBSqnLH0LqxgLzTPwji0qev1X7DZJKPjeUoS
	 ogrRWVaE2sLT2vm6wTJR5NQUeY80SCIz4V2yc4xh1nVbGXqp56TkdnVholxHUprVdR
	 Adnq1u4H7Msfru6wsPhFxwXl79OA/uMliOpx+PTSx1XwLiexQJfdx1U53qsO/0zhn5
	 QT/zevJw9xfA4u6zXhdpnhybAJM2ya0ubor5WQsVx4XzdUosjY+tBu9MR+KFtNqF9Y
	 np3Gn7wl9yEfw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Manuel Fombuena <fombuena@outlook.com>,
	Lee Jones <lee@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	pavel@kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 158/642] leds: leds-st1202: Initialize hardware before DT node child operations
Date: Mon,  5 May 2025 18:06:14 -0400
Message-Id: <20250505221419.2672473-158-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Manuel Fombuena <fombuena@outlook.com>

[ Upstream commit a17d9e736ddd78323e77d3066c1e86371a99023c ]

Arguably, there are more chances of errors occurring during the
initialization of the hardware, so this should complete successfully
before the devicetree node's children are initialized.

st1202_dt_init() fills the led_classdev struct.

st1202_setup() initializes the hardware. Specifically, resets the chip,
enables its phase-shift delay feature, enables the device and disables all
the LEDs channels. All that writing to registers, with no input from
st1202_dt_init().

Real-world testing corroborates that calling st1202_setup() before
st1202_dt_init() doesn't cause any issue during initialization.

Switch the order of st1202_dt_init() and st1202_setup() to ensure the
hardware is correctly initialized before the led_classdev struct is
filled.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Link: https://lore.kernel.org/r/CWLP123MB54731877A8DC54EDD33F0229C5C22@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
Signed-off-by: Lee Jones <lee@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/leds/leds-st1202.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 4cebc0203c227..ccea216c11f9b 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -350,11 +350,11 @@ static int st1202_probe(struct i2c_client *client)
 		return ret;
 	chip->client = client;
 
-	ret = st1202_dt_init(chip);
+	ret = st1202_setup(chip);
 	if (ret < 0)
 		return ret;
 
-	ret = st1202_setup(chip);
+	ret = st1202_dt_init(chip);
 	if (ret < 0)
 		return ret;
 
-- 
2.39.5


