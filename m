Return-Path: <linux-leds+bounces-2510-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 745D095B69C
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 15:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DDBC1C23171
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 13:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57EEC1CBE82;
	Thu, 22 Aug 2024 13:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQ/wmzE4"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318F71CB321;
	Thu, 22 Aug 2024 13:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724333279; cv=none; b=VCAAiocvxRg4pRPG1OHlFWRTvm4521Vgl4OqPWKUzmYazjk/oeZiMUrgD5hTeJ6CxNPCJt7umv6NKOum+7J3uX0OZ7j3jaS/zjROtPUKbddZjK65jBGfhcPe9OlCrpz/7gZnPSSV8o0/iKz9MIAiL2OV+434rS7pE6DyVEnrsac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724333279; c=relaxed/simple;
	bh=rJ7v55yigBDCxli5KM0Ix6S3IDNPNiEmpQZTjTS3seA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GWEqvWUlE4Scb1+F8XUphd//AdUj/JVC2c6FzC7sIOqmicSxiTQYT7WGgho8D4LFUs5pqhTfdyJj/6Oaadbj8suXcQ/VprLjC0n7/2p3WdzocSFBx4CdxQRzMcNuEQDRvmaw1/A+/fMACNB3m5vR+s5ixTJyuF9pWmMSy2OkUVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQ/wmzE4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A51C32782;
	Thu, 22 Aug 2024 13:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724333278;
	bh=rJ7v55yigBDCxli5KM0Ix6S3IDNPNiEmpQZTjTS3seA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OQ/wmzE43apmrB9WW67pYBtlBUfFSdSkzZ+HZ6hY5/RGFHyjDGa8e+OsDVIlP8ako
	 UgmykA912DkeJKmiBvlwi2wmij/TwUP7bkillMDZ3c+t7kjzXGeOjhLkZGOpaGz1CQ
	 NMszgMnZU9wjAugvw0CW26/jys4Ah6TYUS1oPR31zNvAdOV+MWm2RyuYvejR/0O1uw
	 WpDXHlgQ44/fFOvZKbcVGFC3/iW836vGoHKtrH/9hioAcunnPYffYIwR7Zp++KuG9r
	 aMrZ6sEznMkFnqJ/7698+RiP14s4hPEPqTJdwozzWsLQCbRZ8bBwu3CZcBySNLa/5Y
	 YqIRnDLWPsT7g==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Huan Yang <link@vivo.com>
Cc: opensource.kernel@vivo.com
In-Reply-To: <20240820102006.128840-1-link@vivo.com>
References: <20240820102006.128840-1-link@vivo.com>
Subject: Re: (subset) [PATCH] leds: lp55xx: Use devm_clk_get_enabled()
 helpers
Message-Id: <172433327733.1320112.12515392719420671676.b4-ty@kernel.org>
Date: Thu, 22 Aug 2024 14:27:57 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 20 Aug 2024 18:20:06 +0800, Huan Yang wrote:
> lp55xx lp55xx_is_extclk_used get, enable clk and
> deinit_device disable and unprepare it.
> 
> This can use a simplifies helper to cover.
> 
> 

Applied, thanks!

[1/1] leds: lp55xx: Use devm_clk_get_enabled() helpers
      commit: d4f5c2c6b36b12fe627dd4372bb4d47a1811b9f4

--
Lee Jones [李琼斯]


