Return-Path: <linux-leds+bounces-2509-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2732195B67C
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 15:25:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D304D1F26BE8
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 13:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18281CB15D;
	Thu, 22 Aug 2024 13:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGBhDaiM"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BB21CB15A;
	Thu, 22 Aug 2024 13:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724333032; cv=none; b=gYogyr6RtGr/t8QH4d8qn7R0Nju7NOTLbfhSpHzdWyb29++JdgDj60e4mLxEqkoz7206QkT+ooAsohQ/h4hlo2c2MsoajsVHp77qGFm4bRKIC5HOZFVYoJUb5RIVMBPdyjzS1sSg+BeuCn80CfKfQzeRZND/hxgyuB8HdbdZ8DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724333032; c=relaxed/simple;
	bh=P8fGI17fBYSUR6JP+2SBG3qvob6J8CR4tBanfBqwSGc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HO5NXK/zHe7LdLIMMSLSrawg0kMAGuTc3mEacpqbnnIHaP1AdmXm5gkTfNZYubo+h0lmBf27SxDqN5AXayHOQblIY3sUahok6kAKWWSEUiMeBasMmaTFEaT76UpTdkB95lx6K+ZwGR1lnjSNEUylvqH2dn3V7W1RxCkomAJvyJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGBhDaiM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8568EC32782;
	Thu, 22 Aug 2024 13:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724333032;
	bh=P8fGI17fBYSUR6JP+2SBG3qvob6J8CR4tBanfBqwSGc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CGBhDaiMw2PCzbV69OVFQ0ASgOFCZlBCVU//h7NPdqWhY2mrxJnSxoIwGfLoT9Tx3
	 vPNsvUZPxmFVRp1GootR00vw7jSBqjx2BHZ/+HBY0MLM1wzC/zocgeAI8J+frkmbhL
	 QkBm962Y83FwnEqbMk5KRUTYG2ItWkAqgJjfMD3X+AnkWlLKzzf7IWTTwHlqBjiCka
	 SYdfHF5DfvTZXWiBNj1D7vDVKMwRE2Whb7scaT0G3YiVhntKEL6to6I2FrMLDKoMX9
	 Y5eeHKQ+QZue8gk/gFL8rDQAmp88wwQ0bulTzjnBXHrTKDMJsEmtalHP9M120qHE/y
	 M4Vnhj3kUUSsQ==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Riku Voipio <riku.voipio@iki.fi>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
References: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
Subject: Re: [PATCH 00/17] leds: Use scoped device node handling to
 simplify error paths
Message-Id: <172433302926.1317537.8444655210561506833.b4-ty@kernel.org>
Date: Thu, 22 Aug 2024 14:23:49 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 16 Aug 2024 17:31:32 +0200, Krzysztof Kozlowski wrote:
> Make code a bit smaller/simpler, with less of_node_put() thanks to
> cleanup.h.
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

[01/17] leds: aat1290: Use scoped device node handling to simplify error paths
        commit: 1e63395e58b2b1d0105bb5ffdb1e5d7400a4be82
[02/17] leds: ktd2692: Use scoped device node handling to simplify error paths
        commit: 700b6c984b418c04c63a54f67b6758b81016f0e3
[03/17] leds: max77693: add missing of_node_get for probe duration
        commit: d225d436f7baccde74ad80d9dc7f08e1271b8473
[04/17] leds: max77693: Simplify with scoped for each OF child loop
        commit: 05c2f554d1edd6399720e8f8097e9165dcf17044
[05/17] leds: 88pm860x: Simplify with scoped for each OF child loop
        commit: 6c17a9a8991cf1f4e0767c2a8b3c110ea34e1019
[06/17] leds: aw2013: Simplify with scoped for each OF child loop
        commit: 073f016511913e2ea6c52e5d77d33a8cb03c4424
[07/17] leds: bcm6328: Simplify with scoped for each OF child loop
        commit: 6a1d796e70c703a7557c7ef21304879de85f40ec
[08/17] leds: bcm6358: Simplify with scoped for each OF child loop
        commit: c57ba40ea1e78bbf544ec667a9e0f885a8957f5c
[09/17] leds: is31fl32xx: Simplify with scoped for each OF child loop
        commit: 2c37529ee95d06ab44613572bfa474413f9a5b58
[10/17] leds: lp55xx: Simplify with scoped for each OF child loop
        commit: 9d4cfee092ecdaf98f255ee61d094334ddf9f110
[11/17] leds: mc13783: Use scoped device node handling to simplify error paths
        commit: e98a7f1fb9296733855347a98b1cac16e70b7ed8
[12/17] leds: mt6323: Simplify with scoped for each OF child loop
        commit: 84e2b97f87b8bc7dde90555ef29ac5eae27b3c8e
[13/17] leds: netxbig: Simplify with scoped for each OF child loop
        commit: d3f5f674058f5f1d93d9402c79f56684d81e5993
[14/17] leds: pca9532: Simplify with scoped for each OF child loop
        commit: af728722d7a1d81dd38bdf9a646fee84aefde901
[15/17] leds: sc27xx: Simplify with scoped for each OF child loop
        commit: 42476bce8d78eeea5057f34738daa8236b9912a6
[16/17] leds: turris-omnia: Simplify with scoped for each OF child loop
        commit: 122d57e2960c81b6916a5ebe44bfb8c14ebe81de
[17/17] leds: qcom-lpg: Simplify with scoped for each OF child loop
        commit: 9557b4376d02088a33e5f4116bcc324d35a3b64c

--
Lee Jones [李琼斯]


